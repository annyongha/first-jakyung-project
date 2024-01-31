<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="${pageContext.request.contextPath}/resources/js/findAddr.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/saveAddrr.js"></script>
	</head>
	<body>
		<div>
			<form>
				<table>
						<tr>
							<td>
								<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소" name = "addr" name ="addr"><br>
								<input type="text" id="sample6_detailAddress" placeholder="상세주소" name ="detail">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목">
								<input type="button" value = "저장" onclick = "saveAddr(this.form)">
							</td>
						</tr>
				</table>
			</form>	
		</div>	
	</body>
</html>