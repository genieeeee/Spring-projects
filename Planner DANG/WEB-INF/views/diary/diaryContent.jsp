<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/comment.css">
<script
  src="https://code.jquery.com/jquery-3.2.1.js" 
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous">
</script>
<style>
table{
	width: 700px;
	overflow: auto;
}
#t{
	height: 10px;
}
</style>
</head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-sm"><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp"%>
			<div class="hidden-sm"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>
			<div class="portfolioContainer col-xs-11 col-sm-11">
				<c:forEach var="li" items="${dia_content}">
					<input type="hidden" name="dia_idx" value="${li.dia_idx }">
					<div class="col-sm-12">
						<div class="stats pull-right">
							<c:if test="${mem_ids eq id}">
								<!-- 자기 블로그일때 -->
								<c:url var="update" value="diaryUpdate.pd">
									<c:param name="dia_idx">${li.dia_idx }</c:param>
								</c:url>
								<c:url var="del" value="diaryDeleteQ.pd">
									<c:param name="dia_idx">${li.dia_idx }</c:param>
								</c:url>
								<a href="${update }">수정</a> |
								<a href="${del}">삭제</a>
							</c:if>
						</div>	
						<div class="panel panel-white post">
							<form name="diaryContent" action="diaryUpdate.pd">
								<div class="post-heading" style="text-align: center;">		
									<div class="meta">	
										<div class="title h5">
											<h4>${li.dia_subject}</h4>
										</div>
										<h6 class="text-muted time">${li.dia_writedate} | ${li.dia_readnum}</h6>
									</div>
								</div>
								<div class="post-description" style="text-align: center;">
									${li.dia_content}
								</div>			
							</form>
							<div class="post-footer">
								<form name="comment" action="commentWrite.pd">
									<div class="input-group">
										<c:choose>
											<c:when test="${empty id}"></c:when>
											<c:otherwise>
													<c:forEach var="lis" items="${dia_content}">
														<input type="hidden" name="mem_id" value="${id}">
														<input type="hidden" name="dia_idx" value="${lis.dia_idx}">
													</c:forEach>
													<input class="form-control" name="com_comment" placeholder="Add a comment" type="text"> 
													<span class="input-group-addon">
														<button class="btn btn-sm btn-primary pull-right" type="submit">
															<i class="fa fa-edit"></i>
														</button>
													</span>
											</c:otherwise>
										</c:choose>
									</div>
								</form>
								<ul class="comments-list" style="text-align: left;">
									<c:if test="${empty comlist}"></c:if>
									<c:forEach var="com" items="${comlist}">
										<li class="comment">
											<a class="pull-left" href="javascript:void(0);"> 
												<img class="avatar" src="img/member/${com.mem_img}" alt="avatar">
											</a>
											<div class="comment-body">
												<div class="comment-heading">
													<h4 class="user">
														<a href="mypage.pd?mem_id=${com.mem_id}">${com.mem_id}</a>
													</h4>
													<h5 class="time">${com.com_writedate}</h5>
													<c:if test="${com.mem_id eq id}">
														<span style="text-align: right;"> <c:forEach var="lis2" items="${dia_content}">
																<input type="hidden" name="dia_idx" value="${lis.dia_idx}">
																<c:url var="del" value="commentDelete.pd">
																	<c:param name="com_idx">${com.com_idx}</c:param>
																	<c:param name="dia_idx">${lis2.dia_idx}</c:param>
																</c:url>
															</c:forEach> <a href="${del}" class="btn-link text-semibold">삭제</a>
														</span>
													</c:if>
												</div>
												<p>${com.com_comment}</p>
											</div>
										</li>
									</c:forEach>
								</ul>
								<p style="text-align: center;">${page }</p>
							</div>
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