<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:set var="m_id"           value="${ pdsPagingVo.m_id }"/>
	<c:set var="startnum"       value="${ pdsPagingVo.pagestartnum }"/>
	<c:set var="endnum"         value="${ pdsPagingVo.pageendnum }"/>
	<c:set var="totalpagecount" value="${ pdsPagingVo.totalpagecount }"/>

	<div>
	 <table width="500" height="25" align="center">
	  <tr>
	   <td width="500" height="25" align="center">
	  <!-- 처음/이전 -->
	  
	  <c:if test="${ startnum gt 1 }">
		  <a href="/Menu3/Pds?m_id=${ map.m_id }&nowpage=1">  <<  </a>&nbsp;
		  <a href="/Menu3/Pds?m_id=${ map.m_id }&nowpage=${ startnum - 1 }">  <	</a>&nbsp;
	  </c:if>
	  
	   <!-- 1 2 3 4 5 6 7 8 9 10 -->
	   <c:forEach var="pagenum" begin="${ startnum }" end="${ endnum }" step="1">
	     <a href="/Menu3/Pds?m_id=${ map.m_id }&nowpage=${ pagenum }">
	     ${ pagenum }
	     </a>&nbsp;&nbsp;
	   </c:forEach>	  
	   
	  <!-- 다음/마지막 -->
	  <c:if test="${ totalpagecount ne endnum }">
		  <a href="/Menu3/Pds?m_id=${ map.m_id }&nowpage=${ endnum + 1 }">  >  </a>&nbsp;
		  <a href="/Menu3/Pds?m_id=${ map.m_id }&nowpage=${ totalpagecount }">  >>  </a>&nbsp;
	  </c:if>
	   </td>
	  </tr>
	 </table>
	</div>