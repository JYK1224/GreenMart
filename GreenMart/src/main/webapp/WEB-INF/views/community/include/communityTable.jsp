<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/css/common.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table id="PdsList">
	<caption><h2>${ map.m_name } (${ map.nowpage } page)</h2></caption>
	<tr>
		<td colspan="6" class="right">
			<a href="/Menu3/WriteForm?m_id=${ map.m_id }&bnum=0&lvl=0&step=0&nref=0&nowpage=${ map.nowpage }">새 글 쓰기</a>
		</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>직원번호</td>
		<td>조회수</td>
		<td>첨부파일수</td>
		<td>작성일</td>
	</tr>	
	
	<c:forEach var="pdsPagingVo" items="${ list }">
	<tr>
		<td>
		<!-- 번호 -->
		<c:if test="${ pdsPagingVo.lvl eq 0 }">
			${ pdsPagingVo.idx }
		</c:if>
		</td>
		<td>
		<!-- 제목(새글/답글) -->
		<c:choose>
			<c:when test="${ pdsPagingVo.lvl == 0 }">
				<c:choose>
					<c:when test="${ pdsPagingVo.del eq 0 }">
						<a href="/Menu3/View?m_id=${ pdsPagingVo.m_id }&idx=${ pdsPagingVo.idx }&nowpage=${ map.nowpage }">
						${ pdsPagingVo.title }
						</a>
					</c:when>
					<c:otherwise>
						<s>삭제된 게시물 입니다</s>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<b style="display:inline-block; width:${pdsPagingVo.lvl*20}px"></b>
				<c:choose>
					<c:when test="${ pdsPagingVo.del eq 0 }">
						<a href="/Menu3/View?m_id=${ pdsPagingVo.m_id }&idx=${ pdsPagingVo.idx }&nowpage=${ map.nowpage }">
						[답글] ${ pdsPagingVo.title }
						</a>
					</c:when>
					<c:otherwise>
						[답글] <s>삭제된 게시물 입니다</s>
					</c:otherwise>				
				</c:choose>
			</c:otherwise>
		</c:choose>
		</td>
		<td>
		<!-- 작성자 -->
		${ pdsPagingVo.e_id }
		</td>
		<td>
		<!-- 조회수 -->
		${ pdsPagingVo.readcount }
		</td>
		<td>
		<!-- 첨부파일수 -->
		<c:choose>
			<c:when test="${ pdsPagingVo.filescount ne 0 }">
				${ pdsPagingVo.filescount }
			</c:when>
			<c:otherwise>
				&nbsp;
			</c:otherwise>
		</c:choose>
		</td>
		<td>
		<!-- 날짜 -->
		${ fn:substring( pdsPagingVo.regdate, 0, 10 ) }
		</td>
	</tr>
	</c:forEach>
	
	</table>

</body>
</html>