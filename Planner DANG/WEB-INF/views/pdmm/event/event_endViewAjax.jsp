<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-dialog">
	<form name="f" method="post" action="pdMM_event_end.pd">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이벤트 마감하기</h4>
			</div>
			<div class="modal-body">
				<p>이벤트 제목 : ${dto.eListTitle}</p>
				<p>이벤트 시작일 : ${dto.eListDateS} </p>
				<p>이벤트 종료일 : ${dto.eListDateE}
					<input type="hidden" name="eListIdx" value="${dto.eListIdx}">
					<input type="hidden" name="eListTitle" value="${dto.eListTitle}">
					<input type="hidden" name="eListDateS" value="${dto.eListDateS}">
					<input type="hidden" name="eListDateE" value="${dto.eListDateE}">
					<input type="hidden" name="eMainContent" value="${dto.eMainContent}">
				</p>
				<div>
					<p>올린 파일 목록 </p>
					<c:forTokens var="result" items="${dto.eMainContent}" delims="냨늌">
						<p>${result}</p>
						<img src="/pd/event/upload/${dto.eListTitle}/${result}" width="200" height="200">
					</c:forTokens>
				</div>
				<p>총 응모자 수 : ${dmCnt}</p>
				<p>응모한 회원 명단</p>
				<c:choose>
					<c:when test="${empty dmList}">
						<p>이벤트에 응모한 회원이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<p>당첨자 수 설정 : <input type="number" name="selCnt" min="1" max="${dmCnt}"></p>
						<p>
						<c:forEach var="result" items="${dmList}">
							${result},
						</c:forEach>
						</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="modal-footer">
				<c:choose>
					<c:when test="${empty dmList}"></c:when>
					<c:otherwise>
						<button type="button" class="btn btn-success" onclick="document.f.submit()">당첨자 설정하기</button>
					</c:otherwise>
				</c:choose>	
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</form>
</div>