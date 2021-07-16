<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너당 +_+</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
	<article>
		<div class="container-fluid" style="margin-top:50px">
			<div class="panel panel-default">
				<%@ include file="memberHeader.jsp" %>
			    <div class="panel-body">
			    	<div class="container-fluid">
						<h3>회원관리 메인</h3>
						<div class="row">
						    <div class="col-xs-4">
						    	<h3>전체회원</h3>
						        <p>연령,국적,거주지,성별을 필터로 사용하여 </p>    
						        <p>해당 조건값을 가진 모든 회원의 신상정보를 불러온다. </p>    
						    </div>
						    <div class="col-xs-4">
						    	<h3>회원검색</h3>
						        <p>이름, 이메일을 통한 회원검색 기능을 제공하여</p>    
						        <p>필요한 회원의 신상정보를 빠르게 가져올 수 있다.</p>  
						    </div>
						    <div class="col-xs-4">
						    	<h3>민원관리</h3>
						        <p>아이디, 이름, 이메일을 이용하여 해당 회원의 </p>    
						        <p>민원내역과 활동내역을 볼 수 있으며 수정도 가능하다. </p>  
						    </div>
						    <div class="col-xs-4">
						    	<h3>블랙설정</h3>
						        <p>아이디, 이름, 이메일을 이용하여 해당 회원을 </p>    
						        <p>블랙리스트에 추가, 삭제할 수 있다. </p>  
						    </div>
						    <div class="col-xs-4">
						    	<h3>휴면설정</h3>
						        <p>아이디, 이름, 이메일을 이용하여 해당 회원을 </p>    
						        <p>휴면상태로 추가 혹은 해제할 수 있다. </p>  
						    </div>
						    <div class="col-xs-4" style="visibility: hidden">
						    	<h3>깔맞춤</h3>
						        <p>히히히 </p>    
						        <p>히히히 </p>  
						    </div>
							<div class="col-xs-6">
						    	<h3>관리자 마지막 로그인</h3>
								<c:forEach var="admin" items="${admin}">
							    	<p><label data-toggle="collapse" data-target="#demo${admin.mem_id}"><label style="width: 100px">#아이디 : </label>${admin.mem_id}(클릭)</label></p>
							    	<div id="demo${admin.mem_id}" class="collapse">
								        <p><label style="width: 100px">이름 : </label>${admin.mem_name}</p>
								        <p><label style="width: 100px">마지막 로그인 : </label>${admin.mem_lastLog}</p>
							    	</div>
								</c:forEach>
						    </div>
						    <c:choose>
						    	<c:when test="${empty lastUpdateMsg}"></c:when>
						    	<c:otherwise>
						    		<div class="col-xs-6">
						    			<h3>관리자 마지막 작업</h3>
						    			<p><label style="width: 70px">작업명 : </label>${lastUpdateMsg[0]}</p>
						        		<p><label style="width: 70px">작업시간 : </label>${lastUpdateMsg[1]}</p>
						    		</div>
						    	</c:otherwise>
						    </c:choose>
						</div>
					</div>
			    </div>
			    <div class="panel-footer"></div>
		  	</div>
		</div>
	</article>
</section>
</body>
</html>