<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean id="udao" class="project.user.UserDAO" scope="session"/>

<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
 
<%
	String user_id=request.getParameter("user_id");
	String user_pwd=request.getParameter("user_pwd");
	
	String cbState=request.getParameter("cb");
	
	int result = udao.loginCheck(user_id,user_pwd);
	if(result==udao.LOGIN_OK){
		
		String user_nickname=udao.getUserInfo(user_id);
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_nickname", user_nickname);
		
		int user_idx=udao.getUserInfoPlus(user_id);
		session.setAttribute("user_idx", user_idx);
		
		
		if(cbState==null||cbState.equals("")){
			Cookie ck=new Cookie("user_saveid",user_id);
			ck.setMaxAge(0);
			response.addCookie(ck);
		}else{
			Cookie ck=new Cookie("user_saveid",user_id);
			ck.setMaxAge(60*60*24*30);
			response.addCookie(ck);
		} 
		%>
		<script>
		window.alert('<%=user_nickname%>님 환영합니다.');
		var page=window.opener.document.location.href;
		var pages=page.split("/");
		var end_page=pages[pages.length-1];
		if(end_page=="join.jsp"){
			window.opener.location.href="/project/index.jsp";
			window.self.close();
		}
		else{
			opener.location.reload();
			window.self.close();
		}
		</script>
		<%
		
	}else if(result==udao.NOT_ID||result==udao.NOT_PWD){
		
		%>
		<script>
		window.alert('아이디 또는 비밀번호가 잘못되었습니다.');
		location.href='login.jsp';
		</script>
		<%
		
	}else if(result==udao.ERROR){
		out.println("고객센터로 연락하십시오.");
	}
	
%>		
