<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-dialog">
	<form name="f" method="post" action="pdMM_MPL_mod.pd">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">제휴업체 수정하기</h4>
			</div>
			<div class="modal-body">
				<p><label style="width: 100px">- : </label><input type="text" name="idx" value="${dto.idx}" readonly></p>
				<p><label style="width: 100px">업종 : </label><input type="text" name="category" value="${dto.category}" onkeyup="checkText('category')"></p>
				<p><label style="width: 100px">업체명 : </label><input type="text" name="name" value="${dto.name}" onkeyup="checkText('name')"></p>
				<p><label style="width: 100px">국적 : </label><input type="text" name="nation" value="${dto.nation}" onkeyup="checkText('nation')"></p>
				<p><label style="width: 100px">tel : </label><input type="text" name="tel" value="${dto.tel}" onkeyup="onlyNum()"></p>
				<p><label style="width: 100px">email : </label><input type="text" name="email" value="${dto.email}" onkeyup="checkText('email')"></p>
				<p><label style="width: 100px">책임자 : </label><input type="text" name="charge" value="${dto.charge}" onkeyup="checkText('charge')"></p>
				<p><label style="width: 100px">등록일 : </label><input type="date" name="joindate" value="${dto.joindate}"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" onclick="goMPLMod()">수정하기</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</form>
</div>