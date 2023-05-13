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
<script>

// 엑셀
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
	XLSX.utils.book_append_sheet(wb, ws, 'JOrderList');
	
	let today = new Date();
	let day = today.getDate();
	let month = today.getMonth() + 1; // January is 0
	let year = today.getFullYear();

	// Format the date as desired
	let formattedDate = year + '-' + month + '-' + day;
	
	
	XLSX.writeFile(wb, ('JOrderListtable_'+formattedDate +'.xlsx'));
}




//테이블 생성
function data_display(data) {
	
	let html = '';
	html += '<table id="myTable">';
	html += '<tr>';
	html += '<th>주문일자</th>';
	html += '<th>거래처명</th>';
	html += '<th>상품코드</th>';
	html += '<th>상품명</th>';
	html += '<th>입고가격</th>';
	html += '<th>현재재고</th>';
	html += '<th>주문수량</th>';
	html += '<th>총주문금액</th>';
	html += '<th>사원번호</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
	html += '<td>'+data.b_date+'</td>';
	html += '<td>'+data.d_name+'</td>';
	html += '<td>'+data.p_id+'</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '<td>'+data.p_iprice+'</td>';
	html += '<td>'+data.st_num+'</td>';
	html += '<td>'+data.b_num+'</td>';
	html += '<td>'+data.b_num*data.p_iprice+'</td>';
	html += '<td>'+data.e_id+'</td>';
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
	html += '<option value= "" selected>선택</option>';
	html += '<option value= "" >전체</option>';
	html += '<option value= "" >부전점</option>';
	
	/* data.forEach(function(data, index) { 	
	html += '<option value= "'+ data.j_name +'">'+data.j_name+'</option>';
	num++;
	}) */
	
	html += '</select>';
	return html;
	
}


window.onload = function () {
	
	const searchEl = document.getElementById("search");
	const excelEl  = document.getElementById("excelsave");
	const startdateEl = document.getElementById("startdate");
	const enddateEl = document.getElementById("enddate");
	const jumpoEl   = document.getElementById("jumpo");
    
	searchEl.disabled = true;
	
	startdateEl.onchange = function () {

		let stday = new Date(startdateEl.value);
		startdate = stday.toISOString().slice(0,10);
		
	enddateEl.onchange = function () {
		let enday = new Date(enddateEl.value);
		enddate = enday.toISOString().slice(0,10);
	}
}
	
	
	$.ajax({
		url: "/BWork/SearchJOrderlistSelect",
		
		type: "POST", 
				
		success : function(data){
			console.log(data);
			//alert(data);
			let tableEl = document.getElementById('jumpo');
			let html = checkbox_display(data);
			$('#jumpo').html(html);

			let selectedOption;

			const selectElement = document.querySelector('#myCheckBox');
			selectElement.addEventListener('change', function(e) {
				searchEl.disabled = false;
				selectedOption = e.target.value;
			    console.log(selectedOption)
			    			searchEl.onclick = function(e) {
				$.ajax({
					url: "/BWork/SearchJOrderlist",
					data : { search: selectedOption, 
							startdate : startdate,
							enddate : enddate
					},
					type: "POST", 
							
					success : function(data){
						console.log(data);
						//alert(data);
						let tableEl = document.getElementById('table');
						const allsalesEl = document.getElementById('total');
		                var totalsPrice = 0;
		               
		                
						data.forEach(function (item) {
							
							totalsPrice += parseFloat(item.p_iprice*item.b_num);
			              
						});
						let html = data_display(data);
						
						allsalesEl.textContent = totalsPrice + '원';
				

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
	<table>
	 <h2>점포 주문내역 조회</h2>
	<div id="olist">
	시작일자 지정 : <input type="date" id="startdate"><br>
	종료일자 지정 : <input type="date" id="enddate"><br>
	점포 : <div id="jumpo"></div><input type="button" id="search" value="검색"/>
	<input type="button" id="excelsave" value ="엑셀로저장" style="float: right; margin: 0 25px;"/>
	</div>
		<tr>
		<td>총 주문금액 : </td><td id="total" ></td>
		</tr>
	</table>
	<div id="table">
	</div>
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>