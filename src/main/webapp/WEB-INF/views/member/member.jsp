<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	
		var b_idCheck = false;
		var nickCheck = false;
		var juminCheck = false;
		var telCheck = false;
		function check_email() {
			var email = document.getElementById("email").value.trim();
			
			if(email == ''){
				alert('아이디를 입력하세요')
				return;
			}
			
			 // 이메일 형식을 검증하는 정규식
	        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	        if (!emailRegex.test(email)){
	        alert('이메일 형식에 맞게 작성하세요');
	        return;
	        };
			
			var url = "check_id.do";
			var param = "email="+encodeURIComponent(email);
			
			sendRequest(url,param,resultFn,"POST")
		}
		
		
		function resultFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;

				
				var json = (new Function('return'+data))();
				
				if(json[0].res == 'no'){
					alert('이미 사용중인 아이디입니다.');
					return;
				} else {
					alert('사용 가능한 아이디 입니다.')
					b_idCheck = true;
					return;
				}
			}
		}
		function nick() {
			var nickname = document.getElementById("nickname").value.trim();
			
			var url = "nickname_check.do";
			var param = "nickname="+encodeURIComponent(nickname);
			
			sendRequest(url,param,nickFn,"POST")
		}
		
		
		function nickFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;

				
				var json = (new Function('return'+data))();
				
				console.log(json);
				if (json[0].res == 'no'){
					alert('닉네임값을 변경하시오');
					return;
				} else {
					alert('사용 가능한 닉네임 입니다.')
					nickCheck = true;
					return;
				}
			}
		}
		
		function jumin_check() {
			var jumin = document.getElementById("jumin").value.trim();
			var juminRegex = /^[0-9]{6}-[0-9]{7}$/;
			
			if( !juminRegex.test(jumin)){
				alert('올바른 주민등록번호 형식이 아닙니다.');
				return;
			}
			
			var url = "jumin_check.do";
			var param = "jumin="+encodeURIComponent(jumin);
		
			
			sendRequest(url,param,juminFn,"POST")
		}
		
		
		function juminFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
				
				console.log(json);
				if (json[0].res == 'no'){
					alert('주민번호값을 변경하시오');
					return;
				} else {
					alert('사용 가능한 주민번호 입니다.')
					juminCheck = true;
					return;
				}
			}
		}
		
		function tel_check() {
			var tel = document.getElementById("tel").value.trim();
			var telRegex = /^010-\d{4}-\d{4}$/;

		    if (!telRegex.test(tel)) {
		        alert('올바른 휴대폰 번호 형식이 아닙니다. 예시: 010-1111-1111');
		        return;
		    }
			
			var url = "tel_check.do";
			var param = "tel="+encodeURIComponent(tel);
		
			
			sendRequest(url,param,telFn,"POST")
		}
		
		
		function telFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
				
				console.log(json);
				if (json[0].res == 'no'){
					alert('휴대번호값을 변경하시오');
					return;
				} else {
					alert('사용 가능한 휴대번호 입니다.')
					telCheck = true;
					return;
				}
			}
		}
		
		
		
		function id_che() {
			b_idCheck = false;
		}
		function nick_che() {
			nickCheck = false;
		}
		function jumin_che() {
			juminCheck = false;
		}
		function tel_che() {
			telCheck = false;
		}
		
		function showPassword() {
		    var passwordField = document.getElementById("pwd"); // 패스워드 입력란
		    var showPasswordCheckbox = document.getElementById("pwView"); // 체크박스

		    if (showPasswordCheckbox.checked) {
		        passwordField.type = "text"; // 입력란을 텍스트로 변경하여 값이 보이도록 설정
		    } else {
		        passwordField.type = "password"; // 다시 패스워드로 변경하여 값을 숨김
		    }
		}
		
		
		function openPop() {
			var url = "adress.do";
			var popTitle = "search";
			var config = "width=700px,height=800px";
			openedPopup = window.open(url,popTitle,config);
		}
		
		function showHideCompanyAddress() {
	        var choice = document.querySelector('input[name="rank"]:checked').value;
	        var companyAddressRow = document.getElementById('companyAddressRow');

	        if (choice === '0') {
	            companyAddressRow.style.display = 'none'; // 회사 주소 행 숨기기
	        } else {
	            companyAddressRow.style.display = 'table-row'; // 회사 주소 행 보이기
	        }
	    }
		
		function send(f){
			var passwordRegex = /^(?=.*[a-z])(?=.*[0-9])(?=.*[_@$])[a-z0-9_@$]{5,20}$/i;
			var gender;
			var sRank;
			
			var email = f.email.value;
			var pwd = f.pwd.value.trim();
			var repwd = document.getElementById('repwd').value
			var name = f.name.value.trim();
			//nickname은 필요없는거 같음 readonly로 적어서 값을 못바꿈
			var gen = f.elements['gen']; //'gen'이라는 name을 가진 라디오 버튼 요소들을 모두 가져옴
			var jumin = f.jumin.value.trim();
			var postcode = f.postcode.value.trim();
			var addr = f.addr.value.trim();  
			var rank = f.elements['rank'];// 'rank'라는 name을 가진 라디오 버튼 요소들을 모두 가져옴
   		    var question = f.question.value; // 선택된 셀렉트 박스의 값(value)을 가져옴
			// question에는 선택된 비밀번호 찾기 질문의 값이 들어있습니다.
			var answer = f.answer.value;
			
			for(var i = 0; i < gen.length; i++){
				if(gen[i].checked){
					gender = gen[i].value;//선택된 라디오 버튼의 값(value)을 가져 옴
					break;
				}
			}
			
			for(var i = 0; i < rank.length; i++){
				if(rank[i].checked){
					sRank = rank[i].value;// 선택된 라디오 버튼의 값(value)을 가져옴
					break;
				}
			}
			
			if(email == ''){
				alert('아이디값을 적어주세요');
				return;
			}

			if(!b_idCheck){
				alert('중복확인을 true로 만들어주세요');
				return
			}
			
			if(!nickCheck){
				alert('닉네임체크를 true로 만들주세요');
				return
			}
			
			if(!juminCheck){
				alert('주민번호체크를 true로 만들어주세요')
				return;
			}
			
			if(!telCheck){
				alert('휴대번호체크를 true로 만들어주세요')
				return
			}

			if(pwd == ''){
				alert('비밀번호를 입력하세요')
				return
			}
			
			if(!passwordRegex.test(pwd)){
				alert('비밀번호 형식을 맞춰주세요')
				return;
			}
			
			if(!(pwd == repwd)){
				alert('비밀번호와 비밀번호확인 값이 같아야 됩니다.')
				return;
			}
			
			if(name == ''){
				alert('이름을 입력하세요');
				return;
			}
			
			if(gender == null){
				alert('성별을 입력해주새요');
				return;
			} 
			
			
			
			
			if(postcode == '' || addr == ''){
				alert('우편번호와 주소를 입력하세요');
				return;
			} 
			
			if(sRank == null){
				alert('선택해주세요');
				return;
			}
				
			if(question == '' || answer == ''){
				alert('비밀번호 찾기 질문과 답변을 입력해주세요');
				return;
			}	
			
			f.action = "insert.do";
			f.method = "post";
			f.submit();
			}
		
	</script>
</head>
<body>
	<form>
		<table id="joinTbl" align="center">
			<caption>회원가입</caption>

			<tbody>
				<tr>
					<td class="req">Email</td>
					<td><input type="text" size="20" id="email" name="email"
						maxlength="30" onchange="id_che()"> <select id="emailDomain">
							<option value="">직접입력</option>
							<option value="@naver.com">naver.com</option>
							<option value="@daum.net">daum.net</option>
							<option value="@google.com">google.com</option>
							<option value="@kakao.com">kakao.com</option>

					</select> <input type="hidden" name="uEmail" id="uEmail"></td>
					<!-- 왜 만든거지? -->
					<td><input type="button" value="중복확인" onclick="check_email()"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="req">패스워드</td>
					<td><input type="password" size="23" name="pwd" id="pwd"
						maxlength="20"> <input type="checkbox" id="pwView"
						onclick="showPassword()"> 비밀번호 확인</td>
					<td>영어소문자, 숫자,_,@,$,(5~20)</td>
				</tr>
				<tr>
					<td class="req">패스워드 확인</td>
					<td><input type="password" size="23" id=repwd maxlength="20">
						<span id="pwChk">&nbsp;</span></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="req">이름</td>
					<td><input type="text" size="10" name="name" id="name"
						maxlength="20"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="req">닉네임</td>
					<td><input type="text" size="10" name="nickname" id="nickname"
						maxlength="20" onchange="nick_che()"></td>
					<td><input type="button" value="닉네임확인" onclick="nick()"></td>
					<td>&nbsp;</td>
				</tr>


				<tr>
					<td colspan="3" id="sepLine"><hr></td>
				</tr>

				<tr>
					<td>성별</td>
					<td><label>남 <input type="radio" name="gen" value="M"
							class="gen">
					</label> <label>여 <input type="radio" name="gen" value="F"
							class="gen"> <!-- name이 같아서 하꺼번에 취급이 됨  -->
					</label></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" size="20" name="jumin" id="jumin"
						maxlength="18" onchange="jumin_che()"> &nbsp; &nbsp; &nbsp; &nbsp;
						ex)960215-1******</td>
					<td><input type="button" value="주민번호확인" onclick="jumin_check()"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>휴대번호</td>
					<td><input type="text" size="20" name="tel" id="tel"
						maxlength="18" onchange="tel_che()"> &nbsp; &nbsp; &nbsp; &nbsp;
						ex)010-****-****</td>
					<td><input type="button" value="휴대번호체크" onclick="tel_check()"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" size="10" name="postcode" id="postcode"
						maxlength="7">
						<button type="button" id="findZipBtn" onclick="openPop()">우편번호찾기</button></td>
					<td>우편번호찾기 버튼을 눌러주세요.</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" size="40" name="addr" id="addr"
						maxlength="40"></td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>취미</td>
					<td><label> 공부 <input type="checkbox" class="chb"
							name="hobby" value="스터디">
					</label> <label> 운동 <input type="checkbox" class="chb" name="hobby"
							value="운동">
					</label> <label> 게임 <input type="checkbox" class="chb" name="hobby"
							value="게임">
					</label></td>
					<td>중복 선택 가능합니다.</td>
				</tr>
				<tr>
					<td>선택</td>
					<td><label> 개인 <input type="radio" class="rank"
							name="rank" value="0" onclick="showHideCompanyAddress()">
					</label> <label> 사업자 <input type="radio" class="rank" name="rank"
							value="1" onclick="showHideCompanyAddress()"></label></td>
				</tr>
				<tr id="companyAddressRow">
					<td>회사 주소</td>
					<td><input type="text" size="40" name="corpaddr" id="corpaddr"
						maxlength="40"></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>비밀번호 찾기 질문 선택</td>
					<td><select name="question">
							<option value="1">가장 좋아하는 색깔?</option>
							<option value="2">가장 좋아하는 음식?</option>
							<option value="3">가장 좋아하는 도시?</option>
					</select></td>
				</tr>
				<tr>
					<td>비밀번호 찾기 답변</td>
					<td><input type="text" size="10" name="answer" id="answer"></td>
				</tr>

				<tr>
					<td colspan="3" id="btnArea"><input type="button"
						name="joinBtn" value="회원가입" onclick="send(this.form)">
						<button type="reset">다시쓰기</button></td>
				</tr>
			</tbody>
		</table>
	</form>
	<script type="text/javascript">
         /* // 문서가 로드된 후에 실행되도록 window.onload에 이벤트 리스너 등록  */
        window.onload = function() {
            document.getElementById("emailDomain").addEventListener("change", function() {
                var selectedDomain = document.getElementById("emailDomain").value;
                document.getElementById("email").value = selectedDomain;
            });
             
            document.getElementById("email").addEventListener("input", function() {
                var emailValue = this.value.trim();
                var userName = emailValue.split('@')[0];
                document.getElementById("nickname").value = userName;
            });
        };
        
        
        </script>
</body>
</html>