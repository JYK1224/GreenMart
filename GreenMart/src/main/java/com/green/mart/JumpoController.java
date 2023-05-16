package com.green.mart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.JumpoService;

@Controller
public class JumpoController {

	@Autowired
	private JumpoService jumpoService;

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
		
		int num = 1;
		int j= Integer.parseInt((String) map.get("rowCount"));
		List<String> itemList = new ArrayList<String>();
		for (int i = 0; i < j; i++) {
			itemList.add((String) map.get("p_seq" + num));
			num++;
		}
		
		int k = 1;
		List<String> suList = new ArrayList<String>();
		for (int i = 0; i < j; i++) {
			suList.add((String) map.get("su" + k));
			k++;
		}
		
		int merchant_uid = jumpoService.getSaleId();
		
		//회원 전화번호, 이름
		
		System.out.println("merchant_uid" + merchant_uid);
		System.out.println("itemList "+ itemList);
		System.out.println("suList" + suList);
		System.out.println(map);
		System.out.println(map.get("finalPrice"));
		
		ModelAndView  mv  =  new ModelAndView(); 
		mv.addObject("itemList", itemList);
		mv.addObject("suList", suList);
		mv.addObject("finalPrice", map.get("finalPrice"));
		mv.addObject("s_id", merchant_uid);
		mv.addObject("map", map);
		mv.setViewName("jumpo/pay"); 
		
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
