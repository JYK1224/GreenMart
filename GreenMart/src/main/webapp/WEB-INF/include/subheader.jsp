<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <header id="header">
         	<h3  class="head">&nbsp;&nbsp;환영합니다.좋은하루되세요
   	<div class="ver">버전 : 1.0.0.1&nbsp;&nbsp;</div>
   	</h3>
     <h3 class="logo" >그린마트 업무시스템
     <div class="logid"> 
     사원번호 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:if test="${sessionScope.login != null}">
			<div class="logid" id="eid" style="margin-top: -16px;">${ sessionScope.login.e_id }</div>
		</c:if>
		
	 </div>
     </h3>