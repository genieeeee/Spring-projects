<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>이미지등록</legend>
		<form name="imgUpdate" enctype="multipart/form-data" method="post" action="imgUpdate.pd">
			<input type="hidden" name="mem_id" value="${mem_id}">
			<input type="file" name="upload">
			<input type="submit" value="등록">
		</form>
	</fieldset>
</body>
</html>