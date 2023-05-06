package com.green.menu3.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.menu3.service.Menu3Service;

@RestController
public class PdsRestController {
	
	@Autowired
	private Menu3Service menu3Service;

	@RequestMapping(
		value   = "/deleteFile", 
		method  = RequestMethod.GET,
		headers = "Accept=application/json"	) 
	public void deleteFile(
		@RequestParam HashMap<String, Object> map
			) {
		
		System.out.println("첨부파일삭제전 map " + map);
		menu3Service.deleteUploadFile(map);
		
		
		
	}
		
	

}
