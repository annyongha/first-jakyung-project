<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/navi2.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class = "menu">
			<ul class="left">
				<li>
				<a href="typePage?type=popularity">인기</a>
				<img alt="플러스" src="${pageContext.request.contextPath}/resources/images/baseline_add_circle_outline_black_24dp.png"/>
				
				</li>
				
				<li><a href="typePage?type=SHORT">상의</a>
				<img alt="플러스" src="${pageContext.request.contextPath}/resources/images/baseline_add_circle_outline_black_24dp.png"/> </li>
				<li><a href="typePage?type=OUTER">아우터</a>
				<img alt="플러스" src="${pageContext.request.contextPath}/resources/images/baseline_add_circle_outline_black_24dp.png"/> </li>
				<li><a href="typePage?type=PANTS">바지</a>
				<img alt="플러스" src="${pageContext.request.contextPath}/resources/images/baseline_add_circle_outline_black_24dp.png"/> </li>
				<li><a href="typePage?type=SHOES">신발</a>
				<img alt="플러스" src="${pageContext.request.contextPath}/resources/images/baseline_add_circle_outline_black_24dp.png"/> </li>
				<li><a href="typePage?type=ACCESSORY">액세서리</a>
				<img alt="플러스" src="${pageContext.request.contextPath}/resources/images/baseline_add_circle_outline_black_24dp.png"/> </li>
			</ul>
		</div>
	</body>
</html>