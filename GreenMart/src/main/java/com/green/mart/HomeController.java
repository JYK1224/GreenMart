package com.green.mart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public  String  home() {
		return  "home";
	}
	// 헤더 메뉴
		//--------------------------------------
		@RequestMapping("/Jumpo")
		public  ModelAndView   jumpo(  ) {
			ModelAndView  mv  =  new ModelAndView(); 
			mv.setViewName("jumpo/jumpo"); 
			return  mv;
		}
		@RequestMapping("/Bonsa")
		public  ModelAndView   bonsa(  ) {
			ModelAndView  mv  =  new ModelAndView(); 
			mv.setViewName("bonsa/bonsa"); 
			return  mv;
		}
		@RequestMapping("/Community")
		public  ModelAndView   community(  ) {
			ModelAndView  mv  =  new ModelAndView(); 
			mv.setViewName("community/community"); 
			return  mv;
		}
		@RequestMapping("/Customer")
		public  ModelAndView   customer(  ) {
			ModelAndView  mv  =  new ModelAndView(); 
			mv.setViewName("customer/customer"); 
			return  mv;
		}
		//--------------------------------------
}
