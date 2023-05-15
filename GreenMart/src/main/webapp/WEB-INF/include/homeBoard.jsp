<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	 
	<div class="dd">
	  <table>
	    <tr>&nbsp;&nbsp;- 공지사항<tr>
	    <tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;번호</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;작성일</td>
		<td>&nbsp;&nbsp;&nbsp;제목</td>
		</tr>	
	    <c:forEach var="noticeList" items="${ noticeList }">
	    <tr>
		<!-- 번호 -->
	    <td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ noticeList.idx }
		</td>
		<!-- 작성일 -->
		<td>
		&nbsp;&nbsp;${ fn:substring( noticeList.regdate, 0, 10 ) }
		</td>
		<!-- 제목 -->
		<td>
		<a href="/Menu3/View?m_id=${ noticeList.m_id }&idx=${ noticeList.idx }&nowpage=${ map.nowpage }">
			&nbsp;&nbsp;&nbsp;${ noticeList.title }
		</a>
		</td>
	    </tr>
	    </c:forEach>
	  </table>
	</div>
	
	<div class="aa">
	  <table>
	    <tr>&nbsp;&nbsp;- 업무연락<tr>
	    <tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;번호</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;작성일</td>
		<td>&nbsp;&nbsp;&nbsp;제목</td>
		</tr>	
	    <c:forEach var="contactList" items="${ contactList }">
	    <tr>
		<!-- 번호 -->
	    <td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ contactList.idx }
		</td>
		<!-- 작성일 -->
		<td>
		&nbsp;&nbsp;${ fn:substring( contactList.regdate, 0, 10 ) }
		</td>
		<!-- 제목 -->
		<td>
		<a href="/Menu3/View?m_id=${ contactList.m_id }&idx=${ contactList.idx }&nowpage=${ map2.nowpage }">
			&nbsp;&nbsp;&nbsp;${ contactList.title }
		</a>
		</td>
	    </tr>
	    </c:forEach>
	  </table>
	</div>

</body>
</html>