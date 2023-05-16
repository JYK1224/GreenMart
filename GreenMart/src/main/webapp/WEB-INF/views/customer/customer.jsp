<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
<script>
window.onload = function() {
	
	
	
	 var childWindows = []; // 자식 창 개체를 저장할 배열

	    function handleLogout() {
	        for (var i = 0; i < childWindows.length; i++) {
	            childWindows[i].close(); // 모든 자식 팝업 창 닫기
	        }
	        childWindows = []; // 배열 초기화
	    }

 let btnLogoutEl = document.getElementById('logout');
 btnLogoutEl.addEventListener('click', function(e) {
     e.preventDefault();
     handleLogout();
 });
 
	  let customeraddEl = document.getElementById('customeradd');
	  customeraddEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	      //e.stopPropagation();
		  let  html       = '/CustomeraddForm'  ;
		  let  name       = 'Customeradd';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=500, width=550, top=200, left=600'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });

	  let customerlistEl = document.getElementById('customerlist');
	  customerlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	      //e.stopPropagation();
		  let  html       = '/Customerlist'  ;
		  let  name       = 'Customerlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=700, width=1050, top=200, left=600'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });
	  let btnFavoritesEl = document.getElementById('favorites');
		btnFavoritesEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			let html = '/Favorites';
			let name = 'Favorites'; // '' 값이 없으면 창이 여러번 뜬다
			let features = 'height=1050, width=600, top=200, left=300';
			let childWindow = window.open(html, name, features);
			  childWindows.push(childWindow);
		});
		
		// 로그인화면으로
		   let logoutLinkEl = document.getElementById('logout');
		    logoutLinkEl.addEventListener('click', function(e) {
		        e.preventDefault();
		        handleLogout();
		        window.location.href = "/logout";
		    });
}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left4.jsp" %>
	<%@ include file ="/WEB-INF/include/cal.jsp" %>
	<div id="gd">
	 
	 
                   <a href="/logout.jsp" id="logout" onclick="handleLogout()"style="width: 90px; height:25px; position:absolute; margin-left: 1270px; margin-top: -31px;font-size: 17px; color: white; ">로그아웃</a>
	<!-- 공지사항, 업무연락 -->
    <%@ include file="/WEB-INF/include/homeBoard.jsp" %>
	<div id="calendar"></div>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>