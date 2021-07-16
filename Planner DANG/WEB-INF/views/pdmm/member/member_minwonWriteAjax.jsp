<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-dialog">
	<div class="modal-content">
		<form name="fMinwon" method="post" action="member_minwonWrite.pd">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" onclick="location.reload()">&times;</button>
				<h4 class="modal-title text-center">${mem_id} 민원 작성하기</h4>
			</div>
			<div class="modal-body">
				<p>작성자 : <input type="text" name="writer"></p>
				<p><textarea cols="40" rows="20" name="comment"></textarea></p>
				<p><input type="hidden" name="mem_id" value="${mem_id}"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal" onclick="minwonWriteCheck()">민원 작성</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.reload()">Close</button>
			</div>
		</form>
	</div>
</div>