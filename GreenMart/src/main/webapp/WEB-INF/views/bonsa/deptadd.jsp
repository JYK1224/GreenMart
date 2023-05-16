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
		  	alert("거래처 등록에 성공했습니다.")
		}
	
	}


	window.onload = function() {
		
		let btnListEl = document.getElementById("btnList");
		btnListEl.addEventListener('click' , function(e){
			  e.preventDefault();
		      //e.stopPropagation();
			  let  html       = '/Deptlist1'  ;
			  let  name       = 'Deptlist1'; 
			  let  features   = 'height=800, width=1050, top=200, left=600'; 
			  window.open(html, name, features);
			  window.close();
		})
	
	}


</script>
</head>
<body>
	<div id="gd">
			<h2> 신규 거래처 등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form name="form" action="/BWork/deptAdd" method="POST" onsubmit="return submitMessage()">
			<table id="lay">
			  <tr>
			  	<td id="qq">거래처번호</td>
			  	<td>
	    			<input type="text" name="d_id"  
	    			 > 
			  	</td>
			  </tr>
			  <tr>
			    <td id="qq">거래처명</td>
		    	<td>
			   	 	<input type="text" name="d_name"  />
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">담당자 이름</td>
			    <td>
			    	<input type="text" name="d_dam" value=""/>
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">담당자 번호</td>
			    <td>
			    	<input type="text" name="d_phone" maxlength="13" 
			    	 oninput="oninputPhone(this)" />
			    </td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	  <input  type="submit" value="등록" class="btn" style="margin: 0 0 0 182px;">
			  	  <input  type="button" value="조회" id="btnList" class="btn">
			  	</td>
			  </tr>
			</table>
			</form>
	 <%@ include file="/WEB-INF/include/bottom.jsp" %>
	</div>
</body>
</html>