<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>

<%@page import="project.notice.*" %> 

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
	

	<%
			int totalCnt=notice_dao.getTotalCnt(); 		//총 게시물 수
			int listSize=7;											//보여줄 글 수
			int pageSize=2;										//보여줄 페이지 수
			
			String cp_s=request.getParameter("cp");
			if(cp_s==null||cp_s.equals("")){
				cp_s="1";
			}
			int cp=Integer.parseInt(cp_s);
			
			int totalPage=(totalCnt/listSize)+1;			//전체 페이지 수			
			if(totalPage%listSize==0)totalPage--;
			
			int userGroup=cp/pageSize;
			if(cp%pageSize==0)userGroup--;
			
			
					
	%>
	</head>
	<body>
	<%@include file="/header.jsp" %>
	
	<section id="notice_section">
	<br><br>
		<article id="noti_arti1">	
			<br>
			<table id="notice_table" cellspacing="0"  >
					<thead id="notice_table_thead">
					 	<tr height="60">
							<td id="h_thead_td1"><h2 align="left" ><a href="notice_main.jsp" id="atag" >공지사항</a></h2></td>
							
							<%
									if(session.getAttribute("user_id")==null||session.getAttribute("user_id").equals("")){
										 %>
										<td id="notice_table_thead_td"></td>
										<% 
									}else if(session.getAttribute("user_id").equals("admin")){
										%>
										<td id="notice_table_thead_td"><a href="notice_write.jsp"><input type="button" value="작성"></a></td>					
										<%									
									}else{
										%>
										<td id="notice_table_thead_td"></td>
										<% 
									}
							%>
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
			<table id="notice_list"  cellspacing="0" >
				<caption><h1 style="font-weight:lighter; text-align:left">게시글 | 총 <%=totalCnt %> 건 </h1></caption>
				<thead>
					<tr align="center" id="noti_list_tr1">					
						<td  >제목</td>
						<td  width="70">작성자</td>
						<td  width="50">조회수</td>
						<td  width="100">날짜</td>			
					</tr>
				</thead>
				<tbody id="noti_list_tbody">
					<%
							ArrayList<NoticeDTO> list_notice=notice_dao.noticeList(cp, listSize);
							if(list_notice==null||list_notice.size()==0){
					            %>
					            <tr>
					                 <td colspan="5" align="center">공지사항 글이 없습니다.</td>

					            </tr>
					            <%
							}else{
								for(int i=0;i<7;i++){
									String n_m_t=null; //notice_main_title
									 if(list_notice.size()<=i){
										 %>
										<tr>										
											<td align="left">&nbsp;</td>
											<td align="center">&nbsp;</td>
											<td align="center">&nbsp;</td>
											<td align="center">&nbsp;</td>										
										</tr>
										 <%
									 }else{

										if(list_notice.get(i).getNotice_title().length()>20){
											n_m_t=list_notice.get(i).getNotice_title().substring(0,18)+"  . .";
										}else{
											n_m_t=list_notice.get(i).getNotice_title();
										}
										
										%>
										<tr>										
											<td align="left">&nbsp;&nbsp;<a href="/project/notice/notice_content.jsp?notice_idx=<%=list_notice.get(i).getNotice_idx()%>" id="list_title2" ><%=n_m_t%></a></td>
											<td align="center"><%=list_notice.get(i).getNotice_writer() %></td>
											<td align="center"><%=list_notice.get(i).getNotice_readnum()%></td>
											<td	align="center"><%=list_notice.get(i).getNotice_date() %></td>										
										</tr>
										<%
									 }
								}								
							}
					%>
				</tbody>
				<tfoot id="noti_list_tfoot">
					<tr>
						<td colspan="5" align="center" height="100">
						<%
							if(userGroup!=0){
								%>
								<a href="notice_main.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>" id="page">&lt;</a>
								<%
							}
							for(int i=(userGroup*pageSize+1);i<(userGroup*pageSize+1)+pageSize;i++){
								%>
								&nbsp;&nbsp;<a href="notice_main.jsp?cp=<%=i%>" id="page"><%=i%></a>&nbsp;&nbsp;
								<%
								if(i==totalPage)break;
							}
							if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
								%>	
								<a href="notice_main.jsp?cp=<%=(userGroup+1)*pageSize+1%>" id="page">&gt;</a>
								<%
							}
						%>
						</td>
					</tr>
				</tfoot>
			</table>
			<br>
<!-- 			<table id="notice_table2" border="1" align="center" width="700">
				<tr>
					<td align="center"><a href="../index.jsp" style="text-decoration:none;color:black;">홈</a></td>
				</tr>
			</table> -->	
		</article>
	</section>
	
	<%@include file="/footer.jsp" %>
	</body>
</html>