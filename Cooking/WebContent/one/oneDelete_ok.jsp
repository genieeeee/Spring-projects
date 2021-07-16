<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="project.one.oneCommentDAO"/>
<%	
	String pwd = request.getParameter("pwd");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pwd2 = odao.getPwd(idx);
	int delete = -1;
	if(pwd.equals(pwd2)){
		delete = odao.oneDelete(idx);
	}
	String msg = delete>0?"삭제가 완료되었습니다.":"삭제에 실패하였습니다.";
%>
<script>
	window.alert('<%=msg%>');
	window.self.close();
	location.href='oneComment.jsp';
	opener.location.reload();
</script>