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
</head>
<script>
function saveExcel() {
	
	var table = document.getElementById("JumpoTable");
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
	XLSX.utils.book_append_sheet(wb, ws, 'Jumpo');
	
	let today = new Date();
	let day = today.getDate();
	let month = today.getMonth() + 1; // January is 0
	let year = today.getFullYear();

	// Format the date as desired
	let formattedDate = year + '-' + month + '-' + day;
	
	
	XLSX.writeFile(wb, ('JumpoTable_'+formattedDate +'.xlsx'));
}

// 엔터키로 점포 검색
$(document).ready(function() {
	  $('#search').keypress(function(e) {
	    if (e.keyCode == 13) { // 13 is the Enter key code
	      e.preventDefault(); // prevent default form submission behavior
	      $('#jumposearch').click(); // trigger button click event
	    }
	  });
	});
	
	
//점포 테이블
function saveD_name(columnIndex) {
    var table = document.getElementById("jumpoTable");
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
	
//테이블에 넣을 값
function data_display(data) {
	
	let html = '';
	html += '<table id="jumpoTable">';
	html += '<tr>';
	html += '<th>점포코드</th>';
	html += '<th>점포명</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
	html += '<td>'+data.j_id+'</td>';
	html += '<td>'+data.j_name+'</td>';
	html += '<td></td>';
	html += '</tr>';
	})
	html += '</table>';
	return html;
	
}



// 버튼 액션
window.onload = function() {

	let excelEl  = document.getElementById("excelsave")
	
	
	
	// 테이블 생성
	let jumposearchEl = document.getElementById('jumposearch')
	jumposearchEl.onclick = function(e) {
		$.ajax({
			url: "/JWork/SearchJumpo",
			data : { search: $('#search').val()  },
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


<body>
	<div id="gd">
	<h2>점포 조회</h2><br>
점포명:      <input type="text" id="search"/> <input type="button" id="jumposearch" value="검색"/>
<input type="button" id="excelsave" value ="액셀로 저장" style="float: right; margin: 0 25px;"/>
<!-- <input type="button" id= "regist" style="float: right;" value= "거래처 등록"/> -->
<!-- <input type="button" id= "refresh" style="float: right;" value= "새로고침"/> -->
<div id="table">
</div>

    <%@ include file="/WEB-INF/include/bottom.jsp" %>

</div>
</body>
</html>