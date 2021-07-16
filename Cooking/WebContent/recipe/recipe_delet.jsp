<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.getAttribute("UTF-8"); %>
<%@ page import="java.io.File"%>
<%@ page import="project.recipe_modify.*" %>
<%@ page import="project.recipe.view_img.*"%>

<jsp:useBean id="vimgDAO" class="project.recipe.view_img.view_imgDAO" scope="page"/>
<jsp:useBean id="rdDAO" class="project.recipe.recipe_delet.recipe_deletDAO" scope="page" />
<jsp:useBean id="rmDAO" class="project.recipe_modify.recipe_modifyDAO" scope="page"/>

<%
	String recipe_idx_s=request.getParameter("recipe_idx");
	if(recipe_idx_s==null || "".equals(recipe_idx_s)){
		recipe_idx_s="-1";
	}
	int recipe_idx=Integer.parseInt(recipe_idx_s);
	
	recipe_modifyDTO rmDTO=rmDAO.showRecipe(recipe_idx);
	
	/**권한 검사*/
	int write_user_idx=rmDTO.getUser_idx();
	int login_user_idx=-1;
	if(session.getAttribute("user_idx")==null || "".equals(session.getAttribute("user_idx"))){
	}
	else{
		login_user_idx=(Integer)session.getAttribute("user_idx");
	}
	
	String msg="";
	if(login_user_idx!=write_user_idx && login_user_idx!=0){
		%>
		<script>
			alert("권한이 없습니다.");
			location.href="recipe_view.jsp?recipe_idx=<%=recipe_idx%>&recipe_category=<%=rmDTO.getRecipe_category()%>";
		</script>
		<%
	}
	else{
		/**실제로 파일 삭제*/
		String[] recipe_imgs=rdDAO.imgs(recipe_idx).split("\\|");
		for(int i=0 ; i<recipe_imgs.length ; i++){
			view_imgDTO viDTO=vimgDAO.view_img(Integer.parseInt(recipe_imgs[i]));
			String tempPath=this.getServletContext().getRealPath("/");
			File del_img=new File(tempPath + "img/recipe/" + viDTO.getImg_idx() + viDTO.getImg_extension());
			del_img.delete();
		}
		
		int result=rdDAO.recipeDelet(recipe_idx);
		msg=result>0?"삭제 성공":"~~삭제 실패~~";
	}
	
%>
<script>
	alert("<%=msg%>");
	location.href="recipe_main.jsp";
</script>
