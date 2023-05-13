package com.green.mart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.BonsaService;
import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;

@Controller
public class BonsaController {

	@Autowired
	private BonsaService bonsaService;
	
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
	@RequestMapping("/Productadd1")
	public  ModelAndView   productadd1() {
		List<DeptVo> checkDeptlist = bonsaService.getDeptList();
		List<AssortmentVo> checkAstlist = bonsaService.getAstList();
		
		
		ModelAndView  mv  =  new ModelAndView(); 
		mv.setViewName("bonsa/productadd");
		mv.addObject("checkDeptlist", checkDeptlist);
		mv.addObject("checkAstlist", checkAstlist);
		
		
		return  mv;
	}
	@RequestMapping("/Userlist")
	public  ModelAndView   userlist() {
		
		List<EmployeeVo> empList = bonsaService.getEmpList(); 	
		ModelAndView  mv  =  new ModelAndView(); 
		
		mv.setViewName("bonsa/userlist"); 
		mv.addObject("empList", empList);
		
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
