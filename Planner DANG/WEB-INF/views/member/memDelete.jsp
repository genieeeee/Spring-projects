<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>플래너당</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  		
        
      
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function createTextArea(){
	document.getElementById("tArea").innerHTML = '<textarea rows="4" cols="30" style="resize: none;"></textarea>';
}
function deleteTextArea(){
	document.getElementById("tArea").innerHTML = '';
}
</script>
<style>
span{
margin : 0 auto;
}
</style>
    </head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-sm" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
			<div class="hidden-sm"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>			
			<div class="col-xs-11 col-sm-11 portfolioContainer">
				<form name="delete" action="memDelete.pd" method="post">			
					<div align="center">
						<h2>회원탈퇴</h2><br><br><br>
							<div style="margin-left: -3.2cm;">
								<input type="radio" name="reason" onclick="deleteTextArea()"> 타 사이트 이용<br>
							</div>
							<div style="margin-left: -3.3cm;">
								<input type="radio" name="reason" onclick="deleteTextArea()"> 서비스 불만족<br>
							</div>
							<div style="margin-left: -0.5cm;">
								<input type="radio" name="reason" onclick="deleteTextArea()"> 제공하는 정보가 정확하지 않음<br>
							</div>
							<div style="margin-left: -2.09cm;">
								<input type="radio" name="reason" onclick="deleteTextArea()"> 상품이 다양하지 않음<br>
							</div>
							<div style="margin-left: -4.15cm;">
								<input type="radio" name="reason" onclick="createTextArea()"> 직접입력<br>
								<div id="tArea" style="margin-left: 4.2cm;"></div>
							</div><br>
						<input type="hidden" name="mem_id" value="${mem_id}">
						<input type="submit" value="탈퇴" style="width:250px;"><br><br><br><br><br><br><br><br>
					</div>			
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
</div>
</body>
</html>