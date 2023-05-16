<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
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
	  const button = document.querySelector("input[name='pbutton']");
	  const upbtnEl = document.getElementById("upbtn");
	  
	  upbtnEl.addEventListener("click", function (e) {
		  let pid = document.getElementById("inquired10").textContent;
		  let html = 'BWork/productView?p_seq=' + pid;
		  let name = 'productView';
		  let  features   = 'height=700, width=450, top=200, left=600'; 
		  window.open(html, name, features);
	  });
	
	  
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
	      document.getElementById("upbtn").style.display= 'inline-block'
	    } else {
	      inquery1(); 
	      ocument.getElementById("upbtn").style.display= 'inline-block'
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
	        $('#inquired10').text(data[0].p_seq);
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
	        $('#inquired10').text(data[0].p_seq);
	      }
	    });
	  };
	
};
		</script>
    
</head>
<body>
	<div id="gd">
	 	 <h2>상품 상세 조회</h2>
	 <table id="lay">
	 <tr>
	 <td colspan="3">
	 <input type="radio" name="radio"  id="radio1" value="상품코드" checked>상품코드<br>
	 <input type="radio" name="radio"  id="radio2" value="상품명">상품명 
	 <input type="text" id="text" >
	 <input type="button" id="productbutton" value="조회" name="pbutton" class="btn" >
	 <input type="button" id="upbtn" value="수정" style="display: none" class="btn"/>
	 </td>

	 </tr>
	 <tr>
	 <td id="qq">상품코드</td>
	 <td colspan="2" id="inquired1"></td>
	 </tr>
	 <tr>
	 <td id="qq">상품명</td>
	 <td id="inquired2"></td>
	 </tr>
	 <tr>
	 <td id="qq">입고가격</td>
	 <td id="inquired3"></td>
	 </tr>
	 <tr>
	 <td id="qq">판매가격</td>
	 <td id="inquired4"></td>
	 </tr>
	 <tr>
	 <td id="qq">이익률</td>
	 <td id="inquired5"></td>
	 </tr>
	 <tr>
	 <td id="qq">거래처코드</td>
	 <td id="inquired6"></td>
	 </tr>
	 <tr>
	 <td id="qq">거래처명</td>
	 <td id="inquired7"></td>
	 </tr>
	 <tr>
	 <td id="qq">VAT</td>
	 <td>10%</td>
	 </tr>
	 <tr>
	 <td id="qq">재고</td>
	 <td id="inquired8"></td>
	 </tr>
	 <tr>
	 <td id="qq">상품분류</td>
	 <td id="inquired9"></td>
	 </tr>
	 <tr>
	 </tr> 
	 </table>
	 <input type="hidden" id="inquired10"  value="${data.p_seq}" />
	

	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>