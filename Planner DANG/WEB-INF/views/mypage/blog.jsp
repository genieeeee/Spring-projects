<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<link rel="stylesheet" type="text/css" href="css/blog.css">
</head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="portfolioContainer col-xs-11 col-sm-11">
				<c:forEach var="list" items="${blogList}">
					<c:url var="mypage" value="mypage.pd">
						<c:param name="mem_id">${list.mem_id}</c:param>
					</c:url>
					<div class="col-sm-6 col-lg-3 col-md-4 webdesign illustrator">
						<div class="gal-detail thumb">
							<a href="${mypage}" class="image-popup" title="Screenshot-1">
								<img src="${list.blo_mainimg}" class="thumb-img"
								alt="work-thumbnail" height="270px">
							</a>
							<h4 class="text-center">${list.mem_id}님의블로그</h4>
							<div class="ga-bord	er"></div>
							<p class="text-muted text-center">
								<small>팔로우 수 : ${list.blo_zimnum}</small>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
	<div class="col-sm-11 col-xs-11">
		<hr style="float: both;">
		<p style="text-align: center;">${page}</p>
	</div>
</div>
</body>
</html>