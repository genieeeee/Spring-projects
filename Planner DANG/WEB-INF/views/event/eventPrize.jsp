<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function goLetter(){
	opener.location.href='userLetter.pd';
	self.close();
}
</script>
</head>
<body>
<img src="event/prize.png" width="100%">
<br><br>

<div style="text-align: center;"><font size="5">${list}</font></div>

<c:if test="${mem_id ne null }">
	<br><hr><p align="center">※자세한 사항은 <a href="javascript:goLetter()">쪽지함</a>을 확인하세요</p><br>
</c:if>
<c:if test="${mem_id eq null }">
	<br><hr><p align="center">※자세한 사항은 쪽지함을 확인하세요</p><br>
</c:if>
</body>
</html>