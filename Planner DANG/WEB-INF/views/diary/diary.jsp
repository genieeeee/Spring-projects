<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<form name="diary" action="diaryAdd.pd">
					<c:if test="${mem_ids eq id}">	<!-- 자기 블로그일때 -->
						<p style="text-align: right;"><input type="submit" value="글쓰기"></p>
						<p style="text-align: center; font-size: 20px;">${page}</p>
					</c:if>				
					<c:forEach var="li" items="${dia_list}">
						<div class="col-sm-6 col-lg-3 col-md-4 webdesign illustrator" style="height: 370px;">
							<div class="gal-detail thumb">
								<c:url var="content" value="diaryContent.pd">
									<c:param name="dia_idx">${li.dia_idx}</c:param>
									<c:param name="mem_id">${mem_ids }</c:param>
								</c:url>
								<a href="${content}" class="image-popup" title="Screenshot-1">
									${li.dia_mainimg}
								</a>
								<h4 class="text-center">${li.dia_subject}</h4>
								<div class="ga-bord	er"></div>
								<p class="text-muted text-center">
									<small>${li.dia_writedate} | 조회수 : ${li.dia_readnum}</small>
								</p>
							</div>
						</div>
					</c:forEach>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
</div>
</body>
</html>