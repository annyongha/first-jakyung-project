<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy Sweet Home Shopping</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<%@ include file="/WEB-INF/views/member/tmp/index2.jsp"%>
		</div>
		<div id="main">첫 인덱스 페이지</div>
		<%@ include file="/WEB-INF/views/member/member.jsp" %>
	</div>
</body>
<script type="text/javascript">
		// 부모 창에서 주소 정보를 받아들이는 함수
		function receiveAddress(fullAddress,postcode) {
		    // 받은 주소 정보를 여기에서 처리
			 document.getElementById('addr').value = fullAddress;
		     document.getElementById('postcode').value = postcode;
		}		
</script>
</html>