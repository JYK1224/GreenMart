<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
  <nav>
        <ul class="menu">
        <br>
        <h3><즐겨찾기 메뉴></h3>
        <c:forEach var="favoriteList" items="${ favoriteList }" >
        	<li><a href="" id="${ favoriteList.ft_atag }">${ favoriteList.ft_name }</a></li>
        </c:forEach>
        </ul>
      </nav>