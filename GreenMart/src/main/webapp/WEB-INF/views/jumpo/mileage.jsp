<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css" />

<%@ include file="/WEB-INF/include/subheader.jsp"%>
<style>
h2{text-align: center; margin: 20px; font-size: 30px; }
table {
	border: 3px solid #666666;
	box-shadow: 3px 3px 3px 3px gray;
	text-align: center;
	padding: 30px;
	height: 300px;
	width: 90%;
	position: absolute;
	left: 5%;
}
td{border: 1px solid black; }

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
		const milePayEl = window.document.getElementsByName('milePay')[0];	// 마일리지사용액 보내자 
		const c_phoneEl = window.document.getElementsByName('c_phone')[0];	// 고객전화번호 보내자  
		const parentC_nameEl = window.opener.document.getElementById('c_name'); // 부모창의 고객명 정하자
		const parentMilePayEl = window.opener.document.getElementById('milePay'); // 부모창의 마일리지사용액 정하자
		const parentTotalPrice = window.opener.document.getElementById('totalPrice'); // 총금액 불러와서
		const parentFinalPrice = window.opener.document.getElementById('finalPrice'); // 결제할 금액도 바꿔줘야지
		const parentEarnMiles = window.opener.document.getElementById('earnMiles'); // 적립 금액도 바꿔주고
		const parentC_phoneEl = window.opener.document.getElementById('c_phone'); // 고객전화번호도 넘겨주자
		
		const c_mileEl = window.document.getElementsByName('c_mile')[0];	// 마일리지보유액 가져와서  
		if( parseInt( milePayEl.value ) <= parseInt( c_mileEl.value ) ) {	// 마일리지 사용액이 보유액보다 크지 않다면
				parentC_nameEl.value = c_nameEl.value;	// 고객명 값을 넘겨주자
				parentMilePayEl.value = milePayEl.value;	// 마일리지사용액 값을 넘겨주자
				parentC_phoneEl.value = c_phoneEl.value;	// 고객연락처 값을 넘겨주자
				parentFinalPrice.value = parentTotalPrice.value - milePayEl.value;	// 결제할 금액 = 총금액 - 마일리지사용
				parentEarnMiles.value = Math.round( parentFinalPrice.value * 0.01 ) // 적립 = 결제할금액 * 1퍼센트
				
				alert('등록 성공');
				
				window.close();	// 창 닫자
			} else { // 마일리지 사용액이 보유액보다 크다면
				alert('마일리지사용액이 보유마일리지보다 큽니다.');
				event.preventDefault();
			}
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
							<td><input type="button" id="custSearch" value="조회" class="btn"/></td>
						</tr>
						<tr>
							<td>고객명</td>
							<td colspan="3"><input type="text" name="c_name" readonly style="margin-left: -65px;"/></td>
						</tr>
						<tr>
							<td>고객번호</td>
							<td colspan="3"><input type="text" name="c_id" readonly style="margin-left: -65px;"/></td>
						</tr>
						<tr>
							<td>보유 마일리지</td>
							<td colspan="3"><input type="text" name="c_mile" readonly style="margin-left: -65px;"/></td>
						</tr>
						<tr>
							<td>마일리지 사용:</td>
							<td colspan="3"><input type="text" name="milePay" value="0" style="margin-left: -65px;"/></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" value="마일리지 적용" class="btn" style="width: 100px;"/></td>
						</tr>

					</table>
				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/include/bottom.jsp"%>

	</div>
</body>
</html>