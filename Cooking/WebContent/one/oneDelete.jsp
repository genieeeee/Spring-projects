<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="project.one.oneCommentDAO"/>
<script>
	function ok(){
		window.self.close();
		opener.location.reload();
	}
</script>
<%
 		int idx = Integer.parseInt(request.getParameter("idx"));
 		int delete=-1;
 		String admin = (String)session.getAttribute("user_id");
 		if(admin == null || admin.equals("")){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	text-align:center;
}
</style>
</head>

<body>
<form name="delete" action="oneDelete_ok.jsp">
<input type="hidden" name="idx" value="<%=idx %>">
<div>
<h2>비밀번호를 입력해주세요</h2>
PASSWORD <input type="text" name="pwd">
<input type="submit" value="확인">
</div>
</form>
<%							
 		}else if(admin.equals("admin")){
 		 	delete = odao.oneDelete(idx);
 %>
 <br>
 <table style="margin:0px auto;">
 <tr>
 <td><h2 style="text-align:center;">삭제 되었습니다.</h2></td>
 </tr>
 <tr style="text-align:center;">
 <td><input type="button" value="확인" onclick="ok()"></td>
 </tr>
 </table>
</body>
</html>
<%return;
}%>