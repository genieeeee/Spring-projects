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
<link rel="stylesheet" type="text/css" href="css/blog.css">
<script>
function follow(mem_ids) {
	location.href='follow.pd?mem_id='+mem_ids;
}
function unfollow(mem_ids) {
	location.href='unfollow.pd?mem_id='+mem_ids;
}

function img() {
	var popupX= (window.screen.width / 2) - (550/2);
    var popupY= (window.screen.height / 2) - (300/2);
    window.open('memImg.pd', 'img', 'width=550, height=150, left='+popupX+', top='+popupY+', screenX='+popupX+', screenY='+popupY);
}
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-11 text-center" style="position: static;">
			<div class="panel panel-default">
				<div class="userprofile social" style="background: url(${mainimg}) no-repeat; background-size: 100% 100%;">
					<div class="userpic">
					<c:if test="${mem_ids eq id}">
						<a href="javascript:img()"><img src="/pd/img/member/${arr[0].mem_img}" alt="" class="userpicimg"></a>					
					</c:if>
					<c:if test="${mem_ids ne id}">
						<img src="/pd/img/member/${arr[0].mem_img}" alt="" class="userpicimg">
					</c:if>
					</div>
					<h3 class="username">${mem_ids }님의 블로그</h3>
					<div class="socials tex-center"> 
						<a href="#" class="btn btn-circle btn-primary " 
						onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 
								'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" 
								target="_blank"><i class="fa fa-facebook"></i></a> 
						<a href="#" class="btn btn-circle btn-danger " onclick="javascript:window.open('https://plus.google.com/share?url='+encodeURIComponent(document.URL),
								'googleplussharedialog','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=350,width=600');return false;" 
								target="_blank"><i class="fa fa-google-plus"></i></a> 
						<a href="#" class="btn btn-circle btn-info " onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20'+encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 
								'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" 
								target="_blank"><i class="fa fa-twitter"></i></a> 
						<!-- <a href="" class="btn btn-circle btn-warning "><i class="fa fa-naver"></i></a> -->
            		</div>	
				</div>
				<div class="col-md-12 border-top border-bottom">
					<ul class="nav nav-pills pull-left countlist" role="tablist"
						style="list-style-type: none;">
						<li role="presentation">
							<h3>
								<a href="followView.pd?mem_id=${mem_ids}">${follower }<br> <small>Follower</small></a>
							</h3>
						</li>
						<li role="presentation">
							<h3>
								<a href="followingView.pd?mem_id=${mem_ids}">${following }<br> <small>Following</small></a>
							</h3>
						</li>
					</ul>
						<p style="text-align: right; line-height: 80px;">
							<c:choose>
								<c:when test="${mem_ids eq mem_id }">
									<a href="javascript:window.open('imgUpdate.pd', 'imgUpdate', 'width=360, height=50')">
										<img src="img/mypage/setting.png" width="25" height="25" style="z-index: 99;">
									</a>							
								</c:when>
								<c:when test="${mem_ids ne mem_id }">
									<c:choose>
										<c:when test="${num eq 1}">
											<button class="btn btn-primary followbtn" onclick="unfollow('${mem_ids}')">UnFollow</button>
										</c:when>
										<c:when test="${num eq 2}">										
											<button class="btn btn-primary followbtn" onclick="follow('${mem_ids}')">Follow</button>							
										</c:when>
									</c:choose>
								</c:when>
								<c:when test="${empty mem_id}"></c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>