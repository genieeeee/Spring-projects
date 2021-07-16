<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var qs = confirm('정말 삭제하시겠습니까?');
	if(qs == true){
		location.href = 'diaryDelete.pd?dia_idx=${dia_idx}';	
	}else if(qs == false){
		location.href = 'diary.pd';
	}
</script>