<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
 <%@ include file="/WEB-INF/include/subheader.jsp" %>
</head>
<script lang="javascript" src="/js/xlsx.full.min.js"></script>


<script>

//엑셀 불러오기 
function saveExcel() {
	
	var table = document.getElementById("table");
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
	XLSX.utils.book_append_sheet(wb, ws, 'Customer');
	
	let today = new Date();
	let day = today.getDate();
	let month = today.getMonth() + 1; // January is 0
	let year = today.getFullYear();

	// Format the date as desired
	let formattedDate = year + '-' + month + '-' + day;
	
	
	XLSX.writeFile(wb, ('Customer_'+formattedDate +'.xlsx'));
}

	 window.onload = function() {
		// 회원 상세정보 
		let viewEl = document.querySelectorAll('td a');
		viewEl.forEach(viewEl => {    
		 	viewEl.addEventListener('click' , function(e){
			  	e.preventDefault();
		      	//e.stopPropagation();
		      	let customer_id = this.parentNode.parentNode.querySelector('td:first-child').textContent;
			  	let  html       = '/CustomerView?c_id=' + customer_id ;
			  	let  name       = 'CustomerView'; 
				let  features   = 'height=500, width=550, top=200, left=600'; 
				window.open(html, name, features);
			})
		}) 
		// 엔터키로 조회버튼 클릭
		let inputEl = document.querySelector("input[type='text']");
		inputEl.addEventListener("keypress", function(e) {
			if(e.keyCode == 13){
				e.preventDefault();
				executeSearch();
			}
		});
		let btnFindEl = document.getElementById("find");
		btnFindEl.addEventListener("click", executeSearch); 
			
		function executeSearch() {
			  let searchText = inputEl.value.toLowerCase();
			  
			  // 회원 목록에서 검색어와 일치하는 회원 필터링
			  let trList = document.querySelectorAll("#gd table tbody tr");
			  trList.forEach(function(tr) {
			    let tdList = tr.querySelectorAll("td");
			    let match = false;
			    tdList.forEach(function(td, index) {
			      if (index !== 3 && td.textContent.toLowerCase().indexOf(searchText) >= 0) { // c_mile은 제외
			        match = true;
			        return false; // forEach에서 break
			      }
			    });
			    if (match) {
			      tr.style.display = "";
			    } else {
			      tr.style.display = "none";
			    }
			  });
			
		}
		//excel로 표 저장
		let excelEl = document.getElementById("excelsave");
		excelEl.onclick = function() {
			saveExcel();
		};
		
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
#lay {width: 90%; height: 400px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: 115px; box-shadow: 3px 3px 3px 3px gray;}
#table {overflow: auto; width: 95%; height: 390px;}
span {font-size: 40px; position: absolute; top: 21%; left:8% }
#date { border: 3px solid #666666; position: absolute; left: 39%; width: 558px;
 box-shadow: 2px 2px 2px 2px gray; padding: 30px 15px; margin-top: 15px;}


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
        <span>회원 목록</span> 
     <div id="date">
        	회원명 : <input type="text" />
        	<input type="button" id="find" name="find" value="조회"  style=" margin: 0 0 0 25px;" class="btn"/>
        	<input type="button" id="excelsave" value ="액셀로 저장" style=" margin: 0 25px; width:80px;" class="btn"/>
        </div>
        <div id="lay">
        <table id="table">
          <colgroup>
            <col width="11%">
            <col width="11%">
            <col width="17%">
            <col width="11%">
          </colgroup>
          <thead>
            <tr>
              <th>회원번호</th>
              <th>회원성명</th>
              <th>전화번호</th>
              <th>마일리지</th>
            </tr>
          </thead>
          <c:forEach var="customer" items="${cusList}" >
            <tr>
              <td>${customer.c_id }</td>
              <td><a href="" id="view" class="view">${customer.c_name }</a></td>
              
              <td>${customer.c_phone }</td>
              <td>${customer.c_mile }</td>
            </tr>          
          </c:forEach>
        </table>
	
</div>
</div>
<%@ include file="/WEB-INF/include/bottom.jsp" %>
</body>
</html>