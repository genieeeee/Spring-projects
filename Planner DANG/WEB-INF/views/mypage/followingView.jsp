<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-sm" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
			<div class="hidden-sm"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>			
			<div class="col-xs-11 col-sm-11 portfolioContainer">
				<c:forEach var="li" items="${flist}">
					<div class="col-sm-6 col-lg-3 col-md-4 webdesign illustrator">
						<div class="gal-detail thumb">
							<c:url var="blog" value="mypage.pd">
								<c:param name="mem_id">${li.mem_id }</c:param>
							</c:url>
							<a href="${blog}" class="image-popup" title="Screenshot-1">
								<img src="${li.blo_mainimg}" class="thumb-img"
							alt="work-thumbnail" height="270px">
							</a>
							<h4 class="text-center">${li.mem_id}님의블로그</h4>
							<div class="ga-bord	er"></div>
							<p class="text-muted text-center">
								<small>팔로우 수 : ${li.blo_zimnum}</small>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
</div>
</body>
</html>