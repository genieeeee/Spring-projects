<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="project.one.oneCommentDAO"/>
<%
	int one_msg = Integer.parseInt(request.getParameter("one_msg"));
	int o_idx = Integer.parseInt(request.getParameter("idx"));
	int update = odao.updateOk(one_msg, o_idx);
	String msg = update>0?"답변처리가 완료되었습니다.":"답변처리에 실패하였습니다.";
%>
<script>
	window.alert("<%=msg %>");
	location.href='oneComment.jsp';
</script>