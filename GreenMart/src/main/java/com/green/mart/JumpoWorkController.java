package com.green.mart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.JumpoService;
import com.green.mart.vo.work.SearchDeptVo;

@Controller
@RequestMapping("/JWork")
public class JumpoWorkController {
	
	@Autowired
	private JumpoService jumpoService;

	@RequestMapping("/SearchDept")
	@ResponseBody
	public List<SearchDeptVo> returnListVO(String search) throws Exception {
		
		List<SearchDeptVo> list = jumpoService.searchDeptList(search);
		return list;
	}
}
