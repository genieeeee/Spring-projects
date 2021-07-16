<!--내꺼  -->
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.comment.*"%>
<%@page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="project.recomment.ReCommentDTO"%>
<jsp:useBean id="cdao" class="project.comment.CommentDAO" scope="session"/>
<jsp:useBean id="rdao" class="project.recomment.ReCommentDAO" scope="session"/>

<%@ page import="project.recipe.view_img.*" %>
<jsp:useBean id="viDAO" class="project.recipe.view_img.view_imgDAO" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="../css/comment.css">
<style>
	#td4{
		background:#218559;
	}
</style>
<script>
	function back(){
		location.href='comment_main.jsp';
	}
	function reDelete(re, idx){
		location.href='reDelete.jsp?idx='+re+'&del='+idx;
	}
</script>
</head>

<%
String idx_s=request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int comment_idx=Integer.parseInt(idx_s);
CommentDTO dto=cdao.comment(comment_idx);
if(dto==null){
	
}

String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}

int idx=Integer.parseInt(idx_s);
ArrayList<CommentDTO> arr = cdao.commentView(idx);
String nickname=cdao.getUser(arr.get(0).getUser_idx());
/* String nickname = (String)session.getAttribute("user_nickname"); */

int comment_readnum=cdao.getReadnumber(comment_idx, dto.getComment_readnum());

/* int idx1 = Integer.parseInt(request.getParameter("idx")); */
String id1 = (String)session.getAttribute("user_id");
%>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
	<br>
			<fieldset id="title">
			 <h1>후기</h1>
			</fieldset>
			<br>
			<fieldset id="main">
				<form name="comment_delete" action="comment_delete.jsp">
				<%
				if(arr==null||arr.equals("")){%>
					등록된 글이 없습니다.
				<%}else{
					for(int i=0; i<arr.size();i++){
				%>
				<br>
<%-- 				<table>
					<tr>
						<td><%=arr.get(i).getComment_title() %></td>
						<td>| 후기게시판</td>
						<td><%=arr.get(i).getComment_date() %></td>
					</tr>
				</table>
				<hr style="border-style: dotted;">
				<table>
					<tr>
						<td><%=nickname%></td>
						<td>| <%=arr.get(i).getComment_category() %></td>
					</tr>
				</table> --%>
				
 				<table id="comment" border="1" cellspacing="0">
					<tr>
						<th>제목</th>
						<td colspan="5"><%=arr.get(i).getComment_title() %></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td colspan="3">
							<%=nickname%>
							<input type="hidden" name="user_idx" value="<%=arr.get(i).getUser_idx()%>">						
						</td>
						<th>분류</th>
						<td><%=arr.get(i).getComment_category() %></td>
					</tr>
					<tr>
						<th>글번호</th>
						<td>
							<%=arr.get(i).getComment_idx() %>
							<input type="hidden" name="comment_idx" value="<%=arr.get(i).getComment_idx() %>">
						</td>
						<th>조회수</th>
						<td><%=arr.get(i).getComment_readnum()+1%></td>
						<th>작성일</th>
						<td colspan="3"><%=arr.get(i).getComment_date() %></td>
					</tr>
				</table>
				<br>
				<hr>
				<br>
				<table>
					<tr>
						<td colspan="5">
						<div>
								<%
									arr.get(i).getComment_content();
									
									String[] contents=arr.get(i).getComment_content().split("\\|");
									for(int j=0 ; j<contents.length ; j++){
										if(contents[j]==null || "".equals(contents[j])){ //공백은 패스
										}
										else{ // 내용 있음
											if(contents[j].charAt(0)==';'){ // 그림인 경우
												view_imgDTO idto=viDAO.view_img(Integer.parseInt(contents[j].substring(1)));
												%>
												<img src="<%=idto.getImg_path()+idto.getImg_idx()+idto.getImg_extension()%>"> <br>
												<%
												}
											else{
												%>
												<%=contents[j] %><br>
												<%
												}
										}
										}
								%>
								</div>
						</td>
					</tr>
				</table>
				<%
					}
				}
				%>
				<br>
				<hr>
				<p id="commentP">
				<%
				String user_id=(String)session.getAttribute("user_id");
				if(!(user_id==null||user_id.equals(""))){
				%>
					<input type="submit" value="삭제" id="del1">					
				<%	
				}
				%>
					<a href="comment_main.jsp"><input type="button" value="목록으로" action="back()" id="back">
				</a></p>
				<br>
					</form>
				<form name="reComment" action="re_comment_ok.jsp">
				<input type="hidden" name="idx" value="<%=idx %>">
				<fieldset id="two">
					<table id="five">
						<tr>
							<td colspan="2">
								<textarea rows="6" cols="100" name="reComment" placeholder="댓글을 입력해주세요" maxlength="300" id="recomment"></textarea>
							</td>
						</tr>
						<tr>
							<td style="text-align:right;" colspan="2">300자<input type="submit" value="등록" id="ok"></td>
						</tr>
					</table>
				</fieldset>
				<br>
				<hr>
				<br>
				<% 
				ArrayList<ReCommentDTO> arr1 = rdao.getReComment(idx); 						
 						for(int i=0; i<arr1.size();i++){
 							%>
 								<table id="four">
 								<tr>
 									<th><%=arr1.get(i).getUser_nickname()%></th>
  									<%
  										if(id1 == null || id1.equals("")){
  											
  										}else if(id1.equals(arr1.get(i).getUser_id())||id1.equals("admin")){
 									%>
 									<td><input type="button" value="삭제" onclick="reDelete(<%=arr1.get(i).getRe_idx() %>,<%=idx %>)" id="del2"></td>
 									<%} %>
 									<td style="text-align:right;"><%=arr1.get(i).getRe_comment_date() %></td>
 								</tr>
 								</table>
 								<table id="three">
 								<tr>
 									<td>
 										<div><%=arr1.get(i).getRe_comment() %></div>
 										<br>
 									</td>
 								</tr>
 								</table>
 								<hr>
 							<%
 						}
					%>
				</form>		
			</fieldset>	
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>
