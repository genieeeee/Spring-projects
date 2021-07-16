<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, project.one.*"%>
<%@page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="project.user.UserDTO"%>
<jsp:useBean id="odto" class="project.one.oneCommentDTO"/>
<jsp:setProperty property="*" name="odto"/>
<jsp:useBean id="odao" class="project.one.oneCommentDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function oneDel(idx){
		window.open('/project/one/oneDelete.jsp?idx='+idx,'delete','width=400px, height=140px');
	}
	function one_ok(one_msg, idx){
		location.href="oneMsg.jsp?one_msg="+one_msg+"&idx="+idx
	}
</script>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="../css/oneComment.css">

<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	
	<style type="text/css">
			#td5{
				background:#218559;
			}
	</style>
</head>
<%
int totalCnt = odao.getTotalCnt();
int listSize = 5;
int pageSize = 5;
String cp_s = request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

int totalPage = (totalCnt/listSize)+1;

if(totalCnt%listSize==0){
	totalPage--;
}
int userGroup = cp/pageSize;
if(cp%pageSize==0){
	userGroup--;
}

String id2 = (String)session.getAttribute("user_id");
String nickname = (String)session.getAttribute("user_nickname");
%>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<form name="oneComment" action="oneComment_ok.jsp">
		<br>
		<fieldset id="title">
		<h1>요청 게시판</h1>
		</fieldset>
		<br>
			<fieldset id="one">
				<br>
				<div id="two">
					<table id="five" >
					<tr>
						<td colspan="2">
							<textarea id="oneComment" maxlength="300" rows="6" cols="103" name="oneComment" placeholder="여기에 요청 사항을 입력해주세요." required="required"></textarea>
						</td>
					</tr>
					<tr style="text-align:left">
						<td id="seven">
						<input type="text" name="name" size="15" required="required" placeholder="NAME" id="name">
						<input type="password" name="pwd" size="15" required="required" placeholder="PASSWORD" id="password">
						</td>
						<td colspan="2" id="submit">
						300자<input type="submit" value="등록" id="button">
						</td>
					</tr>
					</table>
				</div>
				<br>
				<br>
 					<% 
						ArrayList<oneCommentDTO> arr = odao.oneComment(cp, listSize);
 						
 						if(arr==null || arr.size()==0){
 							%>
 							<table>
 							<tr>
 								<td>
 								등록된 게시글이 없습니다.
 								</td>
 							</tr>
 							</table>
 							<%
 						}else{
 						for(int i=0; i<arr.size();i++){
 							%>
 							<br>
 								<table id="four">
 								<tr>
 									<th id="commentname"><%=arr.get(i).getName() %></th>
 									<td><input type="button" id="delbutton" value="삭제"  onclick="oneDel(<%=arr.get(i).getOne_idx()%>)"></td>
 									<td style="text-align:right;"><%=arr.get(i).getComment_date() %></td>
 								</tr>
 								</table>
 								<table id="three">
 								<tr>
 									<td>
 										<div style="word-break: break-all;"><%=arr.get(i).getOne_comment() %></div>
 										<br>
 									</td>
 								</tr>
 								<%
 								switch(arr.get(i).getOne_ok()){
 								case 0 : break;
 								case 1 : 
 								%>
 								<tr>
 								 	<td>&nbsp;&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;관리자 : 요청이 처리되었습니다.</td>
 								</tr>
 								<%
 								}
 								%>
 								<tr>
 								 	<td></td>
 								</tr>
 								<%	
 									if(id2==null||id2.equals("")){
 									}else if(id2.equals("admin")){
 								%>
 								<tr style="text-align:left;">
 									<td>
 										<select name="one_msg" id="one_msg">
 										<option value="1">요청이 처리되었습니다.</option>
 										</select>
 										<input type="button" value="답변" onclick="one_ok(document.getElementById('one_msg').value,<%=arr.get(i).getOne_idx()%>)">
 									</td>
 								</tr>
 								<%} %>
 								</table>

 							<%
 							}
 						}
					%>
					<br>
					<table id="six">
					<tr>
					<td>
				<% 
				if(userGroup!=0){
					%>
					<a href="oneComment.jsp?cp=<%= (userGroup-1)*pageSize+5 %>">&lt;&lt;</a>
					<% 
				}
				
				for(int i = (userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
					%>
					&nbsp;<a href="oneComment.jsp?cp=<%= i %>"><%= i %></a>&nbsp;	
					<% 
					if(i==totalPage){
						break;
					}
				}
				if(userGroup != totalPage/pageSize-(totalPage%pageSize==0?1:0) ){
					%>
					<a href="oneComment.jsp?cp=<%= (userGroup+1)*pageSize+1 %>">&gt;&gt;</a>
					<%
				}
				%>
					</td>
					</tr>
				</table>
				<br>
			</fieldset>
		</form>
	</article>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>