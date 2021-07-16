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
				<%@ include file="crmHeader.jsp" %>
			    <div class="panel-body">
			    	<div class="container-fluid">
						<h3>CRM관리 메인</h3>
						<div class="row">
						    <div class="col-xs-6">
						    	<h3>매출분석</h3>
						        <p>주별, 월별, 분기별로 매출정보의 통계를 볼 수 있으며 </p>    
						        <p>과거를 기반으로 하여 마감예측과 미래예측을 보여준다.</p>    
						    </div>
						    <div class="col-xs-6">
						    	<h3>좋아요분석(내년에 완성될 예정)</h3>
						        <p>주별, 월별, 분기별로 회원들이 추가한 좋아요의 통계를 볼 수 있으며</p>    
						        <p>과거를 기반으로 하여 마감예측과 미래예측을 보여준다.</p>  
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