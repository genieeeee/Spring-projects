<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
 %>   
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
#nick{
	height: 50px;
	width: 290px;
	font-size: 15px;
	border-radius: 10px;	
}
#tel{
	height: 50px;
	width: 290px;
	font-size: 15px;
	border-radius: 10px;
}
#login{
	border-color:white;
	border-style:none;
	background: #f4f4f7;
}
#searchid{
	border-color:#269463;
	background: white;	
	height: 60px;
	width:290px;
	font-size: 20px;
	border-radius: 10px;
}


table td b{
	color: #269463;
}
#searchpwd{
	border-color:white;
	border-style:none;
	background: #f4f4f7;
}

</style>

<script type="text/javascript">
	function search() {
		var nick=document.search_id.user_nickname.value;
		var tel=document.search_id.user_tel.value;
		if(nick=="" || tel==""){
			alert("입력하지 않은 정보가 있습니다.");
		}
		else{
			document.getElementById("search_id").submit();
		}
	}
</script>

</head>
<body>
<div>
<form name="search_id" action="search_id_ok.jsp" id="search_id">
<table cellspacing="0">
	<tr>
		<td colspan="2"><input type="text" name="user_nickname" id="nick" placeholder="NICKNAME"  id="user_nickname"> </td>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="user_tel" id="tel" placeholder="TEL" id="user_tel"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="아이디 찾기" id="searchid" onclick="search()">
		</td>
	</tr>
	<tr>
		<td style="width:145px;"><a href="/project/login/login.jsp"><input type="button" value="로그인" id="login"><b>></b></a>
		<td>
			<a href="../login/search_pwd.jsp"><input type="button" value="비밀번호 찾기" id="searchpwd"><b>></b></a>
		</td>	
	</tr>	
</table>
</form>
</div>
</body>
</html>







