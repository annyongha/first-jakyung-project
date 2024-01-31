<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy Sweet Home Shopping</title>
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/cart.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/base.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/index.css"
	rel="stylesheet" type="text/css">
</head>
<style>
  #saleSelectContainer {
    display: none;
  }
</style>
<body>
<%@ include file="/WEB-INF/views/loginCheck.jsp"%>
	<div id="wrap">
		<div id="header">
			<%@ include file="/WEB-INF/views/tmp/headerTemplate.jsp"%>
		</div>
		<div id="main" class="dflex">
			<div id="leftNavi">
				<%@ include file="/WEB-INF/views/tmp/navi2.jsp"%>
			</div>
			<div id="mainContent">

				<div id="cart">
					<h2>CART</h2>
					<div class="tbl1">
						<table>
							<caption>::: 장바구니 목록 :::</caption>
							<tr class="payment_btn">
								<td colspan="5"><input type="button" value="결제" onclick = "gopay()"></td>
							</tr>
							<tr>
								<th>구매<input type="checkbox" name="selectAll" checked>
								</th>
								<th>상품이미지(상품명)</th>
								<th>상품 가격</th>
								<th>총 결제금액</th>
								<th class="change">변경 사항</th>
							</tr>
							<c:forEach items="${cartList}" var="data">
							<tr align="center">
								<td><input type="checkbox" name="check1" checked></td>
								<td><a href="goodPage?idx=${data.goodsData.idx}"><img src="${pageContext.request.contextPath}/resources/images/${data.goodsData.g_title}"
									style="width: 100x; height: 100px;" /></a></td>
								<td id="price">${data.g_price}</td>
								<td><input type="text" id="totalAmount" readonly="readonly" name="g_totalprice"></td>
								<td>
									<form action="" class="form">
										 <select  id="sizeSelect"  class="form-select"  name = "g_size" >
									<option>==사이즈 선택==</option>
									<option value="Large">Large</option>
									<option value="Medium">Medium</option>
									<option value="Small">Small</option>
										</select>
									<select id="quantitySelect" onchange="updateTotal()" name="g_quantity">
					                    <option>==수량 선택==</option>
					                    <c:forEach var="i" begin="1" end="50">
					                        <option>${i}</option>
					                    </c:forEach>
					                </select>
									</form> <input type="button" value="삭제" onclick="deleteData(${data.idx})">
								</td>
								
								
							</tr>
								</c:forEach>
						</table>
					</div>
				</div>

			</div>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
		</div>
		<div id="saleSelectContainer">
		
  		할인율 :
  		<span id="saleSelect">${100 - data.sale * 100} %</span>
		</div>
	</div>
</body>
</html>