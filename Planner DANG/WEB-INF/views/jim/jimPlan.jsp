<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로우한 블로그 목록</title>
<link rel="stylesheet" type="text/css" href="/pd/css/plan/planList.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<div class="page-container">
	
	<div class="content">

		<div class="col-sm-10 col-xs-9 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-sm"><%@include
					file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp"%>
			<div class="hidden-sm"><%@include
					file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>
				<div class="row">
					<div class="col-xs-11">
						<hr>
						<c:set var="planlist" value="${planlist}"></c:set>
						<c:if test="${empty planlist }">
							<div class="row form-group product-chooser">
								<div>
									<div class="product-chooser-item selected">
										<img src="img/plan/이미지없음 .png">
									<div>
									<div>
										<span class="title">등록된 게시물이 없습니다.</span>
										<span class="description"></span>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</c:if>
						<div class="row form-group product-chooser">
							<div>
								<c:forEach var="plandto" items="${planlist}">
									<c:url var="planContent" value="planContent.pd">
										<c:param name="plan_idx">${plandto.plan_idx }</c:param>
										<c:param name="mem_id">${plandto.mem_id }</c:param>
										<c:param name="plan_wrinum">${plandto.plan_wrinum }</c:param>
										<c:param name="plan_readnum">${plandto.plan_readnum }</c:param>
									</c:url>
									<a href="${planContent}">
										<div class="product-chooser-item" style="display: inline-block; float: left;">
											<div id="Dday">
												<span style="padding-top:3px;padding-left: 40px;font-size:18px;">여행전 </span>
											</div>
											<img src="img/plan/지도.PNG" class="img-rounded ">
											<div>
												<c:set var="title" value="${plandto.plan_title}" />
												<c:set var="size" value="${fn:length(title)}" />
												<c:choose>
													<c:when test="${size>15}">
														<span class="title">${fn:substring(title,0,10)}</span>
													</c:when>
													<c:otherwise>
														<span class="title">${plandto.plan_title}</span>
													</c:otherwise>
												</c:choose>
												<span class="description">총 ${plandto.plan_term}일 여행</span>
												<hr>
													<span> 작성자&nbsp;|&nbsp;${plandto.mem_id}님<a href="jimPlan.pd?plan_idx=${plandto.plan_idx}&plan_term=${plandto.plan_term}&plan_title=${plandto.plan_title}&mem_id=${id }&plan_wrinum=${plandto.plan_wrinum }">&nbsp;&nbsp;|&nbsp;담기</a></span><span style="padding-left: 40px;"><img src="img/plan/눈.PNG" style="width: 20px; height: 15px;">&nbsp;·&nbsp;${plandto.plan_readnum} </span>												
												</div>
											<div class="clear"></div>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
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