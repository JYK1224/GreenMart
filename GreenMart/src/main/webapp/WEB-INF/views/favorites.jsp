<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
<%@ include file="/WEB-INF/include/subheader.jsp" %>
  <style>
    .menu {
      margin: 5px;
      padding: 10px;
      background-color: #f2f2f2;
      cursor: move;
    }
    .j-zone, .b-zone, .o-zone {
      width: 250px;
      height: 730px;
      border: 1px solid black;
      float: left;
    }
    .j-zone div, .b-zone div, .o-zone div {
    	height: 17px;
    }
    .right-zone {
      width: 250px;
      height: 730px;
      border: 1px solid black;
      float: right;
    }
 button { 
     align: right;
    } 
  </style>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<span>즐겨찾기 메뉴 관리</span>
<button onclick="clearRightZone()">즐겨찾기 ZONE 초기화</button>
<button onclick="saveRightZoneMenus()">즐겨찾기 저장</button>
<div id="gd">	
  <div class="j-zone" ondragstart="drag(event)">
<div class="menu" draggable="true" data-menu-id="1"><점포>상품주문업무</div>
<div class="menu" draggable="true" data-menu-id="2"><점포>본사주문업무</div>
<div class="menu" draggable="true" data-menu-id="3"><점포>상품입고업무</div>
<div class="menu" draggable="true" data-menu-id="4"><점포>거래처조회</div>
<div class="menu" draggable="true" data-menu-id="5"><점포>점포전체조회</div>
<div class="menu" draggable="true" data-menu-id="6"><점포>상품상세조회</div>
<div class="menu" draggable="true" data-menu-id="7"><점포>상품전체조회</div>
<div class="menu" draggable="true" data-menu-id="8"><점포>주문내역조회</div>
<div class="menu" draggable="true" data-menu-id="9"><점포>입고내역조회</div>
<div class="menu" draggable="true" data-menu-id="10"><점포>상품매출조회</div>
<div class="menu" draggable="true" data-menu-id="11"><점포>상품폐기업무</div>
<div class="menu" draggable="true" data-menu-id="12"><점포>폐기내역조회</div>
<div class="menu" draggable="true" data-menu-id="13"><점포>상풀매출입력</div>
</div>
  <div class="b-zone" ondragstart="drag(event)">
<div class="menu" draggable="true" data-menu-id="14"><본사>상품주문업무</div>
<div class="menu" draggable="true" data-menu-id="15"><본사>상품입고업무</div>
<div class="menu" draggable="true" data-menu-id="16"><본사>신규거래처등록</div>
<div class="menu" draggable="true" data-menu-id="17"><본사>신규상품등록</div>
<div class="menu" draggable="true" data-menu-id="18"><본사>사용자관리</div>
<div class="menu" draggable="true" data-menu-id="19"><본사>거래처조회</div>
<div class="menu" draggable="true" data-menu-id="20"><본사>점포전체조회</div>
<div class="menu" draggable="true" data-menu-id="21"><본사>상품상세조회</div>
<div class="menu" draggable="true" data-menu-id="22"><본사>상품전체조회</div>
<div class="menu" draggable="true" data-menu-id="23"><본사>주문내역조회</div>
<div class="menu" draggable="true" data-menu-id="24"><본사>입고내역조회</div>
<div class="menu" draggable="true" data-menu-id="25"><본사>상품매출조회</div>
<div class="menu" draggable="true" data-menu-id="26"><본사>점포주문내역조회</div>
<div class="menu" draggable="true" data-menu-id="27"><본사>상품출고업무</div>
<div class="menu" draggable="true" data-menu-id="28"><본사>상품출고조회</div>
<div class="menu" draggable="true" data-menu-id="29"><본사>상품폐기업무</div>
<div class="menu" draggable="true" data-menu-id="30"><본사>폐기내역조회</div>
  </div>
  <div class="o-zone" ondragstart="drag(event)">
<div class="menu" draggable="true" data-menu-id="31"><커뮤니티>공지사항</div>
<div class="menu" draggable="true" data-menu-id="32"><커뮤니티>업무연락</div>
<div class="menu" draggable="true" data-menu-id="33"><커뮤니티>경조사</div>
<div class="menu" draggable="true" data-menu-id="34"><커뮤니티>자료실</div>
<div class="menu" draggable="true" data-menu-id="35"><커뮤니티>사원조회</div>
<div class="menu" draggable="true" data-menu-id="36"><고객관리>고객신규등록</div>
<div class="menu" draggable="true" data-menu-id="37"><고객관리>고객정보조회</div>
</div>
  

<div class="right-zone" ondragover="allowDrop(event)" ondrop="drop(event)" ondragenter="dragEnter(event)" ondragleave="dragLeave(event)" ondragstart="return false;">여기에 드래그앤드랍</div>


<script>
function saveRightZoneMenus() {
	  var menus = [];

	  // right-zone의 메뉴들을 가져와서 배열에 추가
	  $('.right-zone .menu').each(function() {
	    var menuId = $(this).data('menu-id');
	    menus.push(menuId);
	  });

	  // 서버로 전송할 데이터 형식에 맞게 가공
	  var requestData = {
	    menus: menus,	// 선택한 메뉴들의 배열
	    e_id: getE_Id() // 로그인한 사용자 아이디 정보
	  };

	  // AJAX 요청을 통해 서버에 데이터 전송
	  $.ajax({
	    url: "/SaveFavorites", 
	    data: requestData,
	    type: "POST",
	    success: function(response) {
	    	if(response != 0){
		    	alert('즐겨찾기 설정되었습니다!');
			}
	      // 저장이 성공했을 경우 추가적인 작업 수행
	    },
	    error: function(error) {
	      console.error('Failed:', error);
	      // 저장 실패 시 에러 처리
	    }
	  });
	}

	// 사용자 아이디를 가져옴
	function getE_Id() {
		
	  return '0001';
	}

// ----------------------드래그앤드랍 기능-----------------------
  let draggedMenu = null;

  function allowDrop(event) {
    event.preventDefault();
  }
  
  function drag(event) {
    draggedMenu = event.target;
  }
  
  function drop(event) {
    event.preventDefault();
    const rightZone = document.querySelector('.right-zone');
    
    // 중복 체크
    if (!isMenuExist(rightZone, draggedMenu)) {
      const clonedMenu = draggedMenu.cloneNode(true);
      rightZone.appendChild(clonedMenu);
    }
  }
  
  function dragEnter(event) {
    event.currentTarget.classList.add('dragover');
  }
  
  function dragLeave(event) {
    event.currentTarget.classList.remove('dragover');
  }
  
  function isMenuExist(rightZone, menu) {
    const menuText = menu.textContent;
    const menus = rightZone.querySelectorAll('.menu');
    
    for (let i = 0; i < menus.length; i++) {
      if (menus[i].textContent === menuText) {
        return true;
      }
    }
    
    return false;
  }
  
  function clearRightZone() {
    const rightZone = document.querySelector('.right-zone');
    console.dir(rightZone);
    rightZone.innerHTML = '여기에 드래그앤드랍';
  }
  //--------------------------------------------------------------------------
</script>

</div>
    <%@ include file="/WEB-INF/include/bottom.jsp" %>
</body>
</html>