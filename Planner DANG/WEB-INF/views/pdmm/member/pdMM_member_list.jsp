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
function minwonView(id){
	sendRequest('member_minwonViewAjax.pd', 'mem_id=' + id, minwonViewResult, 'POST');
	function minwonViewResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.minwonViewModal.innerHTML = data;
		}
	}
}
function minwonWrite(id){
	sendRequest('member_minwonWriteAjax.pd', 'mem_id=' + id, minwonWriteResult, 'POST');
	function minwonWriteResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.minwonWriteModal.innerHTML = data;
		}
	}
}
function minwonWriteCheck(){
	var f = document.fMinwon;
	var writer = f.writer;
	var comment = f.comment;
	if(!(writer.value.length >= 3 && comment.value.length >= 12)) return alert('작성자와 코멘트를 제대로 입력해주세요');
	else f.submit();
}
function searchForm(){
	all.memberSerModal.innerHTML = 
					'<div class="modal-dialog">'
						+'<div class="modal-content">'
							+'<div class="modal-header">'
								+'<button type="button" class="close" data-dismiss="modal">&times;</button>'
								+'<h4 class="modal-title">회원 검색</h4>'
							+'</div>'
							+'<div class="modal-body">'
								+'<p><label style="width: 100px">회원 아이디 : </label>'
									+'<input type="text" id="mId">'
			    					+'<button type="button" class="btn btn-info" onclick="goSearchId()">'
			        					+'<span class="glyphicon glyphicon-search"></span> Search'
									+'</button>'
								+'</p>'
								+'<p id="searchIdResult"></p>'
								+'<hr><br>'
								+'<p><label style="width: 100px">회원 이름 : </label>'
									+'<input type="text" id="mName">'
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
function goSearchId(){
	var fid = all.mId;
	var val = fid.value;
	var len = val.length;
	if(len == 0) return alert('값을 입력한 후 검색 버튼을 눌러주세요.');
	sendRequest('member_searchIdAjax.pd', 'mem_id=' + val, memberSerResult, 'POST');
	function memberSerResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.searchIdResult.innerHTML = data;
		}
	}
}
function goSearchName(){
	var fid = all.mName;
	var val = fid.value;
	var len = val.length;
	if(len == 0) return alert('값을 입력한 후 검색 버튼을 눌러주세요.');
	sendRequest('member_searchNameAjax.pd', 'mem_name=' + val, memberSerResult, 'POST');
	function memberSerResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			all.searchNameResult.innerHTML = data;	
		}
	}
}
function goStatus(idx){
	var mgm = document.mgm;
	mgm.status.value = idx;
	mgm.submit();
}
</script>
</head>
<body id="goMain">
<%@ include file="../header.jsp" %>
<section>
	<article>
		<div class="container-fluid" style="margin-top:50px">
			<div class="panel panel-default">
				<%@ include file="memberHeader.jsp" %>
			    <div class="panel-body">
			    	<div class="container-fluid">
						<h2>회원관리 목록</h2> 
						<p>국가, 나이대, 성별, 회원상태로 필터링 할 수 있다.</p>
						<p>이름, 최종로그인으로 정렬할 수 있다.</p>   
						<p>민원을 등록하고 싶으면 비고에서 해당 회원의 민원작성 라벨을 클릭하면 되고</p>                  
						<p>회원의 민원 내역을 보고 싶으면 회원의 아이디를 클릭하면 된다.</p>                  
						<p>회원의 민원 내역을 수정하거나 삭제할 수 없다.</p>                  
						<p>블랙설정, 휴면설정은 회원을 검색한 후에 할 수 있다.</p>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>-Id</th>
									<th>
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
											name<span class="caret"></span></button>
											<ul class="dropdown-menu">
											<c:url var="mem_nameAscUrlResult" value="pdMM_member_list.pd">
												<c:param name="type" value="mem_name"></c:param>
												<c:param name="typeValue" value="asc"></c:param>
											</c:url>
											<c:url var="mem_nameDescUrlResult" value="pdMM_member_list.pd">
												<c:param name="type" value="mem_name"></c:param>
												<c:param name="typeValue" value="desc"></c:param>
											</c:url>
												<li><a href="${mem_nameAscUrlResult}">Asc</a></li>
												<li><a href="${mem_nameDescUrlResult}">Desc</a></li>
											</ul>
										</div>
									</th>
									<th>
									   <div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
											Age<span class="caret"></span></button>
											<ul class="dropdown-menu">
												<c:choose>
												    <c:when test="${empty mem_ageList}">
												    	<li>None</li>
												    </c:when>
												    <c:otherwise>
														<c:forEach var="ageList" items="${mem_ageList}">
															<c:forTokens var="age" items="${ageList}" delims="대" begin="0" end="0" step="1">
																<c:url var="mem_ageUrlResult" value="pdMM_member_list.pd">
																	<c:param name="type" value="mem_age"></c:param>
																	<c:param name="typeValue" value="${age}"></c:param>
																</c:url>
																<li><a href="${mem_ageUrlResult}">${ageList}</a></li>
															</c:forTokens>
														</c:forEach>
												   	</c:otherwise>
												</c:choose>
											</ul>
										</div>
									</th>
									<th>birthDay</th>
									<th>
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
											sex<span class="caret"></span></button>
											<ul class="dropdown-menu">
											<c:url var="mem_sexManUrlResult" value="pdMM_member_list.pd">
												<c:param name="type" value="mem_sex"></c:param>
												<c:param name="typeValue" value="m"></c:param>
											</c:url>
											<c:url var="mem_sexWomanUrlResult" value="pdMM_member_list.pd">
												<c:param name="type" value="mem_sex"></c:param>
												<c:param name="typeValue" value="f"></c:param>
											</c:url>
												<li><a href="${mem_sexManUrlResult}">Man</a></li>
												<li><a href="${mem_sexWomanUrlResult}">Woman</a></li>
											</ul>
										</div>
									</th>
									<th>tel</th>
									<th>email</th>
									<th>
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
											Nation<span class="caret"></span></button>
											<ul class="dropdown-menu">
												<c:choose>
												    <c:when test="${empty mem_nationList}">
												    	<li>None</li>
												    </c:when>
												    <c:otherwise>
														<c:forEach var="result" items="${mem_nationList}">
															<c:url var="mem_nationUrlResult" value="pdMM_member_list.pd">
																<c:param name="type" value="mem_nation"></c:param>
																<c:param name="typeValue" value="${result}"></c:param>
															</c:url>
															<li><a href="${mem_nationUrlResult}">${result}</a></li>
														</c:forEach>
												   	</c:otherwise>
												</c:choose>
											</ul>
										</div>
									</th>
									<th>주소</th>
									<th>상세주소</th>
									<th>
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
											lastLog<span class="caret"></span></button>
											<ul class="dropdown-menu">
											<c:url var="mem_lastLogAscUrlResult" value="pdMM_member_list.pd">
												<c:param name="type" value="mem_lastLog"></c:param>
												<c:param name="typeValue" value="asc"></c:param>
											</c:url>
											<c:url var="mem_lastLogDescUrlResult" value="pdMM_member_list.pd">
												<c:param name="type" value="mem_lastLog"></c:param>
												<c:param name="typeValue" value="desc"></c:param>
											</c:url>
												<li><a href="${mem_lastLogAscUrlResult}">Asc</a></li>
												<li><a href="${mem_lastLogDescUrlResult}">Desc</a></li>
											</ul>
										</div>
									</th>
									<th>
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
											등급<span class="caret"></span></button>
											<ul class="dropdown-menu">
											<c:forEach var="cnt" begin="0" end="5" step="1">
												<c:url var="mem_gradeUrlResult" value="pdMM_member_list.pd">
													<c:param name="type" value="mem_grade"></c:param>
													<c:param name="typeValue" value="${cnt}"></c:param>
												</c:url>
												<c:if test="${cnt == 0}"><li><a href="${mem_gradeUrlResult}">괸리자</a></li></c:if>
												<c:if test="${cnt == 1}"><li><a href="${mem_gradeUrlResult}">일반유저</a></li></c:if>
												<c:if test="${cnt == 2}"><li><a href="${mem_gradeUrlResult}">SNS유저</a></li></c:if>
												<c:if test="${cnt == 3}"><li><a href="${mem_gradeUrlResult}">휴면유저</a></li></c:if>
												<c:if test="${cnt == 4}"><li><a href="${mem_gradeUrlResult}">블랙유저</a></li></c:if>
												<c:if test="${cnt == 5}"><li><a href="${mem_gradeUrlResult}">탈퇴유저</a></li></c:if>
											</c:forEach>
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
								    		<td colspan="12">등록된 회원이 없습니다.</td>
								    	</tr>	
								    </c:when>
								    <c:otherwise>
								    	<c:forEach var="list" items="${list}">
								    		<tr>
								    			<td><label data-toggle="modal" data-target="#minwonViewModal" onclick="minwonView('${list.mem_id}')">${list.mem_id}</label></td>
								    			<td>${list.mem_name}</td>
								    			<td>${list.mem_age}</td>
								    			<td>${list.mem_birth}</td>
								    			<c:if test="${list.mem_sex eq 'm'}"><td>남자</td></c:if>
								    			<c:if test="${list.mem_sex eq 'f'}"><td>여자</td></c:if>
								    			<td>${list.mem_tel}</td>
								    			<td>${list.mem_email}</td>
								    			<td>${list.mem_nation}</td>
								    			<td>${list.mem_addr1}</td>
								    			<td>${list.mem_addr2}</td>
								    			<td>${list.mem_lastLog}</td>
								    			<c:if test="${list.mem_grade == 0}"><td>괸리자</td></c:if>
								    			<c:if test="${list.mem_grade == 1}"><td>일반유저</td></c:if>
								    			<c:if test="${list.mem_grade == 2}"><td>SNS유저</td></c:if>
								    			<c:if test="${list.mem_grade == 3}"><td>휴면유저</td></c:if>
								    			<c:if test="${list.mem_grade == 4}"><td>블랙유저</td></c:if>
								    			<c:if test="${list.mem_grade == 5}"><td>탈퇴유저</td></c:if>
								    			<td><label data-toggle="modal" data-target="#minwonWriteModal" onclick="minwonWrite('${list.mem_id}')" style="color: crimson;"><b><span class="glyphicon glyphicon-pencil"></span>민원작성</b></label></td>
								    		</tr>
								    	</c:forEach>
								    </c:otherwise>   
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			    <div class="panel-footer text-center">
			    	<ul class="breadcrumb">${paging}</ul>
			    </div>
			    <div class="modal fade" id="minwonViewModal" role="dialog"></div>
			    <div class="modal fade" id="minwonWriteModal" role="dialog"></div>
			    <div class="modal fade" id="memberSerModal" role="dialog"></div>
		  	</div>
		</div>
	</article>
</section>
</body>
</html>