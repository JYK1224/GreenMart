<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Massively by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>그린 마트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
								</header>
							</article>

						<!-- Posts -->
							<section class="posts">
								<article>
									<header>
										<span class="date">April 24, 2017</span>
										<h2><a href="greenmart://application?c_name=${c_name}&c_phone=${c_phone}">QRScan</a></h2>
									</header>
									<a href="greenmart://application?c_name=${c_name}&c_phone=${c_phone}" class="image fit"><img src="/img/qrscan.jpg" alt="" /></a>
									<h5>QR코드를 스캔하여 모바일에서 상품을 결제 합니다.</h5>
									<ul class="actions special">
										<li><a href="greenmart://application?c_name=${c_name}&c_phone=${c_phone}" class="button">QRScan</a></li>
									</ul>
								</article>
								<article>
									<header>
										<span class="date">April 22, 2017</span>
										<h2><a href="#">상품조회</h2>
									</header>
									<a href="#" class="image fit"><img src="/img/query.jpg" alt="" /></a>
									<h5>가게에 있는 상품의 재고를 조회합니다.</h5>
									<ul class="actions special">
										<li><a href="#" class="button">상품조회</a></li>
									</ul>
								</article>
							</section>
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