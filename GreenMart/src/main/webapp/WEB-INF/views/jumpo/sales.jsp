<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css" />

<%@ include file="/WEB-INF/include/subheader.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script lang="javascript" src="/js/qrcode.js"></script>
<script>

//상품 seq 배열
function saveOrderP_seq(columnIndex) {
    var table = document.getElementById("table_body");
    var rows = table.getElementsByTagName("tr");
    var columnValues = [];

    for (var i = 0; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName("td");

        if (cells.length > columnIndex) {
        	var input = cells[columnIndex].getElementsByTagName("input")[0];
        	
        	console.log(input)
        	
            var cellValue = input.value;
            columnValues.push(cellValue);
        }
    }

    return columnValues;
}

//상품수량 배열
function saveOrderNum(columnIndex) {
	
    var table = document.getElementById("table_body");
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

	// 금액 배열(합계금액 계산용)
	function getColumnValues(columnIndex) {
		
	  var columnValues = [];
	  
	  $("#myTable tr").each(function() {
		  
	    var cell = $(this).find("td:eq(" + columnIndex + ")");
	    
	    if (cell.length) {
	      var input = cell.find("input[type='number']");
	      if (input.length) {
	        columnValues.push(input.val());
	      } else {
	        columnValues.push(cell.text().trim());
	      }
	    }
	  });
	  
	  let totKum = 0;
	  for( var i = 0; i < columnValues.length; i++){
		  totKum = totKum + parseInt( columnValues[i] );
	  }
	  
	  return totKum;
	}
	
	// rowCount 계산용
	function getTableRowCount(tableId) { 
	  const table = document.getElementById(tableId);
	  if (!table) {
	    console.error(`Table with id ${tableId} not found`);
	    return 0;
	  }

	  return table.rows.length;
	}
	
	
	// 함수 끝
	//======================================================
	// body 켜지고 난 다음
	window.onload = function() {
		
	var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/socket";
		
		var socket = new WebSocket(wsUri);
		
		console.log(socket)
		
		socket.onopen = function(event) {
			  console.log('WebSocket connection established.');
			};


			socket.onerror = function(event) {
			  console.error('WebSocket error:', event);
			};

			socket.onclose = function(event) {
			  console.log('WebSocket connection closed.');
			};

			// In sales.jsp
			socket.onopen = function(event) {
			  console.log('WebSocket connection established.');
			};

			socket.onmessage = function(event) {
			  var message = event.data;
			  console.log('Received message:', message);
			  // Process the received message as needed
			};

			socket.onerror = function(event) {
			  console.error('WebSocket error:', event);
			};

			socket.onclose = function(event) {
			  console.log('WebSocket connection closed.');
			};
        
		socket.onmessage = function(event) {
			  var message = event.data;
			  console.log('Received message:', message);
			  
			  if(message === 'getE_id') {
				  socket.send('${sessionScope.login.e_id}')
			  }

			  if (message === 'CloseSalesWindow') {
				alert('결제가 완료되었습니다.')
			    window.close();
			  }
			};
		
		
		//qrcode
		let qrcodeget = document.getElementById("qrget")
		
		qrcodeget.onclick = function() {
			
			$("#qrcode").empty()
			
			let p_seqList  = saveOrderP_seq(1);
			let su_List   = saveOrderNum(2);
			let finalPrice  = document.getElementById('finalPrice');
			let earnMiles  = document.getElementById('earnMiles');
			let milePay  = document.getElementById('milePay');

			
			
			var qr = new QRCode(document.getElementById("qrcode"), {
			    text: JSON.stringify({address: "http://192.168.0.210:9090/M/Pay",p_seqList: p_seqList, 
			    	su_List: su_List, finalPrice: finalPrice.value, earnMiles: earnMiles.value, milePay: milePay.value}),
			    width: 128,
			    height: 128,
			    colorDark : "#000000",
			    colorLight : "#ffffff",
			    correctLevel : QRCode.CorrectLevel.H
			});
			
		}
		
		// 오늘 날짜
		let today = new Date(); 
		const todayEl = document.getElementById('today');
		todayEl.innerHTML = today.toLocaleString();

		// 마일리지 입력 새창띄우기
		let btnMileageEl = document.getElementById('mileage');
		btnMileageEl.addEventListener('click', function(e) {
			e.preventDefault();
			// e.stopPropagation();
			let html = '/Mileage';
			let name = 'Mileage'; // '' 값이 없으면 창이 여러번 뜬다
			let features = 'height=580, width=500, top=200, left=300';
			window.open(html, name, features);
		});


		
		// (+) 눌렀을때
		let btnAddItemEl = document.querySelector('.btnAddItem')
		let num = 2;
		btnAddItemEl.onclick = function(e) {

			let tag = '';
			tag += '<tr>'
			tag += '<td><button id="btnDelItem' + num + '" type="button" >➖</button></td>';
			tag += '<td><input type="text"   name="p_seq' + num + '" id="p_seq' + num + '" placeholder="상품코드입력"/></td>';
			tag += '<td><input type="number" name="su' + num + '" /></td>';
			tag += '<td><input type="button"  class="btn" value="조회" id="prodSearch' + num + '"/></td>';
			tag += '<td><input type="text"   name="p_name' + num + '" readonly/></td>';
			tag += '<td><input type="text"   name="p_sprice' + num + '" readonly/></td>';
			tag += '<td><input type="number"   name="kum' + num + '" readonly/></td>';
			tag += '</tr>'

			$('#table_body').append(tag);
			
			
			let totKum = parseInt( $('#totalPrice').val() ); // 합계금액 초기화
			// (+) 안의 조회를 눌렀을때
				var seq    = 'input[name=p_seq' + num + ']';
				var name   = 'input[name=p_name' + num + ']';
				var sprice = 'input[name=p_sprice' + num + ']';
				var kum    = 'input[name=kum' + num + ']';
				var su     = 'input[name=su' + num + ']';

				$('#table_body').on('click', '#prodSearch' + num, function() {
				
// 				alert('ㅋㅋㅋ');
// 				alert(seq)
// 				alert($(seq).val())
			$.ajax({
				url : "/JWork/ProdSearch",
				data : {
					p_seq : $(seq).val()	// p_seq 를 컨트롤러 보내서 필요값 가져옴
				},
				type : "POST",

				success : function(data) {
					
					// 상품명, 판매가, 금액 화면에 찍기
					$(name).val( data.p_name );
					$(sprice).val( data.p_sprice );
					$(kum).val( $(su).val() * $(sprice).val() );
					
					// 합계금액 계산
					let totKum  =  getColumnValues(6);
					$('#totalPrice').val( parseInt(totKum) );
					
					// 결제할금액 계산
					if( $('#milePay').val() == '') {
						$('#finalPrice').val( totKum );
					} else {
						$('#finalPrice').val( totKum - parseInt($('#milePay').val()) );
					}
					// 적립마일리지 계산
					$('#earnMiles').val( Math.round( parseInt($('#finalPrice').val()) * 0.01 ) );
					
					// rowCount 반영
					let rowCount = getTableRowCount("myTable")
					realRowCount = parseInt(rowCount) - 4; // 제목과 하단의 4줄빼야함
					$('#rowCount').val( realRowCount ); 
					
				},
				error : function(xhr) {
					console.log(xhr);
					alert('에러:' + xhr.status + '' + xhr.textStatus)
				}
			});

			})
			
			// (+) 안의 (-)를 눌렀을때
			$('#table_body').on('click', '#btnDelItem' + num, function() {
//	 			e.preventDefault();		// 페이지 이동 막음
//	 			e.stopPropagation();
				
				alert('btnDelItem click');
// 				console.log($(this).parent().parent());
				
				let btnDelItem = this;		// 아래 function에서 .remove() 하려면 이거 해줘야됨. 익명클래스 안에서는 this를 모름
				$.ajax({
					method : 'GET'
				})
				.done(function( result ) {
					
					// 상품명, 판매가, 금액 화면에 찍기
					$(name).val('');
					$(sprice).val( 0 );
					$(kum).val( 0 );
					
					// 합계금액 계산
					let totKum  =  getColumnValues(6);
					$('#totalPrice').val( parseInt(totKum) );
					
					// 결제할금액 계산
					if( $('#milePay').val() == '') {
						$('#finalPrice').val( totKum );
					} else {
						$('#finalPrice').val( totKum - parseInt($('#milePay').val()) );
					}
					// 적립마일리지 계산
					$('#earnMiles').val( Math.round( parseInt($('#finalPrice').val()) * 0.01 ) );
					
					$(btnDelItem).parent().parent().remove();	// 화면에서 항목 삭제
					
					// rowCount 반영
					
					
					
				})
				.fail(function( error ) {
					console.log(error);
					alert('오류발생 : ' + error);
				})
				
			})
			
			num++;
		}
		

		// 상품코드 입력후 조회 prodSearch 눌렀을때
		let prodSearchEl = document.getElementById('prodSearch')
		prodSearchEl.onclick = function(e) {
			
			$.ajax({
				url : "/JWork/ProdSearch",
				data : {
					p_seq : $('#p_seq1').val()
				},
				type : "POST",

				success : function(data) {
					
					let totKum = $('#su1').val() * data.p_sprice; // 합계금액 초기화

					$('#p_name1').val(data.p_name);
					$('#p_sprice1').val(data.p_sprice);
					$('#kum1').val(data.p_sprice * $('#su1').val());
					// 합계금액 계산
// 					totKum = totKum + parseInt( $('#su').val() * data.p_sprice );
					$('#totalPrice').val( totKum );
					// 결제할금액 계산
					if( $('#milePay').val() == '') {
						$('#finalPrice').val( totKum );
					} else {
						$('#finalPrice').val( totKum - parseInt($('#milePay').val()) );
					}
					// 적립마일리지 계산
					$('#earnMiles').val( Math.round( parseInt($('#finalPrice').val()) * 0.01 ) );	// 1퍼센트 적립
					
				},
				error : function(xhr) {
					console.log(xhr);
					alert('에러:' + xhr.status + '' + xhr.textStatus)
				}
			});
		}
		 let form = document.querySelector('form');
		  form.addEventListener('submit', function(e) {
		    e.preventDefault();
		    let url = this.action;
		    let features = 'height=580, width=860, top=200, left=300';
		    window.open(url, 'popupWindow', features);
		    form.submit(); // 폼 데이터 전송
		  });
		  $(document).ready(function() {
			  $("#qrget").click(function() {
			    $("#qrcode").css("z-index", "1");
			  });
			}); 
		  
	}
</script>
<style>
table {
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

#myTable {width: 90%; border: 3px solid #666666; max-height:450px;
 position: absolute; left:3%;  margin-top: 180px; box-shadow: 3px 3px 3px 3px gray; max-height: 450px;} */
#table {overflow: auto; width: 100%; height: 390px;}
span {font-size: 40px; position: absolute; top: 21%; left:8% }
#table_foot { border: 3px solid #666666; position: absolute; left: 323px; width: 728px;
 box-shadow: 2px 2px 2px 2px gray; padding: 10px; margin-top: -210px;}


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
#table_body {width: 90%;}

</style>
</head>
<body>
	<div id="gd">
		<div id="main">
			<div>
				<span>POS 판매등록</span>
				
				<!-- 오늘 날짜 현재시간 -->
				<div id="today" style=" position: absolute; left: 70px; top:268px;"></div>
				
				<!-- 고객명 -->
				<div id="customer"></div>
				
				<!-- 입력받은 정보를 서버로 전송한다 -->
				<form action="/Pay" method="POST" target="popupWindow" >
					<input type="hidden" name="rowCount" id="rowCount" value="1" />
					<input type="hidden" name="e_id" id="e_id" value="${ sessionScope.login.e_id }"/>
					<input type="hidden" name="c_phone" id="c_phone" />
					<table id="myTable">
						<tfoot id="table_foot">
						<tr id="right">
							<td colspan="7">
							합계금액 : <input type="text" id="totalPrice" readonly style="height: 30px; mar"/>
							</td>
						</tr>
						<tr id="right">
							<td colspan="3">
							<input type="button" style ="width:120px" value="마일리지 조회" id="mileage" class="btn"/>
							</td>
							<td colspan="2">
							고객명 : &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="c_name" id="c_name" readonly/>
							</td>
							<td colspan="2">
							사용마일리지 : <input type="text" name="milePay" id="milePay" value="0" readonly/>
							</td>
						</tr>
						<tr id="right">
							<td colspan="3">
							<input type="submit" value="결제" id="pay" class="btn" /><input type="button" value="QR결제" id="qrget"  class="btn" style="width: 70px; margin: 0 0 0 5px;
							  position: relative;  z-index: 1;"/>
							</td>
							<td colspan="2">
							결제할금액 : <input type="text" id="finalPrice" name="finalPrice" readonly/>
							</td>
							<td colspan="2">
							적립마일리지 : <input type="text" id="earnMiles" name="earnMiles" readonly/>
							</td>
						</tr>
						</tfoot>
						<thead>
						<tr>
							<td><button id="btnAddItem" class="btnAddItem" type="button" >➕</button></td>
							<th>상품코드</th>
							<th colspan="2">수량</th>
							<th>상품명</th>
							<th>판매가격</th>
							<th>금액</th>
						</tr>
						</thead>
						<tbody id="table_body">
						<tr>
							<td><button id="btnDelItem" type="button" >➖</button></td>
							<td><input type="text"   name="p_seq1" id="p_seq1" placeholder="상품코드입력"/></td>
							<td><input type="number" name="su1" id="su1" value="1"/></td>
							<td><input type="button" value="조회" id="prodSearch" class="btn" /></td>
							<td><input type="text"   name="p_name1" id="p_name1" readonly/></td>
							<td><input type="text"   name="p_sprice1" id="p_sprice1" readonly/></td>
							<td><input type="number"   name="kum1" id="kum1" readonly/></td>
						</tr>
						</tbody>
						</table>
				</form>
				<div id="qrcode" style="width: 130px; height: 130px; background-color: white; position: absolute; margin-left: 410px; margin-top: 28px; z-index:-1; ;"></div>
			</div>
		</div>

		<%@ include file="/WEB-INF/include/bottom.jsp"%>

	</div>
</body>
</html>