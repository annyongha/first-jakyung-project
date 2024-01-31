<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/base.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/FAQ.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/FAQ.js"></script>
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
				<div class="category">
					<table>
						<tr>
							<c:forEach items="${category_list}" var="faq1">
								<th>
									<a href="FAQ?typeIdx=${faq1.idx}">
										${faq1.category}								
									</a>
								</th>
							</c:forEach>
						</tr>
					</table>
				</div>
				<br>
				<div id="faq">
				<c:if test="${id!=null && id.rank==2}">
				<input type="button" value="추가" onclick="location.href='insertFaq'">
				</c:if>
					<table border="1">
						<tr>
							<th>구분</th>
							<th>제목</th>
						</tr>
						<c:choose>
							<c:when test="${list[0]!=null}">
								<c:forEach items="${list}" var="faq">
									<tr>
										<td>${faq.category_title}</td>
										<td><a href="javascript:void(0);" onclick="showContent(this)">${faq.title}
										</a>
										<c:if test="${id.rank == 2}">
										<input type="button" value="수정" onclick="location.href='faqUpdate?idx=${faq.idx}'">
										<input type="button" value="삭제" onclick="deleteData(${faq.idx})">
										</c:if>
										</td>
									</tr>
									<tr class="faq_contents">
									<td colspan="2">${faq.content}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="2">데이터가 없습니다!</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="paging">
					<c:if test="${nowpage!=1}">
						<c:choose>
							<c:when test="${nowpage>jumpgingPage}">
								<a href="FAQ?nowpage=${nowpage-jumpgingPage}">◀</a>
							</c:when>
							<c:otherwise>
								<a href="FAQ?nowpage=1">◀</a>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:forEach var="index" begin="${minpage}" end="${maxpage}" step="1">
						<c:choose>
							<c:when test="${index==nowpage}">
								<a href="FAQ?nowpage=${index}" class="bolder">${index}</a>
							</c:when>
							<c:otherwise>
								<a href="FAQ?nowpage=${index}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${nowpage!=maxpage && maxpage!=0}">
						<c:choose>
							<c:when test="${nowpage<pagingCount-jumpgingPage}">
								<a href="FAQ?nowpage=${nowpage+jumpgingPage}">▶</a>
							</c:when>
							<c:otherwise>
								<a href="FAQ?nowpage=${pagingCount}">▶</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
				</div>

			</div>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
		</div>
	</div>
</body>
</html>