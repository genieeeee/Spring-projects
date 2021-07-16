<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

<style type="text/css">
table{
	padding: 5px;
	width: 100%;
}
.balloon {position:relative; display:inline-block;}
.balloon {display:inline-block; padding:10px; color:#fff; background:#3cb5f9; border-radius:20px;}
.balloon:after {content:''; position:absolute; width:0; height:0; border-style:solid;}
.balloon.test_3:after,
.balloon.test_4:after {border-width:10px 15px; top:50%; margin-top:-10px;}
.balloon.test_3:after {border-color:transparent #3cb5f9 transparent transparent; left:-25px;}
.balloon.test_4:after {border-color:transparent transparent transparent #3cb5f9; right:-25px;}
</style>
</head>
<body>
<form name="chatws" onsubmit="return false;">
	<input type="hidden" id="mem_id" value="${mem_id }">	<!-- 추후 id => mem_id 변경 -->
	<input type="hidden" id="user_id" value="${user_id }">
	<input type="hidden" id="real_id" value="${real_id }">
	<div>${user_id }</div>
	<div id="chatArea">
		<div><pre>${chatContent }</pre></div>
	</div>
<input type="text" id="message" onkeydown="goSend('${mem_id }','${user_id }','${real_id }')">
<input type="button" id="sendBtn" value="전송" onclick="send('${mem_id }','${user_id }','${real_id }')">
<input type="button" id="exitBtn" value="x" onclick="disconnect('${mem_id}')">
</form>
</body>
</html>




