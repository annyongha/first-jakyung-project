<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
	
	var preURL = null;
	
		function send(f) {
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			preURL = f.preURL.value;
			if (id == '') {
				alert("아이디입력");				return;
			}
			if (pwd == '') {
				alert("비밀번호입력");
				return;
			}
	
			
			var url = "loginCheck";
			var param = "id=" + id + "&pwd=" + pwd;
			sendRequest(url, param, resultFn, "post" );
		}
	
		function resultFn() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				var json = (new Function('return' + data))();
	
				if (json[0].res == 'yes') {
					alert('로그인완료');
					location.href = "prePage?preURL="+preURL;
				} else {
					alert('계정x');
				}
			}
		}
	</script>
</head>
<body>
	<form>
		<table>
			<tr>
				<td>아이디</td>
				<td><input name="id" type="text" maxlength="20"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name="pwd" type="password" maxlength="20"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="로그인"
					onclick="send(this.form)"></td>
			</tr>
		</table>
	<input type="hidden" name="preURL" value="${preURL}">
	</form>
</body>
</html>