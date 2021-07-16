<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mobilemenu {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 9999;
    top: 0;
    left: 0;
    background-color: #fdfeff;
    overflow-y: auto;
    transition: 0s;
}

.mobilemenu a {
    text-decoration: none;
    color: #c6eafd;
	font-weight: 700;
	font-size: 18px;
    display: block;
    transition: 0.5s;
}

.mobilemenu a:hover, .offcanvas a:focus{
    color: white;
	text-decoration: none;
}

.closeMobilemenu {
    position: absolute;
    top: 0;
    font-size: 36px !important;
    float: left;
    padding-left: 15px;
}
</style>
<script>
function openMobilemenu() {
    document.getElementById("mobilemenu").style.width = "20%";
}

function closeMobilemenu() {
    document.getElementById("mobilemenu").style.width = "0";
}
</script>
<body>
<span style="cursor:pointer;margin-bottom:30px;text-align: left;" onclick="openMobilemenu()"><img src="img/mypage/app_menu.png" width="100px" height="50px"></span>
	<div id="mobilemenu" class="mobilemenu">
		<p><a href="javascript:void(0)" class="closeMobilemenu" onclick="closeMobilemenu()"><small>X</small></a></p>
		<div id="wrapper">
			<ul style="list-style-type: none;">
				<li id="aa"><a href="">플랜목록</a></li>
				<c:url var="diary" value="diary.pd">
					<c:param name="mem_id">${mem_ids}</c:param>
				</c:url>
				<li id="aa"><a href="${diary}">여행일기</a></li>
				<c:if test="${mem_ids eq mem_id}">
					<li id="aa"><a href="">예약현황</a></li>						
					<li id="aa" class="dropdown"><a href="jimMain.pd" id="drop1" data-toggle="dropdown" class="dropdown-toggle" role="button">찜목록</a>
						<ul role="menu" class="dropdown-menu" aria-labelledby="drop1">
	                        <li role="presentation"><a href="jimPlanform.pd">플랜</a></li>
	                        <li role="presentation"><a href="jimHotelform.pd">호텔</a></li>
	                        <li role="presentation"><a href="jimPointform.pd">명소</a></li>
						</ul>
					</li>
					<li id="aa"><a href="userLetter.pd">쪽지함</a></li>
					<li id="aa"><a href="pwdCert.pd?type=2">회원탈퇴</a></li>
					<li id="aa"><a href="pwdCert.pd?type=1">정보수정</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>