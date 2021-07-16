<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    request.setCharacterEncoding("UTF-8");
 %>   
<%@page import="project.notice.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>

<jsp:useBean id="notice_dao" class="project.notice.NoticeDAO" scope="session"/>
<jsp:useBean id="udao" class="project.user.UserDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	
	<link rel="stylesheet" type="text/css"  href="../css/mainLayout.css">
	<link rel="stylesheet" type="text/css"  href="../css/notice_main.css">
	<link rel="stylesheet" type="text/css"  href="../css/notice_content.css">
	
		<%		//내용 가져오기
				String notice_idx=request.getParameter("notice_idx");
				
				if(notice_idx==null||notice_idx.equals("")){
					notice_idx="0";
				}
				int idx=Integer.parseInt(notice_idx);
				
				NoticeDTO result=notice_dao.noticeContent(idx);
				
				if(result==null){
					%>
					<script>
						window.alert('존재하지 않는 게시물입니다.');
						window.self.close();
						location.href='notice_main.jsp';	
					</script>		
					<%	
				}
				//날짜
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd HH:mm");
				
				//윗글 아랫글			
				ArrayList<Integer> up_down_result=notice_dao.notice_up_down(idx);
				
				
		%>
		<script>
		function up_down_content(idx){
			if(idx==-1){
				window.alert('글 없음');				
			}else{
				location.href='notice_content.jsp?notice_idx='+idx;
			}
			
		}
		
		</script>
</head>
<body>
	<%@include file="/header.jsp" %>
	<form>
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
							<td width="5"></td>
							<td id="n_t" colspan="2"><%=result.getNotice_title()%></td>
							<td id="n_t2" ><%=sdf.format(result.getNotice_date())%></td>
						</tr>
						
						<tr id="n_c_tr2">
							<td width="5"></td>
							<td width="5"></td>
							<td  id="n_c_td" colspan="2" ><%=result.getNotice_writer()%>  |  조회  <%=result.getNotice_readnum() %></td>
						</tr>
						
						<tr >
							<td id="content_td" colspan="4" align="center"><textarea cols="110" rows="30" readonly id="noti_con_textarea"><%=result.getNotice_content()%></textarea></td>
						</tr>	
				</table>
				<br>
				<table id="c_b" >
					<tr align="right">
						<td>
							<% 
							    	if(up_down_result.size()==1){
										up_down_result.set(0,-1);
										
										
									}else if(up_down_result.size()==2){
											if(up_down_result.get(0)==idx){
												up_down_result.set(0,-1);							
											}else{
												up_down_result.set(1,-1);												
											}
									}		
									%>
									<input type="button"  value="목록"  id="b"  onclick=" location.href='notice_main.jsp'">	
									<input type="button"  value="윗글"  id="b"  onclick="up_down_content(<%=up_down_result.get(0)%>)">
									<input type="button"  value="아랫글"  id="b"  onclick="up_down_content(<%=up_down_result.get(up_down_result.size()-1)%>)">	
									<%																		
									    	if(session.getAttribute("user_id")==null||session.getAttribute("user_id").equals("")){
									    		
									    	}else if(session.getAttribute("user_id").equals("admin")){
									    	%>
										    <input type="button"  value="수정"  id="b"   onclick=" location.href='notice_update.jsp?notice_idx=<%=result.getNotice_idx()%>' ">
										    <input type="button"  value="삭제"  id="b" onclick=" location.href='notice_delete.jsp?notice_idx=<%=result.getNotice_idx()%>' ">
										    <%
											}	
							    %>	
						</td>
					</tr>
				</table>
			</article>
		</section>
	</form>	
	<%@include file="/footer.jsp" %>
</body>
</html>