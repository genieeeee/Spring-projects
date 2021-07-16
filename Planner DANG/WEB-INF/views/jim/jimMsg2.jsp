<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert('${msg}');
	var page=${page};
	if(page=="1"){
		location.href="jimHotelform.pd";
	}else if(page=="2"||page=="3"){
		location.href="jimPointform.pd";
	}else if(page=="4"){
		location.href="jimPlanform.pd";
	}else{
		history.back(-1);
	}
</script>