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

   
	  let btnDeptlistEl = document.getElementById('deptlist');
	  btnDeptlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Deptlist'  ;
		  let  name       = 'Deptlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
		  
		
	  });

 	  let btnDisuseEl = document.getElementById('disuse');
	  btnDisuseEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Disuse'  ;
		  let  name       = 'Disuse';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });

	  let btnDisuselistEl = document.getElementById('disuselist');
	  btnDisuselistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Disuselist'  ;
		  let  name       = 'Disuselist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });


	  let btnFullqueryEl = document.getElementById('fullquery');
	  btnFullqueryEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Fullquery'  ;
		  let  name       = 'Fullquery';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });

	  let btnInputEl = document.getElementById('input');
	  btnInputEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Input'  ;
		  let  name       = 'Input';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });

	  let btnInqueryEl = document.getElementById('inquery');
	  btnInqueryEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Inquery'  ;
		  let  name       = 'Inquery';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=600, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });

	  let btnJumpolistEl = document.getElementById('jumpolist');
	  btnJumpolistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	     // e.stopPropagation();
		  let  html       = '/Jumpolist'  ;
		  let  name       = 'Jumpolist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });

	  let btnOrderEl = document.getElementById('order');
	  btnOrderEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Order'  ;
		  let  name       = 'Order';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });

	  let btnOrderlistEl = document.getElementById('orderlist');
	  btnOrderlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Orderlist'  ;
		  let  name       = 'Orderlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });

	  let btnSalesEl = document.getElementById('sales');
	  btnSalesEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Sales'  ;
		  let  name       = 'Sales';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=850, width=1200, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });


	  let btnSaleslistEl = document.getElementById('saleslist');
	  btnSaleslistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Saleslist'  ;
		  let  name       = 'Saleslist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });  
	  let btnInputlistEl = document.getElementById('inputlist');
	  btnInputlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Inputlist'  ;
		  let  name       = 'Inputlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	  });  
	  let btnBonsaorderEl = document.getElementById('bonsaorder');
	  btnBonsaorderEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Bonsaorder'  ;
		  let  name       = 'Bonsaorder';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
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
	<%@ include file= "/WEB-INF/include/left1.jsp" %>
	<%@ include file ="/WEB-INF/include/cal.jsp" %>
	<div id="gd">
	 
                    <a href="/logout.jsp" id="logout" onclick="handleLogout()" style="width: 90px; height:25px; position:absolute; margin-left: 1270px; margin-top: -31px;font-size: 17px; color: white; ">로그아웃</a>
	<!-- 공지사항, 업무연락 -->
    <%@ include file="/WEB-INF/include/homeBoard.jsp" %>
	<div id="calendar"></div>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>