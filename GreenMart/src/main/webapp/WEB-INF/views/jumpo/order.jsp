<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="css/common.css"/>
<%@ include file="/WEB-INF/include/subheader.jsp" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function data_display(data) {
	
	let html = '';
	html += '<table>';
	html += '<tr>';
	html += '<th>거래처명</th>';
	html += '<th>상품코드</th>';
	html += '<th>상품명</th>';
	html += '<th>입고가격</th>';
	html += '<th>현재재고</th>';
	html += '<th>주문수량</th>';
	html += '<th>사원번호</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
	html += '<td>'+data.d_name+'</td>';
	html += '<td>'+data.p_id+'</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '<td>'+data.p_iprice+'</td>';
	html += '<td>'+data.st_num+'</td>';
	html += '<td></td>';
	html += '<td></td>';
	html += '</tr>';
	})
	
	html += '</table>';
	return html;
	
}

function AddDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return result;
}


window.onload = function() {
	
	let jumun1El = document.getElementById("jumun1")
	jumun1El.onchange = function() {
		
		let date = new Date(jumun1El.value);
		let ipgo = AddDays(date,1)
		
		
		let jumun2El = document.getElementById("jumun2");
		let jumun3El = document.getElementById("jumun3");
		ipgo = ipgo.toISOString().slice(0, 10);
		date = date.toISOString().slice(0, 10);
		
		jumun2El.value = date;
		jumun3El.value = ipgo;
	}
	
	let deptsearchEl = document.getElementById('deptsearch')
	deptsearchEl.onclick = function(e) {
		$.ajax({
			url: "/JWork/SearchDept",
			data : { search: $('#search').val()  },
			type: "POST", 
					
			success : function(data){
				console.log(data);
				alert(data);
				let tableEl = document.getElementById('table');
				let html = data_display(data);
				$('#table').html(html); 
				},
			error :function(xhr){
				console.log(xhr);
				alert('에러:' + xhr.status + '' + xhr.textStatus )
				}
			
		}); 
	}
	
}
</script>
</head>
<body>


<div id="gd">	
<h2>상품 주문 업무</h2>
<div id="date">
주문일자 지정: <input type="date" id="jumun1"/>  <br />
주문일자:      <input type="date" id="jumun2" readonly="readonly"/>  <br />
지정일자:      <input type="date" id="jumun3" readonly="readonly"/>  <br />
거래처명:      <input type="text" id="search"/> <input type="button" id="deptsearch" value="검색"/>

</div>
<div id="table">

</div>
<%@ include file="/WEB-INF/include/bottom.jsp" %>
</div>
	
	
</body>
</html>