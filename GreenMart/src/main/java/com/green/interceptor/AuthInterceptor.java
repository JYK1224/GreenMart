package com.green.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	//preHandle() : Controller 보다 먼저 실행되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		String requestUrl = request.getRequestURL().toString();
		
		
		// /login 페이지는 체크에서 제외해야함
		if(requestUrl.contains("/login")) {
			return true;
		}
		//--------------------------------
		Object obj = session.getAttribute("login");
		if(obj == null) {
			// 로그인되어 있지 않다면 /login 으로 이동하시오
			 String userAgent = request.getHeader("User-Agent");
		        if (userAgent != null && userAgent.contains("Mobile")) {
		            response.sendRedirect("/mobile/mhome"); // 홈 URL로 변경해야 함
		            return false;
		        }
			
			response.sendRedirect("/login");
			return false;
		}
		
		//preHandle 의 return 은 컨트롤러 요청 url로 가도 되나 안되나를 허가하는 의미
		//true : 컨트롤러 url로 가게됨
		return super.preHandle(request, response, handler);
	}
	

}
