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
<form name="adminLetterWrite" action="adminLetterWrite.pd" method="post">
	<table>
		<tr>
			<th width="80px">받는이</th>
				<td><input type="text" name="mem_id" size="70"></td>			
		</tr>
		
		<tr>
			<th width="80px">제목</th>
			<td><input type="text" name="let_subject" size="70"></td>
		</tr>
		
		<tr>
			<td colspan="2"><textarea rows="20" cols="85" name="let_content" style="resize: none"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="보내기">
			</td>
		</tr>
	</table>
</form>
</body>
</html>