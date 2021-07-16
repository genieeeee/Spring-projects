<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="../css/join.css">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">

<script>
function idCheck(){
	window.open('idCheck.jsp','idCheck','width=300,height=200');
}
function telCheck(){
	window.open('telCheck.jsp','telCheck','width=300,height=200');	
}
</script>
</head>
<body>
<%@include file="../header.jsp" %>
<section id="join_section">
<article>
<form name="join" action="join_ok.jsp" method="post">
<table id="tableid" >
	<tr>
		<th align="left" style="color:black;  font-size:40px; color:block;  ">
			<img src="../img/login_join/join.png" alt="사진"  title="사진" width="50" height="50">&nbsp;<b class="join_title">회원가입</b>
		</th>
	</tr> 
</table>
<table id="tableid" >	
	<tr >
		<td id="join_lab">
			<label>아이디</label>
		</td>
		<td id="join_td">
				<input type="text" name="user_id"  placeholder="아이디"  readonly onchange="checkNumber(this.form.elements['number'])">
		  		<input type="button" value="중복검사" onclick="idCheck()">
		</td>
	</tr>
	<tr>
		<td id="join_lab">
			<label>비밀번호</label>
		</td>
		<td id="join_td">
				<input type="password" name="user_pwd" placeholder="대/소문자+특수문자 사용" required="required">
		</td>
	</tr>
	<tr>
		<td id="join_lab">
			<label>닉네임</label>
		</td>
		<td id="join_td">
				<input type="name" name="user_nickname" placeholder="닉네임" required="required">
		</td>		
	</tr>
	<tr>
		<td id="join_lab">
			<label>전화번호</label>
		</td>
		<td id="join_td">
				<input type="text" name="user_tel"  placeholder="ex)01012345678" readonly>
				<input type="button" value="인증하기" onclick="telCheck()">
		</td>		
	</tr>
	<tr>
		<td id="join_lab">
			<label>질문</label>
		</td>
		<td id="join_td">
			<select name="user_q_idx">								
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
		<td id="join_lab">
			<label>질문답변</label>
		</td>
		<td id="join_td">
				<input type="text" name="user_a" required="required">
		</td>	
	</tr>
	<tr>
		<th colspan="2" id="join_agree" style="padding-top:10px;">
			<div >약관동의</div>
			<div  style="font-size:10px;">
				<textarea rows="8" cols="53" readonly>
제 1 조 (목적)이 약관은 

6조 주식회사 ("회사" 또는 "6조")가 제공하는 6조 및 6조 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
				</textarea>
			</div>
		</th>
	</tr>
	<tr>		
		<td  colspan="2" id="join_agree">
			<input type="radio" name="radiocheck"  value="1" checked>이용약관에 동의합니다.
		</td>
	</tr>
	<tr>
		<td  colspan="2" id="join_agree">
			<input type="radio" name="radiocheck"  value="0">이용약관에 동의하지 않습니다.
		</td>
	</tr>
	<tr align="right" >
		<td colspan="2" style="padding-top:10px;">
			<input type="submit" value="회원가입">
			<a href="../index.jsp"><input type="button" value="취소"></a>
		</td>
	</tr>
</table>
</form>
<table cellspacing="0"  id="join_t2">
	<tr >
		<td id="join_footer_td1">
			<a href="../index.jsp">홈</a>
		</td>
		<td  id="join_footer_td2">
			<a href="javascript:window.open('/project/login/login.jsp','login','width=400px, height=430px');">로그인</a>
		</td>
		<td id="join_footer_td3">	
			<a href="javascript:window.open('/project/login/search_id.jsp','login','width=400px, height=430px');">아이디 찾기</a>
		</td>
		<td id="join_footer_td3">	
			<a href="javascript:window.open('/project/login/search_pwd.jsp','login','width=400px, height=430px');">비밀번호 찾기</a>	
		</td>	
	</tr>
</table>
<br>
</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>






