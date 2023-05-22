package com.green.mart;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.mart.service.WeatherService;

@Controller
public class WeatherController {
	
	@Autowired
	private WeatherService weatherService;
	
	
	@RequestMapping("/Weather")
	public String galmaetgil() {
	
		return "redirect:/static/html/week2.html";
	}

	
	@RequestMapping(value="/gisang", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> service(@RequestParam("keyword") String keyword) throws IOException {
	    
		String json = weatherService.search(keyword);
	    
		HttpHeaders headers = new HttpHeaders();
	    
		headers.setContentType(MediaType.APPLICATION_JSON);
	    
		return new ResponseEntity<>(json, headers, HttpStatus.OK);
	}

	@RequestMapping(value="/gion", method = RequestMethod.GET, produces = "application/json;charset=UTF-8" )
	@ResponseBody
	public ResponseEntity<String> service1(@RequestParam("keyword") String keyword) throws IOException {
	    
		String json = weatherService.search1(keyword);
	    
	    HttpHeaders headers = new HttpHeaders();
	    
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    
	    return new ResponseEntity<>(json, headers, HttpStatus.OK);
	}
}
	
	
	
	
	

