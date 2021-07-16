<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${empty list}">
		<p>해당 이름의 제휴업체는 존재하지 않습니다.</p>
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${list}">
			<p>- : ${dto.idx}</p>
			<p>업종 : ${dto.category}</p>
			<p>기업명 : ${dto.name}</p>
			<p>국가명 : ${dto.nation}</p>
			<p>tel : ${dto.tel}</p>
			<p>email : ${dto.email}</p>
			<p>책임자 : ${dto.charge}</p>
			<p>등록일 : ${dto.joindate}</p>
			<p>
				<button type="button" class="btn btn-warning" onclick="goMod(${dto.idx})">제휴업체 수정</button>
				<button type="button" class="btn btn-danger" onclick="goDel(${dto.idx})">제휴업체 삭제</button>
			</p>
		</c:forEach>
	</c:otherwise>
</c:choose>