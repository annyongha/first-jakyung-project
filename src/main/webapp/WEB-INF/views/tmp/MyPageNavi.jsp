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
				<li><a href="order_list.do">주문목록</a>
				<li><a href="like_list.do">찜리스트</a>
				<li><a href="checkPwd.do">회원정보수정</a>
				<li><a href="myReview.do">My 리뷰</a>
			</ul>
		</div>
	</body>
</html>