<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Happy Sweet Home Shopping</title>
	</head>
	<body>
	
		<div id="header">
			<c:choose>
				<c:when test="${id != null }">
					<input type="button" value="로그아웃" onclick="location.href='logout.do'">
					<input type="button" value="정보수정">
				</c:when>
				<c:otherwise>
					<input type="button" value="로그인" onclick="location.href='login_form.do'">
					<input type="button" value="회원가입" onclick="location.href='agree.do'">
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>