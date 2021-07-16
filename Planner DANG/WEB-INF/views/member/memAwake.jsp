<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
       <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>플래너당</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
</head>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
$(function(){
	
	$('.onlyAlphabetAndNumber').keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
        }
    });
	
	$(".onlyNumber").keyup(function(event){
	    if (!(event.keyCode >=37 && event.keyCode<=40)) {
	        var inputVal = $(this).val();
	        $(this).val(inputVal.replace(/[^0-9]/gi,''));
	    }
	});
	
	$('#id').keyup(function(event){
        
        var divId = $('#divId');
         
        if($('#id').val()==""){
            divId.removeClass("has-success");
            divId.addClass("has-error");
        }else{
            divId.removeClass("has-error");
            divId.addClass("has-success");
        }
    });
	
	$('#name').keyup(function(event){
        
        var divName = $('#divName');
         
        if($.trim($('#name').val())==""){
            divName.removeClass("has-success");
            divName.addClass("has-error");
        }else{
            divName.removeClass("has-error");
            divName.addClass("has-success");
        }
    });
	
	$('#phoneNumber').keyup(function(event){
        
        var divPhoneNumber = $('#divPhoneNumber');
         
        if($.trim($('#phoneNumber').val())=="" || $('#phoneNumber').val().length!=11){
            divPhoneNumber.removeClass("has-success");
            divPhoneNumber.addClass("has-error");
        }else{
            divPhoneNumber.removeClass("has-error");
            divPhoneNumber.addClass("has-success");
        }
    });
	
});
</script>
<body>
<h2 align="center">휴면계정</h2><br>
<form name="awake" action="memAwake.pd" method="post">
<div class="form-group" id="divId">
	  <div class="col-lg-10">
             <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="id" placeholder="ID" required="required">
      </div>
</div>
<div class="form-group" id="divName">
	  <div class="col-lg-10">
             <input type="text" class="form-control" id="name" name="name" placeholder="NAME" required="required">
      </div>
</div>
<div class="form-group" id="divPhoneNumber">
	  <div class="col-lg-10">
             <input type="text" class="form-control onlyNumber" id="phoneNumber" name="tel" placeholder="TEL" maxlength="11" required="required">
	  </div>
</div>
<br><br>
      <p align="center">
			<input type="submit" value="휴면계정 풀기" style="width:250px;">
      </p>
</form>
</body>
</html>