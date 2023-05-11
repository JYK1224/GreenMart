<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left3.jsp" %>
	<%@ include file ="/WEB-INF/include/cal.jsp" %>
	<div id="gd">
	 
	 
	<div class="dd">
  <table>
    <tr>&nbsp;&nbsp;- 공지사항<tr>
  </table>
	</div>
	
	<div class="aa">
  <table>
    <tr>&nbsp;&nbsp;- 업무연락<tr>
  </table>
	</div>
	
	<div id="calendar"></div>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>