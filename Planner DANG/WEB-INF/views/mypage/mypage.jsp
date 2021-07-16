<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<style type="text/css">
</style>
</head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-sm" ><%@include file="mobileMenu.jsp"%></div>
			<%@include file="topMenu.jsp" %>
			<div class="hidden-sm"><%@include file="sideMenu.jsp"%></div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
</div>
</body>
</html>