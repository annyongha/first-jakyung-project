<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function faqInsertProcessFn(f) {
		f.action = "faqInsertProcess";
		f.method = "post";
		f.submit();
		alert("등록완료");
	}
</script>
</head>
<body>

	<form>
		<table>
			<tr>
				<th>카테고리</th>
				<td><select name="category">
						<c:forEach items="${categoryList}" var="category">
							<option value="${category.category}">${category.category}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>구분</th>
				<td><input type="text" name="category_title"></td>
			</tr>
			<tr>
				<th>title</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>content</th>
				<td><textarea name="content" rows="20" cols="200"
						style="resize: none;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="등록"
					onclick="faqInsertProcessFn(this.form)"> <input
					type="button" value="취소" onclick="location.href = 'FAQ'"></td>
			</tr>
		</table>
	</form>

</body>
</html>