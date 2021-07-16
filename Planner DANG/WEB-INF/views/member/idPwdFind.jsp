<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	$('#phoneNumber2').keyup(function(event){
        
        var divPhoneNumber2 = $('#divPhoneNumber2');
         
        if($.trim($('#phoneNumber2').val())=="" || $('#phoneNumber2').val().length!=11){
            divPhoneNumber2.removeClass("has-success");
            divPhoneNumber2.addClass("has-error");
        }else{
            divPhoneNumber2.removeClass("has-error");
            divPhoneNumber2.addClass("has-success");
        }
    });
});
</script>
<body>
<form name="idFind" action="idFind.pd" method="post">
<div class="form-group" id="divName">
	  <label for="inputId" class="col-lg-2 control-label">아이디 찾기</label>
      <div class="col-lg-10">
             <input type="text" class="form-control" id="name" name="name" placeholder="NAME" required="required">
      </div>
</div>
<div class="form-group" id="divPhoneNumber">
	  <div class="col-lg-10">
             <input type="text" class="form-control onlyNumber" id="phoneNumber" name="tel" placeholder="TEL" maxlength="11" required="required">
	  </div>
</div>
<p align="center">
	<input type="submit" value="아이디 찾기" style="height:25px; width:209px;">
</p>
</form>
<hr>
<form name="pwdFind" action="pwdFind.pd" method="post">
<div class="form-group" id="divId">
	  <label for="inputId" class="col-lg-2 control-label">비밀번호 찾기</label>
      <div class="col-lg-10">
             <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="id" placeholder="ID" required="required">
      </div>
</div>
<div class="form-group" id="divPhoneNumber2">
	  <div class="col-lg-10">
	  		 <input type="text" class="form-control onlyNumber" id="phoneNumber2" name="tel" placeholder="TEL" maxlength="11" required="required">
	  </div>
</div>
<p align="center">
	<input type="submit" value="비밀번호 찾기" style="height:25px; width:209px;">
</p>
</form>
</body>
</html>