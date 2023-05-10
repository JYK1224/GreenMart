<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="css/common.css" />

<%@ include file="/WEB-INF/include/subheader.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<style>
table {
	border: 1px solid black;
	text-align: center;
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
		
		alert('finalPrice ' + finalPrice);
		alert('recieved ' + recieved);
		
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
		    	alert(rsp.merchant_uid);
		    	alert('결제 완료');
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
				
					<table>
						<tr>
							<td colspan="3">받을금액:<input type="text" name="receive" id="finalPrice" value="${finalPrice}" /></td>
						</tr>
						<tr>
							<td>현금:</td>
							<td><input type="text" name="cash" id="cash" value="0"/></td>
							<td><input type="button" value="입력" id="cashPay"/></td>
						</tr>
						<tr>
							<td>카드:</td>
							<td><input type="text" name="card" id="card" value="0"/></td>
							<td><input type="button" value="카드결제" id="cardPay"/></td>
						</tr>
						<tr>
							<td>받은금액:</td>
							<td colspan="2"><input type="text" name="received" id="recieved" value="0" /></td>
						</tr>
						<tr>
							<td>거스름돈:</td>
							<td colspan="2"><input type="text" name="change" id="change" value="0" /></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" value="계산완료"/></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/include/bottom.jsp"%>

	</div>
</body>
</html>