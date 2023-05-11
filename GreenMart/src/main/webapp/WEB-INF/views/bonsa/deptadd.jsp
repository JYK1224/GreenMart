<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="css/common.css"/>
<%@ include file="/WEB-INF/include/subheader.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>

h2{
	border-collapse: collapse;
	text-align: center;
}

table {
  width: 95%;
  border-collapse: collapse;
  margin : 0 0 0 30px;
}

th, td {
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #f5f5f5;
}
</style>
<script type="text/javascript">
 /*  $(document).ready(function() {
    $.ajax({
      url: '/getCustomerCount',
      type: 'GET',
      success: function(data) {
        // data는 Controller 함수가 반환한 결과값입니다.
        console.log('고객 수:', data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.log('Error:', textStatus, errorThrown);
      }
    });
  }); */  // 등록시 회원번호 자동증가 가져오기(미완)
</script>
<script>

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	
	function submitMessage () {
	 	let id = document.forms["form"]["d_dam"].value;
	 	let name = document.forms["form"]["d_name"].value;
	  	let dam = document.forms["form"]["d_dam"].value;
	  	let phone = document.forms["form"]["d_phone"].value;
		if(id == "" || name == ""|| dam == ""|| phone == ""){
			alert("이름과 전화번호를 모두 입력해주세요.") 
			return false;
		}else{
		  	alert("회원등록에 성공했습니다.")
		}
	
	}


	window.onload = function() {
		
		let btnListEl = document.getElementById("btnList");
		btnListEl.addEventListener('click' , function(e){
			  e.preventDefault();
		      //e.stopPropagation();
			  let  html       = '/Deptlist1'  ;
			  let  name       = 'Deptlist1'; 
			  let  features   = 'height=700, width=1050, top=200, left=600'; 
			  window.open(html, name, features);
			  window.close();
		})
	
	}


</script>
</head>
<body>
	<div id="gd">
	<div id="main">
		<div>
			<h2> 신규 거래처 등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form name="form" action="/BWork/deptAdd" method="POST" onsubmit="return submitMessage()">
			<table>
			  <tr>
			  	<td>거래처번호</td>
			  	<td>
	    			<input type="text" name="d_id"  
	    			 > 
			  	</td>
			  </tr>
			  <tr>
			    <td>거래처명</td>
		    	<td>
			   	 	<input type="text" name="d_name"  />
		    	</td>
			  </tr>
			  <tr>
			    <td>담당자 이름</td>
			    <td>
			    	<input type="text" name="d_dam" value=""/>
		    	</td>
			  </tr>
			  <tr>
			    <td>담당자 번호</td>
			    <td>
			    	<input type="text" name="d_phone" maxlength="13" 
			    	 oninput="oninputPhone(this)" />
			    </td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	  <input  type="submit" value="등록">
			  	  <input  type="button" value="조회" id="btnList">
			  	</td>
			  </tr>
			</table>
			</form>
		</div>
	</div>
	 <%@ include file="/WEB-INF/include/bottom.jsp" %>
	</div>
</body>
</html>