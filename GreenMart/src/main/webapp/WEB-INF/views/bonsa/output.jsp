<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
<%@ include file="/WEB-INF/include/subheader.jsp" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script lang="javascript" src="/js/xlsx.full.min.js"></script>
<style>
	h2{text-align: center; margin: 20px; font-size: 30px; }
	table {margin-left: auto; margin-right: auto;}
	table, tr, td {border-collapse: collapse;}
	tr,td{border: 1px solid black; }
	td{ padding: 10px; margin: 30px; width: 200px;}
	select { width: 175px;}
</style>
<script>

	// 출고수량 배열
	function saveOutputNum(columnIndex) {
		
	    var table = document.getElementById("myTable");
	    var rows = table.getElementsByTagName("tr");
	    var columnValues = [];
	    
	    for (var i = 0; i < rows.length; i++) {
	        var cells = rows[i].getElementsByTagName("td");
			
	        if (cells.length > columnIndex) {
	        	var input = cells[columnIndex].getElementsByTagName("input")[0];
	
	            if (input && input.type == "number") {
	                var inputValue = input.valueAsNumber;
	                columnValues.push(inputValue);
	            }
	        }
	    }
	    
	    return columnValues;
	}

	// 상품코드 배열
    function saveOutputP_id(columnIndex) {
        var table = document.getElementById("myTable");
        var rows = table.getElementsByTagName("tr");
        var columnValues = [];

        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].getElementsByTagName("td");

            if (cells.length > columnIndex) {
                var cellValue = cells[columnIndex].innerText;
                columnValues.push(cellValue);
            }
        }

        return columnValues;
    }
	
	// 출고직원 배열
    function saveOutputE_id(columnIndex) {
        var table = document.getElementById("myTable");
        var rows = table.getElementsByTagName("tr");
        var columnValues = [];

        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].getElementsByTagName("td");

            if (cells.length > columnIndex) {
                var cellValue = cells[columnIndex].innerText;
                columnValues.push(cellValue);
            }
        }

        return columnValues;
    }	
	
	// 주문수량 배열
	function saveOrderNum(columnIndex) {
		  var table = document.getElementById("myTable"); // 테이블 요소를 가져옵니다.
		  var columnData = []; // 열 데이터를 저장할 배열을 초기화합니다.

		  // 테이블이 존재하는 경우에만 실행합니다.
		  if (table) {
		    var rows = table.rows; // 테이블의 행을 가져옵니다.

		    // 각 행을 순회하며 지정된 열의 데이터를 배열에 추가합니다.
		    for (var i = 1; i < rows.length; i++) {
		      var cell = rows[i].cells[columnIndex]; // 현재 행에서 지정된 열의 셀을 가져옵니다.

		      // 셀이 존재하는 경우에만 데이터를 배열에 추가합니다.
		      if (cell) {
		        columnData.push(cell.textContent.trim());
		      }
		    }
		  }

		  return columnData; // 열 데이터 배열을 반환합니다.
		}
	
	// 입고가격 배열
	function saveInprice(columnIndex) {
		  var table = document.getElementById("myTable"); // 테이블 요소를 가져옵니다.
		  var columnData = []; // 열 데이터를 저장할 배열을 초기화합니다.
	
		  // 테이블이 존재하는 경우에만 실행합니다.
		  if (table) {
		    var rows = table.rows; // 테이블의 행을 가져옵니다.
	
		    // 각 행을 순회하며 지정된 열의 데이터를 배열에 추가합니다.
		    for (var i = 1; i < rows.length; i++) {
		      var cell = rows[i].cells[columnIndex]; // 현재 행에서 지정된 열의 셀을 가져옵니다.
	
		      // 셀이 존재하는 경우에만 데이터를 배열에 추가합니다.
		      if (cell) {
		        columnData.push(cell.textContent.trim());
		      }
		    }
		  }
	
		  return columnData; // 열 데이터 배열을 반환합니다.
		}



// 테이블 생성
function data_display(data) {
	
	let html = '';
	html += '<table id="myTable">';

	html += '<tr>';
	html += '<th colspan="2">출고일자 : <input type="text" id="out_date"/></th>';
	html += '<th colspan="3">총 주문금액 : <input type="text" id="totalOrderKum" value="0"/></th>';
	html += '<th colspan="3"><button type="button" id="totalOutputKumBtn">총 출고금액 계산</button> : <input type="text" id="totalOutputKum" value="0"/></th>';
	html += '</tr>';
	
	html += '<tr>';
	html += '<th>점포명</th>';
	html += '<th>주문일자</th>';
	html += '<th>주문직원</th>';
	html += '<th>상품코드</th>';
	html += '<th>상품명</th>';
	html += '<th>입고가격</th>';
	html += '<th>주문수량</th>';
	html += '<th>출고수량</th>';
	html += '<th>출고직원</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
// 	html += '<input type="hidden" name="p_seq" value="' + data.p_seq + '" />';
	html += '<td>'+data.j_name+'</td>';
	html += '<td>'+data.b_date+'</td>';
	html += '<td>'+data.e_id+'</td>';
	html += '<td>'+data.p_id+'</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '<td>'+data.p_iprice+'</td>';
	html += '<td>'+data.b_num+'</td>';
	html += '<td><input id="out_num" type="number" style="width: 70px;"/></td>';
	html += '<td>0001</td>';
	html += '</tr>';
	})
	
	html += '</table>';
	return html;
	
}
// 함수 끝
//===========================================================
// body 생성되고
window.onload = function() {
	
	
	// 날짜 지정
	const order1El = document.getElementById("order1")
	const order2El = document.getElementById("order2");
	order1El.onchange = function() {
		
		let date = new Date(order1El.value);
		
		date = date.toISOString().slice(0, 10);
		
		order2El.value = date;
	}
	
	// 주문내역 검색 후 테이블 생성
	const orderSearchEl = document.getElementById('orderSearch')
		orderSearchEl.onclick = function(e) {
		
// 		alert( ('#combobox').val() );
		
		$.ajax({
			url: "/BWork/SearchBonsaOrder",
			data : { combobox: $('#combobox').val(),
				     order2: $('#order2').val()
					},
			type: "POST", 
					
			success : function(data){
				console.log(data);
// 				alert(data);
				let tableEl = document.getElementById('table');
				let html = data_display(data);
				$('#table').html(html); 
				
				// 오늘날짜를 출고일자로 넣음
				var today = new Date(); // 현재 날짜와 시간을 가져옵니다.
				var year = today.getFullYear(); // 현재 연도를 가져옵니다.
				var month = today.getMonth() + 1; // 현재 월을 가져옵니다. (0부터 시작하므로 1을 더합니다.)
				var day = today.getDate(); // 현재 일을 가져옵니다.
				// 월과 일이 10보다 작은 경우, 앞에 0을 붙여줍니다.
				if (month < 10) {
				  month = '0' + month;
				}
				if (day < 10) {
				  day = '0' + day;
				}
				var formattedDate = year + '-' + month + '-' + day; // YYYY-MM-DD 형식으로 날짜를 포맷합니다.
				$('#out_date').val(formattedDate);
				
				// 총 주문금액 계산
				let orderNum = saveOrderNum(6);
				let inprice = saveInprice(5);
				
				let acc = 0;
				for (var i = 0; i < orderNum.length; i++) {
					var kum = parseInt( orderNum[i] * inprice[i] );
					 if (isNaN(kum)) {  // 요소가 숫자로 변환이 불가능한 경우, 다음 반복으로 넘어갑니다.
					      continue;
					 }
					acc += kum;
				}
				$('#totalOrderKum').val(acc);
				
				},
			error :function(xhr){
				console.log(xhr);
				alert('에러:' + xhr.status + '' + xhr.textStatus )
				}
		}); 
		
		// 총 출고금액 계산
		$('#table').on('click', '#totalOutputKumBtn', function() {
			
			let inprice   = saveInprice(5)
			let outputNum = saveOutputNum(7)
			
			let acc = 0;
			for (var i = 0; i < outputNum.length; i++) {
				var kum = parseInt( outputNum[i] * inprice[i+1] );
				 if (isNaN(kum)) {  // 요소가 숫자로 변환이 불가능한 경우, 다음 반복으로 넘어갑니다.
				      continue;
				 }
				acc += kum;
			}
			$('#totalOutputKum').val(acc);
			
		})
	}
	
	// 출고 버튼 클릭시 출고
	const outPutEl  = document.getElementById("outPut")
	outPutEl.onclick = function(e) {
		
		let outputNum   = saveOutputNum(7);
		let outputP_id  = saveOutputP_id(3);
		let outputE_id  = saveOutputE_id(8);
		let outputDate  = $('#out_date').val();
		
// 		console.log(outputNum);
// 		console.log(outputP_id);
// 		console.log(outputE_id);
// 		console.log(outputDate);
		
		$.ajax({
			url: "/BWork/OutPut",
			data : { outputNum  : outputNum,
			    	outputP_id  : outputP_id,
			    	outputE_id : outputE_id,
			    	outputDate : outputDate
				     },
			type: "POST", 
					
			success : function(data){
				if(data == 1){
				alert("출고가 완료되었습니다.");
				}
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
	 <h2>상품 출고 업무</h2>
	<div id="date">
	주문내역 조회: <input type="date" id="order1"/>  <br />
	주문일자:      <input type="date" id="order2" readonly="readonly"/>  <br />
	<span>점포 : &nbsp;&nbsp;&nbsp;&nbsp;</span>
	<select id="combobox" >
	 <option value="none">=== 선택 ===</option>
	 <option value="12020">부전점</option>
	</select>
	<input type="button" id="orderSearch" value="검색"/>
	<input type="button" id="excelsave" value ="액셀로 저장" style="float: right; margin: 0 25px;"/>
	<input type="button" id= "outPut" style="float: right;" value= "출고"/>
	</div>
	
	<div id="table">
	</div>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>
	</div>
</body>
</html>