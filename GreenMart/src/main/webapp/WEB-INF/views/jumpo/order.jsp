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
	XLSX.utils.book_append_sheet(wb, ws, 'Order');
	
	let today = new Date();
	let day = today.getDate();
	let month = today.getMonth() + 1; // January is 0
	let year = today.getFullYear();

	// Format the date as desired
	let formattedDate = year + '-' + month + '-' + day;
	
	
	XLSX.writeFile(wb, ('Ordertable_'+formattedDate +'.xlsx'));
}

// 테이블 생성
function data_display(data) {
	
	let html = '';
	html += '<table id="myTable">';
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
	html += '<td><input id="ordernum" type="number" style="width: 70px;"/></td>';
	html += '<td><c:if test="${sessionScope.login != null}">';
	html +=	`${ sessionScope.login.e_id }`;
	html +=	'</c:if></td>';
	html += '</tr>';
	})
	
	html += '</table>';
	return html;
	
}

// 날짜 하루 뒤 더하기
function AddDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return result;
}

//주문수량 배열
function saveOrderNum(columnIndex) {
	
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
//주문일 배열
function saveOrderDate() {
	
    var table = document.getElementById("myTable");
    var rows = table.getElementsByTagName("tr");
    var columnValues = [];
    
    for (var i = 1; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName("td");
        let jumun2El = document.getElementById("jumun2");
		var Date  = jumun2El.value;
        
        columnValues.push(Date);
    }

    
    return columnValues;
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
    
//주문 상품명 배열
    function saveOrderP_name(columnIndex) {
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

//날짜 input 마우스 이벤트 금지
$(document).ready(function() {
  		$('#jumun2').on('mousedown', function(e) {
  	  e.preventDefault();
  	});
	});
$(document).ready(function() {
  		$('#jumun3').on('mousedown', function(e) {
  	  e.preventDefault();
  	});
	});

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
	
	let jumun1El = document.getElementById("jumun1")
	let orderEl  = document.getElementById("order")
	let excelEl  = document.getElementById("excelsave")
	

	
	//날짜 지정
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
	
	
	//거래처 검색 후 테이블 생성
	let deptsearchEl = document.getElementById('deptsearch')
	deptsearchEl.onclick = function(e) {
		$.ajax({
			url: "/JWork/SearchDept",
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
	
	//주문 버튼 클릭시 주문
	orderEl.onclick = function(e) {
		let ordernum   = saveOrderNum(5);
		let orderdate  = saveOrderDate();
		let orderdname = saveOrderD_name(0);
		let orderpname = saveOrderP_name(2);
		console.log(ordernum)
		console.log(orderdate)
		console.log(orderdname)
		console.log(orderpname);
		
		$.ajax({
			url: "/JWork/Order",
			data : { ordernum  : ordernum,
			     	orderdate  : orderdate,
			     	orderdname : orderdname,
			     	orderpname : orderpname
				     },
			type: "POST", 
					
			success : function(data){
				if(data == 1){
				alert("주문이 완료되었습니다.");
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

#lay {width: 90%; height: 400px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: 150px; box-shadow: 3px 3px 3px 3px gray;}
#table {overflow: auto; width: 100%; height: 390px;}
span {font-size: 40px; position: absolute; top: 21%; left:8% }
#date { border: 3px solid #666666; position: absolute; left: 39%; width: 558px;
 box-shadow: 2px 2px 2px 2px gray; padding: 15px; margin-top: 8px;}


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
<span>상품 주문 업무</span>
<div id="date">

주문일자 지정: &nbsp;<input type="date" id="jumun1" style="width: 168px; position: absolute; left: 133px;"/>  <br />
주문일자: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input type="date" id="jumun2" readonly="readonly" style="width: 168px;"/>  <br />
지정일자:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input type="date" id="jumun3" readonly="readonly" style="width: 168px;"/>  <br />
거래처명:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <input type="text" id="search"/> <input type="button" id="deptsearch" style=" margin: 0 20px 0 10px;" value="검색" class="btn"/>
<input type="button" id= "order"  value= "주문" class="btn"/>
<input type="button" id="excelsave" value ="엑셀로 저장" style=" margin: 0 20px; width:80px; " class="btn"/><br>
</div>

<div id= "lay" >
<div id="table">

</div>
</div>
</div>
<%@ include file="/WEB-INF/include/bottom.jsp" %>
	
</body>
</html>