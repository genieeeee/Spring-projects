<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<style>
#aa{
	float: left;
	padding: 10px;
	margin-left: 20px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-11">
			<div class="panel panel-default">
				<ul style="list-style-type: none;">
					<c:url var="plan" value="planList.pd">
						<c:param name="mem_id">${mem_ids}</c:param>
					</c:url>
					<li id="aa"><a href="${plan}">플랜목록</a></li>
					<c:url var="diary" value="diary.pd">
						<c:param name="mem_id">${mem_ids}</c:param>
					</c:url>
					<li id="aa"><a href="${diary}">여행일기</a></li>
					<c:if test="${mem_ids ne mem_id}">
						<li id="aa" class="pull-right"><a href="chatForm.pd?user_id=${mem_ids}"><img src="img/mypage/chat.png" width="20px" height="20px"></a>
					</c:if>
					<c:if test="${mem_ids eq mem_id}">
						<li id="aa"><a href="airMypage.pd">예약현황</a></li>						
						<li id="aa" class="dropdown"><a href="jimMain.pd" id="drop1" data-toggle="dropdown" class="dropdown-toggle" role="button">찜목록</a>
							<ul role="menu" class="dropdown-menu" aria-labelledby="drop1">
		                        <li role="presentation"><a href="jimPlanform.pd">플랜</a></li>
		                        <li role="presentation"><a href="jimHotelform.pd">호텔</a></li>
		                        <li role="presentation"><a href="jimPointform.pd">명소</a></li>
							</ul>
						</li>
						<li id="aa"><a href="userLetter.pd">쪽지함</a></li>
						<c:choose>
							<c:when test="${memInfo[0].mem_grade eq 0}">
							
							</c:when>
							<c:when test="${memInfo[0].mem_grade eq 1}">
								<li id="aa" class="pull-right"><a href="pwdCert.pd?type=2">회원탈퇴</a></li>
								<li id="aa" class="pull-right"><a href="pwdCert.pd?type=1">정보수정</a></li>					
							</c:when>
						</c:choose>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>