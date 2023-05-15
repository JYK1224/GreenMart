<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css" />

<%@ include file="/WEB-INF/include/subheader.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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

#my {width: 50%; border: 3px solid #666666; max-height:450px;
 position: absolute; left:21%;  margin-top: 100px; box-shadow: 3px 3px 3px 3px gray; max-height: 450px;} */
#table {overflow: auto; width: 100%; height: 390px;}
h2 {font-size: 40px; position: absolute; top: 21%; left:35% }


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
window.onload = function() {
	
	// 현금 입력을 눌렀을때
	let cashPayEl = document.getElementById("cashPay");
	cashPayEl.onclick = function () {
		// 받은 금액계산
		let cash    = parseInt( $('#cash').val() );
		let cardPay = parseInt( $('#card').val() );
		$('#recieved').val( cash + cardPay );
		
		// 거스름돈 계산
		let recieved = parseInt( $('#recieved').val() );
		let finalPrice = parseInt( $('#finalPrice').val() );
		
		$('#change').val( recieved - finalPrice );
		
	}
	
	
	// 카드결제 를 눌렀을때
	let cardpayEl = document.getElementById("cardPay");
	cardpayEl.onclick = function () {
		
		let cash    = parseInt( $('#cash').val() );
		
		let s_id = ${s_id};
		
		IMP.init("imp17803643");
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid: s_id, // 상점에서 관리하는 주문 번호
		    name : '주문명:결제테스트',
		    amount : "${finalPrice}"-cash,
		    buyer_email: 'customer@naver.com',
		    buyer_name : "${map.c_name}",
		    buyer_tel : "${map.c_phone}",
		}, function(rsp) {
		    if ( rsp.success ) {
		    	$('#card').val(rsp.paid_amount);
// 		    	alert(rsp.merchant_uid);
		    	alert('카드결제 완료');
		    	let cashPayEl = document.getElementById("cashPay");
		    	cashPayEl.click();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		        alert(msg);
		    }
		});
	}
	
	
}

</script>


</head>
<body>
	<div id="gd">
		<div id="main">
			<div>
				<h2>결제수단 지정</h2>
				<!-- 입력받은 정보를 서버로 전송한다 -->
				<form action="/JWork/PayWork" method="POST">
					<input type="hidden" name="c_phone"     value="${ map.c_phone }" />
					<input type="hidden" name="c_name"     value="${ map.c_name }" />
					<input type="hidden" name="itemList"     value="${ itemList }" />
					<input type="hidden" name="suList"     value="${ suList }" />
					<input type="hidden" name="milePay"     value="${ map.milePay }" />
					<input type="hidden" name="earnMiles"     value="${ map.earnMiles }" />
					<input type="hidden" name="e_id"     value="${ map.e_id }" />
				
					<table id="my">
						<tr>
						<td>받을금액:</td>
							<td colspan="2" ><input type="text" name="receive" id="finalPrice" value="${finalPrice}" readonly style="float: left;"/></td>
						</tr>
						<tr>
							<td>현금:</td>
							<td><input type="text" name="cash" id="cash" value="0" placeholder = "현금 수령액" style="float: left;"/></td>
							<td><input type="button" value="입력" id="cashPay" class="btn" style="width: 80px;"/></td>
						</tr>
						<tr>
							<td>카드:</td>
							<td><input type="text" name="card" id="card" value="0" readonly style="float: left;"/></td>
							<td><input type="button" value="카드결제" id="cardPay" class="btn"  style="width: 80px;"/></td>
						</tr>
						<tr>
							<td>받은금액:</td>
							<td colspan="2"><input type="text" name="received" id="recieved" value="0" readonly style="float: left;" /></td>
						</tr>
						<tr>
							<td>거스름돈:</td>
							<td colspan="2"><input type="text" name="change" id="change" value="0" readonly style="float: left;" /></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" value="계산완료" class="btn"  style="width: 80px;"/></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/include/bottom.jsp"%>

	</div>
</body>
</html>