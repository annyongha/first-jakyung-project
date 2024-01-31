<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="resources/js/httpRequest.js"></script>
		<script type="text/javascript">
			function send(){
				var jumin = document.getElementById("jumin").value;
				
				if(jumin == ''){
					alert('주민번호를 입력해주세요');
					return;
				}
				
				var url = "id_find.do";
				var param = "jumin="+encodeURIComponent(jumin);
				
				sendRequest(url,param,myCheck,"POST");
			}
			
			function myCheck() {
				if(xhr.readyState == 4 && xhr.status == 200){
					var data = xhr.responseText;
					var json = (new Function('return'+data))();
					
					if(json[0].param == 'no_id'){
						alert('아이디가 존재하지 않습니다.');
					} else{
						alert('아이디 찾음')
						document.getElementById("id_Find").value = 	json[0].param;
					}
				}
			}
		</script>
	</head>
	<body>
		<table style="margin: 0px auto;">
			<tr>
				<th> 아이디 찾기를 하고 싶으면 주민번호를 입력 </th>
			</tr>
			<tr>
				<td><input id="jumin" name="jumin"> <input type="button" value="전송" onclick="send()"></td>
				<td> 형식 예) 901212-1212121 </td>
			</tr>
			<tr>
				<td colspan="2">아이디 : 
				<input id="id_Find" name="id_Find"></td>
			</tr>
		</table>
	</body>
</html>