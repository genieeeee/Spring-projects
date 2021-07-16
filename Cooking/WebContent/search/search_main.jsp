<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="project.search.*" %>
<jsp:useBean id="search_dao" class="project.search.SearchMainDAO" scope="page"></jsp:useBean>
<jsp:useBean id="img_dao" class="project.img.ImgDAO" scope="page"></jsp:useBean>

<%
SearchMainInterpace smi = new SearchMainInterpace();

boolean searchOptionTime[] = new boolean[6];
//int searchOptionPrice = 0;
String searchOptionPrice = "";
boolean searchOptionCategory[] = new boolean[7];
String searchOptionStr = "";
int searchOptionSelected=0;

searchOptionTime[0] = true;
searchOptionCategory[0] = true;

String searchOptionTime_s[] = new String [6];
//String searchOptionPrice_s[] = new String[3];
String searchOptionPrice_s[] = new String[2];
String searchOptionCategory_s[] = new String [7];

searchOptionTime_s[1] = request.getParameter("searchOptionTime_10_less");
searchOptionTime_s[2] = request.getParameter("searchOptionTime_10_20");
searchOptionTime_s[3] = request.getParameter("searchOptionTime_20_30");
searchOptionTime_s[4] = request.getParameter("searchOptionTime_30_40");
searchOptionTime_s[5] = request.getParameter("searchOptionTime_40_over");

//searchOptionPrice_s[1] = request.getParameter("searchOptionPrice_desc");
//searchOptionPrice_s[2] = request.getParameter("searchOptionPrice_asc");
searchOptionPrice_s[1] = request.getParameter("searchOptionPrice");

searchOptionCategory_s[1] = request.getParameter("searchOptionCategory_kor");
searchOptionCategory_s[2] = request.getParameter("searchOptionCategory_cha");
searchOptionCategory_s[3] = request.getParameter("searchOptionCategory_eng");
searchOptionCategory_s[4] = request.getParameter("searchOptionCategory_jpn");
searchOptionCategory_s[5] = request.getParameter("searchOptionCategory_night");
searchOptionCategory_s[6] = request.getParameter("searchOptionCategory_etc");

searchOptionStr = request.getParameter("searchOptionStr");
if(searchOptionStr==null || searchOptionStr.equals("")){
	searchOptionStr = "";
}

String searchOptionSelected_s = request.getParameter("searchOptionSelected");

if(searchOptionSelected_s==null || searchOptionSelected_s.equals("")){
	searchOptionSelected_s="0";
}
searchOptionSelected = Integer.parseInt(searchOptionSelected_s);

for(int i=1; i<searchOptionTime_s.length; i++){
	if(searchOptionTime_s[i] == null || searchOptionTime_s[i].equals("")){
		searchOptionTime_s[i] = "false";	
	}
	if(searchOptionTime_s[i].equals("on")){
		searchOptionTime[0]=false;
		searchOptionTime[i]=true;
	}
}
/*
if(searchOptionPrice_s[1]==null || searchOptionPrice_s[1].equals("")){
	searchOptionPrice_s[1]="false";
}
if(searchOptionPrice_s[2]==null || searchOptionPrice_s[2].equals("")){
	searchOptionPrice_s[2]="false";
}

if(searchOptionPrice_s[1].equals("on")){
	searchOptionPrice=1;
}else if(searchOptionPrice_s[2].equals("on")){
	searchOptionPrice=2;
}
*/

if(searchOptionPrice_s[1]==null || searchOptionPrice_s[1].equals("")){
	searchOptionPrice_s[0] = "";
	searchOptionPrice_s[1] = "";
}

if(searchOptionPrice_s[1].equals("searchOptionPrice_desc")){
	searchOptionPrice="searchOptionPrice_desc";
}else if(searchOptionPrice_s[1].equals("searchOptionPrice_asc")){
	searchOptionPrice="searchOptionPrice_asc";
}

for(int i=1; i<searchOptionCategory_s.length; i++){
	if(searchOptionCategory_s[i]==null || searchOptionCategory_s[i].equals("")){
		searchOptionCategory_s[i] = "false";
	}
	
	if(searchOptionCategory_s[i].equals("on")){
		searchOptionCategory[0]=false;
		searchOptionCategory[i]=true;
	}
}

%>

<%
//기본 설정
int totalCnt = search_dao.getTotalCnt(searchOptionTime, searchOptionPrice, searchOptionCategory, searchOptionStr, searchOptionSelected);
int listSize = 5;
int pageSize = 5;
int yull = 5; // 리스트 열 개수
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

ArrayList<SearchMainDTO> recipeList = search_dao.recipeView(searchOptionTime, searchOptionPrice, searchOptionCategory, searchOptionStr, searchOptionSelected, cp, listSize);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cooking</title>
	<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
	<link rel="stylesheet" type="text/css" href="../css/search_main.css">
	<style>
		#td3{
			background:#218559;
		}
	</style>
</head>
<script>
function searchOkOpen(){
	document.f.cp.value = '1';
	document.f.submit();
}
function searchPageOkOpen(cp){
	document.f.cp.value = cp;
	document.f.submit();
}
</script>
<body>
	<%@include file="../header.jsp" %>
	<section>
		<form action="search_main_ok.jsp?cp=<%=cp%>" name="f" id="search_main_form_1">
			<input type="hidden" name="cp">
			<table id="search_main_table_1" class="table_1">
				<tr class="tr_1">
					<td class="td_1">
						<select id = "f_select" name="f_select">
							<option value="<%=smi.SELECT_TITLE%>" <%=searchOptionSelected ==smi.SELECT_TITLE?"selected":"" %>>제목</option>
							<option value="<%=smi.SELECT_CONTENT%>" <%=searchOptionSelected==smi.SELECT_CONTENT?"selected":"" %>>본문</option>
							<option value="<%=smi.SELECT_TITLE_AND_CONTENT%>" <%=searchOptionSelected==smi.SELECT_TITLE_AND_CONTENT?"selected":"" %>>제목+본문</option>
						</select>
					</td>
					<td class="td_2">
						<input type="text" name="searchOptionStr">
					</td>
					<td class="td_3">
						<input type="button" value="검색" onclick="javascript:searchOkOpen()">
					</td>
				</tr>
			</table>
			<table id="search_main_table_2" class="table_2" cellspacing="0">
				<tr>
					<td class="td_1">조리시간</td>
					<td class="td_2" colspan="2">
						<input type="checkbox" name="searchOptionTime_10_less" id="searchOptionTime_10_less"> <label>10분 이하</label>
						<input type="checkbox" name="searchOptionTime_10_20" id="searchOptionTime_10_20"> <label>10~20분</label>
						<input type="checkbox" name="searchOptionTime_20_30" id="searchOptionTime_20_30"> <label>20~30분</label>
						<input type="checkbox" name="searchOptionTime_30_40" id="searchOptionTime_30_40"> <label>30~40분</label>
						<input type="checkbox" name="searchOptionTime_40_over" id="searchOptionTime_40_over"> <label>40분 이상</label>
					</td>
				</tr>
				<tr>
					<td class="td_1">가격</td>
					<td class="td_2" colspan="2">
						<input type="radio" name="searchOptionPrice" value="searchOptionPrice_desc" id="searchOptionPrice_desc" <%=searchOptionPrice.equals("searchOptionPrice_desc")?"checked":"" %>><label>높은 가격 순</label>
						<input type="radio" name="searchOptionPrice" value="searchOptionPrice_asc" id="searchOptionPrice_asc" <%=searchOptionPrice.equals("searchOptionPrice_asc")?"checked":"" %>><label>낮은 가격 순</label>
					<!-- 
						<input type="checkbox" name="searchOptionPrice_desc" id="searchOptionPrice_desc"> <label>높은 가격 순</label>
						<input type="checkbox" name="searchOptionPrice_asc" id="searchOptionPrice_asc"> <label>낮은 가격 순</label>
					 -->
					</td>
				</tr>
				<tr>
					<td class="td_1">종류</td>
					<td class="td_2" colspan="2">
						<input type="checkbox" name="searchOptionCategory_kor" id="searchOptionCategory_kor"> <label>한식</label>
						<input type="checkbox" name="searchOptionCategory_cha" id="searchOptionCategory_cha"> <label>중식</label>
						<input type="checkbox" name="searchOptionCategory_eng" id="searchOptionCategory_eng"> <label>양식</label>
						<input type="checkbox" name="searchOptionCategory_jpn" id="searchOptionCategory_jpn"> <label>일식</label>
						<input type="checkbox" name="searchOptionCategory_night" id="searchOptionCategory_night"> <label>야식</label>
						<input type="checkbox" name="searchOptionCategory_etc" id="searchOptionCategory_etc"> <label>기타</label>
					</td>
				</tr>
			</table>
			<label><%=searchOptionStr.equals("")?"":"\""+searchOptionStr+"\" 검색 결과" %></label>
		</form>
			<hr>
			<table id="search_main_table_3" class="table_3" cellspacing="0">
				<tfoot>
					<tr>
						<td align="center" colspan="<%=yull%>">
							<%
							if(userGroup!=0){
							%>
							<a href="javascript:searchPageOkOpen('<%=(userGroup-1)*pageSize+pageSize%>')">&lt;&lt;</a>
							<%
							}
							for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){
							%>
								&nbsp;&nbsp;<a href="javascript:searchPageOkOpen('<%=i%>')"><%=i %></a>&nbsp;&nbsp;
							<%
							if(i==totalPage)break;
							}
							if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
								%>
								<a href="javascript:searchPageOkOpen('<%=(userGroup+1)*pageSize+1%>')">&gt;&gt;</a>
								<%
							}
							%>
						</td>
					</tr>
				</tfoot>
				<tbody>
				<%
				if(recipeList==null || recipeList.size()==0){
					%>
					<tr class="tr_1">
						<td class="td_1">
							<article>
								등록된 게시물이 업심다.
							</article>
						</td>
					</tr>
					<%
				}else{
					for(int i=0; i<recipeList.size(); i++){
					%>
					<tr>
						<td class="td_1">
							<a href="/project/recipe/recipe_view.jsp?recipe_idx=<%=recipeList.get(i).getRecipe_idx()%>&recipe_category=<%=recipeList.get(i).getRecipe_category()%>">
								<%
								String imgKeys = recipeList.get(i).getRecipe_img();
								if(imgKeys==null){
									%>
									<article>이미지가 없심..</article>
									<%
								}else{
								int imgKey = Integer.parseInt(new StringTokenizer(imgKeys,"|").nextToken());
									if(img_dao.getImg(imgKey)!=null){
										%>
										<img class="searchList_img" src="<%=img_dao.getImg(imgKey).getImg_path() + img_dao.getImg(imgKey).getImg_idx() + img_dao.getImg(imgKey).getImg_extension()%>"><br/>
										<%
									}else{
										%>
										<article>이미지를 찾을 수 없심...</article>
										<%
									}
								}
								%>
							</a>
						</td>
						<td class="td_2">
							<a href="/project/recipe/recipe_view.jsp?recipe_idx=<%=recipeList.get(i).getRecipe_idx()%>&recipe_category=<%=recipeList.get(i).getRecipe_category()%>">
								<table class="table_4">
									<tr class="tr_1">
										<td class="td_1">
											<%=recipeList.get(i).getRecipe_title() %>
										</td>
									</tr>
									<tr class="tr_2">
										<td class="td_1">
											<%=recipeList.get(i).getRecipe_simple_comment() %>
										</td>
									</tr>
									<tr class="tr_3">
										<td class="td_1">
											<label id ="searchList_price"><%=recipeList.get(i).getRecipe_price() %>원</label> | 
											<label id ="searchList_time"><%=recipeList.get(i).getRecipe_time_s() %> ~ <%=recipeList.get(i).getRecipe_time_a() %>분</label>
										</td>
									</tr>
								</table>
							</a>
						</td>
					</tr>
					<%
					}
				}
				%>
				</tbody>
								
			</table>
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
<script>
	document.getElementById("searchOptionTime_10_less").checked='<%=request.getParameter("searchOptionTime_10_less")%>'=='on'?true:false;
	document.getElementById("searchOptionTime_10_20").checked='<%=request.getParameter("searchOptionTime_10_20")%>'=='on'?true:false;
	document.getElementById("searchOptionTime_20_30").checked='<%=request.getParameter("searchOptionTime_20_30")%>'=='on'?true:false;
	document.getElementById("searchOptionTime_30_40").checked='<%=request.getParameter("searchOptionTime_30_40")%>'=='on'?true:false;
	document.getElementById("searchOptionTime_40_over").checked='<%=request.getParameter("searchOptionTime_40_over")%>'=='on'?true:false;
	
	document.getElementById("searchOptionCategory_kor").checked='<%=request.getParameter("searchOptionCategory_kor")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_cha").checked='<%=request.getParameter("searchOptionCategory_cha")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_eng").checked='<%=request.getParameter("searchOptionCategory_eng")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_jpn").checked='<%=request.getParameter("searchOptionCategory_jpn")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_night").checked='<%=request.getParameter("searchOptionCategory_night")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_etc").checked='<%=request.getParameter("searchOptionCategory_etc")%>'=='on'?true:false;
	
</script>
</html>