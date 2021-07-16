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
int user_idLength=user_id.length();
boolean b_s=false;
for(int i=0;i<user_idLength;i++){
	char c=user_id.charAt(i);
	if(c>='0' && c<='9'){}
	else if(c>='A' && c<='Z'){}
	else if(c>='a' && c<='z'){}
	else b_s=true;
}

if(b_s||user_id==null||user_id.equals("")){
	
	%>
	<script>
		window.alert('특수문자는 아이디로 사용하실 수 없습니다.');
		location.href='idCheck.jsp';
	</script>
	<%
	return;
}

boolean result=udao.idCheck(user_id);
if(result==true){
	%>
	<script>
	window.alert('이미 가입된 ID입니다.');
	location.href='idCheck.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=user_id%>는 사용가능한 ID입니다.');
	opener.document.join.user_id.value='<%=user_id%>';
	window.self.close();
	</script>
<%
}
%>




