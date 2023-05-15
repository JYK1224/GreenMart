<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
<%@ include file="/WEB-INF/include/subheader.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
h2{text-align: center; margin: 20px; font-size: 30px; }
table {margin-left: auto; margin-right: auto;}
#lay {width: 90%; height: 200px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: -5px; box-shadow: 3px 3px 3px 3px gray;}
table, tr, td {border-collapse: collapse;}
tr,td{border: 1px solid black; }
td{ padding: 10px; margin: 30px; width: 200px;}
#qq { background-color: #f2f2f2;}
.btn  {
  width: 50px;
  height: 20px;
  color: #fff;
  font-weight:bold

  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow: 1px 1px 1px 1px #666666,
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;	

  border: none;
  color: #000;
}
.btn {
  background: rgb(96,9,240);
  background: linear-gradient(0deg, #D4D3D3 0%, #F6F6F6 100%);
  border: none;
  
}
.btn:before {
  height: 0%;
  width: 2px;
}
.btn:hover {
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .5), 
    inset -4px -4px 6px 0 rgba(255,255,255,.2),
    inset 4px 4px 6px 0 rgba(0, 0, 0, .4);
}

</style>
<script>

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}

	function delDept(){
		 if(confirm('삭제하시겠습니까?')) {
			 
		 $.ajax({
		        url: "/Delete",
		        type: "POST",
		        data: { c_id:'${vo.c_id}' },
		        success: function(response) {
		        	console.log(response);
		            alert('삭제되었습니다.');
		            if (window.opener) {
		                window.opener.location.reload(); // 부모 페이지 새로고침
		              }
		              window.close(); 
		        },
		        error: function(xhr, status, error) {
					console.error(error);
		        	alert('삭제에 실패했습니다.');
		        }
		    });
		 }
	}
	
	
window.onload = function() {
	let btnDelEl = document.getElementById("btnDel");
	btnDel.addEventListener('click', function(e) {
		delDept(e);
	});
	
	let btnUpEl = document.getElementById("btnUp");
	btnUpEl.addEventListener("click", function(e) {
		window.location.href = "/UpdateForm?c_id="+ ${vo.c_id } ;
	});
	
	
	
	
}	
	
	

</script>

</head>
<body>
	<div id="gd">
	<div id="main">
		<div>
			<h2> 회원 정보 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<table  id = lay>
			  <tr>
			  	<td class="center" id="qq">회원번호</td>
			  	<td class="center"  >${vo.c_id } </td>
			  </tr>
			  <tr>
			    <td class="center" id="qq">회원이름</td>
		    	<td class="center" >${vo.c_name }</td>
			  </tr>
			  <tr>
			    <td id="qq">회원전화</td>
			    <td class="center" >${vo.c_phone }</td>
			  </tr>
			  <tr>
			    <td class="center" id="qq">마일리지</td>
			    <td class="center">${vo.c_mile }</td>
			  </tr>
			  <tr>
			  	<td colspan="2">
				  <input type="button" class="btn" id="btnUp" value="수정"  style="margin:0 0 0 182px; text-align: center;">
				  <input type="button" class="btn" id="btnDel" value="삭제"  style="text-align: center"/>
			  	</td>
			  </tr>
			</table>
			
		</div>
	</div>
	 <%@ include file="/WEB-INF/include/bottom.jsp" %>
	</div>
</body>
</html>