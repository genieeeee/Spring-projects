<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form name="userLetterDel" action="userLetterDel.pd" method="post">
		<table>	
			<tr>
				<td align="center">${dto.let_subject }</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="10" cols="70" name="let_content" readonly>${dto.let_subject }</textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="hidden" name="let_idx" value="${dto.let_idx }">  
					<input type="submit" class="ct-btn-white" value="삭제"></td>
			</tr>
		</table>
	</form>
</body>
</html>



