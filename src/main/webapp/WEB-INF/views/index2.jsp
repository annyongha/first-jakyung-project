<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>

<link rel="stylesheet" href="resources/css/base.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/index2.css">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/index2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/add_like_list.js"></script>


</head>
	<body>
		<div id=wrap>
			<div id=header>
				<%@ include file="/WEB-INF/views/tmp/headerTemplate.jsp"%>
			</div>
			<div id="main" class=dflex>
				<div id="leftNavi">
					<%@ include file="/WEB-INF/views/tmp/navi2.jsp"%>
				</div>
				<div id=submain> 
					<div id=subimg style="float: left; width: 49%;">
					<img alt="title" src="${pageContext.request.contextPath}/resources/images/${goodsData.g_title}" style="width: 350px;">
	
					</div>
					<div id=subinfo style="float: left; width: 49%; height: 49%;">
		<form>
		            <input type="hidden" name="g_idx" value="${goodsData.idx}" />
		            <input type="hidden" name="g_price" value="${goodsData.g_price}" />
		            <input type="hidden" name="g_name" value="${goodsData.g_name}" />
		            <input type="hidden" name="g_title" value="${goodsData.g_title}" />
		            <input type="hidden" name="g_sale" value="${goodsData.sale}" />
		            <input type="hidden" name="g_review" value="${goodsData.review}" />
		    <table>
		        <tr>
		            <td>상품명 :</td>
		            <td id="g_name"><span>${goodsData.g_name}</span></td>
		        </tr>
		        <tr>
		            <td>가격 :</td>
		            <td id="price">${goodsData.g_price}</td>
		        </tr>
		        <tr>
		            <td>수량 :</td>
		            <td>
		                <select id="quantitySelect" onchange="updateTotal()" name="g_quantity">
		                    <option>==수량 선택==</option>
		                    <c:forEach var="i" begin="1" end="50">
		                        <option>${i}</option>
		                    </c:forEach>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td>사이즈 :</td>
		            <td>
		                <select  id="sizeSelect"  class="form-select"  name = "g_size" >
									<option>==사이즈 선택==</option>
									<option value="Large">Large</option>
									<option value="Medium">Medium</option>
									<option value="Small">Small</option>
								</select>
		            </td>
		        </tr>
		        <tr>
		            <td>할인율 :</td>
		            <td><span id="saleSelect">${goodsData.sale} %</span></td>
		        </tr>
		        <tr>
		            <td>평점 :</td>
		            <td><span id="g_review">${goodsData.review}</span></td>
		        </tr>
		        <tr>
		        	<td><input type="button" value="♥" onclick="add_like(${goodsData.idx})"></td>
		        </tr>
		        
		    </table>
		
		    <table id="total">
		        <tr>
		            <td>총 결제 금액</td>
		            <!-- script 영역에서 총 결제 금액을 계산하여 표시 -->
		            <td><input type="text" id="totalAmount" readonly="readonly" name="g_totalprice"></td>
		        </tr>
		    </table>
		
					<table id="paybt">
						<tr>
								<td><a href="javascript:void(0);" onclick="gopay()" 
									style="padding-right: 50px;">결제 </a></td>
								<td><a href="javascript:void(0);" onclick="goback()"
									style="padding-right: 50px;"> 취소 </a></td>
								<td>
		
								</td>
							</tr>
						<tr>
			            <td colspan="2">
			                <input type = "button" value = "장바구니에 담기" onclick = "goCart(this.form)">
			            </td>
			        		</tr>
					</table>
					</form>
					</div>
					
				</div>
			</div>
			<div id=footer>
				<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
			</div>
		</div>
	</body>
</html>