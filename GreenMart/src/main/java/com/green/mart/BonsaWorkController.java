package com.green.mart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.BonsaService;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;


@Controller
@RequestMapping("/BWork")
public class BonsaWorkController {

	@Autowired
	private BonsaService bonsaService;
	
	// 거래처 조회
		@RequestMapping("/SearchAllDept")
		@ResponseBody
		public List<DeptVo> returnDeptListVO(String search) throws Exception {
		
			List<DeptVo> list = bonsaService.searchAllDeptList(search);
			return list;
		}
		
	// 사원관리
		// 사원등록
		@RequestMapping("/userAddForm")
		public ModelAndView customeraddForm (EmployeeVo vo) {
			
			//EmployeeVo empVo = bonsaService.geteid(vo);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("bonsa/useradd");
			//mv.addObject("vo" , empVo);
			
			
			return mv;
		}
		// 사원등록
		@RequestMapping("/userAdd")
		public ModelAndView popadd(EmployeeVo vo) {
			
			bonsaService.insertEmployee(vo);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/BWork/userAddForm");
			
			return mv;
			
		}
		// 사원 상세보기
		@RequestMapping("/userView")
		public ModelAndView viewUser(String e_id) {
			
			EmployeeVo empVo = bonsaService.viewEmp(e_id);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/bonsa/userview");
			mv.addObject("vo", empVo);
			
			System.out.println("ddfdfa :   " + mv);
			
			return mv;
		}
		// 사원삭제
		@RequestMapping("/empDelete")
		public void delete(@RequestParam("e_id") String e_id) {
			
			bonsaService.deleteEmp(e_id);
			
			
		}
		// 사원수정 
		@RequestMapping("/empUpdateForm")
		public ModelAndView updateForm (EmployeeVo vo) {
			
			EmployeeVo empVo = bonsaService.getEmp(vo.getE_id());
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/bonsa/userupdate");
			mv.addObject("vo", empVo);
			
			return mv;
		}
		// 사원수정
		@RequestMapping("/userUpdate")
		public ModelAndView empUpdate (EmployeeVo vo) {
			
			bonsaService.updateEmp(vo);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/BWork/userView?e_id=" + vo.getE_id());
			
			
			return mv;
		}	

}
