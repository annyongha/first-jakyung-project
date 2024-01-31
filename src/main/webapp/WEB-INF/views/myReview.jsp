<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/base.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/index.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/del_reviewJS.js"></script>
</head>
<body>
<%-- <%@ include file="/WEB-INF/views/loginCheck.jsp"%> --%> <!-- 로그인 lock기능 -->
	<div id="wrap">
		<div id="header">
			<%@ include file="/WEB-INF/views/tmp/headerTemplate.jsp"%>
		</div>
		<div id="main" class="dflex">
			<div id="MyPageNavi">
				<%@ include file="/WEB-INF/views/tmp/MyPageNavi.jsp"%>
			</div>
			<div id="mainContent">
				<table border="1">
					<caption>:::내가 쓴 리뷰:::</caption>
					<tr>
						<th>상품명</th>
						<th>상품이미지</th>
						<th>별점</th>
						<th>비고</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<input type="button" value="리뷰 삭제" onclick="del_review()">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
		</div>
	</div>
</body>
</html>