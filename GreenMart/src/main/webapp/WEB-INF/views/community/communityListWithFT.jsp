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
	
	  let btnDeptlistEl = document.getElementById('deptlist');
	  if( btnDeptlistEl != null ){
	  btnDeptlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Deptlist'  ;
		  let  name       = 'Deptlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }	  
	  
	  let btnDisuseEl = document.getElementById('disuse');
	  if( btnDisuseEl != null ){
	  btnDisuseEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Disuse'  ;
		  let  name       = 'Disuse';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }
	  
	  let btnDisuselistEl = document.getElementById('disuselist');
	  if( btnDisuselistEl != null ){
	  btnDisuselistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Disuselist'  ;
		  let  name       = 'Disuselist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }
	  
	  let btnFullqueryEl = document.getElementById('fullquery');
	  if( btnFullqueryEl != null ){
	  btnFullqueryEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Fullquery'  ;
		  let  name       = 'Fullquery';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }
	  
	  let btnInputEl = document.getElementById('input');
	  if( btnInputEl != null ){
	  btnInputEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Input'  ;
		  let  name       = 'Input';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnInqueryEl = document.getElementById('inquery');
	  if( btnInqueryEl != null ){
	  btnInqueryEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Inquery'  ;
		  let  name       = 'Inquery';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=600, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnJumpolistEl = document.getElementById('jumpolist');
	  if( btnJumpolistEl != null ){
	  btnJumpolistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Jumpolist'  ;
		  let  name       = 'Jumpolist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnOrderEl = document.getElementById('order');
	  if( btnOrderEl != null ){
	  btnOrderEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Order'  ;
		  let  name       = 'Order';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnOrderlistEl = document.getElementById('orderlist');
	  if( btnOrderlistEl != null ){
	  btnOrderlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Orderlist'  ;
		  let  name       = 'Orderlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnSalesEl = document.getElementById('sales');
	  if( btnSalesEl != null ){
	  btnSalesEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Sales'  ;
		  let  name       = 'Sales';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=850, width=1200, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnSaleslistEl = document.getElementById('saleslist');
	  if( btnSaleslistEl != null ){
	  btnSaleslistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Saleslist'  ;
		  let  name       = 'Saleslist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });  
	  }
	  
	  let btnInputlistEl = document.getElementById('inputlist');
	  if( btnInputlistEl != null ){
	  btnInputlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Inputlist'  ;
		  let  name       = 'Inputlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });  
	  }
	  
	  let btnBonsaorderEl = document.getElementById('bonsaorder');
	  if( btnBonsaorderEl != null ){
	  btnBonsaorderEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Bonsaorder'  ;
		  let  name       = 'Bonsaorder';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }
	  
	  let btnDeptlist1El = document.getElementById('deptlist1');
	  if( btnDeptlist1El != null ){
	  btnDeptlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Deptlist1'  ;
		  let  name       = 'Deptlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnDisuse1El = document.getElementById('disuse1');
	  if( btnDisuse1El != null ){
	  btnDisuse1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Disuse1'  ;
		  let  name       = 'Disuse1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnDisuselist1El = document.getElementById('disuselist1');
	  if( btnDisuselist1El != null ){
	  btnDisuselist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Disuselist1'  ;
		  let  name       = 'Disuselist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnFullquery1El = document.getElementById('fullquery1');
	  if( btnFullquery1El != null ){
	  btnFullquery1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Fullquery1'  ;
		  let  name       = 'Fullquery1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnInput1El = document.getElementById('input1');
	  if( btnInput1El != null ){
	  btnInput1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Input1'  ;
		  let  name       = 'Input1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnInquery1El = document.getElementById('inquery1');
	  if( btnInquery1El != null ){
	  btnInquery1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Inquery1'  ;
		  let  name       = 'Inquery1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=600, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnJumpolist1El = document.getElementById('jumpolist1');
	  if( btnJumpolist1El != null ){
	  btnJumpolist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Jumpolist1'  ;
		  let  name       = 'Jumpolist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnOrder1El = document.getElementById('order1');
	  if( btnOrder1El != null ){
	  btnOrder1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	      e.stopPropagation();
		  let  html       = '/Order1'  ;
		  let  name       = 'Order1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnOrderlist1El = document.getElementById('orderlist1');
	  if( btnOrderlist1El != null ){
	  btnOrderlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Orderlist1'  ;
		  let  name       = 'Orderlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });
	  }

	  let btnSaleslist1El = document.getElementById('saleslist1');
	  if( btnSaleslist1El != null ){
	  btnSaleslist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Saleslist1'  ;
		  let  name       = 'Saleslist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  }
	  
	  let btnInputlist1El = document.getElementById('inputlist1');
	  if( btnInputlist1El != null ){
	  btnInputlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Inputlist1'  ;
		  let  name       = 'Inputlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  }
	  
	  let btnDeptadd1El = document.getElementById('deptadd1');
	  if( btnDeptadd1El != null ){
	  btnDeptadd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Deptadd1'  ;
		  let  name       = 'Deptadd1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=500, width=550, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  }
	  
	  let btnProductadd1El = document.getElementById('productadd1');
	  if( btnProductadd1El != null ){
	  btnProductadd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Productadd1'  ;
		  let  name       = 'Productadd1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=700, width=550, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  }
	  
	  let btnUseradd1El = document.getElementById('userlist');
	  if( btnUseradd1El != null ){
	  btnUseradd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Userlist'  ;
		  let  name       = 'Userlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  }
	  
	  let btnJumpoorderlist1El = document.getElementById('jumpoorderlist1');
	  if( btnJumpoorderlist1El != null ){
	  btnJumpoorderlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Jumpoorderlist1'  ;
		  let  name       = 'Jumpoorderlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  }
	  
	  let btnOutput1El = document.getElementById('output1');
	  if( btnOutput1El != null ){
	  btnOutput1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Output1'  ;
		  let  name       = 'Output1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  }); 
	  }
	  
	  let btnOutputlist1El = document.getElementById('outputlist1');
	  if( btnOutputlist1El != null ){
	  btnOutputlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation(); 
		  let  html       = '/Outputlist1'  ;
		  let  name       = 'Outputlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  window.open(html, name, features);
	  });  
	  }
	
	  let customeraddEl = document.getElementById('customeradd');
	  if( customeraddEl != null ){
	  customeraddEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	      //e.stopPropagation();
		  let  html       = '/CustomeraddForm'  ;
		  let  name       = 'Customeradd';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=500, width=550, top=200, left=600'; 
		  window.open(html, name, features);
	  });
	  }

	  let customerlistEl = document.getElementById('customerlist');
	  if( customerlistEl != null ){
	  customerlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	      //e.stopPropagation();
		  let  html       = '/Customerlist'  ;
		  let  name       = 'Customerlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=700, width=1050, top=200, left=600'; 
		  window.open(html, name, features);
	  });
	  }
	
	  let btnFavoritesEl = document.getElementById('favorites');
	  if( btnFavoritesEl != null ){
		btnFavoritesEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			let html = '/Favorites';
			let name = 'Favorites'; // '' 값이 없으면 창이 여러번 뜬다
			let features = 'height=750, width=1050, top=200, left=300';
			window.open(html, name, features);
		});
	  }
	  
	  let btnNoticeEl = document.getElementById('notice');
	  if( btnNoticeEl != null ){
		  btnNoticeEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			location.href = "/Menu3/PdsWithFT?nowpage=1&m_id=M01";
		});
	  }
	  
	  let btnContactEl = document.getElementById('contact');
	  if( btnContactEl != null ){
		  btnContactEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			location.href = "/Menu3/PdsWithFT?nowpage=1&m_id=M02";
		});
	  }
	  
	  let btnGyeongjosaEl = document.getElementById('gyeongjosa');
	  if( btnGyeongjosaEl != null ){
		  btnGyeongjosaEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			location.href = "/Menu3/PdsWithFT?nowpage=1&m_id=M03";
		});
	  }
	  
	  let btnJalyosilEl = document.getElementById('jalyosil');
	  if( btnJalyosilEl != null ){
		  btnJalyosilEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			location.href = "/Menu3/PdsWithFT?nowpage=1&m_id=M04";
		});
	  }
	  
	  let btnEmpviewEl = document.getElementById('empview');
	  if( btnEmpviewEl != null ){
		  btnEmpviewEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			location.href = "/Menu3/empTable?nowpage=1&m_id=M05";
		});
	  }
		
	}
</script>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left.jsp" %>
	<%@ include file ="/WEB-INF/include/cal.jsp" %>
	<div id="gd">
	 
	<!-- 테이블 리스트 --> 
	<%@ include file ="/WEB-INF/views/community/include/communityTable.jsp" %>
	
	
	
	<!-- 페이징 리스트 -->
	<%@ include file="/WEB-INF/include/paging.jsp" %>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>