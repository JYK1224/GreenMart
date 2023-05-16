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
<style>
h2{text-align: center; margin: 20px; font-size: 30px; }
table {margin-left: auto; margin-right: auto;}
#lay {width: 60%; height: 400px; border: 3px solid #666666; position: absolute; left:20%;  margin-top: -5px; box-shadow: 3px 3px 3px 3px gray;}
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
<script type="text/javascript">
 
</script>
<script>

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	
	function checkOnlyOne(e) {

		const checkboxes 
		      = document.getElementsByName("j_id");
		  checkboxes.forEach((cb) =>  {
		    cb.checked = false;
		  })
		  e.checked = true;
		}
	
	function submitMessage (e) {
		let eid    = document.forms["form"]["e_id"].value;
	 	let name   = document.forms["form"]["e_name"].value;
	  	let phone  = document.forms["form"]["e_phone"].value;
	  	let passwd = document.forms["form"]["e_passwd"].value;
	  	let intro  = document.forms["form"]["e_intro"].value;
	  	let jid    = null;
	  	document.getElementsByName("j_id").forEach((cb) =>   {
	  		if (cb.checked){
	  			jid = cb.value;
	  		}
	  	});
		if(eid == "" ||name == "" || phone == ""|| passwd == ""|| intro == ""|| jid == null){
			alert("모든항목을 빈칸없이 입력해주세요.") 
			e.preventDefault();
		}else{
			let confirmed = confirm('등록하시겠습니까?');
	 		if(confirmed){
				alert("회원등록에 성공했습니다.")
	  			if (window.opener) {
	        		window.opener.location.reload(); // 부모 페이지 새로고침
					document.forms["form"].submit();
	    		}	
	 		} else {
	 			e.preventDefault();
	 		}
		}
	 	
	}
	
	window.onload = function() {
		let btnListEl = document.getElementById("btnList");
		btnListEl.addEventListener('click' , function(e){
			  e.preventDefault();
			  if (window.opener) {
	                window.opener.location.reload(); // 부모 페이지 새로고침
	              }
			  window.close();
		      
		});
		let formEl = document.forms["form"];
		  formEl.addEventListener('submit', function(e){
				  submitMessage (e);
		  });
		
	}
	

</script>
</head>
<body>
	<div id="gd">
	<div id="main">
		<div>
			<h2> 사원등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form name="form" action="/BWork/userAdd" method="POST" >
			<table id="lay">
			  <tr>
			  	<td id="qq">사원번호</td>
			  	<td>
	    			<input type="number" name="e_id" max="9999999999" oninput="this.value = this.value.slice(0, 10)" required>
			  	</td>
			  </tr>
			  <tr>
			    <td id="qq">이름</td>
		    	<td>
			   	 	<input type="text" name="e_name"  />
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">비밀번호</td>
			    <td>
			    	<input type="password" name="e_passwd" value=""/>
			    </td>
			  </tr>
			  <tr>
			    <td id="qq">전화번호</td>
			    <td>
			    	<input type="text" name="e_phone" maxlength="13" 
			    	 oninput="oninputPhone(this)" />
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">직급</td>
			    <td>
			    	<input type="text" name="e_intro" value=""/>
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">부서</td>
			    <td>
			    	<input type="checkbox" name="j_id" 
			    	onclick="checkOnlyOne(this)" value="12010"/>본사
			    	<input type="checkbox" name="j_id" 
			    	onclick="checkOnlyOne(this)" value="12020"/>부전점
		    	</td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	  <input id="addbtn" type="submit" value="등록" class="btn" style="margin: 0 0 0 100px;">
			  	  <input type="button" value="조회" id="btnList" class="btn">
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