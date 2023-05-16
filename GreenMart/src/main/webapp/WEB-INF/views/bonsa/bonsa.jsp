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
	
	
	
	  let btnDeptlist1El = document.getElementById('deptlist1');
	  btnDeptlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Deptlist1'  ;
		  let  name       = 'Deptlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });

 	  let btnDisuse1El = document.getElementById('disuse1');
	  btnDisuse1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Disuse1'  ;
		  let  name       = 'Disuse1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });

	  let btnDisuselist1El = document.getElementById('disuselist1');
	  btnDisuselist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Disuselist1'  ;
		  let  name       = 'Disuselist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });


	  let btnFullquery1El = document.getElementById('fullquery1');
	  btnFullquery1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Fullquery1'  ;
		  let  name       = 'Fullquery1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });

	  let btnInput1El = document.getElementById('input1');
	  btnInput1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	    //  e.stopPropagation();
		  let  html       = '/Input1'  ;
		  let  name       = 'Input1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });

	  let btnInquery1El = document.getElementById('inquery1');
	  btnInquery1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Inquery1'  ;
		  let  name       = 'Inquery1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=600, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });

	  let btnJumpolist1El = document.getElementById('jumpolist1');
	  btnJumpolist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	   //   e.stopPropagation();
		  let  html       = '/Jumpolist1'  ;
		  let  name       = 'Jumpolist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });

	  let btnOrder1El = document.getElementById('order1');
	  btnOrder1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Order1'  ;
		  let  name       = 'Order1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });

	  let btnOrderlist1El = document.getElementById('orderlist1');
	  btnOrderlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Orderlist1'  ;
		  let  name       = 'Orderlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  });


	  let btnSaleslist1El = document.getElementById('saleslist1');
	  btnSaleslist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Saleslist1'  ;
		  let  name       = 'Saleslist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  }); 
	  let btnInputlist1El = document.getElementById('inputlist1');
	  btnInputlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Inputlist1'  ;
		  let  name       = 'Inputlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  }); 
 	  let btnDeptadd1El = document.getElementById('deptadd1');
	  btnDeptadd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Deptadd1'  ;
		  let  name       = 'Deptadd1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=500, width=550, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  }); 
	  let btnProductadd1El = document.getElementById('productadd1');
	  btnProductadd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Productadd1'  ;
		  let  name       = 'Productadd1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=700, width=550, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  }); 
	  let btnUseradd1El = document.getElementById('userlist');
	  btnUseradd1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Userlist'  ;
		  let  name       = 'Userlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  }); 
	  let btnJumpoorderlist1El = document.getElementById('jumpoorderlist1');
	  btnJumpoorderlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Jumpoorderlist1'  ;
		  let  name       = 'Jumpoorderlist1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  }); 
	  let btnOutput1El = document.getElementById('output1');
	  btnOutput1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation();
		  let  html       = '/Output1'  ;
		  let  name       = 'Output1';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		   let childWindow = window.open(html, name, features);
		   childWindows.push(childWindow);
	  }); 
	  let btnOutputlist1El = document.getElementById('outputlist1');
	  btnOutputlist1El.addEventListener('click',  function(e) {
		  e.preventDefault();
	  //    e.stopPropagation(); 
		  let  html       = '/Outputlist1'  ;
		  let  name       = 'Outputlist1';  // '' 값이 없으면 창이 여러번 뜬다
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
	<%@ include file= "/WEB-INF/include/left2.jsp" %>
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