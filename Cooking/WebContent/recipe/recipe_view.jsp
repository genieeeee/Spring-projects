<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.util.ArrayList"%>
<%@ page import="project.recipe.view.*" %>
<%@ page import="project.recipe.view_img.*" %>
<jsp:useBean id="rvDAO" class="project.recipe.view.recipe_viewDAO" scope="page"/>
<jsp:useBean id="viDAO" class="project.recipe.view_img.view_imgDAO" scope="page"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cooking</title>
	<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	
	<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
	<link rel="stylesheet" type="text/css" href="../css/recipe_view.css">
	
	<style>
		#td2{
			background:#218559;
		}
	</style>
</head>
<body>
	<%
		String recipe_idx_s=request.getParameter("recipe_idx");
		int recipe_idx=0;
		if(recipe_idx_s==null || "".equals(recipe_idx_s)){
		}
		else{
			recipe_idx=Integer.parseInt(recipe_idx_s);
		}
		recipe_viewDTO rvDTO=rvDAO.recipe_view(recipe_idx);
		
		String recipe_category=request.getParameter("recipe_category");
				
		if(rvDTO==null || (!"한식".equals(recipe_category) && !"중식".equals(recipe_category)  && !"양식".equals(recipe_category)  && !"일식".equals(recipe_category)  && !"야식".equals(recipe_category)  && !"기타".equals(recipe_category) ) ){
			%>
				<script type="text/javascript">
					alert("레시피가 삭제되거나 잘못된 접근입니다.");
					 location.href="http://localhost:9090/project/recipe/recipe_main.jsp";
				</script>
			<%
			 return;
		}
		
		String[] imgs=rvDTO.getRecipe_img().split("\\|");
		String[] steps=rvDTO.getRecipe_step().split("\\|");
	%>
	<%@include file="../header.jsp" %>
	
	<article id="viewArticle">
		<section id="viewSection">
			<h2 id="viewH2"><%=rvDTO.getRecipe_title() %></h2>
			<h4 id="categoryh4">[<%=rvDTO.getRecipe_category() %>]</h4>
			<% view_imgDTO idto0=viDAO.view_img(Integer.parseInt(imgs[0])); %>
			<div id="imgDiv">
				<img src="/project/img/recipe/<%=idto0.getImg_idx() + idto0.getImg_extension()%>" id="mainImg">
			</div>
			<div id="simpleDiv">
				<%=rvDTO.getRecipe_simple_comment().replaceAll("\n", "<br>")%>
			</div>
		<hr class="viewHR">
			<div id="materialDiv">
				<h3>재료</h3>
					<%
					String[] materials=rvDTO.getRecipe_material().split("\\|");
					%>
					<ul id="materialUl">
						<li>
							<h4>주재료</h4>
							<ul>
								<li> <%=materials[0]%></li>
							</ul>
						</li>
						<li>
							<h4>부재료</h4>
								<ul>
								<%
								for(int i=1 ; i<materials.length ; i++){
									if(materials[i]==null || "".equals(materials[i])){
									}
									else{
										%>
										<li><%=materials[i]%></li>
										<%
									}
								}
							%>
							</ul>
						</li>
					</ul>
					
			</div>
		<hr class="viewHR">
			<div id="time_priceDiv">
				<h3>소요시간</h3>
				<ul id="timeUl">
			 		<li><%=rvDTO.getRecipe_time_s() %> ~ <%=rvDTO.getRecipe_time_a() %> 분</li>
			 	</ul>
			<h3>가격</h3>
				<ul id="priceUl">
			 		<li><%=rvDTO.getRecipe_price() %>원</li>
			 	</ul>
			</div>
		<hr class="viewHR">
			<table id="stepTable">
				<%
					for(int i=1 ; i<imgs.length ; i++){
						%>
						<tr>
							<td class="imgTD">
								<% view_imgDTO idto=viDAO.view_img(Integer.parseInt(imgs[i])); %>
								<img src="/project/img/recipe/<%=idto.getImg_idx() + idto.getImg_extension()%>" class="stepImg">
							</td>
							<td>
								<strong> STEP <%=i %></strong><br>
								<%=steps[i-1].replaceAll("\n", "<br>") %>
							</td>
						</tr>
						<%
					}
				%>
			</table>
			<div id="buttonDiv">
				<%
					int recommendCount=0;
					if(rvDTO.getRecipe_recommend()==null || "".equals(rvDTO.getRecipe_recommend())){
					}
					else{
					 	String[] recommends=rvDTO.getRecipe_recommend().split("\\|");
						recommendCount=recommends.length;
					}
				%>
				<button type="button" onClick="window.open('recipe_recommend.jsp?recipe_idx=<%=recipe_idx %>', 'recipe_recommend', 'width=400px height=200px')" ><%=recommendCount%><br> 추천</button>
				<div></div>
			</div>
			
			<div id="optionDiv">
				<input type="button" value="목록으로" onClick="location.href='/project/recipe/recipe_main.jsp'" id="listButton">
				<input type="button" value="수정" onClick="location.href='recipe_modify.jsp?recipe_idx=<%=recipe_idx%>'" id="modifyButton">
				<input type="button" value="삭제" onClick="location.href='recipe_delet.jsp?recipe_idx=<%=recipe_idx%>'" id="deleteButton">
			</div>
			
			<%
				ArrayList<Integer> arrPage=rvDAO.sidePage(recipe_idx, recipe_category);
			%>
			<div>
				<%
					String upPage=null;
					String downPage=null;
					if(arrPage.size()==1){
							upPage="<font class='pageFont'>윗 글이 없습니다</font>";
							downPage="<font class='pageFont'>아래 글이 없습니다</font>";
					}
					else if(arrPage.size()==2){
						if(arrPage.get(0)==recipe_idx){
							rvDTO=rvDAO.recipe_view(arrPage.get(1));
							upPage="<font class='pageFont'>윗 글이 없습니다</font>";
							downPage="<a href='recipe_view.jsp?recipe_idx="+Integer.toString(arrPage.get(1))+"&recipe_category="+recipe_category+"' class='pageA'>"+"["+rvDTO.getRecipe_category()+"] "+rvDTO.getRecipe_title()+"</a>";
						}
						else{
							rvDTO=rvDAO.recipe_view(arrPage.get(0));
							upPage="<a href='recipe_view.jsp?recipe_idx="+Integer.toString(arrPage.get(0))+"&recipe_category="+recipe_category+"'class='pageA'>"+"["+rvDTO.getRecipe_category()+"] "+rvDTO.getRecipe_title()+"</a>";
							downPage="<font class='pageFont'>아래 글이 없습니다</font>";
							
						}
					}
					else{
						rvDTO=rvDAO.recipe_view(arrPage.get(0));
						upPage="<a href='recipe_view.jsp?recipe_idx="+Integer.toString(arrPage.get(0))+"&recipe_category="+recipe_category+"'class='pageA'>"+"["+rvDTO.getRecipe_category()+"] "+rvDTO.getRecipe_title()+"</a>";
						rvDTO=rvDAO.recipe_view(arrPage.get(2));
						downPage="<a href='recipe_view.jsp?recipe_idx="+Integer.toString(arrPage.get(2))+"&recipe_category="+recipe_category+"'class='pageA'>"+"["+rvDTO.getRecipe_category()+"] "+rvDTO.getRecipe_title()+"</a>";
					}
				%>
				<hr class="viewHR">
				<p id="upPageP"><span>윗 글</span> <%=upPage %></p>
				<p id="downPageP"><span>아래글</span><%=downPage %></p>
			</div>
			
		</section>
	</article>
	
	<%@include file="../footer.jsp" %>
</body>
</html>