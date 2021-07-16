<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:if test="${result==1}">
<script>
window.alert('로그아웃 완료');
location.href="index.pd";
</script>
</c:if>

<c:if test="${result==2}">
<script>
window.onload = function(){
window.alert('로그아웃 완료');

goo=window.open('https://accounts.google.com/logout');
setTimeout("delay();",800);
}
function delay(){
	goo.close();
	location.href="index.pd";
}
</script>
</c:if>

<c:if test="${result==3}">
<script>
window.onload = function(){
window.alert('로그아웃 완료');

goo=window.open('http://nid.naver.com/nidlogin.logout');
setTimeout("delay();",800);
}
function delay(){
	goo.close();
	location.href="index.pd";
}
</script>
</c:if>

<c:if test="${result==4}">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
window.onload = function(){
window.alert('로그아웃 완료');

Kakao.init('18892640de6334c7f98dd318cc6099e1');

Kakao.Auth.logout(function(){
	location.href="index.pd";
	});
}
</script>
</c:if>