<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="panel-heading">
	<ul class="nav nav-tabs">
		<li><a href="pdMM_member.pd">회원관리 메인</a></li>
		<li><a href="pdMM_member_list.pd">전체회원</a></li>
		<li><a href="adminLetter.pd">쪽지보내기</a></li>
		<c:choose>
			<c:when test="${empty lcp}"></c:when>
			<c:otherwise>
				<li><a data-toggle="modal" data-target="#memberSerModal" onclick="searchForm()">회원검색</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>