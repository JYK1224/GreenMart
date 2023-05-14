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
<link rel="stylesheet" href="/css/common.css" />
<style>
    #table { height:65%; border: 3px solid #666666; width:70%;  position: absolute; left:-20%;  margin-top: 10px; box-shadow: 3px 3px 3px 3px gray;}
	#table th { border:1px solid black; width : 10%; }
	#table td { border:1px solid black; width : 50%; }
	h2 { margin: 20px 20px 20px 180px;; font-size: 30px;}
	

.btn  {
  width: 50px;
  height: 25px;
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
  margin: 0 5px;
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
	<div id="main">
	
		<h2>${ map.m_name } 내용보기</h2>
		<table id="table">
			<tr>
				<th class="center">글번호</th>
				<td class="center">&nbsp;&nbsp;${ vo.idx }</td>
				<th class="center">조회수</th>
				<td class="center">&nbsp;&nbsp;${ vo.readcount }</td>
			</tr>
			<tr>
				<th class="center">작성자</th>
				<td class="center">&nbsp;&nbsp;${ vo.e_id }</td>
				<th class="center">작성일</th>
				<td class="center">&nbsp;&nbsp;${ vo.regdate }</td>
			</tr>
			<tr>
				<th class="center">제목</th>
				<td colspan="3" style="text-align:left">&nbsp;&nbsp;${ vo.title }</td>
			</tr>
			<tr>
				<th class="center" style="padding: 30px;">내용</th>
				<td colspan="3" style="text-align:left">&nbsp;&nbsp;${ vo.cont }</td>
			</tr>
			<tr>
				<th class="center">첨부파일</th>
				<td colspan="3" style="text-align:left; ">
					<c:forEach var="file" items="${ fileList }">
						<div>
							<%-- <a href="<c:out value="/Pds/download/external/${ file.sfilename }" />"> --%>
							<a href="/Menu3/download/external/${ file.f_sname }" >
								&nbsp;&nbsp;${ file.f_name }							
							</a>						
						</div>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<a 	href="/Menu3/WriteForm?m_id=${vo.m_id}&bnum=0&lvl=0&step=0&nref=0&nowpage=1" class="btn" style="width: 80px; text-align: center; margin-left: 80px;">새글쓰기</a><span></span>
					<a 	href="/Menu3/WriteForm?m_id=${vo.m_id}&idx=${vo.idx}&bnum=${vo.bnum}&lvl=${vo.lvl}&step=${vo.step}&nref=${vo.nref}&nowpage=${map.nowpage}" class="btn" style="width: 80px; text-align: center;">답글쓰기</a><span></span>
					<a 	href="/Menu3/UpdateForm?m_id=${vo.m_id}&idx=${vo.idx}&nowpage=${map.nowpage}" class="btn" style="width: 80px; text-align: center;">수정</a><span></span>
					<a 	href="/Menu3/Delete?m_id=${vo.m_id}&idx=${vo.idx}&nowpage=${map.nowpage}" class="btn" style="width: 80px; text-align: center;">삭제</a><span></span>
					<a 	href="/Menu3/Pds?m_id=${vo.m_id}&nowpage=${map.nowpage}" class="btn" style="width: 80px; text-align: center;">목록으로</a><span></span>
					<a 	href="javascript:history.back()" class="btn" style="width: 80px; text-align: center;">이전으로</a><span></span>
					<a 	href="/" class="btn" style="width: 80px; text-align: center;">Home</a>
				</td>
			</tr>
		
		</table>
	</div>
</body>
</html>