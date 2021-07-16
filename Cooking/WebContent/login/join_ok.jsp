<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
	
	<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="udto" class="project.user.UserDTO" />
<jsp:setProperty property="*" name="udto" />
<jsp:useBean id="udao" class="project.user.UserDAO" />
<%

String user_pwd=request.getParameter("user_pwd");
int pwdLength=user_pwd.length();
boolean b_so=false, b_dae=false, b_s=false, b_num=false;
for(int i=0;i<pwdLength;i++){
	char c=user_pwd.charAt(i);
	if(c>='0' && c<='9'){
		b_num=true;
	}else if(c>='a' && c<='z'){
		b_so=true;
	}else if(c>='A' && c<='Z'){
		b_dae=true;
	}else if(((int)c>=33 && (int)c<=47) || ((int)c>=58 && (int)c<=64) || ((int)c>=91 && (int)c<=96) || ((int)c>=123 && (int)c<=126)){
		b_s=true;
	}
}
if(!(b_num && b_so && b_dae && b_s)){
	
	%>
	<script>
		window.alert('비밀번호는 대문자, 소문자, 특수문자, 숫자를 모두 포함해야 합니다.');
		history.back(-1);
	</script>
	<%
	return;
}

int user_q_idx=Integer.parseInt(request.getParameter("user_q_idx"));
if(user_q_idx==0){
	%>
	<script>
		window.alert('비밀번호 질문을 선택하셔야합니다.');
		history.back(-1);
	</script>
	<%
	return;
}

String check_s=request.getParameter("radiocheck");
if(check_s==null||check_s.equals("")){
	
}
int check=Integer.parseInt(check_s);

String msg="";
if(check==1){
	int result = udao.userJoin(udto);
	msg = result>0?"회원가입을 축하합니다.":"회원가입중 문제가 발생하였습니다.";
%>

<script>
window.alert('<%=msg%>');
location.href='/project/index.jsp';
</script>

<%}else{ 
	msg="이용약관을 동의하셔야 서비스를 이용할 수 있습니다.";
%>
	<script>
	window.alert('<%=msg%>');
	history.back(-1);	
	</script>
	
<%
}
%>




