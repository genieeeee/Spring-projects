<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="project.notice.*" %>
    
<jsp:useBean id="notice_dao" class="project.notice.NoticeDAO" scope="session"/> 

<%
	int notice_idx=Integer.parseInt(request.getParameter("notice_idx"));

	int result=notice_dao.notice_delete(notice_idx);
	
	if(result>0){
		%>
		<script>
			window.alert('공지글 삭제 완료!');		
			window.self.close();
			location.href='notice_main.jsp';
			
		</script>
		<%
	}else{
		%>
		<script>
			window.alert('공지글 삭제 실패!');				
			window.self.close();
			opener.location.href='notice_content.jsp?notice_idx=<%=notice_idx%>';
			
		</script>
		<%
	}

%>