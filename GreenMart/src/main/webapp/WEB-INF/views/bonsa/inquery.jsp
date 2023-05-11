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

$(document).ready(function() {
	  $('#text').keypress(function(e) {
	    if (e.keyCode == 13) { 
	      e.preventDefault(); 
	      $('#productbutton').click(); 
	    }
	  });
	});

window.onload = function () {
	  // 라디오버튼선택
	  
	  
	  const radio1 = document.getElementById("radio1");
	  const radio2 = document.getElementById("radio2");
	  const text = document.getElementById("text");
	  const button = document.querySelector("input[type='button']");

	  radio1.addEventListener("click", function () {
	    text.addEventListener("input", function () {
	      const inputVal = text.value.trim();

	    });
	  });

	  button.addEventListener("click", function () {
	    const inputVal = text.value.trim();
	    if (radio1.checked && inputVal !== "" && !/^\d+$/.test(inputVal)) {
	      alert("숫자를 입력하세요.");
	      text.value = "";
	      return;
	    }
	    if (radio2.checked && inputVal !== "") {
	      inquery2(); 
	    } else {
	      inquery1(); 
	    }
	  });

	  function inquery1() {
	    $.ajax({
	      url: "/BWork/Inquery1",
	      data: { text: $('#text').val() },
	      type: "POST",
	      success: function (data) {
	        console.log(data);
	        console.dir(data);

	        $('#inquired1').text(data[0].p_id);
	        $('#inquired2').text(data[0].p_name);
	        $('#inquired3').text(data[0].p_iprice);
	        $('#inquired4').text(data[0].p_sprice);
	        var result = 100 - (data[0].p_iprice * 1.1 / data[0].p_sprice * 100)
	        var formattedResult = result.toFixed(2);
	        $('#inquired5').text(formattedResult + ' %');
	        $('#inquired6').text(data[0].d_id);
	        $('#inquired7').text(data[0].d_name);
	        $('#inquired8').text(data[0].st_num);
	        $('#inquired9').text(data[0].a_name);
	        //  $('#inquired10').text(data.j_name);
	      },
	      error: function (xhr) {
	        console.log(xhr);
	        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
	      }
	    });
	  }

	  function inquery2() {
	    $.ajax({
	      url: "/BWork/Inquery2",
	      data: { text: $('#text').val() },
	      type: "POST",
	      success: function (data) {
	        console.log(data);
	        console.dir(data);

	        $('#inquired1').text(data[0].p_id);
	        $('#inquired2').text(data[0].p_name);
	        $('#inquired3').text(data[0].p_iprice);
	        $('#inquired4').text(data[0].p_sprice);
	        var result = 100 - (data[0].p_iprice * 1.1 / data[0].p_sprice * 100)
	        var formattedResult = result.toFixed(2);
	        $('#inquired5').text(formattedResult + ' %');
	        $('#inquired6').text(data[0].d_id);
	        $('#inquired7').text(data[0].d_name);
	        $('#inquired8').text(data[0].st_num);
	        $('#inquired9').text(data[0].a_name);
	      }
	    });
	  };
	
};
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
	 <input type="button" id="productbutton" value="조회" >
	 
	 </td>

	 </tr>
	 <tr>
	 <td>상품코드</td>
	 <td colspan="2" id="inquired1"></td>
	 </tr>
	 <tr>
	 <td>상품명</td>
	 <td id="inquired2"></td>
	 </tr>
	 <tr>
	 <td>입고가격</td>
	 <td id="inquired3"></td>
	 </tr>
	 <tr>
	 <td>판매가격</td>
	 <td id="inquired4"></td>
	 </tr>
	 <tr>
	 <td>이익률</td>
	 <td id="inquired5"></td>
	 </tr>
	 <tr>
	 <td>거래처코드</td>
	 <td id="inquired6"></td>
	 </tr>
	 <tr>
	 <td>거래처명</td>
	 <td id="inquired7"></td>
	 </tr>
	 <tr>
	 <td>VAT</td>
	 <td>10%</td>
	 </tr>
	 <tr>
	 <td>재고</td>
	 <td id="inquired8"></td>
	 </tr>
	 <tr>
	 <td>상품분류</td>
	 <td id="inquired9"></td>
	 </tr>
	 <tr>
<%-- 	 <td>점포명</td>
	 <td id="inquired10">${data.j_name}</td>
	 </tr> --%>
	 </table>
	

	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>