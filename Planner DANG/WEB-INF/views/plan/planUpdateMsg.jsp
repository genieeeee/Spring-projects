<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${msg=='수정성공'}">
	<script>
	//alert('${msg}');
	location.href='planList.pd';
	self.close();
	</script>
</c:if>

<c:if test="${msg=='수정실패'}">
	<script>
	alert('${msg}');
	history.back(-1);
	//opener.location.href='planList.pd';
	//self.close();
	</script>
</c:if>