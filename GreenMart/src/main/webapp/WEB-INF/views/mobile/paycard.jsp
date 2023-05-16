<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>그린마트</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="/mhome/assets/css/main.css" />
<noscript><link rel="stylesheet" href="/mhome/assets/css/noscript.css" /></noscript>
<script>
var socket;

function sendMessage() {
	

	socket.send('CloseSalesWindow');
	
	
}
window.onload = function() {
	

	var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/socket";
	
	 socket = new WebSocket(wsUri);
	 
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
	
	cashPayEl.click();

		
}

</script>


</head>
<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper" class="fade-in">

				<!-- Intro -->
					<div id="intro">
						<h1>GreenMart<br />
						Payment</h1>
						<p>환영합니다. ${c_name}님</p>
						<ul class="actions">
							<li><a href="#header" class="button icon solid solo fa-arrow-down scrolly">Continue</a></li>
						</ul>
					</div>

				<!-- Header -->
					<header id="header">
						<a href="index.html" class="logo">GreenMart</a>
					</header>

				<!-- Main -->
					<div id="main">
					<form action="/M/PayMent" method="POST" onclick="sendMessage();">
					<input type="hidden" name="c_phone"     value="${c_phone}" />
					<input type="hidden" name="c_name"     value="${ c_name }" />
					<input type="hidden" name="p_seqList"     value="${ p_seqList }" />
					<input type="hidden" name="suList"     value="${ suList }" />
					<input type="hidden" name="milePay"     value="${ milePay }" />
					<input type="hidden" name="earnMiles"     value="${ earnMiles }" />
					<input type="hidden" name="e_id"     value="0001" />
				
					<table>
						<tr>
							<td nowrap>받을금액:</td>
							<td colspan="4"><input  type="text" name="receive" id="finalPrice" value="${finalPrice }" readonly/></td>
						</tr>
						<tr>
							<td nowrap>현금:</td>
							<td colspan="3"><input  type="text" name="cash" id="cash" value="${cash }" placeholder = "현금 수령액"/></td>
							<td><input type="button" value="입력" id="cashPay"/></td>
						</tr>
						<tr>
							<td nowrap>카드:</td>
							<td colspan="4"><input type="text" name="card" id="card" value="${finalPrice-cash }" readonly/></td>
						</tr>
						<tr>
							<td nowrap>결제완료</td>						
						</tr>
						<tr>
							<td nowrap>받은금액:</td>
							<td colspan="5"><input type="text" name="received" id="recieved" value="0" readonly /></td>
						</tr>
						<tr>
							<td nowrap>거스름돈:</td>
							<td colspan="5"><input type="text" name="change" id="change" value="0" readonly /></td>
						</tr>
						<tr>
							<td colspan="5"><input type="submit" value="계산완료"/></td>
						</tr>
					</table>
				</form>
					</div>

				<!-- Footer -->
					<footer id="footer">
						
					</footer>

				<!-- Copyright -->
					<div id="copyright">
						<ul><li>&copy; 1998-2023 GreenMart Company</li><li>CEO: 박 기태</li></ul>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/mhome/assets/js/jquery.min.js"></script>
			<script src="/mhome/assets/js/jquery.scrollex.min.js"></script>
			<script src="/mhome/assets/js/jquery.scrolly.min.js"></script>
			<script src="/mhome/assets/js/browser.min.js"></script>
			<script src="/mhome/assets/js/breakpoints.min.js"></script>
			<script src="/mhome/assets/js/util.js"></script>
			<script src="/mhome/assets/js/main.js"></script>
	</body>
</html>