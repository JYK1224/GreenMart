package com.green.mart;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping("/Mileage")
	public  ModelAndView   mileage( 
		@RequestParam HashMap<String, Object> map
			) {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/mileage"); 
		mv.addObject("map", map);
		return  mv;
	}
	@RequestMapping("/Pay")
	public  ModelAndView   pay(
		@RequestParam HashMap<String, Object> map
			) {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/pay"); 
		mv.addObject("map", map);
		return  mv;
	}
	@RequestMapping("/MilageApply")
	public ModelAndView mailageApply(
		@RequestParam HashMap<String, Object> map	
			) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);
		
		return mv;
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
	@RequestMapping("/Bonsaorder")
	public  ModelAndView   bonsaorder() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("jumpo/bonsaorder"); 
		return  mv;
	}
}
