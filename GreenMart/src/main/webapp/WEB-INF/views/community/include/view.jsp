<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시물 조회</title>
<link rel="shortcut icon" href="/img/favicon.ico"	/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<style>
	#table td:first-child { width : 10%; }
	#table td:nth-child(2) { width : 40%; }
	#table td:nth-child(3) { width : 10%; }
	#table td:last-child { width : 40%; }

	#table tr:nth-of-type(4) { height: 400px; vertical-align: top;}
	#table tr:last-child > td { text-align: center; }
	span { display: inline-block; width:15px;}
	a:hover { text-decoration: none;}
	
	.btn:hover {background: lightgreen;}
	.btn-primary:hover {background: lightgreen;}
	.btn.btn-primary.btn-sm:hover {background: lightgreen;}
	
	h2 { text-align: center;}
</style>
</head>
<body>
	<div id="main">
	
		<h2>${ map.m_name } 내용보기</h2>
		<table id="table">
			<tr>
				<td class="center">글번호</td>
				<td class="center">${ vo.idx }</td>
				<td class="center">조회수</td>
				<td class="center">${ vo.readcount }</td>
			</tr>
			<tr>
				<td class="center">작성자</td>
				<td class="center">${ vo.e_id }</td>
				<td class="center">작성일</td>
				<td class="center">${ vo.regdate }</td>
			</tr>
			<tr>
				<td class="center">제목</td>
				<td colspan="3" style="text-align:left">${ vo.title }</td>
			</tr>
			<tr>
				<td class="center">내용</td>
				<td colspan="3" style="text-align:left">${ vo.cont }</td>
			</tr>
			<tr>
				<td class="center">첨부파일</td>
				<td colspan="3" style="text-align:left; padding:30px 10px;">
					<c:forEach var="file" items="${ fileList }">
						<div>
							<%-- <a href="<c:out value="/Pds/download/external/${ file.sfilename }" />"> --%>
							<a href="/Menu3/download/external/${ file.f_sname }" >
								${ file.f_name }							
							</a>						
						</div>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<a class="btn btn-primary btn-sm" 
						href="/Menu3/WriteForm?m_id=${vo.m_id}&bnum=0&lvl=0&step=0&nref=0&nowpage=1">새글쓰기</a><span></span>
					<a class="btn btn-primary btn-sm" 
						href="/Menu3/WriteForm?m_id=${vo.m_id}&idx=${vo.idx}&bnum=${vo.bnum}&lvl=${vo.lvl}&step=${vo.step}&nref=${vo.nref}&nowpage=${map.nowpage}">답글쓰기</a><span></span>
					<a class="btn btn-primary btn-sm" 
						href="/Menu3/UpdateForm?m_id=${vo.m_id}&idx=${vo.idx}&nowpage=${map.nowpage}">수정</a><span></span>
					<a class="btn btn-primary btn-sm" 
						href="/Menu3/Delete?m_id=${vo.m_id}&idx=${vo.idx}&nowpage=${map.nowpage}">삭제</a><span></span>
					<a class="btn btn-primary btn-sm" 
						href="/Menu3/Pds?m_id=${vo.m_id}&nowpage=${map.nowpage}">목록으로</a><span></span>
					<a class="btn btn-primary btn-sm" 
						href="javascript:history.back()">이전으로</a><span></span>
					<a class="btn btn-primary btn-sm" 
						href="/">Home</a>
				</td>
			</tr>
		
		</table>
	</div>
</body>
</html>