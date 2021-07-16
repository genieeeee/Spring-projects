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
function onlyNum(tc){
	var f = tc == 's' ? document.f.eListDateS : document.f.eListDateE;
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
function checkText(){
	var f = document.f.eListTitle;
	var fVal = f.value;
	var len = fVal.length;
	var result = '';
	for(var i = 0 ; i < len ; i++){
		var c = fVal.charAt(i);
		if(c == '>' || c == '<' || c == '|' || c == '\\' || c == '?' || c == '\"' || c == ':' || c == '/' || c == '*' || c == '-'){
			f.value = result;
			alert('금지문자(>,<,|,\,?,",:,/,*,-)를 입력하셨습니다.');
			return;
		}
		else result += fVal.charAt(i);	
	}
}
function goNext(cnt){
	var modB;
	var nextB;
	var nextF;
	var f = document.f;
	var all = document.all;
	switch(cnt){
	case 0 : 
		if(f.eListTitle.value.length == 0){
			alert('값을 입력하시오.');
			return;
		}else{
			modB = all.modB0;
			nextB = all.nextB0;
			nextF = all.nextF0;
			modB.style.visibility = 'visible';
			nextB.style.visibility = 'hidden';
			nextF.style.visibility = 'visible';
			f.eListTitle.setAttribute('readonly', 'readonly');
			all.modal_eListTitle.innerText = f.eListTitle.value;
		}break;
	case 1 :
		if(f.eListDateS.value.length == 8 & f.eListDateE.value.length == 8){
			modB = all.modB1;
			nextB = all.nextB1;
			nextF = all.nextF1;
			modB.style.visibility = 'visible';
			nextB.style.visibility = 'hidden';
			nextF.style.visibility = 'visible';
			f.eListDateS.setAttribute('readonly', 'readonly');
			f.eListDateE.setAttribute('readonly', 'readonly');
			all.modal_eListDateS.innerText = f.eListDateS.value;
			all.modal_eListDateE.innerText = f.eListDateE.value;
		}else{
			alert('각각 8자리의 숫자를 입력하셔야 합니다.');
			return;
		}break;
	}
}
function goMod(cnt){
	var modB;
	var nextB;
	var nextF;
	var f = document.f;
	var all = document.all;
	switch(cnt){
	case 0 :
		modB = all.modB0;
		nextB = all.nextB0;
		nextF = all.nextF0;
		modB.style.visibility = 'hidden';
		nextB.style.visibility = 'visible';
		nextF.style.visibility = 'hidden';
		f.eListTitle.removeAttribute('readonly');
		break;
	case 1 :
		modB = all.modB1;
		nextB = all.nextB1;
		nextF = all.nextF1;
		modB.style.visibility = 'hidden';
		nextB.style.visibility = 'visible';
		nextF.style.visibility = 'hidden';
		f.eListDateS.removeAttribute('readonly');
		f.eListDateE.removeAttribute('readonly');
	}
}
function fileF(ft){
	var f = document.f;
	var all = document.all;
	var fileCnt = f.fileCnt.value;
	var fileResult = all.fileResult;
	if(ft == '+') fileCnt ++;
	else{
		if(fileCnt <= 0) return;
		else fileCnt --;
	}
	fileResult.innerHTML = '';
	f.fileCnt.value = fileCnt;
	for(var i = 0 ; i < fileCnt ; i++) fileResult.innerHTML += '<li><input type=\"file\" name=\"upload\"></li>';
}
function showUpload(){
	var f = document.f;
	var all = document.all;
	var fileCnt = f.fileCnt.value;
	var modal_upload = all.modal_upload;
	modal_upload.innerHTML = '';
	if(fileCnt == 0) alert('파일을 올리지 않았습니다.\n반드시 파일을 올리셔야 합니다.');
	else if(fileCnt == 1) modal_upload.innerHTML = '<p>파일명 : ' + f.upload.value + '</p>'
	else if(fileCnt >= 2){
		for(var i = 0 ; i < fileCnt ; i++) modal_upload.innerHTML += '<p>' + (i+1) + '번째 파일명 : ' + f.upload[i].value + '</p>';
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
				<%@ include file="eventHeader.jsp" %>
			    <div class="panel-body">
			    	<div class="container-fluid">
			    		<div class="row content">
			    			<div class="col-xs-2 sidenav text-left">
			    				<br>
			    				<p>Menual</p>
			    				<p>1. 이벤트 제목을 입력하고 Next</p>
			    				<p>2. 수정을 하려면 Mod 클릭</p>
			    				<p>3. 시작일과 종료일 모두 기입</p>
			    				<p>4. Next를 누르면 Mod가 나타남</p>
			    				<p>5. file + 를 누르면 이벤트 본문에</p>
			    				<p>6. 삽입할 img 파일을 올릴 수 있다.</p>
			    				<p>7. Next를 누르면 확인창이 뜨고</p>
			    				<p>8. 검사를 한 뒤 Event Make 클릭</p>
			    			</div>
			    			<div class="col-xs-10 text-center">
								<h2>Event Make</h2>
			    				<form name="f" action="pdMM_event_add.pd" method="post" enctype="multipart/form-data">
									<div class="col-xs-4">
										<div class="container-fluid">
											<div class="panel panel-default">
												<div class="panel-heading">금지문자(&gt; , &lt; , | , \ , ? , &quot; , : , / , *, -) 제외</div>
												<div class="panel-body">
													<h5>이벤트 제목 </h5> 
													<input type="text" name="eListTitle" onkeyup="checkText()">
												</div>
												<div class="panel-footer">
													<button type="button" class="btn btn-success" onclick="goNext(0)" id="nextB0">Next</button>
													<button type="button" class="btn btn-danger" onclick="goMod(0)" id="modB0" style="visibility: hidden">Modify</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-4" id="nextF0" style="visibility: hidden">
										<div class="container-fluid">
											<div class="panel panel-default">
												<div class="panel-heading">8자리 숫자값(xxxx년 xx월 xx일 => xxxxxxxx)로 작성</div>
												<div class="panel-body">
													<div class="col-xs-6">
														<h5>이벤트 시작일</h5>
														<input type="text" name="eListDateS" maxlength="8" size="6" onkeyup="onlyNum('s')">
													</div>
													<div class="col-xs-6">
														<h5>이벤트 종료일</h5>
														<input type="text" name="eListDateE" maxlength="8" size="6" onkeyup="onlyNum('e')">
													</div>
												</div>
												<div class="panel-footer">
													<button type="button" class="btn btn-success" onclick="goNext(1)" id="nextB1">Next</button>
													<button type="button" class="btn btn-danger" onclick="goMod(1)" id="modB1" style="visibility: hidden">Modify</button>
												</div>
											</div>
										</div>			
									</div>
									<div class="col-xs-4" id="nextF1" style="visibility: hidden">
										<div class="container-fluid">
											<div class="panel panel-default">
												<div class="panel-heading">이벤트 본문</div>
												<div class="panel-body">
													<ul id="fileResult">
													</ul>
													<input type="hidden" name="fileCnt" value="0">
													<button type="button" class="btn btn-success" onclick="fileF('+')">file +</button>
													<button type="button" class="btn btn-danger" onclick="fileF('-')">file -</button>
												</div>
												<div class="panel-footer">
													<button type="button" class="btn btn-success" data-toggle="modal" data-target="#resultModal">Next</button>
												</div>
											</div>
										</div>		
									</div>
									<div class="modal fade" id="resultModal" role="dialog">
								    	<div class="modal-dialog">
									        <div class="modal-content">
										        <div class="modal-header">
										        	<button type="button" class="close" data-dismiss="modal">&times;</button>
										        	<h4 class="modal-title">작성하신 이벤트 정보</h4>
										        </div>
										        <div class="modal-body">
										        	<p>이벤트 제목 : <label id="modal_eListTitle"></label></p>
										        	<p>이벤트 시작일 : <label id="modal_eListDateS"></label> </p>
										        	<p>이벤트 종료일 : <label id="modal_eListDateE"></label></p>
										        	<p><label onclick="showUpload()">올린 파일 목록 보기(클릭)</label></p>
										        	<p id="modal_upload"></p>
										        </div>
										        <div class="modal-footer">
										        	<button type="button" class="btn btn-success" onclick="document.f.submit();">Event Make</button>
										        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
										        </div>
									        </div>
								    	</div>
								    </div>
								</form>
			    			</div>
			    		</div>
					</div>
			    </div>
			    <div class="panel-footer"></div>
		  	</div>
		</div>
	</article>
</section>
</body>
</html>