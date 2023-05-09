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
<script lang="javascript" src="/js/xlsx.full.min.js"></script>
<script>

function saveExcel() {
	
	var table = document.getElementById("myTable");
    var rows = table.getElementsByTagName("tr");
    var rowValues = [];
    //th 삽입
    var thcells = rows[0].getElementsByTagName("th");
    var throwData = [];
    for (var j = 0; j < thcells.length; j++) {
    	throwData.push(thcells[j].textContent);
    }
    rowValues.push(throwData);
	//td삽입
    for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName("td");
                var rowData = [];

                for (var j = 0; j < cells.length; j++) {
                    var cellValue = cells[j].querySelector('input[type="number"]') ? cells[j].querySelector('input[type="number"]').value : cells[j].textContent;
                    rowData.push(cellValue);
             }

           rowValues.push(rowData);
     }
    
	/* 배열을 워크북 객체로 변환 */
	var wb = XLSX.utils.book_new();
	var ws = XLSX.utils.aoa_to_sheet(rowValues);
	XLSX.utils.book_append_sheet(wb, ws, 'Input');
	
	let today = new Date();
	let day = today.getDate();
	let month = today.getMonth() + 1; // January is 0
	let year = today.getFullYear();

	// Format the date as desired
	let formattedDate = year + '-' + month + '-' + day;
	
	
	XLSX.writeFile(wb, ('InputTable_'+formattedDate +'.xlsx'));
}

//날짜 하루 뒤 더하기
function AddDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return result;
}

//입고수량 배열
function saveInputNum(columnIndex) {
	
    var table = document.getElementById("myTable");
    var rows = table.getElementsByTagName("tr");
    var columnValues = [];
    
    console.log(rows)

    for (var i = 0; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName("td");
		
        console.log(cells)
        if (cells.length > columnIndex) {
        	var input = cells[columnIndex].getElementsByTagName("input")[0];

            console.log(input)
            if (input && input.type == "number") {
                var inputValue = input.valueAsNumber;
                columnValues.push(inputValue);
            }
        }
    }

    
    return columnValues;
}
//입고 주문일 배열
function saveInputDate(columnIndex) {
	
    var table = document.getElementById("myTable");
    var rows = table.getElementsByTagName("tr");
    var columnValues = [];
    
    for (var i = 1; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName("td");
        if (cells.length > columnIndex) {
            var cellValue = cells[columnIndex].innerText;
            columnValues.push(cellValue);
        }
    }

    
    return columnValues;
}

//입고 상품명 배열
function saveInputP_name(columnIndex) {
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

//테이블 생성
function data_display(data) {
	
	let html = '';
	html += '<table id="myTable">';
	html += '<tr>';
	html += '<th>거래처명</th>';
	html += '<th>주문일자</th>';
	html += '<th>입고일</th>';
	html += '<th>상품코드</th>';
	html += '<th>상품명</th>';
	html += '<th>현재재고</th>';
	html += '<th>주문수량</th>';
	html += '<th>입고수량</th>';
	html += '<th>사원번호</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
	html += '<td>'+data.d_name+'</td>';
	html += '<td>'+data.o_date+'</td>';
	html += '<td>'+data.in_date+'</td>';
	html += '<td>'+data.p_id+'</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '<td>'+data.st_num+'</td>';
	html += '<td>'+data.o_num+'</td>';
	html += '<td><input id="inputnum" type="number" style="width: 70px;"/></td>';
	html += '<td>'+data.e_id+'</td>';
	html += '<td></td>';
	html += '</tr>';
	})
	
	html += '</table>';
	return html;
	
}

//body 생성되고
window.onload = function() {
	
	let input1El = document.getElementById("input1")
	let orderEl  = document.getElementById("input")
	let excelEl  = document.getElementById("excelsave")
	
	
	//거래처 검색 후 테이블 생성
	let deptsearchEl = document.getElementById('deptsearch')
	deptsearchEl.onclick = function(e) {
		let input1El = document.getElementById("input1")
		
		let date = new Date(input1El.value);
		date = date.toISOString().slice(0, 10);
		
		$.ajax({
			url: "/JWork/SearchOrder",
			data : { search: $('#search').val(),
				     orderdate: date},
			type: "POST", 
					
			success : function(data){
				console.log(data);
				//alert(data);
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
	
	//주문 버튼 클릭시 주문
	orderEl.onclick = function(e) {
		let inputnum   = saveInputNum(7);
		let inputdate  = saveInputDate(2);
		let inputpname = saveInputP_name(4);
		
		console.log(inputnum)
		console.log(inputdate)
		console.log(inputpname);
		
		$.ajax({
			url: "/JWork/Input",
			data : { inputnum  : inputnum,
				     inputdate  : inputdate,
				     inputpname : inputpname,
				     },
			type: "POST", 
					
			success : function(data){
				if(data == 1){
				alert("입고가 완료되었습니다.");
				}
				},
			error :function(xhr){
				console.log(xhr);
				alert('에러:' + xhr.status + '' + xhr.textStatus )
				}
			
		}); 
	}
	
	//excel로 표 저장
	excelEl.onclick = function() {
		saveExcel()
	}
}
</script>    
<style>
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
</head>
<body>
<div id="gd">	
<h2>상품 입고 업무</h2>
<div id="date">
입고날짜 지정: <input type="date" id="input1"/>  <br />
거래처명:      <input type="text" id="search"/> <input type="button" id="deptsearch" value="검색"/>
<input type="button" id="excelsave" value ="액셀로 저장" style="float: right; margin: 0 25px;"/>
<input type="button" id= "input" style="float: right;" value= "입고확정"/>
</div>
<div id="table">

</div>
<%@ include file="/WEB-INF/include/bottom.jsp" %>
</div>
</body>
</html>