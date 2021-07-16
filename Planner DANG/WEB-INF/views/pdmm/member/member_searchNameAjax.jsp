<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:choose>
	<c:when test="${empty list}">
		<p>${param.mem_name}님은 회원이 아닙니다.</p>
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${list}">
			<p><label style="width: 100px">-id : </label>${dto.mem_id}</p>
			<p><label style="width: 100px">이름 : </label>${dto.mem_name}</p>
			<p><label style="width: 100px">나이 : </label>${dto.mem_age}</p>
			<p><label style="width: 100px">생년월일 : </label>${dto.mem_birth}</p>
			<c:if test="${dto.mem_sex eq 'm'}"><p><label style="width: 100px">성별 : </label>남자</p></c:if>
			<c:if test="${dto.mem_sex eq 'f'}"><p><label style="width: 100px">성별 : </label>여자</p></c:if>
			<p><label style="width: 100px">전화번호 : </label>${dto.mem_tel}</p>
			<p><label style="width: 100px">이메일 : </label>${dto.mem_email}</p>
			<p><label style="width: 100px">주소 : </label>${dto.mem_addr1}</p>
			<p><label style="width: 100px">상세주소 : </label>${dto.mem_addr2}</p>
			<p><label style="width: 100px">마지막로그인 : </label>${dto.mem_lastLog}</p>
			<c:if test="${dto.mem_grade == 0}"><p><label style="width: 100px">등급 : </label>괸리자</p></c:if>
			<c:if test="${dto.mem_grade == 1}"><p><label style="width: 100px">등급 : </label>일반유저</p></c:if>
			<c:if test="${dto.mem_grade == 2}"><p><label style="width: 100px">등급 : </label>SNS유저</p></c:if>
			<c:if test="${dto.mem_grade == 3}"><p><label style="width: 100px">등급 : </label>휴면유저</p></c:if>
			<c:if test="${dto.mem_grade == 4}"><p><label style="width: 100px">등급 : </label>블랙유저</p></c:if>
			<c:if test="${dto.mem_grade == 5}"><p><label style="width: 100px">등급 : </label>탈퇴유저</p></c:if>
			<p><label style="width: 100px">국적 : </label>${dto.mem_nation}</p>
		</c:forEach>	
	</c:otherwise>
</c:choose>