package com.green.mart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {
	
	@RequestMapping("Customeradd")
	public ModelAndView customeradd () {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer/customeradd");
		
		return mv;
	}
	
	@RequestMapping("Customerlist")
	public ModelAndView customerlist () {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer/customerlist");
		
		return mv;
	}
}
