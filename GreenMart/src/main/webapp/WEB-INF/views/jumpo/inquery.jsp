<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="css/common.css"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
h2{text-align: center; margin: 20px; font-size: 30px; }
table {margin-left: auto; margin-right: auto;}
table, tr, td {border-collapse: collapse;}
tr,td{border: 1px solid black; }
td{ padding: 10px; margin: 30px; width: 200px;}
</style>
    <%@ include file="/WEB-INF/include/subheader.jsp" %>
    
<script>
window.onload = function () {


	  const radio1 = document.getElementById("radio1");
	  const radio2 = document.getElementById("radio2");
	  const text = document.getElementById("text");
	  const button = document.querySelector("input[type='button']");

	  radio1.addEventListener("click", function() {
	    text.addEventListener("input", function() {
	      const inputVal = text.value.trim();
	      if (inputVal !== "" && !/^\d+$/.test(inputVal)) {
	        alert("숫자를 입력하세요.");
	        text.value = "";
	      }
	    });
	  });

	  button.addEventListener("click", function() {
	    const inputVal = text.value.trim();
	    if (radio1.checked && inputVal !== "" && !/^\d+$/.test(inputVal)) {
	      alert("숫자를 입력하세요.");
	      text.value = "";
	      return;
	    }
	    if (radio2.checked && inputVal !== "") {}
	  }); 

}
		</script>
    
</head>
<body>
	<div id="gd">
	 	 <h2>상품 상세 조회</h2>
	 <table>
	 <tr>
	 <td colspan="3">
	 <input type="radio" name="radio"  id="radio1" value="상품코드" checked>상품코드<br>
	 <input type="radio" name="radio"  id="radio2" value="상품명">상품명 
	 <input type="text" id="text" >
	 <input type="button" value="조회" >
	 
	 </td>

	 </tr>
	 <tr>
	 <td>상품코드</td>
	 <td colspan="2">111</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>상품명</td>
	 <td>111</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>입고가격</td>
	 <td>111</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>판매가격</td>
	 <td>111</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>이익률</td>
	 <td>1</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>거래처코드</td>
	 <td>1</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>거래처명</td>
	 <td>1</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>VAT</td>
	 <td>10%</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>재고</td>
	 <td>1</td>
	 </tr>
	 	 </tr>
	 <tr>
	 <td>상품분류</td>
	 <td>1</td>
	 </tr>
	 </table>
	

	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>