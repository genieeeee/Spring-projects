<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>플래너당 +_+</title>
</head>
<body>
	<div class="page-container ">
		<div class="content">
			<!-- MPA_AREA -->
			<div class="map_Area"></div>
			<div class="col-sm-10 col-xs-9" style="margin-left: 50px;">
				<div class="carousel slide media-carousel" id="media">
					<h2 style="font-weight: 600; margin-left: 2%; margin-bottom: 1%;">인기 블로그</h2>
					<div class="carousel-inner">
						<div class="item  active">
							<div class="row">
								<c:forEach var="blogL" items="${blogList}" begin="0" end="3" step="1">
								<div class="col-md-3">
									<c:url var="blogP" value="mypage.pd">
										<c:param name="mem_id">${blogL.mem_id}</c:param>
									</c:url>
									<a class="thumbnail" href="${blogP}"><img
										src="${blogL.blo_mainimg}">${blogL.mem_id}님의 블로그</a>
								</div>							
								</c:forEach>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<c:forEach var="blogL2" items="${blogList}" begin="4" end="7" step="1">
								<div class="col-sm-3">
									<c:url var="blogP2" value="mypage.pd">
										<c:param name="mem_id">${blogL2.mem_id}</c:param>
									</c:url>
									<a class="thumbnail" href="${blogP2 }"><img
										src="${blogL2.blo_mainimg}">${blogL2.mem_id}님의 블로그</a>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<a data-slide="prev" href="#media" class="left carousel-control"
						style="font-size: 20px;">‹</a> <a data-slide="next" href="#media"
						class="right carousel-control" style="font-size: 20px;">›</a>
				</div>
			</div>
			<!-- POINT_AREA -->
			<div class="col-sm-10 col-xs-9" style="margin-left: 50px;">
				<div class="carousel slide media-carousel" id="media">
					<h2 style="font-weight: 600; margin-left: 2%; margin-bottom: 1%;">이벤트</h2>
					<div class="carousel-inner">
						<div class="item active">

							<div class="col-sm-3">
								<a class="thumbnail" href="eventIngContent.pd?idx=12&subject=올레&fullName=12-올레-20170618~20170628.txt"><img
									src="/pd/event/upload/올레/제주.jpg">제주 올래? 제주 올레!</a>
							</div>
							<div class="col-sm-3">
								<a class="thumbnail" href="eventIngContent.pd?idx=10&subject=유럽%20금까기&fullName=10-유럽%20금까기-20170620~20170630.txt"><img
									src="/pd/event/upload/유럽 금까기/유럽 금까기.png">유럽 금까기</a>
							</div>
							<div class="col-sm-3">
								<a class="thumbnail" href="eventIngContent.pd?idx=7&subject=가슴이%20팔당팔당&fullName=7-가슴이%20팔당팔당-20170625~20170715.txt"><img
									src="/pd/event/upload/가슴이 팔당팔당/팔당팔당.jpg">가슴이 팔당팔당</a>
							</div>
							<div class="col-sm-3">
								<a class="thumbnail" href="eventIngContent.pd?idx=13&subject=내가%20간다%20하와이&fullName=13-내가%20간다%20하와이-20170611~20170628.txt"><img
									src="/pd/event/upload/내가 간다 하와이/하와이.jpg">내가 간다 하와이</a>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- CONTENT -->
		</div>
		<%@ include file="header.jsp"%>
	</div>
</body>
</html>