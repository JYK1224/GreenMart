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


</script>


</head>
<body>
	<div id="gd">
	<div id="main">
		<div>
			<h2> 회원 정보 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<table>
			  <tr>
			  	<td class="center">회원번호</td>
			  	<td class="center"  >${vo.c_id } </td>
			  </tr>
			  <tr>
			    <td class="center">회원이름</td>
		    	<td class="center" >${vo.c_name }</td>
			  </tr>
			  <tr>
			    <td>회원전화</td>
			    <td class="center" >${vo.c_phone }</td>
			  </tr>
			  <tr>
			    <td class="center">마일리지</td>
			    <td class="center">${vo.c_mile }</td>
			  </tr>
			  <tr>
			  	<td colspan="2">
				  <a href="/UpdateForm?c_id=${vo.c_id }" >[수정]</a>
				  <a href="/Delete?c_id=${vo.c_id }" >[삭제]</a>
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