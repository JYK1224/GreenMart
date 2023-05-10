<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="css/common.css" />

<%@ include file="/WEB-INF/include/subheader.jsp"%>
<style>
table {
	border: 1px solid black;
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	// 연락처 조회버튼 클릭시
	function data_display(data) {
		
		let c_name = $('input[name=c_name]');
		let c_id   = $('input[name=c_id]');
		let c_mile = $('input[name=c_mile]');
		
		c_name.val(data.c_name);
		c_id.val(data.c_id);
		c_mile.val(data.c_mile);
		
	}
	// 함수 끝
	//======================================================
	// body 켜지고 난 다음
	window.onload = function () {
		
		// 연락처 조회 버튼 클릭시
		custSearchEl = document.getElementById('custSearch');
		custSearchEl.onclick = function(e) {
			
			let c_phone = $('input[name=c_phone]')
			
			$.ajax({
				url : "/JWork/CustSearch",
				data : {
					c_phone : c_phone.val()	// p_seq 를 컨트롤러 보내서 필요값 가져옴
				},
				type : "POST",

				success : function(data) {
// 					alert(data);
					data_display(data);
				},
				error : function(xhr) {
					console.log(xhr);
					alert('에러:' + xhr.status + '' + xhr.textStatus)
				}
			});
		}
		
		// submit(마일리지 적용) 버튼 클릭시
		let btnApplyEl = document.querySelector('[type=submit]');
		
		
		btnApplyEl.onclick = function(e) {
			
		const c_nameEl = window.document.getElementsByName('c_name')[0];	// 고객명 보내자 
		const milePayEl = window.document.getElementsByName('milePay')[0];	// 고객전화번호 보내자 
		const c_phoneEl = window.document.getElementsByName('c_phone')[0];	// 마일리지사용액 보내자  
		const parentC_nameEl = window.opener.document.getElementById('c_name'); // 부모창의 고객명 정하자
		const parentMilePayEl = window.opener.document.getElementById('milePay'); // 부모창의 마일리지사용액 정하자
		const parentTotalPrice = window.opener.document.getElementById('totalPrice'); // 총금액 불러와서
		const parentFinalPrice = window.opener.document.getElementById('finalPrice'); // 결제할 금액도 바꿔줘야지
		const parentEarnMiles = window.opener.document.getElementById('earnMiles'); // 적립 금액도 바꿔주고
		const parentC_phoneEl = window.opener.document.getElementById('c_phone'); // 고객전화번호도 넘겨주자
			
			parentC_nameEl.value = c_nameEl.value;	// 고객명 값을 넘겨주자
			parentMilePayEl.value = milePayEl.value;	// 마일리지사용액 값을 넘겨주자
			parentFinalPrice.value = parentTotalPrice.value - milePayEl.value;	// 결제할 금액 = 총금액 - 마일리지사용
			parentEarnMiles.value = Math.round( parentFinalPrice.value * 0.01 ) // 적립 = 결제할금액 * 1퍼센트
			parentC_phoneEl.value = c_phoneEl.value;
			
			alert('등록 성공');
			
			window.close();	// 창 닫자
		}
		
	}
</script>
</head>
<body>
	<div id="gd">
		<div id="main">
			<div>
				<h2>고객 마일리지 조회</h2>
				<!-- 입력받은 정보를 서버로 전송한다 -->
				<form action="/MilageApply" method="POST">
					<table>
						<tr>
							<td>연락처</td>
							<td><input type="text" name="c_phone" /></td>
							<td><input type="button" id="custSearch" value="조회" /></td>
						</tr>
						<tr>
							<td>고객명</td>
							<td colspan="2"><input type="text" name="c_name" readonly/></td>
						</tr>
						<tr>
							<td>고객번호</td>
							<td colspan="2"><input type="text" name="c_id" readonly/></td>
						</tr>
						<tr>
							<td>보유 마일리지</td>
							<td colspan="2"><input type="text" name="c_mile" readonly/></td>
						</tr>
						<tr>
							<td>마일리지 사용:</td>
							<td colspan="2"><input type="text" name="milePay" placeholder="사용 마일리지 입력"/></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" value="마일리지 적용" /></td>
						</tr>

					</table>
				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/include/bottom.jsp"%>

	</div>
</body>
</html>