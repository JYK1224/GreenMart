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
 
</script>
<script>

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	
	function checkOnlyOne(e) {

		const checkboxes 
		      = document.getElementsByName("j_id");
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  e.checked = true;
		}
	
	function submitMessage (e) {
	 	let eid    = document.forms["form"]["e_id"].value;
	 	let name   = document.forms["form"]["e_name"].value;
	  	let phone  = document.forms["form"]["e_phone"].value;
	  	let passwd = document.forms["form"]["e_passwd"].value;
	  	let intro  = document.forms["form"]["e_intro"].value;
	  	let jid    = null;
	  	document.getElementsByName("j_id").forEach((cb) =>   {
	  		if (cb.checked){
	  			jid = cb.value;
	  		}
	  	});
		if(eid == "" ||name == "" || phone == ""|| passwd == ""|| intro == ""|| jid == ""){
			alert("모든항목을 빈칸없이 입력해주세요.") 
			e.preventDefault();
		}else{
		  	alert("회원등록에 성공했습니다.")
		  	formEl.submit();
		  	 window.location.href="/Useradd"
		}
	}
	
	window.onload = function() {
		let btnListEl = document.getElementById("btnlist");
		btnListEl.addEventListener('click' , function(e){
			  e.preventDefault();
		      //e.stopPropagation();
			  let  html       = '/UserList'  ;
			  let  name       = 'UserList'; 
			  let  features   = 'height=700, width=1050, top=200, left=600'; 
			  window.open(html, name, features);
		});
		
		let formEl = document.forms["form"];
		  formEl.addEventListener('submit', submitMessage);
		
		  	
	}
	

</script>
</head>
<body>
	<div id="gd">
	<div id="main">
		<div>
			<h2> 사원등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form name="form" action="/BWork/userAdd" method="POST" >
			<table>
			  <tr>
			  	<td>사원번호</td>
			  	<td>
	    			<input type="number" name="e_id" max="9999999999" oninput="this.value = this.value.slice(0, 10)" required>
			  	</td>
			  </tr>
			  <tr>
			    <td>이름</td>
		    	<td>
			   	 	<input type="text" name="e_name"  />
		    	</td>
			  </tr>
			  <tr>
			    <td>비밀번호</td>
			    <td>
			    	<input type="password" name="e_passwd" value=""/>
			    </td>
			  </tr>
			  <tr>
			    <td>전화번호</td>
			    <td>
			    	<input type="text" name="e_phone" maxlength="13" 
			    	 oninput="oninputPhone(this)" />
		    	</td>
			  </tr>
			  <tr>
			    <td>직급</td>
			    <td>
			    	<input type="text" name="e_intro" value=""/>
		    	</td>
			  </tr>
			  <tr>
			    <td>부서</td>
			    <td>
			    	<input type="checkbox" name="j_id" 
			    	onclick="checkOnlyOne(this)" value="12010"/>본사
			    	<input type="checkbox" name="j_id" 
			    	onclick="checkOnlyOne(this)" value="12020"/>부전점
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