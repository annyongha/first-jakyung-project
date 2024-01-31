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
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/confirm.js"></script>
</head>
<body>
	<%-- <%@ include file="/WEB-INF/views/loginCheck.jsp"%> --%>
	<!-- 로그인 lock기능 -->
	<div id="wrap">
		<div id="header">
			<%@ include file="/WEB-INF/views/tmp/headerTemplate.jsp"%>
		</div>
		<div id="main" class="dflex">
			<div id="MyPageNavi">
				<%@ include file="/WEB-INF/views/tmp/MyPageNavi.jsp"%>
			</div>
			<div id="mainContent">
				<form action="">
					<table border="1">
						<caption>:::회원정보 수정:::</caption>
						<tr>
							<td>닉네임: <input type="text" id="NicknameChange"
								value="${userInfo.nickname}" name="nick">
							</td>
							<td><input type="button" value="수정"
								onclick="changeNickname(this.form)"></td>
						</tr>

						<tr>
							<td>아이디: <input type="text" id="idChange"
								value="${userInfo.email}" name="id">
							</td>
							<td><input type="button" value="수정"
								onclick="changeId(this.form)"></td>
						</tr>

						<tr>
							<td>비밀번호: <input type="text" id="pwdChange"
								value="${userInfo.pwd}" name="pwd">
							</td>
							<td><input type="button" value="수정"
								onclick="changePwd(this.form)"></td>
						</tr>

						<tr>
							<td>전화번호: <input type="text" id="telChange" name="tel"
								value="${userInfo.tel}">
							</td>
							<td><input type="button" value="수정"
								onclick="changeTel(this.form)"></td>
						</tr>


						<tr>
							<td>주소: <input type="text" id="addrChange"
								value="${userInfo.addr}" name="addr">
							</td>
							<td><input type="button" value="찾기" onclick="changeAddr()"></td>
						</tr>
						<tr>
							<td>우편번호: <input type="text" id="postcodeChange"
								value="${userInfo.postcode}">
							</td>
							<td><input type="button" value="저장"></td>
						</tr>

					</table>
				</form>
			</div>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/tmp/footerTemplate.jsp"%>
		</div>
	</div>
</body>
</html>