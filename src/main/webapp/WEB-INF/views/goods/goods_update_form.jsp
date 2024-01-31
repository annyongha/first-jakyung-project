<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function confirmDelete(idx){
				if(confirm("정말로 삭제하시겠습니까?")){
					location.href='goods_delete.do?idx='+idx;
				}
			}
		</script>
	</head>
	<body>
		<caption>:::상품 수정(수정하고 싶으면 인덱스를 클릭):::</caption>
		<table border="1" width="1200">
			<tr>
				<th>인덱스</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>상품 할인율</th>
				<th>상품 타입</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="vo" items="${goodsList}">
				<tr>
					<td><a href="view.do?idx=${vo.idx}">
					${vo.idx}</a></td>
					<td>${vo.g_name}</td>
					<td>${vo.g_price}</td>
					<td>${vo.sale}</td>
					<td>${vo.division}</td>
					<td><input type="button" value="삭제" onclick="confirmDelete(${vo.idx})"></td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">
					<c:if test="${nowpage!=1}">
						<c:choose>
							<c:when test="${nowpage>jumpgingPage}">
								<a href="goods_update_form.do?nowpage=${nowpage-jumpgingPage}">◀</a>
							</c:when>
							<c:otherwise>
								<a href="goods_update_form.do?nowpage=1">◀</a>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:forEach var="index" begin="${minpage}" end="${maxpage}" step="1">
						<c:choose>
							<c:when test="${index==nowpage}">
								<a href="goods_update_form.do?nowpage=${index}" class="bolder">${index}</a>
							</c:when>
							<c:otherwise>
								<a href="goods_update_form.do?nowpage=${index}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${nowpage!=maxpage && maxpage!=0}">
						<c:choose>
							<c:when test="${nowpage<pagingCount-jumpgingPage}">
								<a href="view.do?nowpage=${nowpage+jumpgingPage}">▶</a>
							</c:when>
							<c:otherwise>
								<a href="view.do?nowpage=${pagingCount}">▶</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
	</body>
</html>