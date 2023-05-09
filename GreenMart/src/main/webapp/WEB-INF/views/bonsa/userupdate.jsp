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
	
		

</script>


</head>
<body>
	<div id="gd">
	<div id="main">
		<div>
			<h2> 사원 수정 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form action="/BWork/userUpdate" method="POST">
			<table>
			  <tr>
			  	<td>사원 번호</td>
			  	<td>
	    			<input type="text" name="e_id"  
	    			readonly="readonly" value="${vo.e_id }"> 
			  	
			  	</td>
			  </tr>
			  <tr>
			    <td>이름</td>
		    	<td>
			   	 	<input type="text" name="c_name" value="${vo.e_name }" />
		    	</td>
			  </tr>
			  <tr>
			    <td>비밀번호</td>
			    <td>
			    	<input type="password" name="e_passwd" value="${vo.e_passwd }"/>
			    </td>
			  </tr>
			  <tr>
			    <td>전화번호</td>
			    <td>
			    	<input type="text" name="e_phone" maxlength="13" 
			    	 oninput="oninputPhone(this)" value="${vo.e_phone }" />
			    </td>
			  </tr>
			  <tr>
			    <td>직급</td>
			    <td>
			    	<input type="text" name="e_intro" value="${vo.e_intro }"/>
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
			  	  <input  type="submit" value="수정">
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