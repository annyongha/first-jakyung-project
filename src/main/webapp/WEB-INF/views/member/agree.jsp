<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 18px;
            margin-top: 50px;
        }
        
        .checkbox-container {
            display: flex;
            align-items: center;
        }
        
        input[type="checkbox"] {
            margin-right: 10px;
        }
        
        h1 {
            font-size: 24px;
            font-weight: bold;
        }
    </style>
    
    <script type="text/javascript">
    	function send(f){
    		var agree1 = document.getElementsByName("agree1")[0].checked;
            var agree2 = document.getElementsByName("agree2")[0].checked;
            var agree3 = document.getElementsByName("agree3")[0].checked;
            
            if(!(agree1 && agree2 && agree3)){
            	alert('필수 체크를 반드시 해주시기 바랍니다.');
            } else{
            	location.href="member_insert.do";
            }
             
    	}
    </script>
	</head>
	<body>
		<h1>회원가입</h1>
			
		<h1>환영합니다.<br>가입하시려면 약관에 동의해 주세요</h1><br><br>
				
		<label for="checkAll"><input type="checkbox" id="checkAll"> 약관전체에 동의하기</label><br><br>
    <label><input type="checkbox" class="checkBoxGroup" name="agree1"> [필수]만 14세 이상입니다.</label><br>
    <label><input type="checkbox" class="checkBoxGroup" name="agree2"> [필수]홈쇼핑 스토어 이용 약관</label><br>
    <label><input type="checkbox" class="checkBoxGroup" name="agree3"> [필수]개인정보 수집 및 이용 동의</label><br>
    <label><input type="checkbox" class="checkBoxGroup"> [선택]광고성 정보 수신 동의<br></label><br>
    <label><input type="checkbox" class="checkBoxGroup"> [선택]개인정 수집 및 이용 동의<br></label><br>
    
    
    <br><br><input type="button" value="동의 후 회원가입페이지로" onclick="send()">

    <script type="text/javascript">
        document.getElementById("checkAll").addEventListener("change", function() {
            var checkBoxes = document.querySelectorAll('.checkBoxGroup');
            for (var i = 0; i < checkBoxes.length; i++) {
                checkBoxes[i].checked = this.checked;
            }
        });

        
    </script>
	</body>
</html>