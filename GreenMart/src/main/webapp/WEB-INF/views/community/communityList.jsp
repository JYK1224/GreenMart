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
<script>
window.onload = function() {
	let btnFavoritesEl = document.getElementById('favorites');
		btnFavoritesEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			let html = '/Favorites';
			let name = 'Favorites'; // '' 값이 없으면 창이 여러번 뜬다
			let features = 'height=1050, width=600, top=200, left=300';
			window.open(html, name, features);
		});
	}
</script>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left3.jsp" %>
	<%@ include file ="/WEB-INF/include/cal.jsp" %>
	<div id="gd">
                <a href="/logout.jsp" id="logout" onclick="handleLogout()" style="width: 90px; height:25px; position:absolute; margin-left: 1270px; margin-top: -61px;font-size: 17px; color: white; ">로그아웃</a>

	<!-- 테이블 리스트 --> 
	<%@ include file ="/WEB-INF/views/community/include/communityTable.jsp" %>
	
	
	
	<!-- 페이징 리스트 -->
	<%@ include file="/WEB-INF/include/paging.jsp" %>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>