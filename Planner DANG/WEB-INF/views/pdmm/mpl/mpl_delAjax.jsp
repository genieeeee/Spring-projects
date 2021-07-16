<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-dialog">
	<form name="f" method="post" action="pdMM_MPL_del.pd">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">제휴업체 삭제하기</h4>
			</div>
			<div class="modal-body">
				<p>- : ${dto.idx}</p>
				<p>업종 : ${dto.category}</p>
				<p>기업명 : ${dto.name}</p>
				<p>국가명 : ${dto.nation}</p>
				<p>tel : ${dto.tel}</p>
				<p>email : ${dto.email}</p>
				<p>책임자 : ${dto.charge}</p>
				<p>등록일 : ${dto.joindate}</p>
				<hr>
				<p>코멘트 내역</p>
				<c:choose>
				<c:when test="${empty cnt}">
					<div>작성된 코멘트가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="cnt" items="${cnt}">
						<div>
						<c:forEach var="writer" items="${writer}" begin="${cnt}" end="${cnt}" step="1">
							<div><label data-toggle="collapse" data-target="#demo${cnt}" onclick="test(${cnt})">${writer}</label></div>
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
				<input type="hidden" name="idx" value="${dto.idx}">
				<button type="button" class="btn btn-success" onclick="document.f.submit()">제휴업체 삭제</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</form>
</div>