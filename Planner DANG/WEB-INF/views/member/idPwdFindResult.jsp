<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script>
function back(){
	location.href='idPwdFind.pd'
}
function popupClose(){
	self.close();
}
</script>
</head>
<body>
	<c:if test="${msg=='notExist'}">
		<br><br><br><br><br><br>
		<h4 align="center">일치하는 정보가 없습니다</h4>
		<br><br>
		<p align="center">
		<input type="button" value="뒤로" onclick="back()">
		<input type="button" value="닫기" onclick="popupClose()">
		</p>
	</c:if>
	
	<c:if test="${msg!='notExist'}">

		<c:if test="${type=='id'}">
		<br><br><br><br>
			<div class="form-group" id="divId">
			<label for="inputId" class="col-lg-2 control-label">회원님의 아이디는</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" value="${msg}" readonly="readonly">
			</div>
		</div>
		<br><br>	
			<p align="center">
			<input type="button" value="뒤로" onclick="back()">
			<input type="button" value="닫기" onclick="popupClose()">
			</p>
		</c:if>
		
		<c:if test="${type=='pwd'}">
		<br><br><br><br>	
			<div class="form-group" id="divId">
			<label for="inputId" class="col-lg-2 control-label">회원님의 비밀번호는</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" value="${msg}" readonly="readonly">
			</div>
		</div>
		<br><br>	
			<p align="center">
			<input type="button" value="뒤로" onclick="back()">
			<input type="button" value="닫기" onclick="popupClose()">
			</p>
		</c:if>

	</c:if>
</body>
</html>