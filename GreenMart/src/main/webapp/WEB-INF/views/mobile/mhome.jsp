<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>GreenMart Pay</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!--===============================================================================================-->	
    <link rel="icon" type="image/png" href="/mobile/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/mobile/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/mobile/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/mobile/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/mobile/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/mobile/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/mobile/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/mobile/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/mobile/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/mobile/css/util.css">
	<link rel="stylesheet" type="text/css" href="/mobile/css/main.css">
<!--===============================================================================================-->
<script>
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

</script>		
	</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post" action="/M/Login_check">
					<span class="login100-form-title p-b-26">
						Welcome<br>GreenMart<br>
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="Name">
						<span class="focus-input100" data-placeholder="Name"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="text" name="Phone"  maxlength="13" oninput="oninputPhone(this)" >	
					<c:choose>					
					<c:when test="${message eq 'error'}">
							<span class="focus-input100" data-placeholder="이름 혹은 전화번호가 일치하지 않습니다."></span>
					</c:when>	
					<c:otherwise>
							<span class="focus-input100" data-placeholder="Phone"></span>
					</c:otherwise>	
					</c:choose>				
					</div>
					

					
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/mobile/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/mobile/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/mobile/vendor/bootstrap/js/popper.js"></script>
	<script src="/mobile/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/mobile/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/mobile/vendor/daterangepicker/moment.min.js"></script>
	<script src="/mobile/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/mobile/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/mobile/js/main.js"></script>

</body>
</html>