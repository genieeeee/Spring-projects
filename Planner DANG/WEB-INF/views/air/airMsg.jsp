<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
window.alert('${airMsg}');
var a ='${airClose}';
if(a!=''){
	${airClose}
	opener.location.href='${airPage}';
}else{	
	location.href='${airPage}';
}
</script>