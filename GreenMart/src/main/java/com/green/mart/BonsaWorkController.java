package com.green.mart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.mart.service.BonsaService;
import com.green.mart.vo.DeptVo;


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
}
