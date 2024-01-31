<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		
		function send(f){
			var g_name = f.g_name.value;
			var g_price = f.g_price.value;
			var g_photo = f.g_photo.value;
			var sale = f.sale.value;
			var contentFile = f.contentFile.value;
			var division = f.division.value;
			
			if(g_name == ''){
				alert('상품이름을 입력하세요')
				return;
			}
			
			alert(g_name);
			if(g_price == '' || !/^\d+$/.test(g_price) || parseInt(g_price) <= 0){
				alert('올바른 가격값을 입력하세요')
				return;
			}
			
			if(g_photo == ''){
				alert('사진을 넣으세요')
				return;
			}
			
			if(contentFile == ''){
				alert('내용을 입력하세요')
				return false;
			}
			
			if(sale == '' || !/^\d+$/.test(sale)|| parseInt(sale) > 100 ){
				alert('올바른 할인율을 입력하세요')
				return;
			}
			
			if(division == ''){
				alert('상품타입을 선택하세요')
				return;
			}
			
			f.action = "goods_insert.do";
			f.submit();
		}
		</script>
	</head>
	<body>
		<form method="POST" encType="multipart/form-data">
		
			<caption>:::상품등록:::</caption>
			<table border="1" align="center">
				<tr>
					<th>상품이름</th>
					<td><input name="g_name" style="width:250px;"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input name="g_price"></td>
				</tr>
				<tr>
					<th>상품 타이틀 이미지</th>
					<td><input type="file" name="g_photo"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="file" name="contentFile"></td>
					
				</tr>
				<tr>
					<th>할인율</th>
					<td><input name=sale></td>
				</tr>
				<tr>
					<th>상품타입</th>
					<td><select name="division">
						<option value="SHORT">상의</option>
						<option value="OUTER">아우터</option>
						<option value="PANTS">하의</option>
						<option value="SHOES">신발</option>
						<option value="ACCESSORY">액세서리</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"> 
						<input type="button" value="상품등록" onclick="send(this.form)">
						<button type="reset">다시쓰기</button>
					</td>
				</tr>	
			</table>
		</form>
	</body>
</html>