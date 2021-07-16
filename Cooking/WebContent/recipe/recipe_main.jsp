<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 
%>
<%@ page import="java.util.*" %>
<%@ page import="project.recipe.*" %>
<jsp:useBean id="recipe_dao" class="project.recipe.RecipeMainDAO" scope="page"></jsp:useBean>
<jsp:useBean id="img_dao" class="project.img.ImgDAO" scope="page"></jsp:useBean>

<%
//기본 설정
int totalCnt = recipe_dao.getTotalCnt();
int listSize = 10;
int pageSize = 5;
int yull = 5; // 리스트 열 개수
int table_data_width=900; //상품 칸 넓이 
%>

<%
String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s="1";	
}
int cp = Integer.parseInt(cp_s);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0) totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0) userGroup--;
%>

<%
String selectedCategory = request.getParameter("selectedCategory");
if(selectedCategory==null || selectedCategory.equals("")){
	selectedCategory = "전체 레시피 >";
}

ArrayList<RecipeMainDTO> recipeList = recipe_dao.recipeView(selectedCategory, cp, listSize);

%>
<%
String recipe_category[] = {"전체 레시피 >", "한식", "중식", "양식", "일식", "야식", "기타"};
%>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="../css/recipe_main.css">
<style>
		#td2{
			background:#218559;
		}
	</style>
<script>
function recipeWriteOpen() {
	location.href='recipe_write.jsp';
}
</script>

</head>
<body>

<%@include file="../header.jsp" %>

<section>
	<table id="recipe_main_table_1"  cellspacing="0">
		<tr class="tr_1">
			<td class="td_1">
				<ul>
					<%
					for(int i=0; i<recipe_category.length; i++){
						%>
						<li <%=selectedCategory.equals(recipe_category[i])?" style='background-color: #f4f4f7;'":"" %>><a href="recipe_main.jsp?selectedCategory=<%=recipe_category[i]%>"><%=recipe_category[i] %></a></li>
						<%
					}
					%>
				</ul>
			</td>
			<td class="td_2">
				<article class="article_1">
					<table id="recipe_main_table_2" cellspacing="0">
						<thead>
							<tr class="tr_1">
								<td class="td_1" colspan="<%=yull%>">
									<article class="article_0">
										<img src="/project/img/notice/레시피올리기버튼.PNG" onclick="javascript:recipeWriteOpen()">
									</article>
								</td>
							</tr>
						</thead>
						<tbody>
						<%
						if(recipeList==null || recipeList.size()==0){
							%>
							<tr class="tr_1">
								<td class="td_1" colspan="<%=yull %>" align="center">
								등록된 게시물이 업심다.
								</td>
							</tr>
							<%
						}else{
							for(int i=0; i<listSize/yull; i++){
								%>
								<tr class="tr_<%=i+1%>">
									<%
									for(int j=0; j<yull; j++){
										if((i*yull)+j>=recipeList.size()){
											%>
											<td class="td_3">&nbsp;</td>
											<%
											continue;
										}
										//recipe_view.jsp?recipe_idx=?
									%>
								<td class="td_<%=i+1%>">
									<article class="article_1">
									<a href="recipe_view.jsp?recipe_idx=<%=recipeList.get((i*yull)+j).getRecipe_idx()%>&recipe_category=<%=recipeList.get((i*yull)+j).getRecipe_category()%>">
										<%
										String imgKeys = recipeList.get((i*yull)+j).getRecipe_img();
										if(imgKeys==null){
											%>
											<article>
												이미지가 없심..
											</article>
											<%
										}else{
										int imgKey = Integer.parseInt(new StringTokenizer(imgKeys,"|").nextToken());
											if(img_dao.getImg(imgKey)!=null){
												%>
												<article>
													<img id="recipe_main_imgs" src="<%=img_dao.getImg(imgKey).getImg_path() + img_dao.getImg(imgKey).getImg_idx() + img_dao.getImg(imgKey).getImg_extension()%>"><br/>
												</article>
												<%
											}else{
												%>
												<article>
												이미지를 찾을 수 없심...
												</article>
												<%
											}
											
										}
										%>
										<%
										String titleTemp = recipeList.get((i*yull)+j).getRecipe_title();
										%>
										<div class="div_1"><%=titleTemp.length()<8?titleTemp:titleTemp.substring(0,7)+"..." %></div>
										<!-- 
										 <div class="recipeList_simple_comment"><%=recipeList.get((i*yull)+j).getRecipe_simple_comment() %></div>
										 -->
										<div class="div_2"><%=recipeList.get((i*yull)+j).getRecipe_category() %></div>
										<div class="div_3"><%=recipeList.get((i*yull)+j).getRecipe_recommend_count()%></div>
									</a>
									</article>
								</td>
								<%
								}
								%>
							</tr>
							<%
							}
						}
						%>
						</tbody>
						
					</table>
				</article>
			</td>
		</tr>
		<tr class="tr_2">
			<td class="td_1" width="<%=table_data_width%>" colspan="2">
				<%
				if(userGroup!=0){
					%>
					<a href="recipe_main.jsp?selectedCategory=<%=selectedCategory %>&cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
					<%
				}
				for(int i=(userGroup*pageSize+1), j=1; i<=(userGroup*pageSize+pageSize); i++, j++){
					%>
					&nbsp;&nbsp;<a href="recipe_main.jsp?selectedCategory=<%=selectedCategory %>&cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;
					<%
					if(i==totalPage)break;
				}
				if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
					%>
					<a href="recipe_main.jsp?selectedCategory=<%=selectedCategory %>&cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
					<%
				}
				%>
			</td>
		</tr>
	</table>
</section>
<%@include file="../footer.jsp" %>

</body>
</html>