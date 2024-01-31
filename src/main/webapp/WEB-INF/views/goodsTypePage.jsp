<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div id="wrap">
  		<div id="header">
			<%@ include file="/WEB-INF/views/tmp/headerTemplate.jsp"%> 
		</div>
		<div id="main" class="dflex">
			<div id="leftNavi">
				<%@ include file="/WEB-INF/views/tmp/navi2.jsp"%>
			</div>
			<div id="mainContent">
				<div class="product">
				<c:forEach var="goodsData" items="${goodsList}" >
								<a href="goodPage?idx=${goodsData.idx}">
								<img alt="상품이미지" src="${pageContext.request.contextPath}/resources/images/${goodsData.g_title}">
										<span>${goodsData.g_name}</span>
										</a>
										</c:forEach>
				</div>
								<div class="paging">
					<c:if test="${nowpage!=1}">
						<c:choose>
							<c:when test="${nowpage>jumpgingPage}">
								<a href="typePage?type=${type}&nowpage=${nowpage-jumpgingPage}">◀</a>
							</c:when>
							<c:otherwise>
								<a href="typePage?type=${type}&nowpage=1">◀</a>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:forEach var="index" begin="${minpage}" end="${maxpage}" step="1">
						<c:choose>
							<c:when test="${index==nowpage}">
								<a href="typePage?type=${type}&nowpage=${index}" class="bolder">${index}</a>
							</c:when>
							<c:otherwise>
								<a href="typePage?type=${type}&nowpage=${index}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${nowpage!=maxpage}">
						<c:choose>
							<c:when test="${nowpage<pagingCount-jumpgingPage}">
								<a href="typePage?type=${type}&nowpage=${nowpage+jumpgingPage}">▶</a>
							</c:when>
							<c:otherwise>
								<a href="typePage?type=${type}&nowpage=${pagingCount}">▶</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
		</div>
	</div>
</body>
</html>