<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="js/httpRequest.js"></script>
</head>
<body>
	<div id="suggest">  	
		<c:if test="${empty msg }">
		<div id="suggestList" class="tt-dropdown-menu" style="position: absolute;  right: auto;">
			<c:forEach items="${results }" var="city">
				<a href="javascript:getSearch3Code('${city }')">${city }</a><br>
			</c:forEach>
		</div>
		</c:if>
		<c:if test="${msg }">
		<div id="suggestList" class="tt-dropdown-menu" style="position: absolute; right: auto;">
			${msg }
		</div>
		</c:if>         
	</div>
</body>
</html>