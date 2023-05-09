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
  
    <style>
h2{text-align: center; margin: 20px; font-size: 30px; }
table {margin-left: auto; margin-right: auto;}
table, tr, td {border-collapse: collapse;}
tr,td{border: 1px solid black; }
td{ padding: 10px; margin: 30px; width: 200px;}
select { width: 175px;}

</style>
<script>


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

}
function fullquery1(inputVal) {

	$.ajax({
      url: "/JWork/Fullquery1",
      data: { 
      text : inputVal
      },
      type: "POST",
      success: function (data) {
        console.log(data);
        console.dir(data);
        
        var mergedData = mergeAndSumData(data);
        
        var totaliPrice = 0;
        var totaliic = 0;
        var totalsPrice = 0;
        var iic1=0;
        var iic2=0;
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
        tableRow.find('#inquired5').text(item.s_num);
        tableRow.find('#inquired6').text(item.s_num*item.p_sprice);
        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
        var formattedResult = result.toFixed(2);
        tableRow.find('#inquired7').text(formattedResult + ' %');
        tableRow.find('#inquired8').text(item.d_name);
        tableRow.find('#inquired9').text(item.st_num);
        tableRow.find('#inquired10').text(item.a_name);
        //  $('#inquired10').text(data.j_name);
       
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
       totalsPrice += parseFloat(item.p_sprice*item.s_num);
       iic1 += parseFloat(item.p_iprice*1.1*item.s_num);
       iic2 += parseFloat(item.p_sprice*item.s_num);
       totaliic = parseFloat(100-(iic1)/(iic2)*100);
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    	$('#x2').text(totaliic.toFixed(2) + '%');
    	$('#x3').text(totalsPrice + '원');
      },
      error: function (xhr) {
        console.log(xhr);
        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
      }
    });
  }

  

function fullquery2(inputVal) {

	$.ajax({
      url: "/JWork/Fullquery2",
      data: { 
      text : inputVal
      },
      type: "POST",
      success: function (data) {
        console.log(data);
        console.dir(data);
        
        var mergedData = mergeAndSumData(data);
        
        var totaliPrice = 0;
        var totaliic = 0;
        var totalsPrice = 0;
        var iic1=0;
        var iic2=0;
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
        tableRow.find('#inquired5').text(item.s_num);
        tableRow.find('#inquired6').text(item.s_num*item.p_sprice);
        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
        var formattedResult = result.toFixed(2);
        tableRow.find('#inquired7').text(formattedResult + ' %');
        tableRow.find('#inquired8').text(item.d_name);
        tableRow.find('#inquired9').text(item.st_num);
        tableRow.find('#inquired10').text(item.a_name);
        //  $('#inquired10').text(data.j_name);
       
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
       totalsPrice += parseFloat(item.p_sprice*item.s_num);
       iic1 += parseFloat(item.p_iprice*1.1*item.s_num);
       iic2 += parseFloat(item.p_sprice*item.s_num);
       totaliic = parseFloat(100-(iic1)/(iic2)*100);
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    	$('#x2').text(totaliic.toFixed(2) + '%');
    	$('#x3').text(totalsPrice + '원');
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
			      url: "/JWork/Fullquery3",
			      data: { text: inputVal },
			      type: "POST",
			      success: function (data) {
			        console.log(data);
			        console.dir(data);
			        
			        var totaliPrice = 0;
			        var totaliic = 0;
			        var totalsPrice = 0;
			        var iic1=0;
			        var iic2=0;
			        $.each(data, function(index, item) {
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
			        tableRow.find('#inquired5').text(item.s_num);
			        tableRow.find('#inquired6').text(item.s_num*item.p_sprice);
			        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
			        var formattedResult = result.toFixed(2);
			        tableRow.find('#inquired7').text(formattedResult + ' %');
			        tableRow.find('#inquired8').text(item.d_name);
			        tableRow.find('#inquired9').text(item.st_num);
			        tableRow.find('#inquired10').text(item.a_name);
			        //  $('#inquired10').text(data.j_name);
			       
			        totaliPrice += parseFloat(item.p_iprice*item.st_num);
			        totalsPrice += parseFloat(item.p_sprice*item.s_num);
			        iic1 += parseFloat(item.p_iprice*1.1*item.s_num);
			        iic2 += parseFloat(item.p_sprice*item.s_num);
			        totaliic = parseFloat(100-(iic1)/(iic2)*100);
			         $('#ta1').append(tableRow);
			         });
			     	$('#x1').text(totaliPrice + '원');
			     	$('#x2').text(totaliic.toFixed(2) + '%');
			     	$('#x3').text(totalsPrice + '원');
			      },
			      error: function (xhr) {
			        console.log(xhr);
			        alert('에러 : ' + xhr.status + '' + xhr.textStatus)
			      }
			    });
			  }

  function fullquery4(inputVal) {
	    $.ajax({
	      url: "/JWork/Fullquery4",
	      data: { text: inputVal },
	      type: "POST",
	      success: function (data) {
	        console.log(data);
	        console.dir(data);
	        
	        var totaliPrice = 0;
	        var totaliic = 0;
	        var totalsPrice = 0;
	        var iic1=0;
	        var iic2=0;
	        $.each(data, function(index, item) {
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
	        tableRow.find('#inquired5').text(item.s_num);
	        tableRow.find('#inquired6').text(item.s_num*item.p_sprice);
	        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
	        var formattedResult = result.toFixed(2);
	        tableRow.find('#inquired7').text(formattedResult + ' %');
	        tableRow.find('#inquired8').text(item.d_name);
	        tableRow.find('#inquired9').text(item.st_num);
	        tableRow.find('#inquired10').text(item.a_name);
	        //  $('#inquired10').text(data.j_name);
	       
	        totaliPrice += parseFloat(item.p_iprice*item.st_num);
	        totalsPrice += parseFloat(item.p_sprice*item.s_num);
	        iic1 += parseFloat(item.p_iprice*1.1*item.s_num);
	        iic2 += parseFloat(item.p_sprice*item.s_num);
	        totaliic = parseFloat(100-(iic1)/(iic2)*100);
	         $('#ta1').append(tableRow);
	         });
	     	$('#x1').text(totaliPrice + '원');
	     	$('#x2').text(totaliic.toFixed(2) + '%');
	     	$('#x3').text(totalsPrice + '원');
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
     url: "/JWork/Fullquery5",
     data: { text: inputVal },
     type: "POST",
     success: function (data) {
       console.log(data);
       console.dir(data);
       var totaliPrice = 0;
       var totaliic = 0;
       var totalsPrice = 0;
       var iic1=0;
       var iic2=0;
       $.each(data, function(index, item) {
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
       tableRow.find('#inquired5').text(item.s_num);
       tableRow.find('#inquired6').text(item.s_num*item.p_sprice);
       var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
       var formattedResult = result.toFixed(2);
       tableRow.find('#inquired7').text(formattedResult + ' %');
       tableRow.find('#inquired8').text(item.d_name);
       tableRow.find('#inquired9').text(item.st_num);
       tableRow.find('#inquired10').text(item.a_name);
       //  $('#inquired10').text(data.j_name);
      
       totaliPrice += parseFloat(item.p_iprice*item.st_num);
       totalsPrice += parseFloat(item.p_sprice*item.s_num);
       iic1 += parseFloat(item.p_iprice*1.1*item.s_num);
       iic2 += parseFloat(item.p_sprice*item.s_num);
       totaliic = parseFloat(100-(iic1)/(iic2)*100);
        $('#ta1').append(tableRow);
        });
    	$('#x1').text(totaliPrice + '원');
    	$('#x2').text(totaliic.toFixed(2) + '%');
    	$('#x3').text(totalsPrice + '원');
     },
     error: function (xhr) {
       console.log(xhr);
       alert('에러 : ' + xhr.status + '' + xhr.textStatus)
     }
   });
 }

	  function fullquery6(inputVal) {
		    $.ajax({
		      url: "/JWork/Fullquery6",
		      data: { text: inputVal },
		      type: "POST",
		      success: function (data) {
		        console.log(data);
		        console.dir(data);
		        var totaliPrice = 0;
		        var totaliic = 0;
		        var totalsPrice = 0;
		        var iic1=0;
		        var iic2=0;
		        $.each(data, function(index, item) {
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
		        tableRow.find('#inquired5').text(item.s_num);
		        tableRow.find('#inquired6').text(item.s_num*item.p_sprice);
		        var result = 100 - (item.p_iprice * 1.1 / item.p_sprice * 100)
		        var formattedResult = result.toFixed(2);
		        tableRow.find('#inquired7').text(formattedResult + ' %');
		        tableRow.find('#inquired8').text(item.d_name);
		        tableRow.find('#inquired9').text(item.st_num);
		        tableRow.find('#inquired10').text(item.a_name);
		        //  $('#inquired10').text(data.j_name);
		       
		        totaliPrice += parseFloat(item.p_iprice*item.st_num);
		        totalsPrice += parseFloat(item.p_sprice*item.s_num);
		        iic1 += parseFloat(item.p_iprice*1.1*item.s_num);
		        iic2 += parseFloat(item.p_sprice*item.s_num);
		        totaliic = parseFloat(100-(iic1)/(iic2)*100);
		         $('#ta1').append(tableRow);
		         });
		     	$('#x1').text(totaliPrice + '원');
		     	$('#x2').text(totaliic.toFixed(2) + '%');
		     	$('#x3').text(totalsPrice + '원');
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

</head>
<body>
	<div id="gd">
	  <h2>상품 전체 조회</h2>
	 <table style="width: 100%; height: 50px;">
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
	 <input type="button" id="productbutton" value="조회" >
	 <button onclick="refresh()">새로고침</button>
	 <input type="button" id="excelsave" value="엑셀로 저장" style="float: right;" />
	 </td>

	 </tr>
	 </table>
	 <table id="ta1">
	 	<tr>
	<td>재고금액</td><td  colspan="2" id="x1"></td>
	<td>판매이익률</td><td  colspan="2" id="x2"></td>
	<td>총판매금액</td><td  colspan="3" id="x3"></td>
	</tr>
	 <tr>
	 <td>상품코드</td>
	 <td>상품명</td>
	 <td>입고가격</td>
	 <td>판매가격</td>
	 <td>판매갯수</td>
	 <td>총판매금액</td>
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
	 <td id="inquired5"></td>
	 <td id="inquired6"></td>
	 <td id="inquired7"></td>
	 <td id="inquired8"></td>
	 <td id="inquired9"></td>
	 <td id="inquired10"></td>
	 </tr>
		</table>
	<br>
	<br>
	<br>
	<br>
	
    <%@ include file="/WEB-INF/include/bottom.jsp" %>

	</div>
</body>
</html>