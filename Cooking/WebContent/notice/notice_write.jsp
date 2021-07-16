<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cooking</title>
	<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	
		<link rel="stylesheet" type="text/css"  href="../css/mainLayout.css">
		<link rel="stylesheet" type="text/css"  href="../css/notice_write.css">
		<%
	
			String notice_title=null;
			String notice_content=null;
			
			String user_id=(String)session.getAttribute("user_id");
			if(user_id==null || "".equals(user_id) && !"0".equals(user_id)){
				%>
				<script type="text/javascript">
					alert("작성 할 수 없습니다.");
					location.href="/project/index.jsp";
				</script>
				<%
			}
			
		 	if(request.getParameter("notice_title")==null||request.getParameter("notice_title").equals("")){
				notice_title="";
			}
		 	else{
		 		notice_title=request.getParameter("notice_title");
		 	}
			if(request.getParameter("notice_content")==null||request.getParameter("notice_content").equals("")){
				notice_content="";
			}else{
				notice_content=request.getParameter("notice_content");
			}
		%>
</head>

<body>
<%@include file="../header.jsp" %>
<section>
	<article>
	<br><br>
	<fieldset>
		<form name="notice_write" action="notice_write_ok.jsp" method="post"  onsubmit="return writeSave()">		
			<table cellspacing="0"  id="noti_w_t">
				<caption><h1 id="table_cap2"><img src="../img/notice/후기작성아이콘2.PNG" width="55" height="55">공지사항 작성</h1></caption>
				<tr>
					<!-- <td id="notice_w_td1" >제목</td> -->
					<td><input type="text"  name="notice_title" size="115"   value="<%=notice_title %>"   required="required" placeholder="제목을 입력해주세요."></td>		
				</tr>				
				 <tr>
				 	<!-- <td id="notice_w_td2" >내용</td> -->
					<td colspan="2"><textarea name="notice_content" rows="35" cols="120"    required="required" placeholder="  내용을 입력해주세요."><%=notice_content%></textarea></td>
				 </tr>		 
				 <tr align="right" width="650">
				 		<td colspan="2" >
				 			<a href="notice_main.jsp"><input type="button" value="목록" id="b"></a>
				 			<input type="submit"  value="등록" id="b">
				 			<input type="reset"  value="재작성" id="b">
				 		</td>
				 </tr>
			</table>			
		</form>
		</fieldset>
	</article>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>