<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>

<jsp:useBean id="rwDTO" class="project.recipe.recipe_write.recipe_writeDTO" scope="page"/>
<jsp:useBean id="rwDAO" class="project.recipe.recipe_write.recipe_writeDAO" scope="page"/>

<jsp:useBean id="rwimgDAO" class="project.recipe.recipe_write_img.recipe_write_imgDAO" scope="page"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
	
	//String stepNum_s=request.getParameter("stepNum_s");
	
	String recipe_img="";
	
	try{
		String img_path=this.getServletContext().getRealPath("/") + "img\\recipe"; // img_path
		MultipartRequest mr=new MultipartRequest(request, img_path, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		File upfile = mr.getFile("recipe_img");
		String img_name=upfile.getName(); // img_name
		String img_extension=upfile.getName().substring(upfile.getName().lastIndexOf('.')); // img_extension
		
		int img_idx=rwimgDAO.imgSave(img_name, img_extension, "/project/img/recipe/");
		
		recipe_img=recipe_img + img_idx + "|";
		
		File newFile = new File(img_path + "\\" + img_idx + img_extension);
		upfile.renameTo(newFile); 
		newFile.createNewFile();
		
		
		String stepNum_s=mr.getParameter("stepNum_s");
		int stepNum=Integer.parseInt(stepNum_s);
		String recipe_step="";
		for(int i=1 ; i<stepNum+1 ; i++){
			File upfile_i = mr.getFile("file_"+i);
			String img_name_i=upfile_i.getName(); // img_name
			String img_extension_i=upfile_i.getName().substring(upfile_i.getName().lastIndexOf('.')); // img_extension
			
			int img_idx_i=rwimgDAO.imgSave(img_name_i, img_extension_i, "/project/img/recipe/");
			
			File newFile_i = new File(img_path + "\\" + img_idx_i + img_extension_i);
			upfile_i.renameTo(newFile_i); 
			newFile_i.createNewFile();
			
			if(i==stepNum){
				recipe_step=recipe_step+mr.getParameter("recipe_step_"+i);
				recipe_img=recipe_img + img_idx_i;
			}
			else{
				recipe_step=recipe_step+mr.getParameter("recipe_step_"+i)+"|";
				recipe_img=recipe_img + img_idx_i + "|";
			}
		}
		
		String recipe_material="";
		for(int i=1 ; i<6 ; i++){
			if("".equals(("recipe_material_"+i)) || "recipe_material_"+i==null){
			}
			else{
				recipe_material+=mr.getParameter("recipe_material_"+i)+"|";
			}
		}
		recipe_material=recipe_material.substring(0,recipe_material.length()-1);
		
		rwDTO.setUser_idx((Integer)session.getAttribute("user_idx"));
		rwDTO.setRecipe_category(mr.getParameter("recipe_category"));
		rwDTO.setRecipe_title((mr.getParameter("recipe_title")));
		rwDTO.setRecipe_img(recipe_img);
		rwDTO.setRecipe_simple_comment((mr.getParameter("recipe_simple_comment")));
		rwDTO.setRecipe_material(recipe_material);
		rwDTO.setRecipe_step(recipe_step);
		rwDTO.setRecipe_time_s(Integer.parseInt((mr.getParameter("recipe_time_s"))));
		rwDTO.setRecipe_time_a(Integer.parseInt((mr.getParameter("recipe_time_a"))));
		rwDTO.setRecipe_price(Integer.parseInt((mr.getParameter("recipe_price"))));
		
		int result=rwDAO.recipeWrite(rwDTO);
		%>
		<script type="text/javascript">
			<%
				if(result>0){
					%>
					alert("글 작성 성공");
					<%
				}
				else{
					%>
					alert("~~글 작성 실패~~");
					<%
				}
			%>
			location.href="recipe_main.jsp";
		</script>
		<%
	}
	catch(Exception e){
		e.printStackTrace();
		%>
			<script type="text/javascript">
				alert("글쓰기 실패");
				location.href="recipe_main.jsp";
			</script>
		<%
	}
	%>
</body>
</html>