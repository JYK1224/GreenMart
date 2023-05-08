package com.green.mart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView customeraddForm (CustomerVo vo) {
		
		CustomerVo cusVo = customerService.getCid(vo.getC_id());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer/customeradd");
		mv.addObject("vo" , cusVo);
		
		System.out.println("DDFadfadf : " + vo);
		
		return mv;
	}
	
	@RequestMapping("/Customeradd")
	public ModelAndView customerAdd (CustomerVo vo) {
		
		customerService.insertCustomer(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/CustomeraddForm");
		
		return mv;
	}
	@RequestMapping("/CustomerView")
	public ModelAndView customerView (String c_id ) {
		
		CustomerVo cusVo = customerService.viewCustomer(c_id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer/customerview");
		mv.addObject("vo", cusVo);
		
		System.out.println(cusVo);
		
		return mv;
	}
	@RequestMapping("/Delete")
	public ModelAndView delete(CustomerVo vo) {
		
		customerService.deleteCus(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Customerlist");
		
		
		return mv;
	}
	
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm (CustomerVo vo) {
		
		CustomerVo cusVo = customerService.viewCustomer(vo.getC_id());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/customer/customerupdate");
		mv.addObject("vo",cusVo);
		
		return mv;
	}
	
	@RequestMapping("/CustomerUpdate")
	public ModelAndView update(CustomerVo vo) {
		
		customerService.updateCustomer(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Customerlist");
		
		System.out.println("업데이트 : " + vo);
		
		
		return mv;
	}
	@RequestMapping(value = "/getCustomerCount", method = RequestMethod.GET)
	  @ResponseBody
	  public int getCustomerCount() {
	   
		
		return customerService.getCustomerCount();
	  }
	
	
	
	
}
