<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" onclick="location.reload()">&times;</button>
			<h4 class="modal-title text-center">${dto.name} 코멘트 내용</h4>
		</div>
		<div class="modal-body">
			<c:choose>
				<c:when test="${empty cnt}">
					<div>작성된 코멘트가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="cnt" items="${cnt}">
						<div>
						<c:forEach var="writer" items="${writer}" begin="${cnt}" end="${cnt}" step="1">
							<div><label data-toggle="collapse" data-target="#demo${cnt}">${writer}</label></div>
						</c:forEach>
						<c:forEach var="comment" items="${comment}" begin="${cnt}" end="${cnt}" step="1">
							<div id="demo${cnt}" class="collapse">내용 : ${comment}</div>
						</c:forEach>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Close</button>
		</div>
	</div>
</div>