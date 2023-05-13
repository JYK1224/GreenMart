<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css"/>
<%@ include file="/WEB-INF/include/subheader.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
h2{text-align: center; margin: 20px; font-size: 30px; }
table {margin-left: auto; margin-right: auto;}
#lay {width: 90%; height: 400px; border: 3px solid #666666; position: absolute; left:5%;  margin-top: -5px; box-shadow: 3px 3px 3px 3px gray;}
table, tr, td {border-collapse: collapse;}
tr,td{border: 1px solid black; }
td{ padding: 10px; margin: 30px; width: 200px;}
#qq { background-color: #f2f2f2;}
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
<script type="text/javascript">
 
</script>
<script>

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	
	function checkOnlyOne(e) {

		const checkboxes 
		      = document.getElementsByName("j_id");
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  e.checked = true;
		}
	

	
	

</script>
</head>
<body>
	<div id="gd">
			<h2> 상품등록 </h2>
			<!-- 입력받은 정보를 서버로 전송한다 -->
			<form name="form" action="/BWork/productAdd" method="POST" >
			<table>
			  <tr>
			  	<td id="qq">상품번호</td>
			  	<td>
	    			<input type="number" name="p_seq" max="9999999999" 
	    			oninput="this.value = this.value.slice(0, 10)" required readonly="readonly">
			  	</td>
			  </tr>
			  <tr>
			  	<td id="qq">바코드번호</td>
			  	<td>
	    			<input type="number" name="p_seq" max="9999999999999" 
	    			oninput="this.value = this.value.slice(0, 13)" required >
			  	</td>
			  </tr>
			  <tr>
			    <td id="qq">상품명</td>
		    	<td>
			   	 	<input type="text" name="p_name"  />
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">입고가</td>
			    <td>
			    	<input type="number" name="p_iprice" max="9999999999"  
			    		oninput="this.value = this.value.slice(0, 10)" />
			    </td>
			  </tr>
			  <tr>
			    <td id="qq">판매가</td>
			    <td>
			    	<input type="number" name="p_sprice" max="9999999999"  
			    		oninput="this.value = this.value.slice(0, 10)" />
			    </td>
			  </tr>
			  <tr>
			    <td id="qq">거래처명</td>
			    <td>
			    	<input type="text" name="d_id" value="" />
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">상품분류</td>
			    <td>
			    	<input type="" name="a_id" value=""/>
		    	</td>
			  </tr>
			  <tr>
			    <td id="qq">부서</td>
			    <td>
			    	<input type="checkbox" name="j_id" 
			    	onclick="checkOnlyOne(this)" value="12010"/>본사
			    	<input type="checkbox" name="j_id" 
			    	onclick="checkOnlyOne(this)" value="12020"/>부전점
		    	</td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	  <input  type="submit" value="등록" class="btn" style="margin: 0 0 0 103px;">
			  	  <input  type="button" value="수정" class="btn">
			  	  <input  type="button" value="수정" class="btn">
			  	  <input  type="button" value="조회" id="btnList" class="btn">
			  	</td>
			  </tr>
			</table>
			</form>
	 <%@ include file="/WEB-INF/include/bottom.jsp" %>
	</div>
</body>
</html>