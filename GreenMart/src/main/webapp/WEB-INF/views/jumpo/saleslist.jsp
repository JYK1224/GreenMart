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
	XLSX.utils.book_append_sheet(wb, ws, 'SalesList');
	
	let today = new Date();
	let day = today.getDate();
	let month = today.getMonth() + 1; // January is 0
	let year = today.getFullYear();

	// Format the date as desired
	let formattedDate = year + '-' + month + '-' + day;
	
	
	XLSX.writeFile(wb, ('SalesListtable_'+formattedDate +'.xlsx'));
}









//테이블 생성
function data_display(data) {
	
	let html = '';
	html += '<table id="myTable">';
	html += '<tr>';
	html += '<th>상품코드</th>';
	html += '<th>상품명</th>';
	html += '<th>판매가격</th>';
	html += '<th>판매갯수</th>';
	html += '<th>총판매금액</th>';
	html += '<th>이익률</th>';
	html += '<th>거래처명</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
	html += '<td>'+data.p_id+'</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '<td>'+data.p_sprice+'</td>';
	html += '<td>'+data.s_num+'</td>';
	html += '<td>'+data.s_num*data.p_sprice+'</td>';
	html += '<td>'+	100 - (item.p_iprice * 1.1 / item.p_sprice * 100).toFixed(2) +'%'+'</td>';
	html += '<td>'+data.d_name+'</td>';
	html += '<td><input id="disusenum" type="number" style="width: 70px;"/></td>';
	html += '<td></td>';
	html += '</tr>';
	})
	
	html += '</table>';
	return html;
	
}
function checkbox_display(data) {
	
	let html = '';
	let num  = 1;
	html += '<select id="myCheckBox">';
	html += '<option value= "" selected>전체보기</option>';
	
	data.forEach(function(data, index) { 	
	html += '<option value= "'+ data.j_name +'">'+data.j_name+'</option>';
	num++;
	})
	
	html += '</select>';
	return html;
	
}




window.onload = function () {
	
	const searchEl = document.getElementById("search");
	const excelEl  = document.getElementById("excelsave");
	const dayEl = document.getElementById("day");
	const monthEl = document.getElementById("month");
	const jumpoEl   = document.getElementById("jumpo");
    
	jumpoEl.disabled = true;
	searchEl.disabled = true;
	excelEl.disabled = true;
	
	dayEl.onchange = function () {
		jumpoEl.disabled = false;
		monthEl.disabled = true;
		let day = new Date(datEl.value);
		daydate= day.toISOString().slice(0,10);
		
	
	}
	
	monthEl.onchange = function () {
		jumpoEl.disabled = false;
		dayEl.disabled = true;
		let month = new Date(datEl.value);
		monthdate= month.toISOString().slice(0,10);
		
	
	}
	
	
	$.ajax({
		url: "/JWork/SearchSaleslistSelect",
		type: "POST", 
				
		success : function(data){
			console.log(data);
			//alert(data);
			let tableEl = document.getElementById('checkbox');
			let html = checkbox_display(data);
			$('#checkbox').html(html);

			let selectedOption;

			const selectElement = document.querySelector('#myCheckBox');
			selectElement.addEventListener('change', function(e) {
				selectedOption = e.target.value;
			    console.log(selectedOption)
			    			searchEl.onclick = function(e) {
				$.ajax({
					url: "/JWork/SearchSaleslist",
					data : { search: selectedOption  },
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
			});
		
			},
		error :function(xhr){
			console.log(xhr);
			alert('에러:' + xhr.status + '' + xhr.textStatus )
			}
		
	});
	
	excelEl.onclick = function() {
		saveExcel()
	}
	
	
}



</script>

</head>
<body>
	<div id="gd">
	 <h2>상품매출조회</h2>
	<div id="salelist">
	일매출조회 : <input type="date" id="day"><br>
	월매출조회 : <input type="month" id="month"><br>
	점포 : <div id="jumpo"></div><input type="button" id="search" value="검색"/>
	<input type="button" id="excelsave" value ="엑셀로저장" style="float: right; margin: 0 25px;"/>
	</div>
	<div id="table">
	</div>
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>