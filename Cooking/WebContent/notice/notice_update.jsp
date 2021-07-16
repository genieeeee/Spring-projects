<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    request.setCharacterEncoding("UTF-8");
%>   
<%@page import="project.notice.*" %>
<%@page import="java.text.SimpleDateFormat" %>

<jsp:useBean id="notice_dao" class="project.notice.NoticeDAO" scope="session"/>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	
	<link rel="stylesheet" type="text/css"  href="../css/mainLayout.css">
	<link rel="stylesheet" type="text/css"  href="../css/notice_main.css">
	<link rel="stylesheet" type="text/css"  href="../css/notice_content.css">
	<link rel="stylesheet" type="text/css"  href="../css/notice_update.css">
	
	<%
			String notice_idx=request.getParameter("notice_idx");
			
			if(notice_idx==null||notice_idx.equals("")){
				notice_idx="0";
			}
			int idx=Integer.parseInt(notice_idx);
			
			NoticeDTO update_result=notice_dao.noticeContent(idx);
			
			if(update_result==null){
				%>
				<script>
					window.alert('존재하지 않는 게시물입니다.');
					window.self.close();
					location.href='notice_main.jsp';	
				</script>		
				<%	
			}

	%>
</head>
<body>
	<%@include file="/header.jsp" %>
	<form name="notice_update" action="notice_update_ok.jsp">
	<section id="notice_section">
		<br><br>
		<article id="noti_arti1">	
			<br>
			<table id="notice_table" cellspacing="0"  >
					<thead id="notice_table_thead">
					 	<tr height="60">
							<td id="h_thead_td1"><h2 align="left" ><a href="notice_main.jsp" id="atag" >공지사항</a></h2></td>
							<td id="notice_table_thead_td"></td>
						</tr>
					</thead >
				
					<tbody id="notice_table_tbody"  >
						<tr>
							<td id="n_tbody_td1"><img src="../img/index/공지사항.PNG" width="95" height="100"></td>
							<td id="n_tbody_td2"><font size="3">요리의 서비스 공지 소식과, 신규 서비스, 장애 예고, 이벤트 관련등</font><h2>서비스 안내 사항을 전해드립니다.</h2><font size="2">앞으로도 더욱 많은 관심 부탁드려요</font>
						</tr>
					</tbody>	
			</table>
		</article>	
		<br>
			<article>
				<br>
				<table id="notice_content" cellspacing="0"  >
						<tr  height="55"  id="n_c_tr" >
							<td id="u_n_t" colspan="3"><input type="text" name="notice_title" value="<%=update_result.getNotice_title()%>" size="110" style="height:40px;"></td>
						</tr>			
						<tr id="n_c_tr2">
							<td width="5"></td>
							<td width="5"></td>
							<td  id="n_c_td" colspan="2" height="25">&nbsp;&nbsp;<%=update_result.getNotice_writer()%>  |  조회  <%=update_result.getNotice_readnum() %></td>
							<input type="hidden" name="notice_writer" value="<%=update_result.getNotice_writer() %>">
							<input type="hidden" name="notice_readnum" value="<%= update_result.getNotice_readnum()%>">
						</tr>						
						<tr >
							<td id="c" colspan="4" align="center"><textarea cols="114" rows="30"  name="notice_content"><%=update_result.getNotice_content()%></textarea></td>
						</tr>	
							<input type="hidden" name="notice_idx" value="<%=update_result.getNotice_idx()%>">
				</table>
				<table id="c_b" >
					<tr align="right">
						<td>
							<a href="notice_main.jsp"><input type="button" value="목록" id="b" ></a>
							<input type="submit" value="수정" id="b">
							<input type="reset" value="다시" id="b">
						</td>
					</tr>
				</table>
			</article>
	</section>
	</form>
	<%@include file="/footer.jsp" %>
</body>
</html>