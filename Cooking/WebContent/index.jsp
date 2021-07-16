<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@page import="java.util.*" %>
<%@page import="project.notice.*" %> 
<%@ page import="project.comment.*"%>
<%@page import="project.index.hot.*" %>
<%@page import="project.index.today.*" %>

<jsp:useBean id="notice_dao" class="project.notice.NoticeDAO" scope="session"/>
<jsp:useBean id="cdao" class="project.comment.CommentDAO" scope="session"/>
<jsp:useBean id="idao" class="project.index.hot.IndexHotDAO" scope="page"></jsp:useBean>
<jsp:useBean id="img_dao" class="project.img.ImgDAO" scope="page"></jsp:useBean>
<jsp:useBean id="user_dao" class="project.user.UserDAO" scope="page"></jsp:useBean>
<jsp:useBean id="today_dao" class="project.index.today.IndexTodayDAO" scope="page"></jsp:useBean>
<jsp:useBean id="today_dto" class="project.index.today.IndexTodayDTO" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">

<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<style type="text/css">
#td1{
	background:#218559;
}
</style>
	<script>
	function popUPshow(){
		window.open('popUp.jsp', 'popform','width=430,height=450');
	}

	</script>
</head>
<!--쿠키  -->
		<%
			Cookie cookies[]=request.getCookies();
			String popUp_cb="";
			
			if(!(cookies==null)){
				for(int i=0;i<cookies.length;i++){
					if(cookies[i].getName().equals("popUp_cb")){
						popUp_cb=cookies[i].getValue();
					}			
				}
			}	
		%>
<body <%=popUp_cb.equals("on")?  "":"onload='popUPshow()' "  %>>

<%
int getTotalCnt = idao.getTotalCnt();
ArrayList<IndexHotDTO> hotList = idao.hotView();

today_dto = today_dao.todayView();
%>

<%@include file="header.jsp" %>
<section>
<!-- <img src="img/index/메인물결1.png" width="1000" height="22"> -->

	<article class="main_arti1" >
	
	<br>
	
	<table id="hot_reci_ta">
		<tr>
					<td id="hot_reci_title"><img src="img/index/핫레시피아이콘1.PNG" width="40" height="42">&nbsp;</td>
					<td id="hot_reci_title2"><b>HOT RECIPE</b></td>
					<td id="body_hot_recipe_more" ><a href="recipe/recipe_main.jsp" >더보기&nbsp;<img src="img/index/화살표.PNG" height="10" width="10"></a></td>
		</tr>
	</table>
	
		<table id="body_hot_recipe_table" cellspacing="0"  >
			
			<tbody id="body_hot_recipe_tbody">
				<tr>
				<%
				for(int i=0; i<3; i++){
					if(i>=getTotalCnt){
						%>
						<td id="hot_td<%=i+1%>" class="hot_td">&nbsp;</td>
						<%
						continue;
					}
					
					%>
					<td id="hot_td<%=i+1%>" class="hot_td">
						<a href="/project/recipe/recipe_view.jsp?recipe_idx=<%=hotList.get(i).getRecipe_idx()%>&recipe_category=<%=hotList.get(i).getRecipe_category()%>">
							<%
							String imgKeys = hotList.get(i).getRecipe_img();
							if(imgKeys==null){
								%>
								<article>이미지가 없심..</article>
								<%
							}else{
							int imgKey = Integer.parseInt(new StringTokenizer(imgKeys,"|").nextToken());
								if(img_dao.getImg(imgKey)!=null){
									%>
									<img src="<%=img_dao.getImg(imgKey).getImg_path() + img_dao.getImg(imgKey).getImg_idx() + img_dao.getImg(imgKey).getImg_extension() %>"  width="240"  height="190" >
									
									<%
								}else{
									%>
									<article>이미지를 찾을 수 없심...</article>
									<%
								}
							}
							%>
							<article class="article_1"><%=hotList.get(i).getRecipe_title().length()>7?hotList.get(i).getRecipe_title().substring(0,7)+"...":hotList.get(i).getRecipe_title()%></article>
						</a>
							<article class="article_2"><%=hotList.get(i).getRecipe_category()%></article>
							<img src="img/index/사람아이콘.PNG" height="15" width="15">
							<%=user_dao.getUserInfo_Idx(hotList.get(i).getUser_idx())%>    |  <img src="img/index/조회수아이콘.PNG" height="15" width="15"> <%=hotList.get(i).getRecipe_recommend_count() %>
					</td>
					<%
				}
				%>
				</tr>
			</tbody>
		
		</table>	
	</article>
	
	<article class="main_arti2" >	
	<table  class="main_table2"   >
		<tr>
			<td id="main_table2_td1">
				<table id="today_recom" cellspacing="0">
					<thead>
						<tr>
							<td id="today_recom_title">오늘 뭐 먹을까?</td>
							<td id="today_recom_more"  style="height: 30px;text-align: center;"><a href="search/search_main.jsp" >더보기 <img src="img/index/화살표.PNG" height="10" width="10"></a></td>
						</tr>					
						<tr >
							<td id="today_recom_tr2" colspan="2">
								<a href="/project/recipe/recipe_view.jsp?recipe_idx=<%=today_dto.getRecipe_idx()%>&recipe_category=<%=today_dto.getRecipe_category()%>">
									<%
									int imgKey = Integer.parseInt(new StringTokenizer(today_dto.getRecipe_img(),"|").nextToken());
										if(img_dao.getImg(imgKey)!=null){
											%>
											<img src="<%=img_dao.getImg(imgKey).getImg_path() + img_dao.getImg(imgKey).getImg_idx() + img_dao.getImg(imgKey).getImg_extension() %>"  id = "today_img">
											<%
										}else{
											%>
											<article>이미지를 찾을 수 없심...</article>
											<%
										}
									%>
									<font id="font_1"><%=today_dto.getRecipe_title().length()>7?today_dto.getRecipe_title().substring(0,7)+"...":today_dto.getRecipe_title() %></font><br>
									<font id="font_2"><%=new StringTokenizer(today_dto.getRecipe_material(),"|").nextToken()%></font>
								</a>
							</td>
						</tr>						
					</thead>
				</table>	
			</td>
			<td>
				<table id="spe_view" cellspacing="0">
				<tr>
					<td  id="spe_review_td" colspan="2"><img src="img/index/메인후기아이콘.PNG" width="19" height="25">&nbsp;<b id="spe_rev_text">Special Review</b></td>
					<td id="spe_view_more"><a href="comment/comment_main.jsp" >더보기&nbsp;<img src="img/index/화살표.PNG" height="10" width="10"></a></td>
				</tr>
				<tr>
					<td id="spe_no">글 번호</td>
					<td id="spe_name">이름</td>
					<td id="spe_content1">제목</td>
				</tr>
				<%
				ArrayList<CommentDTO> arr = cdao.index_commentMain();
				if (arr == null || arr.size() == 0) {
					%>
						<td id="spe_no" colspan="4" align="center">등록된 글이 없습니다.</td>
					<%
					for (int i = 1; i < 7; i++) {
					%>
					<tr>													
						<td id="spe_no">&nbsp;</td>
						<td id="spe_name"> &nbsp;</td>
						<td id="spe_content">&nbsp;</td>
					</tr>
					<%
					}
				} else {
					for (int i = 0; i < 7; i++) {	//보여질 글 수 7개
						String comment_content=null;
						if(arr.size()<=i){
							%>
							<tr>
								<td id="spe_no">&nbsp;</td>
								<td id="spe_name"> &nbsp;</td>
								<td id="spe_content">&nbsp;</td>
							</tr>
							<%
						}else{
							%>
							<tr>
								<td id="spe_no"><%=arr.get(i).getComment_idx()%></td>
								<td id="spe_name"> <%String nickname=cdao.getUser(arr.get(i).getUser_idx()); %> <%=nickname %></td>
								<%
									String spe_con=arr.get(i).getComment_title();			
								%>
								<td id="spe_content">&nbsp;&nbsp;<a href="/project/comment/comment.jsp?idx=<%=arr.get(i).getComment_idx()%>"> <%=arr.get(i).getComment_title().length()>20? spe_con.substring(0, 15)+". .":spe_con %>&nbsp;&nbsp;&nbsp;[<%=cdao.re_commentCount(arr.get(i).getComment_idx()) %>]</a></td>
							</tr>
							<%					
						}
					}
				}
				%>				
			</table>
		</td>
		</table>
	</article>
	
	<article class="main_arti3">
	<table class="main_table3" cellspacing="0">
			<tr>
				<td id="m_t_n_td1">
					<table id="notice" cellspacing="0"  >	
						<tbody>
							<tr>
								<td id="notice_t_header1"><img src="img/index/공지사항.PNG" height="35" width="35" align="left"></td>
								<td id="notice_t_header"><a href="notice/notice_main.jsp">공지사항</a></td>
								<td id="notice_more"><a href="notice/notice_main.jsp" >더보기&nbsp;<img src="img/index/화살표.PNG" height="10" width="10"></a></td>		
							</tr>
								<%  
									ArrayList<NoticeDTO> list_notice=notice_dao.Main_noticeList();
									if(list_notice==null||list_notice.size()==0){
								    %>
								        <tr>
								            <td colspan="3" align="center"  id="notice_td">공지사항 글이 없습니다.</td>
								        </tr>
								    <%
										for(int i=1;i<5;i++){
											%>
											<tr>
												<td id="notice_td" colspan="3">&nbsp;</td>
											</tr>											
											
											
											<%
											
										}
									}else{
										
										for(int i=0;i<5;i++){	
											String i_n_t=null;
											if(list_notice.size()<=i){	
												%>
													<tr>
														<td id="notice_td" colspan="3">&nbsp;</td>
													</tr>
												<%
											}else{
														//index_notice_title
												if(list_notice.get(i).getNotice_title().length()>20){
													i_n_t=list_notice.get(i).getNotice_title().substring(0,18)+"..";
												}else{
													i_n_t=list_notice.get(i).getNotice_title();
												}
											%>
											<tr>
												<td id="notice_td" colspan="3">&nbsp;·&nbsp;<a href="/project/notice/notice_content.jsp?notice_idx=<%=list_notice.get(i).getNotice_idx()%>"><%=i_n_t%></a></td>
											</tr>
											<%
											}										
										}
									}
								%>
						</tbody>		
					</table>
			</td>
			<td>
				<%@include file="adpage.jsp" %>
			</td>	
			</tr>
	</table>
	</article>		
</section>		
<%@include file="footer.jsp" %>
</body>
</html>