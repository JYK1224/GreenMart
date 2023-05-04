package com.green.mart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BonsaController {

	@RequestMapping("/Deptlist1")
	public  ModelAndView   deptlist1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/deptlist"); 
		return  mv;
	}
	@RequestMapping("/Disuse1")
	public  ModelAndView   disuse1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/disuse"); 
		return  mv;
	}
	@RequestMapping("/Disuselist1")
	public  ModelAndView   disuselist1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/disuselist"); 
		return  mv;
	}
	@RequestMapping("/Fullquery1")
	public  ModelAndView   fullquery1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/fullquery"); 
		return  mv;
	}
	@RequestMapping("/Input1")
	public  ModelAndView   input1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/input"); 
		return  mv;
	}
	
	@RequestMapping("/Inquery1")
	public  ModelAndView   inquery1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/inquery"); 
		return  mv;
	}
	
	@RequestMapping("/Jumpolist1")
	public  ModelAndView   jumpolist1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/jumpolist"); 
		return  mv;
	}
	@RequestMapping("/Order1")
	public  ModelAndView   order1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/order"); 
		return  mv;
	}
	@RequestMapping("/Orderlist1")
	public  ModelAndView   orderlist1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/orderlist"); 
		return  mv;
	}

	@RequestMapping("/Saleslist1")
	public  ModelAndView   saleslist1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/saleslist"); 
		return  mv;
	}
	@RequestMapping("/Inputlist1")
	public  ModelAndView   inputlist1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/inputlist"); 
		return  mv;
	}
	@RequestMapping("/Deptadd1")
	public  ModelAndView   deptadd1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/deptadd"); 
		return  mv;
	}
	@RequestMapping("/Jumpoadd1")
	public  ModelAndView   jumpoadd1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/jumpoadd"); 
		return  mv;
	}
	
	@RequestMapping("/Productadd1")
	public  ModelAndView   productadd1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/productadd"); 
		return  mv;
	}
	@RequestMapping("/Useradd1")
	public  ModelAndView   useradd1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/useradd"); 
		return  mv;
	}
	
	@RequestMapping("/Jumpoorderlist1")
	public  ModelAndView   jumpooderlist1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/jumpoorderlist"); 
		return  mv;
	}
	@RequestMapping("/Output1")
	public  ModelAndView   output1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/output"); 
		return  mv;
	}
	@RequestMapping("/Outputlist1")
	public  ModelAndView   outputlist1() {
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/outputlist"); 
		return  mv;
	}
	
	
}