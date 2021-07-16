<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odto" class="project.one.oneCommentDTO"/>
<jsp:setProperty property="*" name="odto"/>
<jsp:useBean id="odao" class="project.one.oneCommentDAO" scope="session"/>
<%
	String id = (String)session.getAttribute("user_id");
	String comment = request.getParameter("oneComment");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	int result = odao.oneComment_ok(comment,name,pwd);
	String msg = result>0?"한줄게시글 작성을 완료하였습니다.":"게시글 작성에 실패하였습니다.";
%>
<script>
	window.alert("<%=msg %>");
	location.href='oneComment.jsp';
	opener.location.reload();
</script>