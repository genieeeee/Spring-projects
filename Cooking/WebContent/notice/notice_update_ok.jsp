<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="notice_dao" class="project.notice.NoticeDAO" scope="session"/>
	
	<%
	    int idx=Integer.parseInt(request.getParameter("notice_idx"));
		String title= request.getParameter("notice_title");
		String content=request.getParameter("notice_content");
		int result=notice_dao.notice_update(idx,title,content);
		
		if(result>0){
			%>
			<script>
				window.alert('공지글 수정 완료!');		
				window.self.close();
				location.href='notice_main.jsp';				
			</script>
			<%
		}else{
			%>
			<script>
				window.alert('공지글 수정 실패!');				
				window.self.close();
				opener.location.href='notice_update.jsp?notice_idx=<%=idx%>&notice_title=<%=title%>&notice_writer=<%=request.getParameter("notice_writer")%>&notice_readnum=<%=request.getParameter("notice_readnum") %>&notice_content=<%=content%>';				
			</script>
			<%
		}
	
	%>
