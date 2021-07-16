<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" onclick="location.reload()">&times;</button>
			<h4 class="modal-title text-center">${dto.eListTitle} 내용</h4>
		</div>
		<div class="modal-body">
			<p>이벤트 제목 : ${dto.eListTitle}</p>
			<p>이벤트 시작일 : ${dto.eListDateS}</p>
			<p>이벤트 종료일 : ${dto.eListDateE}</p>
			<c:forTokens var="result" items="${dto.eMainContent}" delims="냨늌">
				<p>${result}</p>
				<img src="/pd/event/upload/${dto.eListTitle}/${result}" width="300" height="300">
			</c:forTokens>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Close</button>
		</div>
	</div>
</div>
