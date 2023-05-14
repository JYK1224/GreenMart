<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자료실 새글쓰기</title>
<link rel="shortcut icon" href="/img/favicon.ico"	/>
<link rel="stylesheet" href="/css/common.css" />
<style>
	input { height: 32px; }
    #table { border: 3px solid #666666; width:70%;  position: absolute; left:-20%;  margin-top: 10px; box-shadow: 3px 3px 3px 3px gray;}
	#table th { border:1px solid black; width : 30%; }
	#table td { border:1px solid black; width : 100%; }
	input[type=text]  { width : 100%; }
	textarea  { width: 100%; height: 400px;}
	h2 { margin: 20px 20px 20px 200px;; font-size: 30px;}
	

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
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
	$(function(){
		let num = 1;
		$('#btnAddFile').on('click', function(e) {
			let tag = '<input type="file" name="upfile' + num + '" class="upfile" /><br>';
			$('#tdfile').append(tag);
			num++;
		})
	})


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
</head>
<body>
	<div id="main">
	
	<c:choose>
		<c:when test="${ map.bnum eq 0 }">
			<h2> ${ map.m_name } 새글 등록</h2>
		</c:when>
		<c:otherwise>
			<h2> ${ map.m_name } 답글 등록</h2>
		</c:otherwise>
	</c:choose>
	
	<!-- enctype="multipart/form-data" : 파일전송(binary data)시 필수 
	     이게 있어야 <input file="" name="" /> 사용가능
	-->
	<form action="/Menu3/Write" method="POST"
	      enctype="multipart/form-data" >	
	<input type="hidden" name="m_id"    value="${ map.m_id }" />
	<input type="hidden" name="bnum"    value="${ map.bnum }" />
	<input type="hidden" name="lvl"     value="${ map.lvl }" />
	<input type="hidden" name="step"    value="${ map.step }" />
	<input type="hidden" name="nref"    value="${ map.nref }" />
	<input type="hidden" name="pnum"    value="${ map.idx }" />
	<input type="hidden" name="nowpage" value="${ map.nowpage }" />
	
		<table id="table">

			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${ vo.title }"></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="e_id" value="${ vo.e_id }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cont" maxlength="1300">${ vo.cont }</textarea></td>
			</tr>
			<tr>
				<th>파일</th>
			<!-- 
				<td id="tdfile">
					<input type="button" id="btnAddFile" value="파일 추가" />
					<div id="divfiles">
					<input type="file" name="upfile" class="upfile"/></br>
					</div>
				</td>
			-->
				<td id="tdfile">
					<input type="button" id="btnAddFile" value="파일 추가(최대 100M byte)" class="btn" style="margin: 5px; 5px; 5px; 5px; width:200px;"/></br>
					<input type="file" name="upfile" class="upfile" style="margin: 5px;"/></br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="작성" class="btn" style="margin: 10px;"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>