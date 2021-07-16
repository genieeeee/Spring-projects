<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-dialog">
	<form name="f" method="post" action="pdMM_event_del.pd">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이벤트 삭제하기</h4>
			</div>
			<div class="modal-body">
				<p>이벤트 제목 : ${dto.eListTitle}</p>
				<p>이벤트 시작일 : ${dto.eListDateS} </p>
				<p>이벤트 종료일 : ${dto.eListDateE}
					<input type="hidden" name="eListIdx" value="${dto.eListIdx}">
					<input type="hidden" name="eListTitle" value="${dto.eListTitle}">
					<input type="hidden" name="eListDateS" value="${dto.eListDateS}">
					<input type="hidden" name="eListDateE" value="${dto.eListDateE}">
				</p>
				<div>
					<p>올린 파일 목록 </p>
					<c:forTokens var="result" items="${dto.eMainContent}" delims="냨늌">
						<p>${result}</p>
						<img src="/pd/event/upload/${dto.eListTitle}/${result}" width="200" height="200">
					</c:forTokens>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" onclick="document.f.submit()">Event 삭제</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</form>
</div>