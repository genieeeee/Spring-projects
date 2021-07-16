<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${result==1}">
<script>
opener.location.href='index.pd';
self.close();
</script>
</c:if>

<c:if test="${result!=1}">
<script>
location.href="memLogin.pd?logMsg=정보가 일치하지 않습니다.";
</script>
</c:if>
