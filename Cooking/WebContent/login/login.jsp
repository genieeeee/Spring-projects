<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">

<style>
form{
	width:300px;
	margin:0px auto;
	padding:30px;
	border-top-left-radius:120px;
	border-bottom-right-radius:120px;
	background:#f4f4f7;
	marign:0px auto;
}
table{
	width:300px;
	height:300px;
	text-align:center;
}
table td a{
	 text-decoration:none; 
}
#idid{
	height: 50px;
	width: 290px;
	font-size: 15px;
	border-radius: 10px;	
}
#pwdid{
	height: 50px;
	width:290px;
	font-size: 15px;
	border-radius: 10px;
}
#loginid{
	border-color:#269463;
	background: white;	
	height: 50px;
	width:290px;
	font-size: 20px;
	border-radius: 10px;
}


#joinid{
	border-color:white;
	border-style:none;
	background: white;
}
table td b{
	color: #269463;
}
 a:hover{
	text-decoration:underline;
}
#searchid{
	border-color:white;
	border-style:none;
	background-color: #f4f4f7;
}
#searchpwd{
	border-color:white;
	border-style:none;
	background-color: #f4f4f7;
}
</style>
</head>

<%
Cookie cks[]=request.getCookies();
String user_id="";
if(cks!=null){
	for(int i=0;i<cks.length;i++){
		if(cks[i].getName().equals("user_saveid")){
			user_id=cks[i].getValue();
		}
	}
}
%>

<body>
<form name="login" action="login_ok.jsp" method="post">
<table cellspacing="0" >
	<tr>
		<td colspan="2"><input type="text" name="user_id" id="idid" placeholder="ID" value="<%=user_id%>"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="password" name="user_pwd" id="pwdid" placeholder="PW"></td>
	</tr>
	<tr>	
		<td colspan="2" align="right">
			<input type="checkbox" name="cb" value="on" <%=user_id.equals("")?"":"checked" %>>
			아이디 저장하기
		</td>
	</tr>
	<tr>
		<th colspan="2"><input type="submit" value="로그인" id="loginid"></th>
	</tr>
	<tr>
		<td align="center" id="search_td">
			<a href="search_id.jsp"><input type="button" value="아이디 찾기 " id="searchid"><b>></b></a>
		</td>
		<td id="search_td">
			<a href="search_pwd.jsp"><input type="button" value="비밀번호 찾기" id="searchpwd"><b>></b></a>
		</td>	
	</tr>		
</table>
</form>
</body>
</html>













