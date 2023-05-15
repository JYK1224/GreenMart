<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린마트</title>
<link rel="stylesheet" href="/css/common.css" />
<%@ include file="/WEB-INF/include/subheader.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
	
	// 수정
	function upDept2() {
		let pidEl = document.getElementById("pid");
		let pnameEl = document.getElementById("pname");
		let ipriceEl = document.getElementById("iprice");
		let spriceEl = document.getElementById("sprice");
		let checkAstEl = document.getElementById("checkAst");
		let aidEl = checkAstEl.value;
		let checkDeptEl = document.getElementById("checkDept");
		let didEl = checkDeptEl.value;
	    if (confirm('수정하시겠습니까?')) {
	        $.ajax({
	            url: "/BWork/productUpdate",
	            type: "POST",
	            data: { p_id: pidEl.value , 
	            		p_name: pnameEl.value ,
	            		p_iprice: ipriceEl.value  ,
	            		p_sprice: spriceEl.value ,
	            		d_id : didEl,
	            		a_id : aidEl
	            		}, 
	            success: function(response) { 
	               		console.log(response);
	                	alert('수정되었습니다.');
	               		location.href = "/Inquery1";
	            },
	             error: function(xhr, status, error) {
	                	console.error(error);
	                	alert('수정에 실패했습니다.');
	            }
	        });
	    }
	}
	//삭제 
	function delDept(){
		 if(confirm('삭제하시겠습니까?')) {
			 
		 $.ajax({
		        url: "/BWork/productDelete",
		        type: "POST",
		        data: { p_id:'${vo.p_id}' },
		        success: function(response) {
		        	console.log(response);
		            alert('삭제되었습니다.');
					location.href="/Inquery1";
		
		        },
		        error: function(xhr, status, error) {
					console.error(error);
		        	alert('삭제에 실패했습니다.');
		        }
		    });
		 }
	}
	
	window.onload = function() { 
	    let upBtnEl2 = document.getElementById('submitBtn');
	    upBtnEl2.addEventListener("click", function(e) {
	        console.log(upBtnEl2);
	        upDept2();
	    });

	    let delBtnEl = document.getElementById('delBtn');
	    delBtnEl.addEventListener("click", function(e) {
	        delDept();	
	    });

	    let backBtnEl = document.getElementById('backBtn');
	    backBtnEl.addEventListener("click", function(e) {
	        e.preventDefault(); 
	        window.close(this);
	        let html = '/Inquery1';
	        let name = 'Inquery1';
	        let features = 'height=750, width=1050, top=200, left=300'; 
	        
	        window.open(html, name, features);
	    });
	};
	

</script>
</head>
<body>
	<div id="gd">
				<h2>상품 상세보기</h2>
				<table id="lay">
					<tr>
						<td class="center">&nbsp;&nbsp;&nbsp;상품코드 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="pid" maxlength="13"
							 class="center" value="${vo.p_id }" />
						</td>
					</tr>
					<tr>
						<td class="center">&nbsp;&nbsp;&nbsp;상품명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="pname"
							class="center" value="${vo.p_name }" />
						</td>
					</tr>
					<tr>
						<td class="center">&nbsp;&nbsp;&nbsp;입고가격  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="iprice" maxlength="10"
						 class="center" value="${vo.p_iprice }" />
						</td>
					</tr>
					<tr>
						<td class="center">&nbsp;&nbsp;&nbsp;판매가격  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="sprice" maxlength="10"
						class="center" value="${vo.p_sprice }" />
						</td>
					</tr>
					<tr>
						<td class="center">&nbsp;&nbsp;&nbsp;거래처명  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="checkDept" name="d_id" >
			    		<option value="${vo.d_id }" selected >${vo.d_id}</option>
			    		<c:forEach var="dept"  items="${checkDeptlist }">
			    			<option value="${dept.d_id }">${dept.d_name }</option>
			    		</c:forEach>
			    		</select>
						</td>
					</tr>
					<tr>
						<td class="center">&nbsp;&nbsp;&nbsp;상품분류  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="a_id" id="checkAst" >
			    		<option value="${vo.a_id }" selected >${vo.a_id }</option>
						<c:forEach var="ast"  items="${checkAstlist }">
			    			<option value="${ast.a_id }">${ast.a_name }</option>
			    		</c:forEach>
			    		</select>	
						</td>
					</tr>
					<tr>
						<td class="center">&nbsp;&nbsp;&nbsp;점포명  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="jid" class="center"
						readonly value="${vo.j_id }" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="submit" class="btn" id="submitBtn" value="수정" style="margin: 0 0 0 100px"> 
						<input type="button" class="btn" id="delBtn" value="삭제" /> 
						<input type="button" class="btn" id="backBtn" value="뒤로" /> 
						</td>
					</tr>

				</table>
		<%@ include file="/WEB-INF/include/bottom.jsp"%>
	</div>
</body>
</html>