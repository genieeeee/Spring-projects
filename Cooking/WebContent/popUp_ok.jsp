<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String popUp_cb=request.getParameter("popUp_cb");
	
	if(!(popUp_cb==null||popUp_cb.equals(""))){
		Cookie ck=new Cookie("popUp_cb","on");			//쿠키생성(저장)
		ck.setMaxAge(60*60*24);
		response.addCookie(ck);
	}

%>
<script>
window.self.close();
</script>