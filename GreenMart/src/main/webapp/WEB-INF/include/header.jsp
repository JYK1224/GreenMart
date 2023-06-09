<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>그린마트 업무시스템</title>
    
</head>
<body>
    <header id="header">
        <h3 class="head">&nbsp;&nbsp;환영합니다. 좋은 하루되세요
            <div class="ver">버전 : 1.0.0.1&nbsp;&nbsp;</div>
        </h3>
        <h3 class="logo">그린마트 업무시스템
            <div class="logid">
            <ul>
                    <li style="font-size: 1.1rem;">${sessionScope.login.e_name} 님 환영합니다<br></li>
              </ul>
            </div>
        </h3>
        <div class="gnb">
            <ul>
                <li><a href="/">홈으로</a></li>
                <c:choose>
                    <c:when test="${sessionScope.login.j_id eq '12010'}">
                        <li><a href="/Bonsa">본사화면</a></li>
                    </c:when>
                    <c:when test="${sessionScope.login.j_id eq '12020'}">
                        <li><a href="/Jumpo">점포화면</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/Jumpo">점포화면</a></li>
                        <li><a href="/Bonsa">본사화면</a></li>
                    </c:otherwise>
                </c:choose>
                <li><a href="/Menu3/Pds?nowpage=1&m_id=M01">커뮤니티</a></li>
                <li><a href="/Customer">고객관리</a></li>
                <li><a href="" id="favorites">즐겨찾기</a></li>
            </ul>
        </div>
    </header>
</body>
</html>