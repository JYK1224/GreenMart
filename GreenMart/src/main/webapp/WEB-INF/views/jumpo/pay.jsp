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
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>

// 결제버튼 눌렀을때 액션해야함
// <form action="/Pay" method="POST">
	$.ajax({
	url: "/JWork/Pay",
	data : { pay_p_seq    : pay_p_seq,
		     pay_su       : pay_su,
		     pay_p_name   : pay_p_name,
		     pay_p_sprice : pay_p_sprice,
		     pay_kum      : pay_kum
		     },
	type: "POST", 
		
	success : function(data){
		if(data == 1){
		
		// 결제창으로 이동
		alert("결제화면으로 이동합니다.");
	
		}
		},
	error :function(xhr){
		console.log(xhr);
		alert('에러:' + xhr.status + '' + xhr.textStatus )
		}

}); 

</script>


</head>
<body>
	<div id="gd">
		<div id="main">
			<div>
				<h2>결제수단 지정</h2>
				<!-- 입력받은 정보를 서버로 전송한다 -->
				<form action="/Pay" method="POST">
					<input type="hidden" name="idx"     value="${ map.idx }" />
					<input type="hidden" name="idx"     value="${ map.idx }" />
					<input type="hidden" name="idx"     value="${ map.idx }" />
					<input type="hidden" name="idx"     value="${ map.idx }" />
				
					<table>
						<tr>
							<td colspan="3">받을금액:<input type="text" name="receive" /></td>
						</tr>
						<tr>
							<td>현금:</td>
							<td><input type="text" name="cash" /></td>
							<td><input type="button" value="입력"/></td>
						</tr>
						<tr>
							<td>카드:</td>
							<td><input type="text" name="card" /></td>
							<td><input type="button" value="입력"/></td>
						</tr>
						<tr>
							<td>받은금액:</td>
							<td colspan="2"><input type="text" name="received" /></td>
						</tr>
						<tr>
							<td>거스름돈:</td>
							<td colspan="2"><input type="text" name="change" /></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" value="계산완료"/></td>
						</tr>
						<tr>
							<td colspan="3"><input type="button" id="naverPayBtn" value="네이버페이 결제"/></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/include/bottom.jsp"%>

	</div>
</body>
</html>