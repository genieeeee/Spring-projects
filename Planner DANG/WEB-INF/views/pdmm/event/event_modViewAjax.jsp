<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-dialog">
	<form name="f" method="post" action="pdMM_event_mod.pd" enctype="multipart/form-data">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이벤트 수정하기</h4>
			</div>
			<div class="modal-body">
				<p>이벤트 제목 : <input type="text" name="eListTitle" value="${dto.eListTitle}"></p>
				<p>이벤트 시작일 : <input type="text" name="eListDateS" value="${dto.eListDateS}"> </p>
				<p>이벤트 종료일 : <input type="text" name="eListDateE" value="${dto.eListDateE}">
					<input type="hidden" name="eListIdx" value="${dto.eListIdx}"></p>
				<div>
					<p>올린 파일 목록 </p>
					<c:forTokens var="result" items="${dto.eMainContent}" delims="냨늌">
						<p>${result}</p>
						<img src="/pd/event/upload/${dto.eListTitle}/${result}" width="200" height="200">
					</c:forTokens>
					<h3>파일수정하기</h3>
					<ul id="fileResult"></ul>
					<p>
						<input type="hidden" name="fileCnt" value="0">
						<button type="button" class="btn btn-success" onclick="fileF('+')">file +</button>
						<button type="button" class="btn btn-danger" onclick="fileF('-')">file -</button>
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" onclick="goEventMod()">Event 수정</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</form>
</div>