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
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/del_like.js"></script>
<style type="text/css">
	td{
		border: none;	
	}
	#title{
		border-bottom: 1px solid black;
	}
	#mainContent table tr:first-child th:first-child {
		width: 80px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<%@ include file="/WEB-INF/views/tmp/headerTemplate.jsp"%>
		</div>
		<div id="main" class="dflex">
			<div id="MyPageNavi">
				<%@ include file="/WEB-INF/views/tmp/MyPageNavi.jsp"%>
			</div>
			<div id="mainContent">
				<table align="left" style=" border-collapse: collapse; margin: 10px auto; display: block;">
					<tr id="title">
						<th style="border-right: 1px solid black;">
							<input type="checkbox">
						</th>
						<th colspan="2">상품이미지</th>
						<th>상품명</th>
						<th>비고</th>
					</tr>
					
					<c:forEach items="${dataList}" var="list">
						<tr>
							<td style="border-right: 1px solid black;">
								<input type="checkbox">
							</td>
							<td colspan="2" style="display: table-cell; vertical-align: middle;">
								<a href="goodPage?idx=${list.g_idx}"><img alt="사진" src="resources/images/${list.l_image}"></a>
							</td>
							<td style="border-left: none; width: 150px;">${list.l_name}</td>
							<td>
								<input type="button" value="삭제" onclick="del_like(${list.idx})">
							</td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
		</div>
	</div>
</body>
</html>
