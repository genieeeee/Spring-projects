<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로우한 블로그 목록</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<div class="page-container">
	
	<div class="content">

		<div class="col-sm-10 col-xs-12 col-md-10" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-xs"><%@include
					file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp"%>
			<div class="hidden-xs"><%@include
					file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>
				<div class="portfolioContainer">
				<c:forEach var="list" items="${jimbList}">
					<c:url var="mypage" value="mypage.pd">
						<c:param name="mem_id">${list.mem_id}</c:param>
					</c:url>
					<div class="col-sm-6 col-lg-3 col-md-4 webdesign illustrator">
						<div class="gal-detail thumb">
							<a href="${mypage}" class="image-popup" title="Screenshot-1">
								<img src="${list.blo_mainimg}" class="thumb-img"
								alt="work-thumbnail">
							</a>
							<h4 class="text-center">${list.mem_id}님의블로그</h4>
							<div class="ga-bord	er"></div>
							<p class="text-muted text-center">
								<small>${list.blo_zimnum}</small>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-sm-10 col-xs-12">
			<hr style="float: both;">
			<p style="text-align: center;">${page}</p>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	</div>
</body>
</html>