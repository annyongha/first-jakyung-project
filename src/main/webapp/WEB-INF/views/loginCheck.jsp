<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function () {
	var idCheck = '${id}';
	if(idCheck==''){
		alert("로그인 후 이용 가능합니다.");
		location.href = "login_form.do";
	}
}
</script>
</head>
<body>

</body>
</html>