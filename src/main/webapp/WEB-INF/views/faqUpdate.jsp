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
<script src="${pageContext.request.contextPath}/resources/js/faqUpdate.js"></script>
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
				<form>
					<table>
						<tr>
							<th>카테고리</th>
							<td><select name="category">
									<c:forEach var="category" items="${titleData}">
										<c:choose>
											<c:when test="${category.category == data.category}">
												<option value="${category.category}" selected="selected">${category.category}</option>
											</c:when>
											<c:otherwise>
												<option value="${category.category}">${category.category}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th>구분</th>
							<td><input type="text" name="category_title" value="${data.category_title}">
							</td>
						</tr>

						<tr>
							<th>title</th>
							<td><input type="text" name="title" value="${data.title}"
								style="width: 700px;"></td>
						</tr>
						<tr>
							<th>content</th>
							<td><textarea name="content" rows="10" cols="100" style="resize: none;">"${data.content}"</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="수정" onclick="update(this.form)"> 
							<input type="button" value="취소" onclick="location.href='prePage?preURL=${preURL}'"></td>
						</tr>
					</table>
					<input type="hidden" name="idx" value="${data.idx}">
				</form>
			</div>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
		</div>
	</div>
</body>
</html>