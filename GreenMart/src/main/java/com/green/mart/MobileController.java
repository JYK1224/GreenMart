/*package com.green.mart;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.MobileService;
import com.green.mart.vo.CustomerVo;

@Controller
@RequestMapping("/M")
public class MobileController {
	
	@Autowired
	private MobileService mobileService;
	
	@RequestMapping("/Login_check")
	public ModelAndView login_check(@RequestParam HashMap<String, String> map){
		System.out.println(map);
		
		CustomerVo vo = new CustomerVo();
		vo = mobileService.getCustomer(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "error");
		mv.setViewName("mobile/mhome");
		return mv;
		
	}

}
*/