<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${result==1}">
<script>
window.opener.location.reload();
self.close();
</script>
</c:if>

<c:if test="${result==-1}">
<script>
var filter="win16|win32|win64|mac";

if(navigator.platform){
	if(0>filter.indexOf(navigator.platform.toLowerCase())){
		location.href='mobileLogin.pd';
	}else{
		location.href='memLogin.pd?logMsg=ID 또는 PW가 일치하지 않습니다.';
	}
}
</script>
</c:if>
