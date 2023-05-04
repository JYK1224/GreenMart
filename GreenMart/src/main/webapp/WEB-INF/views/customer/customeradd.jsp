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


</style>
</head>
<body>
	<div id="gd">
	<div id="main">
		<div>
			<h2> 사원 등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form action="Customer/Customeradd" method="POST">
			<table>
			  <tr>
			    <td>회원번호</td>
			    <td>
			    	<input type="text" name="c_id" value="${vo.c_id }"/>
			    </td>
			  </tr>
			  <tr>
			    <td>회원이름</td>
		    	<td>
			   	 	<input type="text" name="c_name" value="${vo.c_name }" />
		    	</td>
			  </tr>
			  <tr>
			    <td>회원전화</td>
			    <td>
			    	<input type="text" name="c_phone" maxlength="13" value="${vo.c_name }"/>
			    </td>
			  </tr>
			  <tr>
			    <td>마일리지</td>
			    <td>
			    	<input type="text" name="c_mile" value="0" />
		    	</td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	  <input  type="submit" value="등록">
			  	  <input  type="button" value="조회">
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