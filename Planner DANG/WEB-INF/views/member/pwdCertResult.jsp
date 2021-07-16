<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result==1}">
	<c:if test="${type==1}">
		<script>
			location.href='memUpdate.pd?mem_id=${id}';
		</script>
	</c:if>
	<c:if test="${type==2}">
		<script>
			location.href='memDelete.pd';
		</script>
	</c:if>
</c:if>

<c:if test="${result!=1}">
<script>
alert('비밀번호가 일치하지 않습니다.')
location.href='pwdCert.pd?type=${type}';
</script>
</c:if>