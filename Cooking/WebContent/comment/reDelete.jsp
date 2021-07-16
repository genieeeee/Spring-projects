<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="project.recomment.ReCommentDAO"/>
<%
	String idx = request.getParameter("idx");
	String idx2 = request.getParameter("del");
	int delete = rdao.reDelete(Integer.parseInt(idx));
	String msg = delete>0?"삭제가 완료되었습니다.":"삭제에 실패하였습니다.";
%>
<script>
	window.alert('<%=msg%>');
	window.self.close();
	location.href='comment.jsp?idx=<%=idx2 %>';
	opener.location.reload();
</script>