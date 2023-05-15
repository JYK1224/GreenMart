<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>그린마트</title>
<link rel="stylesheet" href="/mhome/assets/css/main.css" />
<noscript><link rel="stylesheet" href="/mhome/assets/css/noscript.css" /></noscript>

</head>
<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper" class="fade-in">

				<!-- Intro -->
					<div id="intro">
						<h1>GreenMart<br />
						Payment</h1>
						<p>환영합니다. ${vo.c_name}님</p>
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

						<!-- Featured Post -->
							<article class="post featured">
								<header class="major">
									<span class="date">April 25, 2017</span>
									<h5> ${vo.c_name}님 이용해 주셔서 감사합니다.
									고객님의 마일리는 현재 ${vo.c_mile}입니다. </h5>
								</header>
								<a href="#" class="image main"><img src="images/pic01.jpg" alt="" /></a>
								<ul class="actions special">
									<li><a href="/M/Login_check?Name=${vo.c_name }&Phone=${vo.c_phone}" class="button large">홈으로</a></li>
								</ul>
							</article>


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