<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

</head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-sm" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
			<div class="hidden-sm"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>			
			<div class="col-xs-11 col-sm-11 portfolioContainer">
           
                <div class="col-md-6">
                    <!-- 좌측공간 -->
                <div class="col-md-6">
                  	<!-- 우측공간 -->
                </div>
            </div>
            <!--// 헤더 들어가는 부분 -->          
            <hr/><br>
                <!-- 본문 들어가는 부분 -->   
				<form class="form-horizontal" name="pwdCert" action="pwdCert.pd" method="post" role="form">
				
					<div class="form-group" id="divPassword">
						<label for="inputPassword" class="col-lg-2 control-label" style="text-align: right;">비밀번호</label>
						<div class="col-lg-8">
				              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD" maxlength="30" required="required">
						</div>
					</div>
					
						<br><br><br><br>
						<p align="center">
							<input type="submit" value="확인" style="width:150px;">
						</p>     
						<input type="hidden" name="id" value="${mem_id}">
						<input type="hidden" name="type" value="${type}">
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
</div>
</body>
</html>