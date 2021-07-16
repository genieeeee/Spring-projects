<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="project.comment.*"%>
<jsp:useBean id="cdao" class="project.comment.CommentDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
#td4{
	background:#218559;
}
#com_table {
	width:800px;
	margin:0px auto;	
	text-align:center;
	color: black;
	border:1px solid #999;
	border-radius:8px;
}
#com_table2{
	margin:0px auto;
	width:800px;
/* 	height:200px; */
	border-spacing:0px;
/* 	border-top:1px solid silver; */
	border-bottom:1px solid silver;
	border-radius: 8px;
}
#com_tr{
	height:30px;
/* 	border-top:1px soiid silver;
	border-bottom:1px solid silver; */
}
#writeid{
	width:50px;
	height:30px;
	border:0px;
	border-radius:10px;
	background-color: #268463;
	cursor:pointer;
	color:#ffffff;;
	outline: 0;
}
tbody{
	text-align: center;
}
tbody td{
	height:40px;
}
thead{
	background: #ededed;
}
#com_table2 a{
	text-decoration:none;
	color: black;	
}
#com_table2 a:hover{
	text-decoration: underline;
}
#paging a{
	color:black;
	text-decoration: none; 	
	font-weight: bold;
}
#paging a:hover{
	text-decoration: underline;
}
</style>
</head>
<%
	int totalCnt = cdao.getTotalCnt();
	int listSize = 10;
	int pageSize = 5;

	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}
	int cp = Integer.parseInt(cp_s);

	int totalPage = (totalCnt / listSize) + 1;
	if (totalCnt % listSize == 0) {
		totalPage--;
	}

	int userGroup = cp / pageSize;
	if (cp % pageSize == 0) {
		userGroup--;
	}
%>
<body>
<%@include file="../header.jsp" %>
<section>
<br>
<table id="com_table">
	<tr>
		<th align="right" width="100"><img src="../img/comment/main.PNG" height="180" width="180"></th>
		<th align="left">			
			<h1 style="font-size: 50px; margin-bottom: 0px;">게시판</h1>
			<h6 style="margin-top: 0px;">
				고객님의 소중한 후기가 여러 회원님들께 도움이 됩니다.<br>
				게시물에 적합하지 않은 글은 관리자 판단하에 삭제 될 수도 있습니다.
			</h6>
		</th>
	</tr>
</table>
<br>
<table id="com_table2">
	<thead align="center">
	<tr>
		<th id="com_tr" style="width:50px;">번호</th>
		<th id="com_tr" style="width:150px;">글쓴이</th>
		<th id="com_tr">제목</th>
		<th id="com_tr" style="width:120px;">등록일</th>
		<th id="com_tr" style="width:50px;">조회</th>
	</tr>
	</thead>
	
	<tbody>
	<%
ArrayList<CommentDTO> arr = cdao.commentMain(cp, listSize);
	if(arr==null||arr.size()==0){
           %>
           <tr>
               <td colspan="5" align="center">등록된 글이 없습니다.</td>
           </tr>
           <%
	}else{
		for(int i=0;i<10;i++){
			String n_m_t=null; //notice_main_title
			 if(arr.size()<=i){
				 %>
				<tr>										
					<td align="left">&nbsp;</td>
					<td align="center">&nbsp;</td>
					<td align="center">&nbsp;</td>
					<td	align="center">&nbsp;</td>										
				</tr>
				 <%
			 }else{

				if(arr.get(i).getComment_title().length()>20){
					n_m_t=arr.get(i).getComment_title().substring(0,20)+"  . .";
				}else{
					n_m_t=arr.get(i).getComment_title();
				}
				
				%>
				<tr>										
					<td><%=arr.get(i).getComment_idx()%></td>
		<td> 
		<%String nickname=cdao.getUser(arr.get(i).getUser_idx()); %> <%=nickname %></td>
		<td style="text-align:left;"><a href="comment.jsp?idx=<%=arr.get(i).getComment_idx()%>"><%=arr.get(i).getComment_title()%> [<%=cdao.re_commentCount(arr.get(i).getComment_idx()) %>]</a></td>
		<td><%=arr.get(i).getComment_date()%></td>
		<td><%=arr.get(i).getComment_readnum()%></td>									
				</tr>
				<%
			 }
		}								
	}
%>
	</tbody>
</table>
<br>
<table align="center" style="height:90px; width: 800px;">
<tr>
	<th align="right" colspan="2">
		<a href="comment_write.jsp"><input type="button" value="글쓰기" id="writeid"></a>
	</th>
</tr>
<tr>
	<th align="center" style="width: 600px;" colspan="2"  id="paging">
<%
		if (userGroup != 0) {
%> 
			<a href="comment_main.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
<%
		}
		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
%> 
			&nbsp;&nbsp;<a href="comment_main.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
<%
			if (i == totalPage) {
				break;
			}
		}
		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
%> 
			<a href="comment_main.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
<%
			}
%>
	</th>
<!-- 	<th align="right">
		<a href="comment_write.jsp"><input type="button" value="글쓰기" id="writeid"></a>
	</th> -->
</tr>
</table>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>















