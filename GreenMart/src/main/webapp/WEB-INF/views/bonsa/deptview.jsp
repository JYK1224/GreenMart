<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css" />
<%@ include file="/WEB-INF/include/subheader.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
	

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	function upDept1() {
		document.getElementById('submitBtn').style.display = 'inline-block'
		document.getElementById('delBtn').style.display = 'none'
		document.getElementById('backBtn').style.display = 'none'
		document.getElementById('upBtn').style.display = 'none'
	 
		const fields = document.querySelectorAll('input[type="text"]');
	    fields.forEach((field, index) => {
	        field.removeAttribute('readonly');
	    	 if (index === 0) {
		        field.setAttribute('readonly', 'readonly');
	    	 }
	    });
	}
	
	function upDept2() {
		let didEl = document.getElementById("did");
		let dnameEl = document.getElementById("dname");
		let ddamEl = document.getElementById("ddam");
		let dphoneEl = document.getElementById("dphone");
		
	    if (confirm('수정하시겠습니까?')) {
	        $.ajax({
	            url: "/BWork/deptUpdate",
	            type: "POST",
	            data: { d_id: didEl.value    , 
	            		d_name: dnameEl.value ,
	            		d_dam: ddamEl.value  ,
	            		d_phone: dphoneEl.value } ,
	            success: function(response) {
	                console.log(response);
	                alert('수정되었습니다.');
	                location.href = "/BWork/deptView?d_id=" + didEl.value + "&d_name=" + dnameEl.value + 
	                		"&d_dam=" + ddamEl.value + "&d_phone=" + dphoneEl.value ;
	            },
	            error: function(xhr, status, error) {
	                console.error(error);
	                alert('수정에 실패했습니다.');
	            }
	        });
	    }
	}
	function delDept(){
		 if(confirm('삭제하시겠습니까?')) {
			 
		 $.ajax({
		        url: "/BWork/deptDelete",
		        type: "POST",
		        data: { d_id:'${vo.d_id}' },
		        success: function(response) {
		        	console.log(response);
		            alert('삭제되었습니다.');
					location.href="/Deptlist1";
		
		        },
		        error: function(xhr, status, error) {
					console.error(error);
		        	alert('삭제에 실패했습니다.');
		        }
		    });
		 }
	}
	
	window.onload = function() {
	    let upBtnEl1 = document.getElementById('upBtn');
	    upBtnEl1.addEventListener("click", function(e) {
	    	upDept1(e);
	    });
		
	    let upBtnEl2 = document.getElementById('submitBtn');
	    upBtnEl2.addEventListener("click", function(e) {
	    	upDept2(e);
	    });
		
	    let delBtnEl = document.getElementById('delBtn');
	    delBtnEl.addEventListener("click", function(e) {
	    	delDept(e);	
	    })
	    
		let backBtnEl = document.getElementById('backBtn');
	    backBtnEl.addEventListener("click", function(e) {
	        location.href = "/Deptlist1";
	    });
	};
	

</script>
<style>
h2{text-align: center; margin: 20px; font-size: 30px; }
table {margin-left: auto; margin-right: auto;}
#lay {width: 30%; height: 400px; border: 3px solid #666666; position: absolute; left:5%; 
left: 360px;
 margin-top: -5px; box-shadow: 3px 3px 3px 3px gray;}
table, tr, td {border-collapse: collapse;}
tr,td{border: 1px solid black; }
td{ padding: 10px; margin: 30px; width: 200px;}
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
				<h2>거래처 상세보기</h2>
				<!-- 입력받은 정보를 서버로 전송한다 -->
				<table id="lay">
					<tr>
						<td class="center">거래처번호 :  &nbsp; &nbsp;<input type="text" id="did"
							readonly="readonly" class="center" value="${vo.d_id }"
							maxlength="6" />
						</td>
					</tr>
					<tr>
						<td class="center">거래처이름 :  &nbsp; &nbsp;<input type="text" id="dname"
							readonly="readonly" class="center" value="${vo.d_name }" />
						</td>
					</tr>
					<tr>
						<td class="center">담당자 :  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="ddam"
						readonly="readonly" class="center" value="${vo.d_dam }" />
						</td>
					</tr>
					<tr>
						<td class="center">담당자번호 :  &nbsp; &nbsp;<input type="text" id="dphone"
							readonly="readonly" class="center" maxlength="13"
							oninput="oninputPhone(this)" value="${vo.d_phone }" />
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" class="btn" id="upBtn"	value="수정" style="margin: 0 0 0 70px;">
							 <input type="button" class="btn" id="delBtn" value="삭제" />
							 <input type="button" class="btn" id="backBtn"	value="뒤로" /> 
							<input type="button" class="btn" style="display: none" id="submitBtn" value="확인" /></td>
					</tr>

				</table>
		<%@ include file="/WEB-INF/include/bottom.jsp"%>
	</div>
</body>
</html>