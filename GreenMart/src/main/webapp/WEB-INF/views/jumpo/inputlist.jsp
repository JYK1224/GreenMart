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
	
	
	XLSX.writeFile(wb, ('Inputtable_'+formattedDate +'.xlsx'));
}
//테이블 생성
function data_display(data) {
	
	let html = '';
	html += '<table id="myTable">';
	html += '<tr>';
	html += '<th>입고일자</th>';
	html += '<th>거래처명</th>';
	html += '<th>상품코드</th>';
	html += '<th>상품명</th>';
	html += '<th>입고가격</th>';
	html += '<th>현재재고</th>';
	html += '<th>입고수량</th>';
	html += '<th>총입고금액</th>';
	html += '<th>사원번호</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
	html += '<td>'+data.in_date+'</td>';
	html += '<td>'+data.d_name+'</td>';
	html += '<td>'+data.p_id+'</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '<td>'+data.p_iprice+'</td>';
	html += '<td>'+data.st_num+'</td>';
	html += '<td>'+data.in_num+'</td>';
	html += '<td>'+data.in_num*data.p_iprice+'</td>';
	html += '<td>'+data.e_id+'</td>';
	html += '<td></td>';
	html += '</tr>';
	})
	
	html += '</table>';
	return html;
	
}

// 본사상품 테이블 생성
function bonsadata_display(data) {
	
	let html = '';
	html += '<table id="myTable">';
	html += '<tr>';
	html += '<th>입고일자</th>';
	html += '<th>거래처명</th>';
	html += '<th>상품코드</th>';
	html += '<th>상품명</th>';
	html += '<th>입고가격</th>';
	html += '<th>현재재고</th>';
	html += '<th>입고수량</th>';
	html += '<th>총입고금액</th>';
	html += '<th>사원번호</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
	html += '<td>'+data.in_date+'</td>';
	html += '<td>'+data.d_name+'</td>';
	html += '<td>'+data.p_id+'</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '<td>'+data.p_iprice+'</td>';
	html += '<td>'+data.st_num+'</td>';
	html += '<td>'+data.in_num+'</td>';
	html += '<td>'+data.in_num*data.p_iprice+'</td>';
	html += '<td>'+data.e_id+'</td>';
	html += '<td></td>';
	html += '</tr>';
	})
	
	html += '</table>';
	return html;
	
}

//주문 거래처 배열
function saveOrderD_name(columnIndex) {
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




//엔터키로 거래처 검색
$(document).ready(function() {
	  $('#search').keypress(function(e) {
	    if (e.keyCode == 13) { // 13 is the Enter key code
	      e.preventDefault(); // prevent default form submission behavior
	      $('#deptsearch').click(); // trigger button click event
	    }
	  });
	});



//body 생성되고
window.onload = function() {
	
	let startdateEl = document.getElementById("startdate")
	let enddateEl   = document.getElementById("enddate")
	let excelEl     = document.getElementById("excelsave")
	


	
	//거래처 검색 후 테이블 생성
	let deptsearchEl = document.getElementById('deptsearch')
	deptsearchEl.onclick = function(e) {
		let startdateEl = document.getElementById("startdate")
		let enddateEl = document.getElementById("enddate")
		
		let startdate = new Date(startdateEl.value);
		let enddate   = new Date(enddateEl.value);
		
		startdate = startdate.toISOString().slice(0, 10);
		enddate   = enddate.toISOString().slice(0, 10);
		
		$.ajax({
			url: "/JWork/SearchInputList",
			data : { search: $('#search').val(),
					startdate: startdate,
					enddate: enddate},
			type: "POST", 
					
			success : function(data){
				console.log(data);
				//alert(data);
				let tableEl = document.getElementById('table');
				const allsalesEl = document.getElementById('total');
                var totalsPrice = 0;
               
                
				data.forEach(function (item) {
					
					totalsPrice += parseFloat(item.p_iprice*item.in_num);
	              
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
	let bonsaSearchEl = document.getElementById('bonsaSearch')
	bonsaSearchEl.onclick = function(e) {
		
		let startdateEl = document.getElementById("startdate")
		let enddateEl = document.getElementById("enddate")
		
		let startdate = new Date(startdateEl.value);
		let enddate   = new Date(enddateEl.value);
		
		startdate = startdate.toISOString().slice(0, 10);
		enddate   = enddate.toISOString().slice(0, 10);
		
		$.ajax({
			url: "/JWork/BonsaSearchInput",
			data : { search: $('#search').val(),
					startdate: startdate,
					enddate: enddate},
			type: "POST", 
					
			success : function(data){
				let tableEl = document.getElementById('table');
				let html = bonsadata_display(data);
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

#lay {width: 90%; height: 400px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: 165px; box-shadow: 3px 3px 3px 3px gray;}
#table {overflow: auto; width: 100%; height: 390px;}
span {font-size: 40px; position: absolute; top: 19%; left:8% }
#date { border: 3px solid #666666; position: absolute; left: 39%; width: 558px;
 box-shadow: 2px 2px 2px 2px gray; padding: 15px; margin-top: 5px;}


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
</head>
<body>
	<div id="gd">
	<span id= my>입고 내역 조회</span>
<div id="date">
시작일자 지정: <input type="date" id="startdate" class="ee"/>  <br />
종료일자 지정: <input type="date" id="enddate" class="ee"/>  <br />
거래처명:      <input type="text" id="search"/> <input type="button" id="deptsearch" value="검색" class="btn" style="margin: 0 0 0 20px;""/>
 <input type="button" id="bonsaSearch" value="본사상품검색" class="btn" style=" margin: 0 30px; width:90px; "/>
<input type="button" id="excelsave" value ="액셀로 저장" style=" margin: 0 10px; width: 80px;" class="btn"  />
</div>
	<table  style="border: 3px solid #666666; box-shadow: 2px 2px 2px 2px gray; position: absolute; top: 225px; width: 950px; left: 24px; ">
         <tr>
		<td>총 입고금액 : </td><td id="total" ></td>
		</tr>
	</table>
<div id= "lay" >
<div id="table">
    </div>
	</div>
	</div>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

</body>
</html>