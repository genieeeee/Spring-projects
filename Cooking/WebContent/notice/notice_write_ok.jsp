<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("UTF-8");
	%>

	<jsp:useBean id="notice_dao" class="project.notice.NoticeDAO" scope="session"/>
	
	<%
		String notice_title=request.getParameter("notice_title");
		String notice_content=request.getParameter("notice_content");
		
		if(notice_title==null||notice_title.equals("")||notice_content==null||notice_content.equals("")){
			%>
			<script>
				window.alert('내용을 모두 입력해주세요');
				window.self.close();
				location.href='notice_write.jsp?notice_title=<%=notice_title%>&notice_content=<%=notice_content%>';	
			</script>		
			<%
		}else{
			
			int notice_write_result=notice_dao.notice_write(notice_title,notice_content);
			
			if(notice_write_result>0){
				%>
				<script>
					window.alert('공지사항 글 등록 성공')
					window.self.close();
					location.href='notice_main.jsp';
				</script>
				<%
			}else{
				%>
				<script>
					window.alert('공지사항 글 등록 실패!')
					window.self.close();
					location.href='notice_main.jsp';
				</script>
				<%
				
			}
			
		}
	
	%>