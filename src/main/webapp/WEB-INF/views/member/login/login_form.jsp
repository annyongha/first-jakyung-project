<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="resources/js/httpRequest.js"></script>
		<script type="text/javascript">
		var preURL = null;
			function send(f){
				var email = f.email.value.trim();
				var pwd = f.pwd.value.trim();
				preURL = f.preURL.value;
				
				//유효성 체크
				if(email == ''){
					alert('아이디를 입력해주세요');
					return;
				}
				
				if(pwd == ''){
					alert('비밀번호를 입력해주세요');
					return;
				}
				
				var url = "login.do";
				var param = "email="+encodeURIComponent(email)+"&pwd="+encodeURIComponent(pwd);
				sendRequest(url,param,myCheck,"POST");
			}
			
			//콜백함수
			function myCheck() {
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					var json = (new Function('return'+data))();
					
					if(json[0].param == 'no_id'){
						alert('아이디가 존재하지 않습니다.');
					} else if(json[0].param == 'no_pwd'){
						alert('비밀번호가 일치하지 않습니다.');
					} else{
						alert('로그인 성공');
						location.href="prePage?preURL="+preURL;
					}
				}
			}
			
		</script>
	</head>
	<body>
		<form>
			<table border="1" style="margin: 0px auto;">
				<caption>:::로그인:::</caption>
				<tr>
					<th>이메일</th>
					<td><input name='email'></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인" onclick="send(this.form)">
						<input type="button" value="회원가입" onclick="location.href='agree.do'">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="hidden" name="preURL" value="${preURL}">
						<input type="button" value="아이디 찾기" onclick="location.href='id_find_form.do'">
						<input type="button" value="비밀번호 찾기" onclick="location.href='pwd_Find.do'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>