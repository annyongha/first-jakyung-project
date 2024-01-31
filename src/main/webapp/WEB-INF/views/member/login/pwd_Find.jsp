<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="resources/js/httpRequest.js"></script>
		<script>
			function check(){
				var email = document.getElementById("email").value;
				
				if(email == ''){
					alert('email을 입력해 주세요');
					return;
				}
				
				var url = "pwd_idCheck.do;"
				var param = "email="+encodeURIComponent(email);
				
				sendRequest(url,param,myCheck,"POST");
			}
			
			function myCheck() {
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					
					alert("hi")
					
						
					if(data === ''){
						alert('아이디를 제대로 입력해 주세요');
						return;
					} else {
						var json = JSON.parse(data);
						alert('아이디가 있습니다.');
						var selectElement = document.querySelector('select[name="question"]');//셀렉트 요소 가져오기
												
						//옵션을 순회하며 선택된 옵션 설정
						var options = selectElement.options;
						for(var i = 0; i < options.length; i++){
							if(options[i].value == json.question) {
								selectElement.selectedIndex = i;
								
								break;
							}
						}
						var hiddenInput = document.getElementById('hidden');
						hiddenInput.value = json.answer;
						
					}
				}
			} 
			
			function send(){
				var hidden = document.getElementById('hidden').value;
				var answer = document.getElementById('answer').value;
				var email = document.getElementById('email').value;	
				
				if(answer == ''){
					alert('답변을 입력하세요');
					return;
				}
				
				if(hidden != answer){
					alert('답변이 일치하지 않습니다.');
					return;
				}
				
				var url = 'pwd_check.do';
				var param = "email="+encodeURIComponent(email);
				
				sendRequest(url,param,pwdCheck,"POST");
			}
			
			function pwdCheck(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					var json = (new Function('return'+data))();
					
					if(json[0].param == 'no_email'){
						alert('이메일이 존재하지 않습니다.')
					} else {
						alert('비밀번호 출력')
					document.getElementById('pwd').value = json[0].param;
					}
				}
				
			}
		</script>
	</head>
	<body>
		<table border="1" style="margin: 0px auto;">
			<tr>
				<td colspan="2"><input id="email">
				<input type=button value="아이디 확인" onclick="check()"></td>
			</tr>
			<tr>
				<td> 비밀번호 찾기 질문 선택</td>
				<td><select name="question">
						<option value="1">가장 좋아하는 색깔?</option>
						<option value="2">가장 좋아하는 음식?</option>
						<option value="3">가장 좋아하는 도시?</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input id="answer"> <input type="button" value="답변확인" onclick="send()"></td>
			</tr>
			<tr>
				<td colspan="2">비밀번호 출력 : <input id= pwd></td>
			</tr>
			
				
			
		</table>
		<input id="hidden" type="hidden">
	</body>
</html>