 package com.green.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
    
    // preHandle(): Method executed before the Controller
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // Get the session object
        HttpSession session = request.getSession();
        String requestUrl = request.getRequestURL().toString();

        // Exclude "/login" page from checking
        if (requestUrl.equals("http://localhost:9090/")) {
            // Check if the user is logged in
            Object obj = session.getAttribute("login");
            if (obj == null) {
                // If not logged in and not accessing "/Mobile", redirect to "/login"
                response.sendRedirect("/login");
                return false;
            }
        }

        // Check if the request URL contains "/Mobile"
        if (requestUrl.contains("/Mobile")) {
            return true; // Skip the interceptor and allow access to "/Mobile"
        }



        // By default, continue with the existing logic for other pages
        return super.preHandle(request, response, handler);
    }
    
    // postHandle(): Method executed after the Controller
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        super.postHandle(request, response, handler, modelAndView);
    }
}