<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${msg=='일정이 삭제 되었습니다.'}">
	<script>
	location.href='planList.pd';
	</script>
</c:if>

<c:if test="${msg=='일정 삭제 실패'}">
	<script>
	alert('${msg}');
	location.href='planContent.pd';
	</script>
</c:if>