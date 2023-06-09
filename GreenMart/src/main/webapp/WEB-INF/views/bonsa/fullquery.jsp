<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
<script lang="javascript" src="/js/xlsx.full.min.js"></script>

    <%@ include file="/WEB-INF/include/subheader.jsp" %>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  
   
<script>

function saveExcel() {
	
	var table = document.getElementById("ta1");
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
	XLSX.utils.book_append_sheet(wb, ws, 'fullquery');
	
	let today = new Date();
	let day = today.getDate();
	let month = today.getMonth() + 1; // January is 0
	let year = today.getFullYear();

	// Format the date as desired
	let formattedDate = year + '-' + month + '-' + day;
	
	
	XLSX.writeFile(wb, ('fullquerytable_'+formattedDate +'.xlsx'));
}


window.onload = function() {
	  // Get the elements
	  const jumpoSelect = document.getElementById("jumpo");
	  const radio1 = document.getElementById("radio1");
	  const textInput = document.getElementById("text");
	  const radio2 = document.getElementById("radio2");
	  const combobox2 = document.getElementById("combobox2");
	  const productButton = document.getElementById("productbutton");
	  const excelEl  = document.getElementById("excelsave");
	  // Disable the input fields and button initially
	  radio1.disabled = true;
	  textInput.disabled = true;
	  radio2.disabled = true;
	  combobox2.disabled = true;
	  productButton.disabled = true;
	  excelEl.disabled = true;
	  // Add an event listener to the jumpoSelect element
	  jumpoSelect.addEventListener("change", function() {
	    if (jumpoSelect.value === "none") {
	      disableInputs();
	    } else {
	      enableInputs();
	    }
	  });
	  function disableInputs() {
	  }
	  function enableInputs() {
		  radio1.disabled = false;
		  textInput.disabled = false;
		  radio2.disabled = false;
		  combobox2.disabled = true;
		  productButton.disabled = false;
		  textInput.disabled = false;
		  
		  radio1.addEventListener("click", function() {
		    disableInputs();
		    combobox2.disabled = true;
		    textInput.disabled = false;
		  });

		  radio2.addEventListener("click", function() {
		    disableInputs();
		    textInput.disabled = true;
		    combobox2.disabled = false;
		  });
		  //전체
  }

 
		
productButton.addEventListener("click", function() {
	
	    
	productButton.disabled = true;
	excelEl.disabled = false;   
	radio1.disabled = true;
	radio2.disabled = true;
	jumpoSelect.disabled = true;
	switch (jumpoSelect.value) {
	    case "all":
	      if (radio1.checked) {
	        const inputVal = textInput.value.trim();
	        fullquery1(inputVal);
	        
	      } else if (radio2.checked) {
	        const inputVal = combobox2.value;
	        fullquery2(inputVal);
	      }
	      break;
	    case "bonsa":
	      if (radio1.checked) {
	        const inputVal = textInput.value.trim();
	        fullquery3(inputVal);
	      } else if (radio2.checked) {
	        const inputVal = combobox2.value;
	        fullquery4(inputVal);
	      }
	      break;
	    case "bujeon":
	      if (radio1.checked) {
	        const inputVal = textInput.value.trim();
	        fullquery5(inputVal);
	      } else if (radio2.checked) {
	        const inputVal = combobox2.value;
	        fullquery6(inputVal);
	      }
	      break;
	    default:
	      break;
	  }
	});
	
	
excelEl.onclick = function() {
	saveExcel()
}

}
function fullquery1(inputVal) {

	$.ajax({
      url: "/BWork/Fullquery1",
      data: { 
      text : inputVal
      },
      type: "POST",
      success: function (data) {
        console.log(data);
        console.dir(data);
        
        var mergedData = mergeAndSumData(data);
        
        var totaliPrice = 0;
    
         
        $.each(mergedData, function(index, item) {
    	 if (index === 0) {
            tableRow = $('#tr2');
          
          } else {
           var tableRow = $('#tr2').clone();
           tableRow.removeClass('hidden');
           $('#tr2').before(tableRow);
             }	
        tableRow.find('#inquired1').text(item.p_id);
        tableRow.find('#inquired2').text(item.p_name);
        tableRow.find('#inquired3').text(item.p_iprice);
        tableRow.find('#inquired4').text(item.p_sprice);
       
        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
        var formattedResult = result.toFixed(2);
        tableRow.find('#inquired7').text(formattedResult + ' %');
        tableRow.find('#inquired8').text(item.d_name);
        tableRow.find('#inquired9').text(item.st_num);
        tableRow.find('#inquired10').text(item.a_name);
        //  $('#inquired10').text(data.j_name);
       
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
      
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    
      },
      error: function (xhr) {
        console.log(xhr);
        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
      }
    });
  }

  

function fullquery2(inputVal) {

	$.ajax({
      url: "/BWork/Fullquery2",
      data: { 
      text : inputVal
      },
      type: "POST",
      success: function (data) {
        console.log(data);
        console.dir(data);
        
        var mergedData = mergeAndSumData(data);
        
        var totaliPrice = 0;
    
         
        $.each(mergedData, function(index, item) {
    	 if (index === 0) {
            tableRow = $('#tr2');
          
          } else {
           var tableRow = $('#tr2').clone();
           tableRow.removeClass('hidden');
           $('#tr2').before(tableRow);
             }	
        tableRow.find('#inquired1').text(item.p_id);
        tableRow.find('#inquired2').text(item.p_name);
        tableRow.find('#inquired3').text(item.p_iprice);
        tableRow.find('#inquired4').text(item.p_sprice);
       
        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
        var formattedResult = result.toFixed(2);
        tableRow.find('#inquired7').text(formattedResult + ' %');
        tableRow.find('#inquired8').text(item.d_name);
        tableRow.find('#inquired9').text(item.st_num);
        tableRow.find('#inquired10').text(item.a_name);
        //  $('#inquired10').text(data.j_name);
       
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
      
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    
      },
      error: function (xhr) {
        console.log(xhr);
        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
      }
    });
  }

  
  
			  //본사
		

function fullquery3(inputVal) {

	$.ajax({
      url: "/BWork/Fullquery3",
      data: { 
      text : inputVal
      },
      type: "POST",
      success: function (data) {
        console.log(data);
        console.dir(data);
        
        var mergedData = mergeAndSumData(data);
        
        var totaliPrice = 0;
    
         
        $.each(mergedData, function(index, item) {
    	 if (index === 0) {
            tableRow = $('#tr2');
          
          } else {
           var tableRow = $('#tr2').clone();
           tableRow.removeClass('hidden');
           $('#tr2').before(tableRow);
             }	
        tableRow.find('#inquired1').text(item.p_id);
        tableRow.find('#inquired2').text(item.p_name);
        tableRow.find('#inquired3').text(item.p_iprice);
        tableRow.find('#inquired4').text(item.p_sprice);
       
        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
        var formattedResult = result.toFixed(2);
        tableRow.find('#inquired7').text(formattedResult + ' %');
        tableRow.find('#inquired8').text(item.d_name);
        tableRow.find('#inquired9').text(item.st_num);
        tableRow.find('#inquired10').text(item.a_name);
        //  $('#inquired10').text(data.j_name);
       
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
      
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    
      },
      error: function (xhr) {
        console.log(xhr);
        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
      }
    });
  }

function fullquery4(inputVal) {

	$.ajax({
      url: "/BWork/Fullquery4",
      data: { 
      text : inputVal
      },
      type: "POST",
      success: function (data) {
        console.log(data);
        console.dir(data);
        
        var mergedData = mergeAndSumData(data);
        
        var totaliPrice = 0;
    
         
        $.each(mergedData, function(index, item) {
    	 if (index === 0) {
            tableRow = $('#tr2');
          
          } else {
           var tableRow = $('#tr2').clone();
           tableRow.removeClass('hidden');
           $('#tr2').before(tableRow);
             }	
        tableRow.find('#inquired1').text(item.p_id);
        tableRow.find('#inquired2').text(item.p_name);
        tableRow.find('#inquired3').text(item.p_iprice);
        tableRow.find('#inquired4').text(item.p_sprice);
       
        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
        var formattedResult = result.toFixed(2);
        tableRow.find('#inquired7').text(formattedResult + ' %');
        tableRow.find('#inquired8').text(item.d_name);
        tableRow.find('#inquired9').text(item.st_num);
        tableRow.find('#inquired10').text(item.a_name);
        //  $('#inquired10').text(data.j_name);
       
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
      
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    
      },
      error: function (xhr) {
        console.log(xhr);
        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
      }
    });
  }

  

		
			//점포
		
function fullquery5(inputVal) {

	$.ajax({
      url: "/BWork/Fullquery5",
      data: { 
      text : inputVal
      },
      type: "POST",
      success: function (data) {
        console.log(data);
        console.dir(data);
        
        var mergedData = mergeAndSumData(data);
        
        var totaliPrice = 0;
    
         
        $.each(mergedData, function(index, item) {
    	 if (index === 0) {
            tableRow = $('#tr2');
          
          } else {
           var tableRow = $('#tr2').clone();
           tableRow.removeClass('hidden');
           $('#tr2').before(tableRow);
             }	
        tableRow.find('#inquired1').text(item.p_id);
        tableRow.find('#inquired2').text(item.p_name);
        tableRow.find('#inquired3').text(item.p_iprice);
        tableRow.find('#inquired4').text(item.p_sprice);
       
        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
        var formattedResult = result.toFixed(2);
        tableRow.find('#inquired7').text(formattedResult + ' %');
        tableRow.find('#inquired8').text(item.d_name);
        tableRow.find('#inquired9').text(item.st_num);
        tableRow.find('#inquired10').text(item.a_name);
        //  $('#inquired10').text(data.j_name);
       
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
      
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    
      },
      error: function (xhr) {
        console.log(xhr);
        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
      }
    });
  }

function fullquery6(inputVal) {

	$.ajax({
      url: "/BWork/Fullquery6",
      data: { 
      text : inputVal
      },
      type: "POST",
      success: function (data) {
        console.log(data);
        console.dir(data);
        
        var mergedData = mergeAndSumData(data);
        
        var totaliPrice = 0;
    
         
        $.each(mergedData, function(index, item) {
    	 if (index === 0) {
            tableRow = $('#tr2');
          
          } else {
           var tableRow = $('#tr2').clone();
           tableRow.removeClass('hidden');
           $('#tr2').before(tableRow);
             }	
        tableRow.find('#inquired1').text(item.p_id);
        tableRow.find('#inquired2').text(item.p_name);
        tableRow.find('#inquired3').text(item.p_iprice);
        tableRow.find('#inquired4').text(item.p_sprice);
       
        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
        var formattedResult = result.toFixed(2);
        tableRow.find('#inquired7').text(formattedResult + ' %');
        tableRow.find('#inquired8').text(item.d_name);
        tableRow.find('#inquired9').text(item.st_num);
        tableRow.find('#inquired10').text(item.a_name);
        //  $('#inquired10').text(data.j_name);
       
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
      
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    
      },
      error: function (xhr) {
        console.log(xhr);
        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
      }
    });
  }

  



   $(document).ready(function() {
	  $('#text').keypress(function(e) {
	    if (e.keyCode == 13) { 
	      e.preventDefault(); 
	      $('#productbutton').click(); 
	    }
	  });
	}); 
// 새로고침
   function refresh() {
       location.reload();
   }
   // 똑같은 id 합치기
   function mergeAndSumData(data) {
		  var mergedData = [];

		  data.forEach(function (item) {
		    var existingItem = mergedData.find(function (mergedItem) {
		      return mergedItem.p_id === item.p_id;
		    });

		    if (existingItem) {
		      existingItem.st_num += item.st_num;
		      existingItem.s_num += item.s_num;
		    } else {
		      mergedData.push(item);
		    }
		  });

		  return mergedData;
		}
	

    
</script>
<style>
#tr2:hover {  background-color: #f5f5f5; }
tr,td{border: 1px solid black; }
td{ padding: 10px; margin: 30px; width: 200px;}
#qq { border: 3px solid #666666; position: absolute; left: 42%; width: 558px;
 box-shadow: 2px 2px 2px 2px gray;  padding: 15px; margin-top: 25px; }
select { width: 175px;}
#span {font-size: 40px; position: absolute; top: 21%; left:8% }
#lay {width: 90%; height: 400px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: 150px; box-shadow: 3px 3px 3px 3px gray; overflow: auto;}
#ta1 {width:100%; height: 390px; }

#bb {width: 90%; height: 40px;}
#aa {width: 90%; height: 40px;}

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
	   <span id="span">상품 전체 조회</span>
	 <table id="qq">
	 <tr>
	 <td>
	 <span>점포 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	 <select id="jumpo">
	 <option value="none">=== 선택 ===</option>
	 <option value="all">전체</option>
	 <option value="bonsa">본사</option>
	 <option value="bujeon">부전점</option>
	 </select>
	 <br>
	 <input type="radio" name="radio"  id="radio1" value="상품코드" checked>거래처 :&nbsp;&nbsp;&nbsp; 
	 <input type="text" id="text" >
	 <br>
	 <input type="radio" name="radio"  id="radio2" value="상품명">상품분류 : 
	 <select id="combobox2" >
	  <option value="none">=== 선택 ===</option>
	 <option value="주류">주류</option>
	 <option value="가공식품">가공식품</option>
	 <option value="기호식품">기호식품</option>
	 <option value="냉동냉장">냉동냉장</option>
	 <option value="일용잡화">일용잡화</option>
	 <option value="가정잡화">가정잡화</option>
	 <option value="문화복식">문화복식</option>
	 </select>
	 <input type="button" id="productbutton" value="조회" class="btn" style=" margin: 0 20 0 20px;">
	 <button onclick="refresh()" class="btn" style=" margin: 0 10px; width:60px;">새로고침</button>
	 <input type="button" id="excelsave" value="엑셀로 저장"  style="  width:80px; " class="btn" />
	 </td>

	 </tr>
	 </table>
	 <div id= "lay" >
	 <table id="ta1">
	 	<tr id = "bb">
	<td colspan="4">재고금액</td><td  colspan="4" id="x1"></td>
	</tr>
	 <tr id="aa">
	 <td>상품코드</td>
	 <td>상품명</td>
	 <td>입고가격</td>
	 <td>판매가격</td>
	 <td>이익률</td>
	 <td>거래처명</td>
	 <td>재고</td>
	 <td>상품분류</td>
	 </tr>
	 <tr id="tr2">
	 <td id="inquired1"></td>
	 <td id="inquired2"></td>
	 <td id="inquired3"></td>
	 <td id="inquired4"></td>
	 <td id="inquired7"></td>
	 <td id="inquired8"></td>
	 <td id="inquired9"></td>
	 <td id="inquired10"></td>
	 </tr>
		</table>
	</div>

	</div>
    <%@ include file="/WEB-INF/include/bottom.jsp" %>
</body>
</html>