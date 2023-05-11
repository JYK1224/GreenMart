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


<script>


function saveExcel() {
	
	var table = document.getElementById("myTable");
	var table1 = document.getElementById("myTable1");
    var rows = table.getElementsByTagName("tr");
    var table1rows = table1.getElementsByTagName("tr");
    var rowValues = [];
    //table1 td 
     var table1cells = table1rows[0].getElementsByTagName("td");
     var table1throwData = [];
     for (var k = 0; k < table1cells.length; k++) {
    	 table1throwData.push(table1cells[k].textContent);
     }
     rowValues.push(table1throwData);
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
	 var mergedData = mergeAndSumData(data);
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
	
	mergedData.forEach(function(item) { 	
	html += '<tr>';
	html += '<td>'+item.p_id+'</td>';
	html += '<td>'+item.p_name+'</td>';
	html += '<td>'+item.p_sprice+'</td>';
	html += '<td>'+item.s_num+'</td>';
	html += '<td>'+item.s_num*item.p_sprice+'</td>';
	html += '<td>'+(100 - (item.p_iprice * 1.1 / item.p_sprice * 100)).toFixed(2) +'%'+'</td>';
	html += '<td>'+item.d_name+'</td>';
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
	
	data.forEach(function(data, index) { 	
	html += '<option value= "'+ data.j_name +'">'+data.j_name+'</option>';
	num++;
	})
	
	html += '</select>';
	return html;
	
}

function mergeAndSumData(data) {
	  var mergedData = [];

	  data.forEach(function (item) {
	    var existingItem = mergedData.find(function (mergedItem) {
	      return mergedItem.p_id === item.p_id;
	    });

	    if (existingItem) {
	      existingItem.s_num += item.s_num;
	    } else {
	      mergedData.push(item);
	    }
	  });

	  return mergedData;
	}


window.onload = function () {
	
	const searchEl = document.getElementById("search");
	const excelEl  = document.getElementById("excelsave");
	const startdateEl = document.getElementById("startdate");
	const enddateEl = document.getElementById("enddate");
	const bonsaEl   = document.getElementById("bonsa");
    
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
		url: "/BWork/SearchSaleslistSelect",
		
		type: "POST", 
				
		success : function(data){
			console.log(data);
			//alert(data);
			let tableEl = document.getElementById('bonsa');
			let html = checkbox_display(data);
			$('#bonsa').html(html);

			let selectedOption;

			const selectElement = document.querySelector('#myCheckBox');
			selectElement.addEventListener('change', function(e) {
				searchEl.disabled = false;
				selectedOption = e.target.value;
			    console.log(selectedOption)
			    			searchEl.onclick = function(e) {
				$.ajax({
					url: "/BWork/SearchSaleslist",
					data : { search: selectedOption, 
							startdate : startdate,
							enddate : enddate
					},
					type: "POST", 
							
					success : function(data){
						console.log(data);
						//alert(data);
						let tableEl = document.getElementById('table');
						const allsalesEl = document.getElementById('x1');
						const alliicEl = document.getElementById('x2');
		                var totalsPrice = 0;
		                var iic1=0;
		                var iic2=0;
		                var mergedData = mergeAndSumData(data);
		             
		                mergedData.forEach(function (item) {
							
							totalsPrice += parseFloat(item.p_sprice*item.s_num);
			                 iic1 += parseFloat(item.p_iprice*1.1*item.s_num);
			                 iic2 += parseFloat(item.p_sprice*item.s_num);
						});
						let html = data_display(data);
							
						let totaliic1 = (100-(iic1/iic2)*100);
						
						allsalesEl.textContent = totalsPrice + '원';
						alliicEl.textContent = totaliic1.toFixed(2) + '%';

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
	일매출조회 : <input type="date" id="startdate"><br>
	월매출조회 : <input type="date" id="enddate"><br>
	점포 : <div id="bonsa"></div><input type="button" id="search" value="검색"/>
	<input type="button" id="excelsave" value ="엑셀로저장" style="float: right; margin: 0 25px;"/>
	</div>
	<table id ="myTable1">
		<tr>
		<td>총 판매금액 : </td><td id="x1" ></td>
		<td>총 이익률 : </td><td id="x2"></td>
		</tr>
	</table>
	<div id="table">
	</div>
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>