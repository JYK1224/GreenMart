<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="css/common.css"/>
<script>
window.onload = function() {
	  let customeraddEl = document.getElementById('customeradd');
	  customeraddEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	      //e.stopPropagation();
		  let  html       = '/Customeradd'  ;
		  let  name       = 'Customeradd';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=700, width=1050, top=200, left=600'; 
		  window.open(html, name, features);
	  });

	  let customerlistEl = document.getElementById('customerlist');
	  customerlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	      //e.stopPropagation();
		  let  html       = '/Customerlist'  ;
		  let  name       = 'Customerlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=700, width=1050, top=200, left=600'; 
		  window.open(html, name, features);
	  });
}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left4.jsp" %>
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