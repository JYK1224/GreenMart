<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
  <nav>
        <ul class="menu">
        <br>
        <li style="font-size: 20px; margin: 0px 0px 5px 0px;">&nbsp;즐겨찾기</li>
        <c:forEach var="favoriteList" items="${ favoriteList }" >
        	<li><a href="" id="${ favoriteList.ft_atag }">${ favoriteList.ft_name }</a></li>
        </c:forEach>
        </ul>
      </nav>