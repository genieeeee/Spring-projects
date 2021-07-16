<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="recommendDAO" class="project.recipe.recipe_recommend.recipe_recommendDAO" scope="page"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cooking</title>
	<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	<style type="text/css">
		div{
			text-align: center;
			padding: 50px;
		}
		input[type='button']{
			width: 50px;
		    height: 25px;
			margin-top: 15px;
			border: 0px;
		    border-radius: 10px;
		    background-color: #268463;
		    color: #ffffff;
		    cursor: pointer;
		}
	</style>
	<script type="text/javascript">
		function buttonClose() {
			opener.location.reload();
			window.close();
		}
	</script>
</head>
<body>
	<%
		String user_id=(String)session.getAttribute("user_id");
		int recipe_idx=Integer.parseInt(request.getParameter("recipe_idx"));
		 if(user_id==null || "".equals(user_id)){
			%>
				<div>
					<font>로그인 해 주세요.<br>로그인 사용자만 가능 합니다.</font><br>
					<input type="button" value="닫기" onClick="buttonClose()">
				</div>
			<%
		}
		else{
			int check=recommendDAO.checkRecommend(recipe_idx, user_id); // 세션에 저장된 아이디 추천 했으면 1이 옴
			if(check==1){
				%>
				<div>
					<font>이미 추천 한 글 입니다.</font><br>
					<input type="button" value="닫기" onClick="buttonClose()">
				</div>
				<%
			}
			else if(check==2){
				%>
				<div>
					<font>자신의 글은 추천 할 수 없습니다.</font><br>
					<input type="button" value="닫기" onClick="buttonClose()">
				</div>
				<%
			}
			else{
				int result=recommendDAO.recommend(recipe_idx, user_id);
				if(result>0){
					%>
						 <div>
							<font>정상적으로 추천되었습니다.</font><br>
							<input type="button" value="닫기" onClick="buttonClose()">
						 </div>
					<%
				}
				else{
					%>
						 <div>
							<font>~~오류발생~~</font><br>
							<input type="button" value="닫기" onClick="buttonClose()">
						</div>
					<%
				}
			}
		}
	%>
</body>
</html>