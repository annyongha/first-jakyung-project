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
<style type="text/css">
	td{
		border: none;	
	}
	#title{
		border-bottom: 1px solid black;
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
						<th colspan="2">상품정보</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
					
					<tr>
						<td style="display: table-cell; vertical-align: middle;"><img
							alt="사진" src="resources/images/outer.jpg"></td>
						<td style="border-left: none; width: 150px;">아우터</td>
						<td style="width: 300px;">1</td>
						<td style="width: 300px;">20,000</td>
						<td>
							<input type="button" value="리뷰 작성" onclick="location.href='writeReview'">
						</td> 
					</tr>
					<tr>
						<td style="display: table-cell; vertical-align: middle;"><img
							alt="사진" src="resources/images/outer.jpg"></td>
						<td style="border-left: none; width: 150px;">아우터</td>
						<td style="width: 300px;">1</td>
						<td style="width: 300px;">20,000</td>
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
