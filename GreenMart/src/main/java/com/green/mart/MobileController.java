package com.green.mart;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/M")
public class MobileController {
	
	@RequestMapping("/Login_check")
	public ModelAndView login_check(@RequestParam HashMap<String, String> map){
		System.out.println(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "error");
		mv.setViewName("mobile/mhome");
		return mv;
		
	}

}
