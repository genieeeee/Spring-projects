<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" name="memImg" action="memImg.pd">
			<input type="hidden" name="mem_id" value="${mem_id}">
			<p align="center">
				<input type="file" name="upload" required="required"><br><br>
				<input type="submit" value="이미지 변경" style="width:240px;">
			</p>
</form>
</body>
</html>