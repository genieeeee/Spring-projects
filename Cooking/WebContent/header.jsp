<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
    function login_popup(){
    	window.open('/project/login/login.jsp','login','width=400px, height=430px');
    	
    }  
    </script>
    
	<header>	
		<table id="header_login"  style="height:10px">		
			<tr>
		<%		    	
    		String user_nickname=(String)session.getAttribute("user_id");
				    	
			if(!(user_nickname==null)){
				%>
				<td><p><b id="user_name"><%=user_nickname%></b>님 로그인 중 | <a href="/project/login/logout.jsp" style="text-decoration: none;color:black;"> 로그아웃</a></p></td>
				<%			
			}else{
				%>
				<td><p><a onclick="location.href='javascript:login_popup()'"   style="text-decoration: none;cursor:pointer;">로그인</a> | <a onclick="location.href='/project/login/join.jsp'" style="text-decoration: none;cursor:pointer;">회원가입</a></p>	</td>		
				<%			
			}  
    	%>	
    		</tr>
    	</table>
    	<a href="/project/index.jsp"><img src="/project/img/index/메인아이콘.PNG"  id="main_img">	</a>
		<nav id="header_nav" style="height:63px; background:#269463 " >
			<table  id="header_table" >
				<tr>
					<td id="td1"><a href="/project/index.jsp" >홈</a></td>
					<td id="td2"><a href="/project/recipe/recipe_main.jsp" >레시피</a></td>
					<td id="td3"><a href="/project/search/search_main.jsp" >검색</a></td>
					<td id="td4"><a href="/project/comment/comment_main.jsp" >후기</a></td>
					<td id="td5"><a href="/project/one/oneComment.jsp">요청</a></td>
				</tr>
			</table>
		</nav>
	</header>
	