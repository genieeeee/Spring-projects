<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${empty dto}">
		<p>해당 번호의 이벤트는 존재하지 않습니다.</p>
	</c:when>
	<c:otherwise>
		<p>이벤트 Idx : ${dto.eListIdx}</p>
		<p>이벤트 제목 : ${dto.eListTitle}</p>
		<p>이벤트 시작일 : ${dto.eListDateS}</p>
		<p>이벤트 종료일 : ${dto.eListDateE}</p>
		<p>
			<button type="button" class="btn btn-info" onclick="goMod(${dto.eListIdx})">이벤트 수정</button>
			<button type="button" class="btn btn-danger" onclick="goDel(${dto.eListIdx})">이벤트 삭제</button>
			<button type="button" class="btn btn-success" onclick="goEnd(${dto.eListIdx})">이벤트 마감</button>
		</p>
	</c:otherwise>
</c:choose>
