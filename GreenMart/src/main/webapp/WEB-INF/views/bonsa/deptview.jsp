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
<style>
h2 {
	border-collapse: collapse;
	text-align: center;
}

table {
	width: 95%;
	border-collapse: collapse;
	margin: 0 0 0 30px;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #f5f5f5;
}

.btn {
	cursor: pointer;
}

.center {
	border-collapse: collapse;
	text-align: center;
}
</style>
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
</head>
<body>
	<div id="gd">
		<div id="main">
			<div>
				<h2>거래처 상세보기</h2>
				<!-- 입력받은 정보를 서버로 전송한다 -->
				<table>
					<tr>
						<td class="center">거래처번호 <input type="text" id="did"
							readonly="readonly" class="center" value="${vo.d_id }"
							maxlength="6" />
						</td>
					</tr>
					<tr>
						<td class="center">거래처이름 <input type="text" id="dname"
							readonly="readonly" class="center" value="${vo.d_name }" />
						</td>
					</tr>
					<tr>
						<td class="center">담당자 <input type="text" id="ddam"
						readonly="readonly" class="center" value="${vo.d_dam }" />
						</td>
					</tr>
					<tr>
						<td class="center">담당자 번호 <input type="text" id="dphone"
							readonly="readonly" class="center" maxlength="13"
							oninput="oninputPhone(this)" value="${vo.d_phone }" />
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" class="btn" id="upBtn"
							value="수정"> <input type="button" class="btn" id="delBtn"
							value="삭제" /> <input type="button" class="btn" id="backBtn"
							value="뒤로" /> <input type="button" class="btn"
							style="display: none" id="submitBtn" value="확인" /></td>
					</tr>

				</table>
			</div>
		</div>
		<%@ include file="/WEB-INF/include/bottom.jsp"%>
	</div>
</body>
</html>