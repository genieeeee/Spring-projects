<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
}
</style>
</head>
<body>
	<form name="adminLetterContent">
		<table>
			<tr>
				<th>글번호</th>
				<td>${dto.let_idx}</td>
				<th>받는이</th>
				<td>${dto.mem_id}</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td colspan="3">${dto.let_subject}</td>
			</tr>
			
			<tr>
				<td colspan="4"><textarea rows="10" cols="70" name="content" readonly="readonly" style="resize: none">${dto.let_content}</textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>