<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="udto" class="project.user.UserDTO" />
<jsp:setProperty property="*" name="udto" />
<jsp:useBean id="udao" class="project.user.UserDAO" />
 <title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
<%
String user_tel=request.getParameter("user_tel");
if(user_tel==null||user_tel.equals("")){	
	%>
	<script>
		window.alert('전화번호를 입력하셔야 합니다.');
		location.href='telCheck.jsp';
	</script>
	<%
	return;
}

int user_telLength=user_tel.length();
boolean b_num=false;
for(int i=0;i<user_telLength;i++){
	char c=user_tel.charAt(i);
	if(c>='0' && c<='9'){}
	else b_num=true;
}
if(b_num){
	%>
	<script>
		window.alert('0~9 사이의 숫자만 입력하셔야 합니다.');
		location.href='telCheck.jsp';
	</script>
	<%
	return;
}

boolean result=udao.telCheck(user_tel); 
if(result==true){
	%>
	<script>
	window.alert('이미 가입된 전화번호입니다.');
	location.href='telCheck.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=user_tel%>는 사용가능한 전화번호입니다.');
	opener.document.join.user_tel.value='<%=user_tel%>';
	window.self.close();
	</script>
<%
}
%>




