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
	  let btnDeptlist1El = document.getElementById('deptlist1');
	  btnDeptlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Deptlist1'  ;
		  let  name       = 'Deptlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

 	  let btnDisuse1El = document.getElementById('disuse1');
	  btnDisuse1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Disuse1'  ;
		  let  name       = 'Disuse1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnDisuselist1El = document.getElementById('disuselist1');
	  btnDisuselist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Disuselist1'  ;
		  let  name       = 'Disuselist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });


	  let btnFullquery1El = document.getElementById('fullquery1');
	  btnFullquery1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Fullquery1'  ;
		  let  name       = 'Fullquery1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnInput1El = document.getElementById('input1');
	  btnInput1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Input1'  ;
		  let  name       = 'Input1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnInquery1El = document.getElementById('inquery1');
	  btnInquery1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Inquery1'  ;
		  let  name       = 'Inquery1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnJumpolist1El = document.getElementById('jumpolist1');
	  btnJumpolist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Jumpolist1'  ;
		  let  name       = 'Jumpolist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnOrder1El = document.getElementById('order1');
	  btnOrder1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Order1'  ;
		  let  name       = 'Order1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });

	  let btnOrderlist1El = document.getElementById('orderlist1');
	  btnOrderlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Orderlist1'  ;
		  let  name       = 'Orderlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });


	  let btnSaleslist1El = document.getElementById('saleslist1');
	  btnSaleslist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Saleslist1'  ;
		  let  name       = 'Saleslist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  let btnInputlist1El = document.getElementById('inputlist1');
	  btnInputlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Inputlist1'  ;
		  let  name       = 'Inputlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
 	  let btnDeptadd1El = document.getElementById('deptadd1');
	  btnDeptadd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Deptadd1'  ;
		  let  name       = 'Deptadd1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  let btnJumpoadd1El = document.getElementById('jumpoadd1');
	  btnJumpoadd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Jumpoadd1'  ;
		  let  name       = 'Jumpoadd1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  let btnProductadd1El = document.getElementById('productadd1');
	  btnProductadd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Productadd1'  ;
		  let  name       = 'Productadd1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  let btnUseradd1El = document.getElementById('userlist');
	  btnUseradd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Userlist'  ;
		  let  name       = 'Userlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  let btnJumpoorderlist1El = document.getElementById('jumpoorderlist1');
	  btnJumpoorderlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Jumpoorderlist1'  ;
		  let  name       = 'Jumpoorderlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  let btnOutput1El = document.getElementById('output1');
	  btnOutput1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Output1'  ;
		  let  name       = 'Output1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  let btnOutputlist1El = document.getElementById('outputlist1');
	  btnOutputlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation(); 
		  let  html       = '/Outputlist1'  ;
		  let  name       = 'Outputlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });  
}


</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left2.jsp" %>
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