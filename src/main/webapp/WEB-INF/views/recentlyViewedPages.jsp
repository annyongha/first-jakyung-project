<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy Sweet Home Shopping</title>
<link href="${pageContext.request.contextPath}/resources/css/base.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/index.css"
	rel="stylesheet" type="text/css">
</head>
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

				<table style="border-collapse: collapse;">
				<caption style="margin-bottom: 10px;">최근 본 상품</caption>
					<tr>
						<th>번호</th>
						<th>상품</th>
						<th>상품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${list!=null}">
							<c:forEach items="${list}" var="data">
								<tr>
									<td>${data.rank}</td>
									<td>
									<a href="goodPage?idx=${data.goods_idx}">
									<img alt="data" src="${pageContext.request.contextPath}/resources/images/${data.goods_title_name}">
									</a>
									</td>
									<td style="width: 400px;">물음표</td>
									<td style="width: 200px;">${data.goods_price}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3">최근 본 항목이 존재 하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>

			</div>


		</div>
	</div>
	<div id="footer">
		<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
	</div>

</body>
</html>