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
			url: "/BWork/SearchJumpo",
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

#lay {width: 90%; height: 400px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: 150px; box-shadow: 3px 3px 3px 3px gray;}
#table {overflow: auto; width: 100%; height: 390px;}
span {font-size: 40px; position: absolute; top: 21%; left:8% }
#date { border: 3px solid #666666; position: absolute; left: 39%; width: 558px;
 box-shadow: 2px 2px 2px 2px gray; padding: 30px 15px; margin-top: 35px;}



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


<body>
	<div id="gd">
	<span>점포 전체 조회</span>
	<div id="date">
점포명:      <input type="text" id="search" style=" margin: 0 10px 0 0;"/> <input type="button" id="jumposearch" value="검색" class="btn"/>
<input type="button" id="excelsave" value ="액셀로 저장" style=" margin: 0 20px; width:80px; " class="btn"/>
</div>
<div id= "lay" >
<div id="table">
</div>
</div>
</div>
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

</body>
</html>