<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="css/common.css"/>

    <%@ include file="/WEB-INF/include/subheader.jsp" %>
    </head>
<body>
	<div id="gd">
	<div class="container">
		<div class="content">
			<h2> 사원 등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form action="action.jsp" method="GET">
			<table>
			  <tr>
			    <td>사원번호</td>
			    <td><input type="text" name="custno" value=""/></td>
			  </tr>
			  <tr>
			    <td>사원이름</td>
			    <td><input type="text" name="custname" value="윈터" /></td>
			  </tr>
			  <tr>
			    <td>회원전화</td>
			    <td>
			    <input type="text" name="phone" maxlength="13" value="010-1111-1111"/>
			    <input class="btn btn-primary" type="button" value="중복" id="dubCheck">
			    <span id="chkresult"></span>
			    </td>
			  </tr>
			  <tr>
			    <td>회원주소</td>
			    <td><input type="text" name="address" value="그린시 그린동 그린구" /></td>
			  </tr>
			  <tr>
			    <td>가입일자</td>
			    <td><input type="text" name="joindate" value="2023-01-01"/></td>
			  </tr>
			  <tr>
			    <td>고객등급(A: VIP , B: 일반 , C: 노비)</td>
			    <td>
			    	<select name="grade" id="">
			    		<option value="">선택하세요</option>
			    		<option value="A">VIP</option>
			    		<option value="B">일반</option>
			    		<option value="C">노비</option>
			    	</select>
			    </td>
			  </tr>
			  <tr>
			    <td>도시코드</td>
			    <td><input type="text" name="city" value="01"/></td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	  <input class="btn btn-primary" type="submit" value="등록">
			  	  <input class="btn btn-primary" type="button" value="조회">
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