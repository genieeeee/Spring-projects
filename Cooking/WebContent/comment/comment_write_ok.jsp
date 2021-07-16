<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cdto" class="project.comment.CommentDTO"/>
<jsp:useBean id="cdao" class="project.comment.CommentDAO"/>

<%@ page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>
<jsp:useBean id="rwimgDAO" class="project.recipe.recipe_write_img.recipe_write_imgDAO" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3{
	text-align:center;
}
div{
	text-align:right;
}
</style>
</head>
<body>
	<%
		try{
			String img_path=this.getServletContext().getRealPath("/") + "img\\comment"; // img_path
			MultipartRequest mr=new MultipartRequest(request, img_path, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			
			int img_idx=0;
			String comment_content = mr.getParameter("comment_content");
			String[] contents=comment_content.split("\\|");
			if(contents.length>1){
				File upfile = mr.getFile("comment_img");
				String img_name=upfile.getName(); // img_name
				String img_extension=upfile.getName().substring(upfile.getName().lastIndexOf('.')); // img_extension
				
				img_idx=rwimgDAO.imgSave(img_name, img_extension, "/project/img/comment/");
				
				File newFile = new File(img_path + "\\" + img_idx + img_extension);
				upfile.renameTo(newFile); 
				newFile.createNewFile();
				
				for(int i=0 ; i<contents.length ; i++){
					if("img".equals(contents[i])){
						contents[i]=";"+Integer.toString(img_idx);
					}
				}
				comment_content="";
				for(int i=0 ; i<contents.length ; i++){
					comment_content=comment_content+contents[i]+"|";
				}
				comment_content=comment_content.substring(0, comment_content.length()-1);
			}
			
			int user_idx=(Integer)session.getAttribute("user_idx");
			String comment_title = mr.getParameter("comment_title");
			String comment_category=mr.getParameter("comment_category");
			
			int result = cdao.Comment_write(user_idx, comment_category, comment_title, comment_content, img_idx);
			String msg = result>0?"후기작성이 완료되었습니다.":"후기작성을 실패하였습니다.";
			
			if(result>0){
				%>
				<script>
				window.alert('<%=msg %>');
				location.href='comment_main.jsp';
				</script>
				<%
			}else{
				%>
				<script>
				window.alert('<%=msg %>');
				location.href='comment_write.jsp';
				</script>
				<%
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>