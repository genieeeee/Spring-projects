<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${empty dto}">
		<p>해당 번호의 이벤트는 존재하지 않습니다.</p>
	</c:when>
	<c:otherwise>
		<p>이벤트 Idx : ${dto.eListIdx}</p>
		<p>이벤트 제목 : ${dto.eListTitle}</p>
		<p>이벤트 시작일 : ${dto.eListDateS}</p>
		<p>이벤트 종료일 : ${dto.eListDateE}</p>
		<p>이벤트 당첨자 : ${selCnt}명</p>
		<p>이벤트 당첨자 목록</p>
		<p>
		<c:forEach var="selList" items="${selList}">
			${selList}, 
		</c:forEach>
		</p>
	</c:otherwise>
</c:choose>