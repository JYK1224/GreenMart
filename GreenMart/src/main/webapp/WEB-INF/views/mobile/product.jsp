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
<script>

function checkbox_display(data) {
	
	let html = '';
	let num  = 1;
	html += '<select id="myCheckBox">';
	html += '<option value= "" selected>==선택==</option>';
	
	data.forEach(function(data, index) { 	
	html += '<option value= "'+ data.j_name +'">'+data.j_name+'</option>';
	num++;
	})
	
	html += '</select>';
	return html;
	
}

//테이블 생성
function data_display(data) {
	
	let html = '';
	if(data.p_name != null){
	html += '<table id="myTable">';
	html += '<tr>';
	html += '<td nowrap>상품명:</td>';
	html += '<td>'+data.p_name+'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<td nowrap>상품코드:</td>';
	html += '<td>'+data.p_id+'</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<td nowrap>판매가:</td>';
	html += '<td>'+data.p_sprice+'원</td>';
	html += '</tr>';
	html += '<tr>';
	html += '<td nowrap>현재재고:</td>';
	html += '<td>'+data.st_num+'개</td>';
	html += '</tr>';
	}else{
	html += '<h5>상품이 존재하지 않습니다. 다시 입력해주세요</h5>';
	}
	
	return html;

	
}

window.onload = function () {
	let searchEl = document.getElementById("search")
	
	$.ajax({
		url: "/M/SearchJumpoSelect",
		type: "POST", 
				
		success : function(data){
			console.log(data);
			//alert(data);
			let tableEl = document.getElementById('checkbox');
			let html = checkbox_display(data);
			$('#checkbox').html(html);

			let selectedOption;

			const selectElement = document.querySelector('#myCheckBox');
			selectElement.addEventListener('change', function(e) {
				selectedOption = e.target.value;
			    console.log(selectedOption)
			    searchEl.onclick = function(e) {
			    let ProductNameEl = document.getElementById("ProductName");
			    console.log(ProductNameEl.value)
				$.ajax({
					url: "/M/SearchProduct",
					data : { search: selectedOption,
						p_name : ProductNameEl.value},
					type: "POST", 
							
					success : function(data){
						console.log(data);
						//alert(data);
						let tableEl = document.getElementById('table');
						let html = data_display(data);
						$('#table').html(html); 
						},
					error :function(xhr){
						console.log(xhr);
						alert('에러:' + xhr.status + '' + xhr.textStatus )
						}
					
				}); 
			}
			});
		
			},
		error :function(xhr){
			console.log(xhr);
			alert('에러:' + xhr.status + '' + xhr.textStatus )
			}
		
	});
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
					
					<!-- Featured Post -->
							<article class="post featured">
								<header class="major">
									<span class="date">April 25, 2017</span>
									<h5> 상품을 조회합니다. 점포와 상품 이름을 입력해주세요 </h5>
								</header>
								
								<div id ="checkbox" ></div>
								<input type="text" placeholder="상품명을 입력해주세요" id="ProductName" style="display:inline-block; width: 70%; margin: 0 6px;" /><input type="button" id="search" value="검색" class="btn"/>
								<div id="table"></div>
								<a href="#" onClick="history.back()" class="button large">홈으로</a>
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