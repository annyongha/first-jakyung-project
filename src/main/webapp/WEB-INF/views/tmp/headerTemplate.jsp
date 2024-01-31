<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">

	function alt() {
		alert("로그인 후 이용 가능합니다.");
	}
	
    function confirmDelete() {
        return confirm("정말로 회원을 삭제하시겠습니까?");
    }


</script>
<link href="${pageContext.request.contextPath}/resources/css/base.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="header">
		<div id="headerLogo">
			<span> <a href="index"> <img alt="logo"
					src="${pageContext.request.contextPath}/resources/images/logo.png"
					style="width: 50px; height: 50px; margin: 10px;"></a>
			</span>
		</div>
		<div id="allHeaderNavi">
			<div id="menuNavi">
			<form>
			<input type="hidden" name="user_idx" value="${id.idx}">
			</form>
				<ol>
					<c:choose>
						<c:when test="${id==null}">
							<li><a href="#" onclick="alt()">마이페이지</a></li>
							<li><a href="#" onclick="alt()">최근 본 상품</a></li>
							<li><a href="#" onclick="alt()">장바구니</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="checkPwd.do">마이페이지</a></li>
							<li><a href="recently">최근 본 상품</a></li>
							<li><a href="cart">장바구니</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="FAQ">고객센터</a></li>
				</ol>
			</div>
			<div id="MemberNavi">
				<ol>
					<c:choose>
						<c:when test="${id == null }">
							<li><a href="login_form.do">로그인</a></li>
							<li><a href="agree.do">회원가입</a></li>
						</c:when>
						<c:otherwise>
					        <c:choose>
					            <c:when test="${id.rank != 0}">
					                <li><a href="goods.do">상품등록</a></li>
					                <li><a href="goods_update_form.do">상품수정</a></li>
					                <span>${id.nickname}님 hi</span>
					                <li><a href="logout.do">로그아웃</a></li>
					                <li><a href="checkPwd.do">정보수정</a></li>
					                <li><a href="cart">장바구니</a></li>
					                <li><a href="member_delete"  onclick="return confirmDelete()">회원삭제</a></li>
					            </c:when>
					            <c:otherwise>
					                <span>${id.nickname}님 hi</span>
					                <li><a href="logout.do">로그아웃</a></li>
					                <li><a href="#">정보수정</a></li>
					                <li><a href="cart">장바구니</a></li>
					            </c:otherwise>
					        </c:choose>
    					</c:otherwise>
					</c:choose>
				</ol>
			</div>
		</div>
	</div>

</body>
</html>