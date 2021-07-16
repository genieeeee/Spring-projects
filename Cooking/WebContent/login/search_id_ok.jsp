<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="udto" class="project.user.UserDTO" />
<jsp:setProperty property="*" name="udto" />
<jsp:useBean id="udao" class="project.user.UserDAO" />
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
<%
String user_nickname=request.getParameter("user_nickname");
String user_tel=request.getParameter("user_tel");
String msg=udao.idSearch(user_nickname, user_tel);
%>

<script>
window.alert('찾으시는 아이디 : <%=msg%>');
location.href='/project/login/search_id.jsp';
</script>



