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
<style>
h2{ margin: 30px 0 30px 180px; font-size: 30px; }
table {margin-left: 200px; margin-right: auto; width: 80%;  border: 3px solid #666666;  box-shadow: 3px 3px 3px 3px gray;}
#lay {width: 90%; height: 400px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: -5px; box-shadow: 3px 3px 3px 3px gray;}
table, tr, td {border-collapse: collapse;}
tr,td{border: 1px solid black; }
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

	<h2>${ map.m_name } (${ map.nowpage } page)</h2>
<table id="PdsList">
	<tr>
		<td colspan="6" class="right">
			<a href="/Menu3/WriteForm?m_id=${ map.m_id }&bnum=0&lvl=0&step=0&nref=0&nowpage=${ map.nowpage }" class="btn" style="width: 80px; height: 25px; text-align: center;">새글쓰기</a>
		</td>
	</tr>
	<colgroup>
            <col width="2%">
            <col width="15%">
            <col width="2%">
            <col width="2%">
            <col width="4%">
            <col width="3%">
          </colgroup>
	<tr>
		<td style="text-align: center;">번호</td>
		<td style="text-align: center;">제목</td>
		<td style="text-align: center;">직원번호</td>
		<td style="text-align: center;">조회수</td>
		<td style="text-align: center;">첨부파일수</td>
		<td style="text-align: center;">작성일</td>
	</tr>	
	
	<c:forEach var="pdsPagingVo" items="${ list }">
	<tr>
		<td style="text-align: center;">
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
		<td style="text-align: center;">
		<!-- 작성자 -->
		${ pdsPagingVo.e_id }
		</td>
		<td style="text-align: center;">
		<!-- 조회수 -->
		${ pdsPagingVo.readcount }
		</td>
		<td style=" margin-top: 30px;">
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
		<td style="text-align: center;">
		<!-- 날짜 -->
		${ fn:substring( pdsPagingVo.regdate, 0, 10 ) }
		</td>
	</tr>
	</c:forEach>
	
	</table>

</body>
</html>