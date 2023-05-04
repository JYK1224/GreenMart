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
	  let btnOrderEl = document.getElementById('order');
	  btnOrderEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	      e.stopPropagation();
		  const useridEl  = document.getElementById('userid'); 
		  let  html       = '/Order'  ;
		  let  name       = 'Order';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=300, width=700, top=200, left=600'; 
		  window.open(html, name, features);
		  //alert('ok');
		  // document.forms[0].action = 'aaa.jsp';
		  // document.forms[0].submit(); 
	  });
}

</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left1.jsp" %>
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