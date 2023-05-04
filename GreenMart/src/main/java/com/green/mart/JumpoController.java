package com.green.mart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JumpoController {


	@RequestMapping("/Deptlist")
	public  ModelAndView   deptlist() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/deptlist"); 
		return  mv;
	}
	@RequestMapping("/Disuse")
	public  ModelAndView   disuse() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/disuse"); 
		return  mv;
	}
	@RequestMapping("/Disuselist")
	public  ModelAndView   disuselist() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/disuselist"); 
		return  mv;
	}
	@RequestMapping("/Fullquery")
	public  ModelAndView   fullquery() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/fullquery"); 
		return  mv;
	}
	@RequestMapping("/Input")
	public  ModelAndView   input() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/input"); 
		return  mv;
	}
	
	@RequestMapping("/Inquery")
	public  ModelAndView   inquery() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/inquery"); 
		return  mv;
	}
	
	@RequestMapping("/Jumpolist")
	public  ModelAndView   jumpolist() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/jumpolist"); 
		return  mv;
	}
	@RequestMapping("/Order")
	public  ModelAndView   order() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/order"); 
		return  mv;
	}
	@RequestMapping("/Orderlist")
	public  ModelAndView   orderlist() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/orderlist"); 
		return  mv;
	}
	@RequestMapping("/Sales")
	public  ModelAndView   sales() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/sales"); 
		return  mv;
	}
	@RequestMapping("/Saleslist")
	public  ModelAndView   saleslist() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/saleslist"); 
		return  mv;
	}
	@RequestMapping("/Inputlist")
	public  ModelAndView   inputlist() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/inputlist"); 
		return  mv;
	}
}
