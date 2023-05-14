<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
<%@ include file="/WEB-INF/include/subheader.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	
		/* let btnAddEl = document.querySelector("[type=submit]");
		btnAddEl.addEventListener('click', function(e){
			e.preventDefault();
			alert('등록 성공');
			
		}) */

</script>
<style>
h2{text-align: center; margin: 20px; font-size: 30px; }
table {margin-left: auto; margin-right: auto;}
#lay {width: 90%; height: 200px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: -5px; box-shadow: 3px 3px 3px 3px gray;}
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
	<div id="gd">
	<div id="main">
		<div>
			<h2> 회원 수정 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form action="/CustomerUpdate" method="POST">
			<table id = "lay">
			  <tr>
			  	<td id="qq">회원번호</td>
			  	<td>
	    			<input type="text" name="c_id"  
	    			readonly="readonly" value="${vo.c_id }"> 
			  	
			  	</td>
			  </tr>
			  <tr>
			    <td id="qq">회원이름</td>
		    	<td>
			   	 	<input type="text" name="c_name" value="${vo.c_name }" />
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">회원전화</td>
			    <td>
			    	<input type="text" name="c_phone" maxlength="13" 
			    	 oninput="oninputPhone(this)" value="${vo.c_phone }" />
			    </td>
			  </tr>
			  <tr>
			    <td id="qq">마일리지</td>
			    <td>
			    	<input type="text" name="c_mile" value="${vo.c_mile }"/>
		    	</td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	  <input  type="submit" value="수정" class="btn" style="margin: 0 0 0 210px;">
			  	</td>
			  </tr>
			</table>
			</form>
		</div>
	</div>
	 <%@ include file="/WEB-INF/include/bottom.jsp" %>
	</div>
</body>
</html>