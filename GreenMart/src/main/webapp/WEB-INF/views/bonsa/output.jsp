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
 box-shadow: 2px 2px 2px 2px gray; padding: 15px; margin-top: 30px;}


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
<script>
//엑셀로 출력
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
	XLSX.utils.book_append_sheet(wb, ws, 'Output');
	
	let today = new Date();
	let day = today.getDate();
	let month = today.getMonth() + 1; // January is 0
	let year = today.getFullYear();

	// Format the date as desired
	let formattedDate = year + '-' + month + '-' + day;
	
	
	XLSX.writeFile(wb, ('OutputTable_'+formattedDate +'.xlsx'));
}
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
	html += '<td><c:if test="${sessionScope.login != null}">'
		html +=   `${ sessionScope.login.e_id }`
		html +=   '</c:if></td>';
	html += '</tr>';
	})
	
	html += '</table>';
	return html;
	
}
// 함수 끝
//===========================================================
// body 생성되고
window.onload = function() {
	let excelEl       = document.getElementById("excelsave")
	
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
	
	
	//excel로 표 저장
	excelEl.onclick = function() {
		saveExcel()
	}
	
}



</script>
</head>
<body>

	<div id="gd">
	 <span>상품 출고 업무</span>
	<div id="date">
	주문내역 조회:&nbsp; <input type="date" id="order1"/>  <br />
	주문일자:  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;     <input type="date" id="order2" readonly="readonly"/>  <br />
	점포 : 
	<select id="combobox" style="margin-left: 83px;">
	 <option value="none">=== 선택 ===</option>
	 <option value="12020">부전점</option>
	</select>
	<input type="button" id="orderSearch" value="검색" class="btn"/>
	<input type="button" id="excelsave" value ="액셀로 저장" class="btn" style="width: 80px; margin: 0 0 0 10px;" />
	<input type="button" id= "outPut" style="float: right;" value= "출고"  class="btn"/>
	</div>
	<div id= "lay" >
	<div id="table">

	</div>
	</div>

    <%@ include file="/WEB-INF/include/bottom.jsp" %>
	</div>
</body>
</html>