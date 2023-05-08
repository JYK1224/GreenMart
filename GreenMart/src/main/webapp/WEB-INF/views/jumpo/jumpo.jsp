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
	  let btnDeptlistEl = document.getElementById('deptlist');
	  btnDeptlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Deptlist'  ;
		  let  name       = 'Deptlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

 	  let btnDisuseEl = document.getElementById('disuse');
	  btnDisuseEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Disuse'  ;
		  let  name       = 'Disuse';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnDisuselistEl = document.getElementById('disuselist');
	  btnDisuselistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Disuselist'  ;
		  let  name       = 'Disuselist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });


	  let btnFullqueryEl = document.getElementById('fullquery');
	  btnFullqueryEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Fullquery'  ;
		  let  name       = 'Fullquery';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnInputEl = document.getElementById('input');
	  btnInputEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Input'  ;
		  let  name       = 'Input';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnInqueryEl = document.getElementById('inquery');
	  btnInqueryEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Inquery'  ;
		  let  name       = 'Inquery';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnJumpolistEl = document.getElementById('jumpolist');
	  btnJumpolistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Jumpolist'  ;
		  let  name       = 'Jumpolist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnOrderEl = document.getElementById('order');
	  btnOrderEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Order'  ;
		  let  name       = 'Order';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnOrderlistEl = document.getElementById('orderlist');
	  btnOrderlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Orderlist'  ;
		  let  name       = 'Orderlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnSalesEl = document.getElementById('sales');
	  btnSalesEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Sales'  ;
		  let  name       = 'Sales';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });


	  let btnSaleslistEl = document.getElementById('saleslist');
	  btnSaleslistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Saleslist'  ;
		  let  name       = 'Saleslist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });  
	  let btnInputlistEl = document.getElementById('inputlist');
	  btnInputlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Inputlist'  ;
		  let  name       = 'Inputlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });  
	  let btnBonsaorderEl = document.getElementById('bonsaorder');
	  btnBonsaorderEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Bonsaorder'  ;
		  let  name       = 'Bonsaorder';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
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