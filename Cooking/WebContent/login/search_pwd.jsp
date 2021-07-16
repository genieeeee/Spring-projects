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
#user_id{
	height: 50px;
	width: 290px;
	font-size: 15px;
	border-radius: 10px;	
}
#user_q_idx{
	width: 290px;
	font-size: 15px;
	border-radius: 10px;
}
#user_a{
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
#searchpwd{
	border-color:#269463;
	background: white;	
	height: 60px;
	width:290px;
	font-size: 20px;
	border-radius: 10px;
}
#searchid{
	border-color:white;
	border-style:none;
	background: #f4f4f7;
}
table td b{
	color: #269463;
}
</style>
<script type="text/javascript">
function search() {
	var userid=document.search_pwd.user_id.value;
	var usera=document.search_pwd.user_a.value;
	if(userid=="" || usera==""){
		alert("입력하지 않은 정보가 있습니다.");
	}
	else{
		document.getElementById("search_pwd").submit();
	}
}
</script>
</head>
<body>
<form name="search_pwd" action="search_pwd_ok.jsp" id="search_pwd">
<table cellspacing="0">
	<tr>
		<td colspan="2">
		<input type="text" name="user_id" id="user_id" placeholder="ID" >
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<select name="user_q_idx" id="user_q_idx">
			<option value="0" selected>비밀번호 질문을 선택하세요</option>		
			<option value="1">가장 좋아하는 음식은?</option>
			<option value="2">초등학교 이름은?</option>
			<option value="3">중학교 이름은?</option>
			<option value="4">고등학교 이름은?</option>
			<option value="5">보물 1호는?</option>
			<option value="6">태어난 고향은?</option>
			<option value="7">한번쯤 가고싶은 나라는?</option>
		</select>
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="user_a" id="user_a" placeholder="ANSWER"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="비밀번호 찾기" id="searchpwd" onclick="search()">
		</td>
	</tr>
	<tr>
		<td style="width:145px;">
		<a href="/project/login/login.jsp"><input type="button" value="로그인" id="login"><b>></b></a>
		</td>
		<td>
			<a href="../login/search_id.jsp"><input type="button" value="아이디 찾기" id="searchid"><b>></b></a>
		</td>
	</tr>	
</table>

</form>
</body>
</html>