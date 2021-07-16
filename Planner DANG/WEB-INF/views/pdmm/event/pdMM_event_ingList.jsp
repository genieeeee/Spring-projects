<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너당 +_+</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/pd/js/httpRequest.js"></script>
<script>
var all = document.all;
function eMainView(idx){
	sendRequest('event_selViewAjax.pd', 'idx=' + idx, eMainViewResult, 'POST');
	function eMainViewResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.eventViewModal.innerHTML = data;
		}
	}
}
function searchIdx(){
	var elit = all.elit;
	var eVal = elit.value;
	var len = eVal.length;
	var result = '';
	for(var i = 0 ; i < len ; i++){
		var c = eVal.charCodeAt(i);
		if(c >= 48 && c <= 57) result += eVal.charAt(i);
		else{
			elit.value = result;
			alert('숫자만 입력하세요.');
			return;
		}
	}
}
function searchForm(){
	all.eventSerModal.innerHTML = 
					'<div class="modal-dialog">'
						+'<div class="modal-content">'
							+'<div class="modal-header">'
								+'<button type="button" class="close" data-dismiss="modal">&times;</button>'
								+'<h4 class="modal-title">Event Search</h4>'
							+'</div>'
							+'<div class="modal-body">'
								+'<p> 이벤트 Idx : '
									+'<input type="text" name="eListIdx" onkeyup="searchIdx()" id="elit">'
			    					+'<button type="button" class="btn btn-info" onclick="goSearch()">'
			        					+'<span class="glyphicon glyphicon-search"></span> Search'
									+'</button>'
								+'</p>'
								+'<p id="searchResult"></p>'
							+'</div>'
							+'<div class="modal-footer">'
								+'<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>'
							+'</div>'
						+'</div>'
					+'</div>';
}
function goSearch(){
	var elit = all.elit;
	var eVal = elit.value;
	var len = eVal.length;
	if(len == 0) return alert('숫자를 입력하세요.');
	var idx = parseInt(eVal);
	sendRequest('event_searchAjax.pd', 'idx=' + idx, eSearchResult, 'POST');
	function eSearchResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.searchResult.innerHTML = data;
		}
	}
}
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
		if(c == '>' || c == '<' || c == '|' || c == '\\' || c == '?' || c == '\"' || c == ':' || c == '/' || c == '*' , c == '-'){
			f.value = result;
			alert('금지문자(>,<,|,\,?,",:,/,*,-)를 입력하셨습니다.');
			return;
		}
		else result += fVal.charAt(i);	
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
function goEventMod(){
	var f = document.f;
	if(f.eListDateS.value.length == 8 & f.eListDateE.value.length == 8 && f.eListTitle.value.length >= 4) f.submit();
	else alert('이벤트 제목과 시작일, 종료일을 제대로 써주세요.');
}
function goMod(idx){
	sendRequest('event_modViewAjax.pd', 'idx=' + idx, eventModForm, 'POST');
	function eventModForm(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.eventSerModal.innerHTML = data;
		}
	}
}
function goDel(idx){
	sendRequest('event_delViewAjax.pd', 'idx=' + idx, eventDelForm, 'POST');
	function eventDelForm(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.eventSerModal.innerHTML = data;
		}
	}
}
function goEnd(idx){
	sendRequest('event_endViewAjax.pd', 'idx=' + idx, eventEndForm, 'POST');
	function eventEndForm(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.eventSerModal.innerHTML = data;
		}
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
							<div class="col-xs-2 sidenav text-center">
								<br>
								<p><label>작업 메뉴</label></p>
							    <p></p>
							    <p><label data-toggle="modal" data-target="#eventSerModal" onclick="searchForm()">이벤트 수정</label></p>
								<p><label data-toggle="modal" data-target="#eventSerModal" onclick="searchForm()">이벤트 삭제</label></p>
							    <p><label data-toggle="modal" data-target="#eventSerModal" onclick="searchForm()">이벤트 마감</label></p>
							</div>
							<div class="col-xs-10">
								<h2>Event Ing</h2>    
								<p>이벤트 수정, 삭제, 마감은 작업메뉴에서 진행할 수 있다.</p>                  
								<p>이벤트 본문의 내용을 보고싶으면 보고싶은 이벤트의 제목을 클릭한다.</p>                  
								<table class="table table-striped">
									<thead>
								    	<tr>
									        <th>-</th>
									        <th>이벤트 제목</th>
									        <th>이벤트 시작일</th>
									        <th>이벤트 종료일</th>
								        </tr>
								    </thead>
								    <tbody>
								    	<c:choose>
								    		<c:when test="${empty list}">
								    			<tr>
								    				<td colspan="4">현재 진행중인 이벤트가 없습니다.</td>
								    			</tr>	
								    		</c:when>
								    		<c:otherwise>
								    			<c:forEach var="list" items="${list}">
								    				<tr>
								    					<td>${list.eListIdx}</td>
								    					<td><label data-toggle="modal" data-target="#eventViewModal" onclick="eMainView(${list.eListIdx})">${list.eListTitle}</label></td>
								    					<td>${list.eListDateS}</td>
								    					<td>${list.eListDateE}</td>
								    				</tr>
								    			</c:forEach>
								    		</c:otherwise>   
								    	</c:choose>
								    </tbody>
								</table>
							</div>
						</div>	
					</div>
			    </div>
			    <div class="panel-footer text-center">
			    	<ul class="breadcrumb">${paging}</ul>
			    </div>
			    <div class="modal fade" id="eventViewModal" role="dialog"></div>
			    <div class="modal fade" id="eventSerModal" role="dialog"></div>
		  	</div>
		</div>
	</article>
</section>
</body>
</html>