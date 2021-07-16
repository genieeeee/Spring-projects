<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="project.recomment.ReCommentDTO"/>
<jsp:setProperty property="*" name="rdto"/>
<jsp:useBean id="rdao" class="project.recomment.ReCommentDAO" scope="session"/>
<%
	int c_idx = Integer.parseInt(request.getParameter("idx"));
	String msg="";

	String user_id = (String)session.getAttribute("user_id");
	if(user_id==null||user_id.equals("")){
		msg = "로그인 후 작성하실 수 있습니다.";
	}else{
		String user_idx = rdao.getUseridx(user_id);
		String reComment = request.getParameter("reComment");
		int ReWrite = rdao.ReWrite(user_idx, c_idx, reComment);
		msg = ReWrite>0?"댓글작성이 완료되었습니다.":"댓글작성이 실패하였습니다.";		
	}
%>
<script>
	window.alert("<%=msg %>");
	location.href='comment.jsp?idx=<%=c_idx %>';
	opener.location.reload();
</script>