package com.green.mart.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Service;

import com.green.mart.service.WeatherService;

@Service("/weatherService")
public class WehaterServiceImpl implements WeatherService {

	String serviceKey 
	="njO%2B7Z0pMBN7c1B2ZEuW0AYBilD0QdwjNJL9OmTUXUBoFO8%2B%2FHs8YOfcwLvmjh%2FQese8n4da2mA%2FtjsfM4JhmA%3D%3D";
	
	//날씨 
	@Override
	public String search(String keyword) throws IOException {

		LocalDateTime now = LocalDateTime.now();
		LocalDateTime targetDateTime;

		if (now.getHour() < 6) {
		    targetDateTime = now.minusDays(1).withHour(18).withMinute(0).withSecond(0);
		} else {
		    targetDateTime = now.withHour(6).withMinute(0).withSecond(0);
		}

		String formattedDateTime = targetDateTime.format(DateTimeFormatter.ofPattern("yyyyMMddHH00"));
		
		// 보내줄 주소 처리 
		   StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "="
	        		+ URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "="
	        		+ URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
	        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11H20000", "UTF-8")); /*06시 발표(정시단위) */
	        urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(formattedDateTime, "UTF-8")); /*예보지점의 X 좌표값*/
			/*
			 * urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" +
			 * URLEncoder.encode("json", "UTF-8"));
			 */
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	      
	      return sb.toString();
	}
	
	// 기온
	@Override
	public String search1(String keyword) throws IOException {
		
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime targetDateTime;

		if (now.getHour() < 6) {
		    targetDateTime = now.minusDays(1).withHour(18).withMinute(0).withSecond(0);
		} else {
		    targetDateTime = now.withHour(6).withMinute(0).withSecond(0);
		}

		String formattedDateTime = targetDateTime.format(DateTimeFormatter.ofPattern("yyyyMMddHH00"));
		System.out.println("함수 : " + formattedDateTime);
		
		// 보내줄 주소 처리 
		   StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "="
	        		+ URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "="
	        		+ URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
	        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11H20201", "UTF-8")); /*06시 발표(정시단위) */
	        urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(formattedDateTime, "UTF-8")); /*예보지점의 X 좌표값*/
			/*
			 * urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" +
			 * URLEncoder.encode("json", "UTF-8"));
			 */
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	      
	      return sb.toString();
	}


}
