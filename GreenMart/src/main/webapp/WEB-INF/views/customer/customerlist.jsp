<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
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
        <h2>회원목록</h2> 
        <table>
          <colgroup>
            <col width="11%">
            <col width="11%">
            <col width="17%">
            <col width="11%">
          </colgroup>
          <thead>
            <tr>
              <th>회원번호</th>
              <th>회원성명</th>
              <th>전화번호</th>
              <th>마일리지</th>
            </tr>
          </thead>
          <c:forEach var="customer" items="${cusList}" >
            <tr>
              <td>${customer.c_id }</td>
              <td>${customer.c_name }</td>
              <td>${customer.c_phone }</td>
              <td>${customer.c_mile }</td>
            </tr>          
          </c:forEach>
        </table>
     </div>  
  </div>
	
<%@ include file="/WEB-INF/include/bottom.jsp" %>
</div>
</body>
</html>