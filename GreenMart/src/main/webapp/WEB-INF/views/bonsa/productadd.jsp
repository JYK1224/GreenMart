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

h2{
	border-collapse: collapse;
	text-align: center;
}

table {
  width: 95%;
  border-collapse: collapse;
  margin : 0 0 0 30px;
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
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  e.checked = true;
		}
	

	
	

</script>
</head>
<body>
	<div id="gd">
	<div id="main">
		<div>
			<h2> 상품등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form name="form" action="/BWork/productAdd" method="POST" >
			<table>
			  <tr>
			  	<td>상품번호</td>
			  	<td>
	    			<input type="number" name="p_seq" max="9999999999" 
	    			oninput="this.value = this.value.slice(0, 10)" required readonly="readonly">
			  	</td>
			  </tr>
			  <tr>
			  	<td>바코드번호</td>
			  	<td>
	    			<input type="number" name="p_seq" max="9999999999999" 
	    			oninput="this.value = this.value.slice(0, 13)" required >
			  	</td>
			  </tr>
			  <tr>
			    <td>상품명</td>
		    	<td>
			   	 	<input type="text" name="p_name"  />
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
			    	<input type="text" name="d_id" value="" />
		    	</td>
			  </tr>
			  <tr>
			    <td>상품분류</td>
			    <td>
			    	<input type="" name="a_id" value=""/>
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
			  	  <input  type="submit" value="등록">
			  	  <input  type="button" value="수정">
			  	  <input  type="button" value="수정">
			  	  <input  type="button" value="조회" id="btnList">
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