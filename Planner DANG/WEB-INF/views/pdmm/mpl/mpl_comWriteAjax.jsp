<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-dialog">
	<div class="modal-content">
		<form name="fComment" method="post" action="mpl_commentWrite.pd">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" onclick="location.reload()">&times;</button>
				<h4 class="modal-title text-center">${dto.name} 코멘트 작성하기</h4>
			</div>
			<div class="modal-body">
				<p>작성자 : <input type="text" name="writer"></p>
				<p><textarea cols="40" rows="20" name="comment"></textarea></p>
				<p><input type="hidden" name="idx" value="${dto.idx}"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="commentCheck" onclick="commentWriteCheck()">유효성 검사</button>
				<button type="button" class="btn btn-warning" style="display: none" id="commentMod" onclick="commentModify()">코멘트 수정</button>
				<button type="button" class="btn btn-success" data-dismiss="modal" style="display: none" id="commentSubmit" onclick="document.fComment.submit()">코멘트 작성</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Close</button>
			</div>
		</form>
	</div>
</div>