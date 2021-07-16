<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>

<jsp:useBean id="rmiDAO" class="project.recipe.recipe_modify_img.recipe_modify_imgDAO" scope="page"/>

<jsp:useBean id="rwimgDAO" class="project.recipe.recipe_write_img.recipe_write_imgDAO" scope="page"/>

<jsp:useBean id="rmDTO" class="project.recipe_modify.recipe_modifyDTO" scope="page"/>
<jsp:useBean id="rmDAO" class="project.recipe_modify.recipe_modifyDAO" scope="page"/>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
	try{
		String img_path=this.getServletContext().getRealPath("/") + "img\\recipe"; // img_path
		MultipartRequest mr=new MultipartRequest(request, img_path, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		int recipe_idx=Integer.parseInt(mr.getParameter("recipe_idx"));
		
		String recipe_img=rmiDAO.recipe_img(recipe_idx);
		String[] recipe_imgs=recipe_img.split("\\|");
		recipe_img=recipe_img+"|";
		
		String stepNum_s=mr.getParameter("stepNum_s");
		int stepNum=Integer.parseInt(stepNum_s);
		for(int i=recipe_imgs.length; i<stepNum+1 ; i++){
			File upfile_i = mr.getFile("file_"+i);
			String img_name_i=upfile_i.getName(); // img_name
			String img_extension_i=upfile_i.getName().substring(upfile_i.getName().lastIndexOf('.')); // img_extension
			
			int img_idx_i=rwimgDAO.imgSave(img_name_i, img_extension_i, "/project/img/recipe/");
			
			File newFile_i = new File(img_path + "\\" + img_idx_i + img_extension_i);
			upfile_i.renameTo(newFile_i); 
			newFile_i.createNewFile();
			recipe_img=recipe_img+img_idx_i+"|";
		}
		recipe_img=recipe_img.substring(0,recipe_img.length()-1);
		
		String recipe_step="";
		String recipe_material="";
		for(int i=1 ; i<stepNum+1 ; i++){
			recipe_step=recipe_step+mr.getParameter("recipe_step_"+i)+"|";
		}
		recipe_step=recipe_step.substring(0,recipe_step.length()-1);
		
		for(int i=1 ; i<6 ; i++){
			
			if("".equals(("recipe_material_"+i)) || "recipe_material_"+i==null){
			}
			else{
				recipe_material+=mr.getParameter("recipe_material_"+i)+"|";
			}
		}
		recipe_material=recipe_material.substring(0,recipe_material.length()-1);
		
		rmDTO.setRecipe_category(mr.getParameter("recipe_category"));
		rmDTO.setRecipe_title((mr.getParameter("recipe_title")));
		rmDTO.setRecipe_img(recipe_img);
		rmDTO.setRecipe_simple_comment((mr.getParameter("recipe_simple_comment")));
		rmDTO.setRecipe_material(recipe_material);
		rmDTO.setRecipe_step(recipe_step);
		rmDTO.setRecipe_time_s(Integer.parseInt((mr.getParameter("recipe_time_s"))));
		rmDTO.setRecipe_time_a(Integer.parseInt((mr.getParameter("recipe_time_a"))));
		rmDTO.setRecipe_price(Integer.parseInt((mr.getParameter("recipe_price"))));
		
		int result=rmDAO.recipeModify(rmDTO, recipe_idx);

		%>
		<script type="text/javascript">
			<%
				if(result>0){
					%>
					alert("글 수정 성공");
					<%
				}
				else{
					%>
					alert("~~글 수정 실패~~");
					<%
				}
			%>
			location.href="recipe_main.jsp";
		</script>
		<%
	}
	catch(Exception e){
		%>
			<script type="text/javascript">
				alert("글 수정 실패");
				location.href="recipe_main.jsp";
			</script>
		<%
	}
	%>
</body>
</html>