package com.green.mart.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;

public interface WeatherService {

	//String search(String keyword, int numOfRows, int pageNo) throws IOException ;

	String search(String keyword) throws IOException;

	String search1(String keyword) throws IOException;
	
	
	
}
