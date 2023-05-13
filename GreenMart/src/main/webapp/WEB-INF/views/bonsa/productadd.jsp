<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<script type="text/javascript">
 
</script>
<script>

// 상품분류 선택
	function selectAst() {
		let checkAstEl = document.getElementById("checkAst");
		
		let selectValue = checkAstEl.value;
		let selectText = checkAstEl.options[checkAstEl.selectedIndex].text;
		
		   $.ajax({
		        url: "/BWork/productAdd", // 요청을 보낼 URL
		        type: "POST", // 요청 메서드 (POST)
		        data: { a_id: selectValue }, // 전송할 데이터
		        success: function (response) {
		            // 요청이 성공적으로 처리된 경우 실행되는 콜백 함수
		            console.log("데이터 전송 성공");
		        },
		        error: function (xhr, status, error) {
		            // 요청이 실패한 경우 실행되는 콜백 함수
		            console.log("데이터 전송 실패");
		        }
		    });
		
	}
	// 거래처 선택
	function selectDept() {
		let checkDeptEl = document.getElementById("checkDept");
		
		let selectValue = checkDeptEl.value;
		let selectText = checkDeptEl.options[checkDeptEl.selectedIndex].text;
	
		      // 추가된 $.ajax 요청
		      $.ajax({
		        url: "/BWork/productAdd",
		        type: "POST",
		        data: { d_id: selectValue },
		        success: function(response) {
		          console.log("데이터 전송 성공");
		        },
		        error: function(xhr, status, error) {
		          console.log("데이터 전송 실패");
		        }
	      });
	}
	
	// 점포 체크박스
	function checkOnlyOne(e) {
	
		const checkboxes 
		      = document.getElementsByName("j_id");
		  checkboxes.forEach((cb) =>  {  
		    cb.checked = false;
		  })
		  e.checked = true;
		}
	// 빈칸입력시 메세지 출력 
	function submitMessage (e) {
	 	let pid    = document.forms["form"]["p_id"].value;
	 	let name   = document.forms["form"]["p_name"].value;
	  	let iprice  = document.forms["form"]["p_iprice"].value;
	  	let sprice = document.forms["form"]["p_sprice"].value;
	  	let did = document.forms["form"]["d_id"].value;
	  	let aid = document.forms["form"]["a_id"].value;
	  	let jid    = null;
	  	document.getElementsByName("j_id").forEach((cb) =>   {
	  		if (cb.checked){
	  			jid = cb.value;
	  		}
	  	});
		if(pid == "" || name == ""|| iprice == ""|| sprice == ""|| jid == "" || did == "=== 선택 ===" || aid == "=== 선택 ==="){
			alert("모든항목을 빈칸없이 입력해주세요.") 
			e.preventDefault();
		}else{
		  	alert("신규 상품등록에 성공했습니다.")
		  	formEl.submit();
		  	 window.location.href="/Productadd1"
		}
	}
	
	window.onload = function() {
	let formEl = document.forms["form"];
	formEl.addEventListener('submit', submitMessage);
	
	let btnListEl = document.getElementById('btnList');
	btnListEl.addEventListener("click", function(e) {
	 	e.preventDefault();
		   //   e.stopPropagation();
	  		let  html       = '/Inquery1'  ;
		  	let  name       = 'Inquery1';  // '' 값이 없으면 창이 여러번 뜬다
	  		let  features   = 'height=750, width=600, top=200, left=300'; 
		    window.open(html, name, features);
		    window.close();
	});
	
	}

</script>
</head>
<body>
	<div id="gd">
			<h2> 상품등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form name="form" action="/BWork/productAdd" method="POST"
			  >
			<table>
			  <tr>
			  	<td>상품번호</td>
			  	<td>
	    			<input type="number" name="p_id" max="9999999999999" 
	    			oninput="this.value = this.value.slice(0, 13)" />
			  	</td>
			  </tr>
			  <tr>
			    <td>상품명</td>
		    	<td>
			   	 	<input type="text" name="p_name" />
		    	</td>
			  </tr>
			  <tr>
			    <td>입고가</td>
			    <td>
			    	<input type="number" name="p_iprice" max="9999999999"  
			    		oninput="this.value = this.value.slice(0, 10)" />
			    </td> 
			  </tr>
			  <tr>
			    <td>판매가</td>
			    <td>
			    	<input type="number" name="p_sprice" max="9999999999"  
			    		oninput="this.value = this.value.slice(0, 10)" />
			    </td>
			  </tr>
			  <tr>
			    <td>거래처명</td>
			    <td>
			    	<select id="checkDept" name="d_id" onchange="selectDept(this.value)">
			    		<option value="=== 선택 ===" selected disabled>==== 선택 ====</option>
			    		<c:forEach var="dept"  items="${checkDeptlist }">
			    			<option value="${dept.d_id }">${dept.d_name }</option>
			    		</c:forEach>
			    	</select>
		    	</td>
			  </tr>
			  <tr>
			    <td>상품분류</td>
			    <td>
			    	<select name="a_id" id="checkAst" onchange="selectAst()">
			    		<option value="=== 선택 ===" selected disabled>==== 선택 ====</option>
						<c:forEach var="ast"  items="${checkAstlist }">
			    			<option value="${ast.a_id }">${ast.a_name }</option>
			    		</c:forEach>
			    	</select>
		    	</td>
			  </tr>
			  <tr>
			    <td>부서</td>
			    <td>
			    	<input type="checkbox" name="j_id" 
			    	onclick="checkOnlyOne(this)" value="12010"/>본사
			    	<input type="checkbox" name="j_id" 
			    	onclick="checkOnlyOne(this)" value="12020"/>부전점
		    	</td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	  <input  type="submit" value="등록" class="btn" style="margin: 0 0 0 158px;">
			  	  <input  type="button" value="조회" id="btnList" class="btn">
			  	</td>
			  </tr>
			</table>
			</form>
	 <%@ include file="/WEB-INF/include/bottom.jsp" %>
	</div>
</body>
</html>