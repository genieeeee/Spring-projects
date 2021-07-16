<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdto" class="project.comment.CommentDTO" />
<jsp:setProperty property="*" name="cdto" />
<jsp:useBean id="cdao" class="project.comment.CommentDAO" scope="session" />

<%
String idx_s=request.getParameter("comment_idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int comment_idx=Integer.parseInt(idx_s);


String comment_user_idx_s=request.getParameter("user_idx");
if(comment_user_idx_s==null||comment_user_idx_s.equals("")){
	comment_user_idx_s="0";
}
int comment_user_idx=Integer.parseInt(comment_user_idx_s);


Integer user_idx=(Integer)session.getAttribute("user_idx");
if(user_idx==null||user_idx.equals("")){

}

String msg="";

if(!(comment_user_idx==user_idx)&&user_idx!=0){
	msg="해당 게시물을 삭제하실 수 없습니다.";
%>
	<script>
	window.alert('<%=msg %>');
	location.href='comment_main.jsp';
	</script>
<%
}else{
	String tempPath=this.getServletContext().getRealPath("/");
	int result=cdao.commentDelete(comment_idx, tempPath);
	msg=result>0?"삭제 성공!":"삭제 실패!";
%>
	<script>
	window.alert('<%=msg %>');
	location.href='comment_main.jsp';
	</script>
<%
}
%>


 