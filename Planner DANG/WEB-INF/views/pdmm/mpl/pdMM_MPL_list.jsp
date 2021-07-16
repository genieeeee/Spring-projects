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
function commentView(idx){
	sendRequest('mpl_comViewAjax.pd', 'idx=' + idx, commentViewResult, 'POST');
	function commentViewResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.commentViewModal.innerHTML = data;
		}
	}
}
function commentWrite(idx){
	sendRequest('mpl_comWriteAjax.pd', 'idx=' + idx, commentWriteResult, 'POST');
	function commentWriteResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.commentWriteModal.innerHTML = data;
		}
	}
}
function commentWriteCheck(){
	var f = document.fComment;
	var writer = f.writer;
	var comment = f.comment;
	if(!(writer.value.length >= 3 && comment.value.length >= 12)) return alert('작성자와 코멘트를 제대로 입력해주세요');
	else{
		writer.setAttribute('readonly', 'readonly');
		comment.setAttribute('readonly', 'readonly');
		all.commentCheck.style.display = 'none';
		all.commentMod.style.display = 'inline';
		all.commentSubmit.style.display = 'inline';
		alert('유효성 검사를 통과했습니다.');
	}
}
function commentModify(){
	var f = document.fComment;
	var writer = f.writer;
	var comment = f.comment;
	writer.removeAttribute('readonly');
	comment.removeAttribute('readonly');
	all.commentCheck.style.display = 'inline';
	all.commentMod.style.display = 'none';
	all.commentSubmit.style.display = 'none';
}
function searchForm(){
	all.mplSerModal.innerHTML = 
					'<div class="modal-dialog">'
						+'<div class="modal-content">'
							+'<div class="modal-header">'
								+'<button type="button" class="close" data-dismiss="modal">&times;</button>'
								+'<h4 class="modal-title">제휴업체 검색</h4>'
							+'</div>'
							+'<div class="modal-body">'
								+'<p><label style="width: 100px">제휴업체 Idx : </label>'
									+'<input type="text" name="idx" onkeyup="searchIdx()" id="mlit">'
			    					+'<button type="button" class="btn btn-info" onclick="goSearchIdx()">'
			        					+'<span class="glyphicon glyphicon-search"></span> Search'
									+'</button>'
								+'</p>'
								+'<p id="searchIdxResult"></p>'
								+'<hr><br>'
								+'<p><label style="width: 100px">기업명 : </label>'
									+'<input type="text" name="name" id="mlnt">'
			    					+'<button type="button" class="btn btn-info" onclick="goSearchName()">'
			        					+'<span class="glyphicon glyphicon-search"></span> Search'
									+'</button>'
								+'</p>'
								+'<p id="searchNameResult"></p>'
							+'</div>'
							+'<div class="modal-footer">'
								+'<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>'
							+'</div>'
						+'</div>'
					+'</div>';
}
function searchIdx(){
	var mlit = all.mlit;
	var mVal = mlit.value;
	var len = mVal.length;
	var result = '';
	for(var i = 0 ; i < len ; i++){
		var c = mVal.charCodeAt(i);
		if(c >= 48 && c <= 57) result += mVal.charAt(i);
		else{
			mlit.value = result;
			alert('숫자만 입력하세요.');
			return;
		}
	}
}
function goSearchIdx(){
	var mlit = all.mlit;
	var mVal = mlit.value;
	var len = mVal.length;
	if(len == 0) return alert('숫자를 입력하세요.');
	var idx = parseInt(mVal);
	sendRequest('mpl_searchIdxAjax.pd', 'idx=' + idx, mSearchIdxResult, 'POST');
	function mSearchIdxResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.searchIdxResult.innerHTML = data;
		}
	}
}
function goSearchName(){
	var mlnt = all.mlnt;
	var mVal = mlnt.value;
	var len = mVal.length;
	if(len == 0) return alert('업체명을 입력하세요.');
	sendRequest('mpl_searchNameAjax.pd', 'name=' + mVal, mSearchNameResult, 'POST');
	function mSearchNameResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.searchNameResult.innerHTML = data;
		}
	}
}
function goMod(idx){
	sendRequest('pdMM_MPL_mod.pd', 'idx=' + idx, mplModify, 'GET');
	function mplModify(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.mplSerModal.innerHTML = data;
		}
	}
}
function goDel(idx){
	sendRequest('pdMM_MPL_del.pd', 'idx=' + idx, mplDelete, 'GET');
	function mplDelete(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.mplSerModal.innerHTML = data;
		}
	}
}
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
function goMPLMod(){
	var f = document.f;
	var category = f.category.value;
	var name = f.name.value;
	var nation = f.nation.value;
	var tel = f.tel.value;
	var email = f.email.value;
	var charge = f.charge.value;
	var joindate = f.joindate.value;
	if(category.length != 0 && name.length != 0 && nation.length != 0 && tel.length >= 8 && email.length >= 12 && charge.length !=0 && joindate.length != 0){
		var len = email.length;
		var subs = email.substring(len - 4, len);
		var boo = false;
		for(var i = 0 ; i < len - 4 ; i++){
			c = email.charAt(i);
			if(c == '@') boo = true;
		}
		if((subs == '.com' || subs == '.net') && boo) f.submit();
		else alert('이메일을 제대로 입력해주세요');
	}else alert('모든 값을 다 입력하셔야 합니다.');
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
			    		<div class="row content">
							<div class="col-xs-2 sidenav text-center">
								<br>
								<p><label>작업 메뉴</label></p>
							    <p><label data-toggle="modal" data-target="#mplSerModal" onclick="searchForm()">제휴업체 검색</label></p>
							    <p><label data-toggle="modal" data-target="#mplSerModal" onclick="searchForm()">제휴업체 수정</label></p>
								<p><label data-toggle="modal" data-target="#mplSerModal" onclick="searchForm()">제휴업체 삭제</label></p>
							</div>
							<div class="col-xs-10">
								<h2>제휴업체 목록</h2> 
								<p>업종, 국가로 필터링 할 수 있으며</p>
								<p>idx, 등록일 기준으로 정렬할 수 있다.</p>   
								<p>제휴업체 검색, 수정, 삭제는 작업메뉴에서 할 수 있다.</p>                  
								<p>목록에서 제휴업체 이름을 클릭하면 그 업체에 대한 코멘트를 볼 수 있다.</p>                  
								<p>목록에서 해당 업체에 대해 코멘트 작성을 클릭하면 코멘트를 남길 수 있다.</p>                  
								<table class="table table-striped">
									<thead>
								    	<tr>
									        <th>
									        	<div class="dropdown">
													<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
													-<span class="caret"></span></button>
												    <ul class="dropdown-menu">
													<c:url var="idxAscUrlResult" value="pdMM_MPL_list.pd">
														<c:param name="typeValue" value="asc"></c:param>
													</c:url>
													<c:url var="idxDescUrlResult" value="pdMM_MPL_list.pd">
														<c:param name="typeValue" value="desc"></c:param>
													</c:url>
														<li><a href="${idxAscUrlResult}">Asc</a></li>
														<li><a href="${idxDescUrlResult}">Desc</a></li>
												    </ul>
												</div>
									        </th>
									        <th>
									        	<div class="dropdown">
													<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
													업종<span class="caret"></span></button>
												    <ul class="dropdown-menu">
												    <c:choose>
												    	<c:when test="${empty categoryList}">
												    		<li>None</li>
												    	</c:when>
												    	<c:otherwise>
														    <c:forEach var="result" items="${categoryList}">
															    <c:url var="categoryUrlResult" value="pdMM_MPL_list.pd">
																	<c:param name="type" value="category"></c:param>
																	<c:param name="typeValue" value="${result}"></c:param>
																</c:url>
															    <li><a href="${categoryUrlResult}">${result}</a></li>
														    </c:forEach>
												    	</c:otherwise>
												    </c:choose>
												    </ul>
												</div>
									        </th>
									        <th>이름</th>
									        <th>
									        	<div class="dropdown">
													<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
													국가<span class="caret"></span></button>
												    <ul class="dropdown-menu">
												    <c:choose>
												    	<c:when test="${empty nationList}">
												    		<li>None</li>
												    	</c:when>
												    	<c:otherwise>
														    <c:forEach var="result" items="${nationList}">
														    	<c:url var="nationUrlResult" value="pdMM_MPL_list.pd">
																	<c:param name="type" value="nation"></c:param>
																	<c:param name="typeValue" value="${result}"></c:param>
																</c:url>
															    <li><a href="${nationUrlResult}">${result}</a></li>
														    </c:forEach>
												    	</c:otherwise>
												    </c:choose>
												    </ul>
												</div>
									        </th>
									        <th>tel</th>
									        <th>email</th>
									        <th>책임자</th>
									        <th>
									        	<div class="dropdown">
													<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
													등록일<span class="caret"></span></button>
												    <ul class="dropdown-menu">
													<c:url var="joindateAscUrlResult" value="pdMM_MPL_list.pd">
														<c:param name="type" value="joindate"></c:param>
														<c:param name="typeValue" value="asc"></c:param>
													</c:url>
													<c:url var="joindateDescUrlResult" value="pdMM_MPL_list.pd">
														<c:param name="type" value="joindate"></c:param>
														<c:param name="typeValue" value="desc"></c:param>
													</c:url>
														<li><a href="${joindateAscUrlResult}">Asc</a></li>
														<li><a href="${joindateDescUrlResult}">Desc</a></li>
												    </ul>
												</div>
									        </th>
									        <th>비고</th>
								        </tr>
								    </thead>
								    <tbody>
								    	<c:choose>
								    		<c:when test="${empty list}">
								    			<tr>
								    				<td colspan="9">등록된 제휴업체가 없습니다.</td>
								    			</tr>	
								    		</c:when>
								    		<c:otherwise>
								    			<c:forEach var="list" items="${list}">
								    				<tr>
								    					<td>${list.idx}</td>
								    					<td>${list.category}</td>
								    					<td><label data-toggle="modal" data-target="#commentViewModal" onclick="commentView(${list.idx})">${list.name}</label></td>
								    					<td>${list.nation}</td>
								    					<td>${list.tel}</td>
								    					<td>${list.email}</td>
								    					<td>${list.charge}</td>
								    					<td>${list.joindate}</td>
								    					<td><label data-toggle="modal" data-target="#commentWriteModal" onclick="commentWrite(${list.idx})" style="color: crimson;"><b><span class="glyphicon glyphicon-pencil"></span>코멘트 작성</b></label></td>
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
			    <div class="modal fade" id="commentViewModal" role="dialog"></div>
			    <div class="modal fade" id="commentWriteModal" role="dialog"></div>
			    <div class="modal fade" id="mplSerModal" role="dialog"></div>
		  	</div>
		</div>
	</article>
</section>
</body>
</html>