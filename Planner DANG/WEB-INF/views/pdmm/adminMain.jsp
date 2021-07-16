<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>플래너당 +_+</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
	<article>
		<div class="container-fluid" style="margin-top:50px">
			<h3>관리모드 메인</h3>
			<div class="row">
			    <div class="col-xs-6">
			    	<h3>회원관리</h3>
			        <p>모든 회원의 신상에 대한 정보를 볼 수 있으며 </p>    
			        <p>블랙리스트를 작성할 수 있다. </p>    
			    </div>
			    <div class="col-xs-6">
			    	<h3>비즈니스분석(CRM)</h3>
			        <p>CRM은 회원들의 구매패턴과 호감도를 분석할 수 있으며 </p>    
			        <p>미래 예측을 제공한다. </p>  
			    </div>
			    <div class="col-xs-6">
			    	<h3>제휴업체관리</h3>
			        <p>모든 제휴업체의 정보를 볼 수 있으며 </p>    
			        <p>제휴업체를 추가, 수정, 삭제할 수 있다. </p>  
			    </div>
			    <div class="col-xs-6">
			    	<h3>이벤트관리</h3>
			        <p>모든 이벤트에 관한 정보를 볼 수 있으며 </p>    
			        <p>이벤트를 추가, 수정, 삭제할 수 있다. </p>  
			    </div>
			    <c:choose>
					<c:when test="${empty lastLoginMsg}"></c:when>
					<c:otherwise>
						<div class="col-xs-6">
							<h3>관리자 마지막 로그인</h3>
							<p>아이디 : ${lastLoginMsg[0]}</p>
							<p>로그인 시간 : ${lastLoginMsg[1]}</p>
						</div>
					</c:otherwise>
				</c:choose>
			    <c:choose>
			    	<c:when test="${empty lastUpdateMsg}"></c:when>
			    	<c:otherwise>
			    		<div class="col-xs-6">
			    			<h3>관리자 마지막 작업</h3>
			    			<p>작업명 : ${lastUpdateMsg[0]}</p>
			        		<p>작업 시간 : ${lastUpdateMsg[1]}</p>
			    		</div>
			    	</c:otherwise>
			    </c:choose>
			    <div class="col-xs-6">
			    	<h3>회원 항공권 예약 상태관리</h3>
			    	<p><a href="airEndTicket.pd"><button>예약상태변경</button></a></p>
			        <p>항공권을 구매한 회원들의 만료일자에 맞추어서 </p>    
			        <p>만료된 티켓의 상태를 보여주게 하기 위해 진행한다. </p>  
			    </div>
			</div>
		</div>
	</article>
</section>
</body>
</html>