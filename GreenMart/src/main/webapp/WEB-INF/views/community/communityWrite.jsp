<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
</head>
<style>
table  { margin-left: 500px; }
</style>

<body>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left3.jsp" %>
	<%@ include file ="/WEB-INF/include/cal.jsp" %>
	<div id="gd">
	 
	<!-- view 페이지 --> 
	<%@ include file ="/WEB-INF/views/community/include/writeForm.jsp" %>
	
	
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>