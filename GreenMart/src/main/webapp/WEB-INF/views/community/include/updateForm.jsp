<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자료실 수정</title>
<link rel="shortcut icon" href="/img/favicon.ico"	/>
<link rel="stylesheet" href="/css/common.css" />

<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
	$(function(){
		// 첨부파일 추가버튼 클릭
		let num = 1;
		$('#btnAddFile').on('click', function(e) {
			let tag = '<input type="file" name="upfile' + num + '" class="upfile" /><br>';
			$('#tdfile').append(tag);
			num++;
		})
		
		// 첨부파일 X 버튼 클릭 - 파일삭제
		$('.aDelete').on('click', function(e) {
			e.preventDefault();		// 페이지 이동 막음
			e.stopPropagation();
			
			alert('aDelete click');
			console.log($(this).parent());
			
			let aDelete = this;		// 아래 function에서 .remove() 하려면 이거 해줘야됨. 익명클래스 안에서는 this를 모름
			$.ajax({
				url    : this.href,
				method : 'GET'
			})
			.done(function( result ) {
// 				alert('삭제 완료');
				$(aDelete).parent().remove();	// 화면에서 항목 삭제
			})
			.fail(function( error ) {
				console.log(error);
				alert('오류발생 : ' + error);
			})
		})
		
	});


</script>

<script>
/*	window.onload = function() {
		let num = 1;
		const btnAddFileEl = document.querySelector('#btnAddFile');
		const divfilesEl   = document.querySelector('#tdfile #divfiles');
		
		btnAddFileEl.onclick = function(e) {
			let oldtag = divfilesEl.innerHTML;
			let tag    = '<input type="file" name="upfile' + num + '" class="upfile"/><br>';
			let newtag = oldtag + tag;
			divfilesEl.innerHTML = newtag;
			num++;
		};
	}
*/
</script>
<style>
	input { height: 32px; }
    #table { border: 3px solid #666666; width:70%;  position: absolute; left:-20%;  margin-top: 10px; box-shadow: 3px 3px 3px 3px gray; padding: 10px 0;}
	#table th { border:1px solid black; width : 20%; }
	#table td { border:1px solid black; width : 50%; }
	input[type=text]  { width : 100%; }
	textarea  { width: 100%; height: 300px;}
	h2 { margin: 20px 20px 20px 130px;; font-size: 30px;}
	

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
	<div id="main">
	
	<form action="/Menu3/Update" method="POST"
	      enctype="multipart/form-data" >	
	<input type="hidden" name="idx"     value="${ map.idx }" />
	<input type="hidden" name="m_id"    value="${ map.m_id }" />
	<input type="hidden" name="bnum"    value="${ map.bnum }" />
	<input type="hidden" name="lvl"     value="${ map.lvl }" />
	<input type="hidden" name="step"    value="${ map.step }" />
	<input type="hidden" name="nref"    value="${ map.nref }" />
	<input type="hidden" name="pnum"    value="${ map.idx }" />
	<input type="hidden" name="nowpage" value="${ map.nowpage }" />
	
	
			<h2>${ m_name } 정보 수정</h2>
		<table id="table">
			<tr>
				<th>글번호</th>
				<td>&nbsp;&nbsp;${ vo.idx }</td>
				<th>작성일</th>
				<td>&nbsp;&nbsp;${ vo.regdate }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>&nbsp;&nbsp;${ vo.e_id }</td>
				<th>조회수</th>
				<td>&nbsp;&nbsp;${ vo.readcount }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
				<input type="text" name="title" value="&nbsp;&nbsp;${ vo.title }">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
				<textarea name="cont" maxlength="1300">${ vo.cont }</textarea>
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td id="tdfile" colspan="3">
					<!-- 기존 파일목록, 삭제버튼 -->
					<c:forEach var="file" items="${ fileList }">
						<div>
							<a class = "aDelete" 
							   href="/deleteFile?f_seq=${ file.f_seq }&sfile=${ file.f_sname }">
							❌
							</a>
							<a href="/Menu3/download/external${ file.f_sname }">
							${ file.f_name }
							</a>
						</div>
					</c:forEach>
					</br>
					<!-- 새 파일 추가 -->
					<input type="button" id="btnAddFile" value="파일 추가(최대 100M byte)"  class="btn" style="margin: 5px; 5px; 5px; 5px; width:200px;"/></br>
					<input type="file" name="upfile" class="upfile" style="margin: 5px;"/></br>
				</td>
			</tr>
			<tr>
				<td colspan="4">
				<input type="submit" value="수정"  class="btn" style="margin: 10px;"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>