<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>그린마트</title>
<link rel="stylesheet" href="css/common.css"/>
</head>
<style>
	#gion{
		margin-top: 5px; margin-left: 5px;
		
	} 
	
	#gisang{
		position: absolute; left: 1240px; top: 475px;;
		
	}

    img {
      width: 25px;
      height: 25px;
      margin-right: 5px;
    }
</style>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
function data_kangsu(data){
	let body = data.response.body;
	let arr = body.items.item;
	let html = ''; 
	
	//이미지
	const images = {
			'맑음'           : 'https://cdn-icons-png.flaticon.com/128/3262/3262946.png',
			'흐림'           : 'https://cdn-icons-png.flaticon.com/128/2722/2722859.png',
			'구름많음'       : 'https://cdn-icons-png.flaticon.com/128/2722/2722836.png',
			'구름많고 비'    : 'https://cdn-icons-png.flaticon.com/128/2722/2722809.png',
			'구름많고 눈'    : 'https://cdn-icons-png.flaticon.com/128/2722/2722873.png',
			'구름많고 비/눈' : 'https://cdn-icons-png.flaticon.com/128/2722/2722873.png',
			'구름많고 소나기': 'https://cdn-icons-png.flaticon.com/128/2840/2840777.png',
			'흐리고 비'      : 'https://cdn-icons-png.flaticon.com/128/2722/2722809.png',
			'흐리고 눈'      : 'https://cdn-icons-png.flaticon.com/128/2722/2722873.png',
			'흐리고비/눈'    : 'https://cdn-icons-png.flaticon.com/128/2722/2722873.png',
			'흐리고 소나기'  : 'https://cdn-icons-png.flaticon.com/128/2841/2841125.png',
			'온도': 'https://cdn-icons-png.flaticon.com/128/3052/3052776.png'
	};
	
	arr.forEach(function (kos, index) {
		
		let currentDate = new Date(); // 현재 시간을 가져옵니다.

		let targetDates = []; // 3일 후부터 7일 후까지의 날짜를 담을 배열
		let days = ['일', '월', '화', '수', '목', '금', '토'];

		for (let i = 3; i <= 7; i++) {
		  let targetDate = new Date(currentDate);
		  targetDate.setDate(targetDate.getDate() + i); // i일 후의 날짜를 설정합니다.

		  let targetMonth = targetDate.getMonth() + 1;
		  let targetDay = targetDate.getDate();
		  let targetDayOfWeek = days[targetDate.getDay()];

		  targetDates.push({
		    date: `${targetMonth}-${targetDay}`,
		    dayOfWeek: targetDayOfWeek
		  }); // 3일 후의 요일을 가져옵니다.
		}
	    html += '<div id="gisang">';
		html += '<ul>';
		html += '<li>        </li>'
		html += '<li> 오전 오후 </li>'
		if (kos.wf3Am in images){
			let imagesSrc = images[kos.wf3Am]
			html += '<li>'+targetDates[0].date+'<img src="'+imagesSrc+'">' ; 
		}
		if(kos.wf3Pm in images){
			let imagesSrc = images[kos.wf3Pm]
			html += '<img src="'+imagesSrc+'"</li>';
		}
		if (kos.wf4Am in images){
			let imagesSrc = images[kos.wf4Am]
			html += '<li>'+targetDates[1].date+'<img src="'+imagesSrc+'">' ; 
		}
		if(kos.wf4Pm in images){
			let imagesSrc = images[kos.wf4Pm]
			html += '<img src="'+imagesSrc+'"</li>';
		}
		if (kos.wf5Am in images){
			let imagesSrc = images[kos.wf5Pm]
			html += '<li>'+targetDates[2].date+'<img src="'+imagesSrc+'">' ; 
		}
		if(kos.wf5Pm in images){
			let imagesSrc = images[kos.wf5Pm]
			html += '<img src="'+imagesSrc+'"</li>';
		}
		if (kos.wf6Am in images){
			let imagesSrc = images[kos.wf6Am]
			html += '<li>'+targetDates[3].date+'<img src="'+imagesSrc+'">' ; 
		}
		if(kos.wf6Pm in images){
			let imagesSrc = images[kos.wf6Pm]
			html += '<img src="'+imagesSrc+'"</li>';
		}
		if (kos.wf7Am in images){
			let imagesSrc = images[kos.wf7Am]
			html += '<li>'+targetDates[4].date+'<img src="'+imagesSrc+'">' ; 
		}
		if(kos.wf7Pm in images){
			let imagesSrc = images[kos.wf7Pm]
			html += '<img src="'+imagesSrc+'"</li>';
		}
					
		html += '</ul>';
		html += '</div>';
	});
	
	return html;
}  
	   function data_gion(data){
	let body = data.response.body;
	let arr = body.items.item;
	let html = ''; 
	arr.forEach(function (kos, index) {
		let currentDate = new Date(); // 현재 시간을 가져옵니다.

		let targetDates = []; // 3일 후부터 7일 후까지의 날짜를 담을 배열
		let days = ['일', '월', '화', '수', '목', '금', '토'];

		for (let i = 3; i <= 7; i++) {
		  let targetDate = new Date(currentDate);
		  targetDate.setDate(targetDate.getDate() + i); // i일 후의 날짜를 설정합니다.

		  let targetMonth = targetDate.getMonth() + 1;
		  let targetDay = targetDate.getDate();
		  let targetDayOfWeek = days[targetDate.getDay()];

		  targetDates.push({
		    date: `${targetMonth}-${targetDay}`,
		    dayOfWeek: targetDayOfWeek
		  }); // 3일 후의 요일을 가져옵니다.
		}
		
		html += '<div id="gion">';
		html += '<ul>';
		html += '<li>부전날씨</li>';

		html += '<li>&nbsp;&nbsp;&nbsp;&nbsp;최저 최고</li>'
		
		html += '<li style="margin: 0 0 8.5px 0;">('+targetDates[0].dayOfWeek+')' ;
		html += ''+kos.taMin3+'℃/' ;
		html += ''+kos.taMax3+'℃</li>';
		html += '<li style="margin: 0 0 8.5px 0;">('+targetDates[1].dayOfWeek+')' ;
		html += ''+kos.taMin4+'℃/' ;
		html += ''+kos.taMax4+'℃</li>';
		html += '<li style="margin: 0 0 8.5px 0;">('+targetDates[2].dayOfWeek+')' ;
		html += ''+kos.taMin5+'℃/'; 
		html += ''+kos.taMax5+'℃</li>';
		html += '<li style="margin: 0 0 8.5px 0;">('+targetDates[3].dayOfWeek+')' ;
		html += ''+kos.taMin6+'℃/' ;
		html += ''+kos.taMax6+'℃</li>';
		html += '<li>('+targetDates[4].dayOfWeek+')' ;
		html += ''+kos.taMin7+'℃/' ;
		html += ''+kos.taMax7+'℃</li>';
		
					
		html += '</ul>';
		html += '</div>';
	});
	return html;
}  
  
	  $(document).ready(function() {
		  let url1 = 'http://localhost:9090/gisang?keyword=';
		  let url2 = 'http://localhost:9090/gion?keyword=';

		  let ajax1 = $.ajax({
		    url: url1,
		    data: {
		      keyword: $('#search').val()
		    }
		  });

		  let ajax2 = $.ajax({
		    url: url2,
		    dataType: 'JSON',
		    data: {
		      keyword: $('#search').val()
		    }
		  });
		  $.when(ajax1, ajax2).done(function(data1, data2) {
			console.log(data1[0].response.body.items.item)
			console.log(data2[0])
		    let html1 = data_kangsu(data1[0]);
		    let html2 = data_gion(data2[0]);
		    $('#div1').html(html1 + html2);
		  }).fail(function(xhr) {
		    console.log(xhr);
		    alert(xhr.status + ':' + xhr.textStatus);
		  });
		});
	
 	
</script>
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
	if( btnDeptlistEl != null ){
	btnDeptlistEl.addEventListener('click',  function(e) {
		  e.preventDefault();
	   // e.stopPropagation();
		  let  html       = '/Deptlist'  ;
		  let  name       = 'Deptlist';  // '' 값이 없으면 창이 여러번 뜬다
		  let  features   = 'height=750, width=1050, top=200, left=300'; 
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
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
		  let childWindow = window.open(html, name, features);
		  childWindows.push(childWindow);
	});
	}
	
	let btnFavoritesEl = document.getElementById('favorites');
	if( btnFavoritesEl != null ){
		btnFavoritesEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			let html = '/Favorites';
			let name = 'Favorites'; // '' 값이 없으면 창이 여러번 뜬다
			let features = 'height=1050, width=600, top=200, left=300';
			let childWindow = window.open(html, name, features);
			  childWindows.push(childWindow);
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
	// 로그인화면으로
	   let logoutLinkEl = document.getElementById('logout');
	    logoutLinkEl.addEventListener('click', function(e) {
	        e.preventDefault();
	        handleLogout();
	        window.location.href = "/logout";
	    });
	
	}
</script>
<body>

	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left.jsp" %>
	<%@ include file ="/WEB-INF/include/cal.jsp" %>
	<div id="gd">
	 
                    <a href="/logout.jsp" id="logout" onclick="handleLogout()" style="width: 90px; height:25px; position:absolute; margin-left: 1270px; margin-top: -31px;font-size: 17px; color: white; " >로그아웃</a>
         
	 
	<!-- 공지사항, 업무연락 -->
    <%@ include file="/WEB-INF/include/homeBoard.jsp" %>
	<div id="calendar"></div>
	<div id="main">
	<div id= "div1" style="width:190px; height:195px; margin-left:83%; margin-top:-29%; border: 1px solid black; box-shadow: 3px 3px 3px 3px gray;">
	</div>
	</div>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>