package com.green.mart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.CustomerService;
import com.green.mart.vo.CustomerVo;

@Controller
public class CustomerController {
	
	@Autowired 
	private CustomerService customerService;
	
	@RequestMapping("Customerlist")
	public ModelAndView customerlist () {
		
		List<CustomerVo> customerList = customerService.getcustomerList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer/customerlist");
		mv.addObject("cusList", customerList);
		return mv;
	}
	
	
	
	
	@RequestMapping("/CustomeraddForm")
	public ModelAndView customeraddForm (String c_id) {
		
		
		
		CustomerVo vo = customerService.getCid(c_id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer/customeradd");
		mv.addObject("vo" , vo);
		
		System.out.println("DDFadfadf : " + c_id);
		
		return mv;
	}
	
	
	
	@RequestMapping("/Customeradd")
	public ModelAndView Customeradd (CustomerVo vo) {
		
		System.out.println("why ? : " + vo);
		
		customerService.insertCustomer(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/CustomeraddForm");
		
		System.out.println("dfasdf3 :  " + vo);
		
		return mv;
	}
	
}
