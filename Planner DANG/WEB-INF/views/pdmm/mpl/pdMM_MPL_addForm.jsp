<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너당 +_+</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
var all = document.all;
function onlyNum(){
	var f = document.f.tel;
	var fVal = f.value;
	var len = fVal.length;
	var result = '';
	for(var i = 0 ; i < len ; i++){
		var c = fVal.charCodeAt(i);
		if(c >= 48 && c <= 57) result += fVal.charAt(i);
		else{
			f.value = result;
			alert('숫자만 입력하세요.');
			return;
		}
	}
}
function checkText(tp){
	var f;
	if(tp == 'category') f = document.f.category;
	else if(tp == 'name') f = document.f.name;
	else if(tp == 'nation') f = document.f.nation;
	else if(tp == 'email') f = document.f.email;
	else if(tp == 'charge') f = document.f.charge;
	var fVal = f.value;
	var len = fVal.length;
	var result = '';
	for(var i = 0 ; i < len ; i++){
		var c = fVal.charAt(i);
		if(c == '>' || c == '<' || c == '|' || c == '\\' || c == '?' || c == '\"' || c == ':' || c == '/' || c == '*' || c == '~'){
			f.value = result;
			alert('금지문자를 입력하셨습니다.');
			return;
		}
		else result += fVal.charAt(i);	
	}
}
function goConfirm(){
	var category = all.f1.value;
	var name = all.f2.value;
	var nation = all.f3.value;
	var tel = all.f4.value;
	var email = all.f5.value;
	var charge = all.f6.value;
	var joindate = all.f7.value;
	if(category.length != 0 && name.length != 0 && nation.length != 0 && tel.length >= 8 && email.length >= 12 && charge.length !=0 && joindate.length != 0){
		var len = email.length;
		var subs = email.substring(len - 4, len);
		var boo = false;
		for(var i = 0 ; i < len - 4 ; i++){
			c = email.charAt(i);
			if(c == '@') boo = true;
		}
		if((subs == '.com' || subs == '.net') && boo){
			all.modal_category.innerText = category;
			all.modal_name.innerText = name;
			all.modal_nation.innerText = nation;
			all.modal_tel.innerText = tel;
			all.modal_email.innerText = email;
			all.modal_charge.innerText = charge;
			all.modal_joindate.innerText = joindate;
			all.btnModal.setAttribute('data-toggle' ,'modal');
		}else{
			alert('이메일을 제대로 입력해주세요');
			return all.btnModal.removeAttribute('data-toggle');
		}
	}else{
		alert('모든 값을 다 입력하셔야 합니다.');
		all.btnModal.removeAttribute('data-toggle');
	}
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
	<article>
		<div class="container-fluid" style="margin-top:50px">
			<div class="panel panel-default">
				<%@ include file="mplHeader.jsp" %>
			    <div class="panel-body">
			    	<div class="container-fluid">
			    		<form name="f" method="post" action="pdMM_MPL_add.pd">
							<ul class="list-group">
								<li class="list-group-item">
									<h4 class="list-group-item-heading" data-toggle="collapse" data-target="#mplAddForm">제휴업체 추가(클릭)</h4>
									<p class="list-group-item-text">금지문자 &gt; , &lt; , | , \ , ? , &quot; , : , / , *, ~</p>
								</li>	
							</ul>
							<div id="mplAddForm" class="collapse">
								<div class="col-xs-6">
									<div class="form-group">
										<div class="col-xs-2">
									    	<label for="f1">업종:</label>
										</div>
										<div class="col-xs-10">
									    	<input type="text" name="category" id="f1" onkeyup="checkText('category')">
										</div>
								  	</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<div class="col-xs-2">
									    	<label for="f2">이름:</label>
										</div>
										<div class="col-xs-10">
									    	<input type="text" name="name" id="f2" onkeyup="checkText('name')">
										</div>
								  	</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<div class="col-xs-2">
									    	<label for="f3">국적:</label>
										</div>
										<div class="col-xs-10">
									    	<input type="text" name="nation" id="f3" onkeyup="checkText('nation')">
										</div>
								  	</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<div class="col-xs-2">
									    	<label for="f4">전화번호:</label>
										</div>
										<div class="col-xs-10">
									    	<input type="text" name="tel" id="f4" onkeyup="onlyNum()">
										</div>
								  	</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<div class="col-xs-2">
									    	<label for="f5">이메일:</label>
										</div>
										<div class="col-xs-10">
									    	<input type="text" name="email" id="f5" onkeyup="checkText('email')">
										</div>
								  	</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<div class="col-xs-2">
									    	<label for="f6">담당자:</label>
										</div>
										<div class="col-xs-10">
									    	<input type="text" name="charge" id="f6" onkeyup="checkText('charge')">
										</div>
								  	</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<div class="col-xs-2">
									    	<label for="f7">등록일:</label>
										</div>
										<div class="col-xs-10">
									    	<input type="date" name="joindate" id="f7">
										</div>
								  	</div>
								</div>
								<div class="col-xs-12 text-center">
									<button type="button" id="btnModal" class="btn btn-success" data-toggle="modal" data-target="#resultModal" onclick="goConfirm()">제휴업체 등록</button>
								</div>
							</div>
							<div class="modal fade" id="resultModal" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										    <h4 class="modal-title">작성하신 제휴업체 정보</h4>
										</div>
										<div class="modal-body">
											<p>업종 : <label id="modal_category"></label></p>
										    <p>이름 : <label id="modal_name"></label> </p>
										    <p>국적 : <label id="modal_nation"></label> </p>
										    <p>전화번호 : <label id="modal_tel"></label></p>
										    <p>이메일 : <label id="modal_email"></label></p>
										    <p>담당자 : <label id="modal_charge"></label></p>
										    <p>등록일 : <label id="modal_joindate"></label></p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success" onclick="document.f.submit();">등록하기</button>
										    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
			    		</form>
					</div>
			    </div>
			    <div class="panel-footer"></div>
		  	</div>
		</div>
	</article>
</section>
</body>
</html>