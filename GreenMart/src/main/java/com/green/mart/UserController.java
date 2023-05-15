package com.green.mart;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.mart.service.UserService;
import com.green.mart.vo.EmployeeVo;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	/*
	 * // home
	 * 
	 * @RequestMapping("/") // root : http://localhost:9090/ public String home1( )
	 * { return "home"; // /WEB-INF/views/ home .jsp }
	 */
			
			// 로그인
			@RequestMapping("/login")
			public String login() {
				return "/login";
			}
			
			// 로그인체크
			@RequestMapping("/loginprocess")
			public String loginprocess(
					HttpSession session,
					@RequestParam HashMap<String, Object> map){
				System.out.println("로그인"+map);
				String returnURL = "";
				
				if(session.getAttribute("login") != null) {
					
					// 기존 login 정보가 존재한다면
					session.removeAttribute("login");
				}
				
				// 로그인 성공하면
				EmployeeVo vo = userService.getLogin(map);
				if (vo != null) {
					session.setAttribute("login", vo);
					System.out.println("vo"+vo);
					returnURL = "/home";
				}else {
					returnURL = "redirect:/login";
				}
				return returnURL;
			}
			
			// 로그아웃
			@RequestMapping("/logout")
			public String logout(HttpSession session) {
				session.invalidate();
				return "redirect:/login";
			}
}
