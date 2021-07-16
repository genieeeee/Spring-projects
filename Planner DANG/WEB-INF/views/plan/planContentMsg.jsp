<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${msg=='삭제된 게시글 또는 잘못 된 접근입니다.'}">
	<script>
	alert('${msg}');
	opener.location.href='planList.pd';
	self.close();
	</script>
</c:if>