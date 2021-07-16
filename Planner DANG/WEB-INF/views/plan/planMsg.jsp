<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${msg}'=='일정 저장 실패!'){ 
		alert('${msg}');
		history.back(-1);
	}else if('${msg}'=='일정이 저장 되었습니다.'){
		//alert('${msg}');
		location.href='planList.pd';
	}
	else if ('${msg}'=='시스템에 오류가 생겼습니다.다시 시도해주세요.죄송합니다.'){
		alert('${msg}');
		history.back(-1);
	}
</script>