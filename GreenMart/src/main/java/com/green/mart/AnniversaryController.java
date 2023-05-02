package com.green.mart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.mart.service.AnnService;
import com.green.mart.vo.AnniversaryVo;



@Controller
public class AnniversaryController {
	
	@Autowired
	private AnnService annService;

	
	@RequestMapping("/service")
	@ResponseBody 
	public List<AnniversaryVo> returnListVO() throws Exception {
		
		List<AnniversaryVo> list = annService.getAnniversaryVoList();
				
		return list;	
	}
}
