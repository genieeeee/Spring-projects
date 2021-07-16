<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.File"%>
<%@ page import="project.recipe.view_img.*"%>

<jsp:useBean id="vimgDAO" class="project.recipe.view_img.view_imgDAO" scope="page"/>
<jsp:useBean id="rwimgDAO" class="project.recipe.recipe_write_img.recipe_write_imgDAO" scope="page"/>
<jsp:useBean id="rmimgDAO" class="project.recipe.recipe_modify_img.recipe_modify_imgDAO" scope="page"/>

<%
	String recipe_idx_s=request.getParameter("recipe_idx");
	int recipe_idx=Integer.parseInt(recipe_idx_s);
	String[] recipe_imgs=rmimgDAO.recipe_img(recipe_idx).split("\\|");
	String imgNums_s=request.getParameter("img_num");
	int imgNums=Integer.parseInt(imgNums_s);
	int img_idx=Integer.parseInt(recipe_imgs[imgNums]);
	
	/**실제로 삭제*/
	view_imgDTO viDTO=vimgDAO.view_img(img_idx);
	String tempPath=this.getServletContext().getRealPath("/");
	File del_img=new File(tempPath + "img/recipe/" + viDTO.getImg_idx() + viDTO.getImg_extension());
	del_img.delete();
	
	/**DB에서 삭제*/
	rmimgDAO.imgDel(img_idx);

	/**바뀔 이미지*/
	try{
		String img_path=this.getServletContext().getRealPath("/") + "img/recipe"; // img_path
		MultipartRequest mr=new MultipartRequest(request, img_path, 1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		File upfile = mr.getFile("change_File");
		String img_name=upfile.getName(); // img_name
		String img_extension=upfile.getName().substring(upfile.getName().lastIndexOf('.')); // img_extension
		
		int change_img_idx=rwimgDAO.imgSave(img_name, img_extension, "/project/img/recipe/");
		
		File newFile = new File(img_path + "\\" + change_img_idx + img_extension);
		upfile.renameTo(newFile); 
		newFile.createNewFile();
		
		String change_img_idxs=Integer.toString(change_img_idx);
		
		/**recipe DB 수정*/
		for(int i=0 ; i< recipe_imgs.length ; i++){
			if(img_idx==Integer.parseInt(recipe_imgs[i])){
				recipe_imgs[i]=change_img_idxs;
			}
		}
		
		String recipe_img="";
		for(int i=0 ; i<recipe_imgs.length ; i++){
			if(i==recipe_imgs.length-1){
				recipe_img=recipe_img+recipe_imgs[i];
			}
			else{
				recipe_img=recipe_img+recipe_imgs[i]+"|";
			}
		}
		rmimgDAO.modify_recipe_img(recipe_img, recipe_idx);

	%>
	<script>
		alert('이미지 수정 완료');
		<%
			viDTO=vimgDAO.view_img(change_img_idx);
			if(imgNums==0){
				%>opener.document.getElementById("img_main").src="<%=viDTO.getImg_path()+viDTO.getImg_idx()+viDTO.getImg_extension()%>";<%
			}
			else{
				%>opener.document.getElementById("img_<%=imgNums%>").src="<%=viDTO.getImg_path()+viDTO.getImg_idx()+viDTO.getImg_extension()%>";<%
			}
		%>
		window.self.close();
	</script>
	<%
	}
	catch(Exception e){
	}
%>