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

//폐기수량 배열
function saveDisusNum(columnIndex) {
	
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

//주문 상품명 배열
function saveDisuseP_name(columnIndex) {
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
	html += '<th>상품코드</th>';
	html += '<th>상품명</th>';
	html += '<th>입고가격</th>';
	html += '<th>현재재고</th>';
	html += '<th>폐기수량</th>';
	html += '<th>사원번호</th>';
	html += '</tr>';
	
	data.forEach(function(data, index) { 	
	html += '<tr>';
	html += '<td>'+data.d_name+'</td>';
	html += '<td>'+data.p_id+'</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '<td>'+data.p_iprice+'</td>';
	html += '<td>'+data.st_num+'</td>';
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
	html += '<option value= "" selected>전체 보기</option>';
	
	data.forEach(function(data, index) { 	
	html += '<option value= "'+ data.a_name +'">'+data.a_name+'</option>';
	num++;
	})
	
	html += '</select>';
	return html;
	
}


window.onload = function() {
	
	let searchEl = document.getElementById("search")
	let disuseEl  = document.getElementById("disuse")
	let excelEl  = document.getElementById("excelsave")

	
	$.ajax({
		url: "/JWork/SearchDisuseSelect",
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
					url: "/JWork/SearchDisUse",
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
	
	
	//폐기 버튼 클릭시 폐기
	disuseEl.onclick = function(e) {
		let disusenum   = saveDisusNum(5);
		let disusepname = saveDisuseP_name(2);
		console.log(disusenum)
		console.log(disusepname)
		
		$.ajax({
			url: "/JWork/Disuse",
			data : { disusenum  : disusenum,
				disusepname : disusepname
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
	
	
	
}

</script>
<style>
#checkbox {
  display: inline-block;
}

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
<h2>상품 폐기 업무</h2>
<div id="fegi">
상품 분류: <div id ="checkbox"></div><input type="button" id="search" value="검색"/>
<br />
<input type="button" id="excelsave" value ="액셀로 저장" style="float: right; margin: 0 25px;"/>
<input type="button" id= "disuse" style="float: right;" value= "폐기확정"/>
</div>
<div id="table">

</div>
<%@ include file="/WEB-INF/include/bottom.jsp" %>
</div>
</body>
</html>