<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
<style>
h2{ margin: 30px 0 30px 180px; font-size: 30px; }
table {margin-left: 200px; margin-right: auto; width: 80%;  border: 3px solid #666666;  box-shadow: 3px 3px 3px 3px gray;}
#lay {width: 90%; height: 400px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: -5px; box-shadow: 3px 3px 3px 3px gray;}
table, tr, td {border-collapse: collapse;}
tr,td{border: 1px solid black; text-align: center; }
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
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp" %>
	<%@ include file= "/WEB-INF/include/left3.jsp" %>
	<%@ include file ="/WEB-INF/include/cal.jsp" %>
	 
<h2>${ map.m_name } (${ map.nowpage } page)</h2>	
	
        <table id="table">
          <colgroup>
            <col width="2%">
            <col width="2%">
            <col width="2%">
            <col width="2%">
            <col width="4%">
            <col width="3%">
          </colgroup>
          <thead>
            <tr>
              <th>사원번호</th>
              <th>이름</th>
              <th>전화번호</th>
              <th>직급</th>
              <th>가입일</th>
              <th>부서명</th>  
            </tr>
          </thead>
          <c:forEach var="emp" items="${empList}" >
            <tr>
              <td>${emp.e_id}</td>
              <td>${emp.e_name}</td>
			  <td>${emp.e_phone}</td>              
			  <td>${emp.e_intro}</td>              
			  <td>${emp.e_indate}</td>              
			  <td>${emp.j_name}</td>              
            </tr>          
          </c:forEach>
        </table>
</body>
</html>