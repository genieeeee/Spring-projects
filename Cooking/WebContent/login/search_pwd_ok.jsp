<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="udto" class="project.user.UserDTO" />
<jsp:setProperty property="*" name="udto" />
<jsp:useBean id="udao" class="project.user.UserDAO" />

<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">

<%
String user_id=request.getParameter("user_id");
int user_q_idx=Integer.parseInt(request.getParameter("user_q_idx"));
String user_a=request.getParameter("user_a");
String msg=udao.pwdSearch(user_id, user_q_idx, user_a);
%>

<script>
window.alert('찾으시는 비밀번호 : <%=msg%>');
location.href='/project/login/search_pwd.jsp';
</script>



