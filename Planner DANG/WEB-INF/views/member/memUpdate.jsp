<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>플래너당</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  		
        
      
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function searchPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
           
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}
function nextPage(){
	
	var emailCheck1=0; //@체크
	var emailCheck2=0; //.체크
	for(var i=0; i<document.all.mem_email.value.length; i++){
		if(document.all.mem_email.value.charAt(i) == '@'){
			emailCheck1++;
		}
		else if(document.all.mem_email.value.charAt(i) == '.'){
			emailCheck2++;
		}
	}
	
	if(document.all.mem_pwd.value != document.all.mem_pwd2.value){
		$('#divPasswordCheck').removeClass("has-success");
        $('#divPasswordCheck').addClass("has-error");
        $('#divPasswordCheck').focus();
	}else if(document.all.mem_pwd.value.length < 8){
		$('#divPassword').removeClass("has-success");
        $('#divPassword').addClass("has-error");
        $('#divPassword').focus();
	}else if(document.all.mem_name.value == ''){
		$('#divName').removeClass("has-success");
        $('#divName').addClass("has-error");
        $('#divName').focus();
	}else if(document.all.mem_email.value == ''){
		$('#divEmail').removeClass("has-success");
        $('#divEmail').addClass("has-error");
        $('#divEmail').focus();
	}else if(emailCheck1==0 || emailCheck2==0){
		$('#divEmail').removeClass("has-success");
        $('#divEmail').addClass("has-error");
        $('#divEmail').focus();
	}else if(document.all.mem_addr1.value == ''){
		$('#divAddr11').removeClass("has-success");
        $('#divAddr11').addClass("has-error");
        $('#divAddr11').focus();
	}else if(document.all.mem_addr2.value == ''){
		$('#divAddr22').removeClass("has-success");
        $('#divAddr22').addClass("has-error");
        $('#divAddr22').focus();
	}else{
		document.update.action="memUpdate.pd";
		document.update.method="post";
		document.update.submit(); 
	}
}

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
     
    //------- 검사하여 상태를 class에 적용
 
     
    $('#password').keyup(function(event){
         
        var divPassword = $('#divPassword');
         
        if($('#password').val()=="" || $('#password').val().length<8){
            divPassword.removeClass("has-success");
            divPassword.addClass("has-error");
        }else{
            divPassword.removeClass("has-error");
            divPassword.addClass("has-success");
        }
    });
     
    $('#passwordCheck').keyup(function(event){
         
        var passwordCheck = $('#passwordCheck').val();
        var password = $('#password').val();
        var divPasswordCheck = $('#divPasswordCheck');
         
        if((passwordCheck=="") || (password!=passwordCheck)){
            divPasswordCheck.removeClass("has-success");
            divPasswordCheck.addClass("has-error");
        }else{
            divPasswordCheck.removeClass("has-error");
            divPasswordCheck.addClass("has-success");
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
     
   
    $('#email').keyup(function(event){
        
    	var emailCheck1=0; //@체크
    	var emailCheck2=0; //.체크
	   	for(var i=0; i<document.all.mem_email.value.length; i++){
	   		if(document.all.mem_email.value.charAt(i) == '@'){
	   			emailCheck1++;
	   		}
	   		else if(document.all.mem_email.value.charAt(i) == '.'){
	   			emailCheck2++;
	   		}
	   	}
    	
        var divEmail = $('#divEmail');
         
        if($.trim($('#email').val())=="" || emailCheck1 == 0 || emailCheck2 == 0){
            divEmail.removeClass("has-success");
            divEmail.addClass("has-error");
        }else{
            divEmail.removeClass("has-error");
            divEmail.addClass("has-success");
        }
    });
     
    $('#addr1').keyup(function(event){
         
        var divAddr11 = $('#divAddr11');
         
        if($.trim($('#addr1').val())==""){
        	divAddr11.removeClass("has-success");
        	divAddr11.addClass("has-error");
        }else{
        	divAddr11.removeClass("has-error");
        	divAddr11.addClass("has-success");
        }
    });
    
    $('#addr2').keyup(function(event){
        
        var divAddr22 = $('#divAddr22');
         
        if($.trim($('#addr2').val())==""){
        	divAddr22.removeClass("has-success");
        	divAddr22.addClass("has-error");
        }else{
        	divAddr22.removeClass("has-error");
        	divAddr22.addClass("has-success");
        }
    });

});
     
</script>
<style>
.intro{
  width:100%;
  height:30px;
}
.intro h1{
  font-family:'Oswald', sans-serif;
  letter-spacing:2px;
  font-weight:normal;
  font-size:14px;
  color:#222;
  text-align:center;
  margin-top:10px;
}
.intro a{
  color:#e74c3c;
  font-weight:bold;
  letter-spacing:0;
}
.intro img{
  width:20px;
  heght:20px;
  margin-left:5px;
  margin-right:5px;
  position:relative;
  top:5px;
}

*{margin:0;padding:0;box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;}
#container{
  width:715px;
  height:230px;
  margin:50px auto;
}


.button-4{
  width:400px;
  height:50px;
  border:2px solid #34495e;
  float:left;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:0 0 40px 50px;
}
.button-4 a{
  font-family:arial;
  font-size:16px;
  color:#34495e;
  text-decoration:none;
  line-height:50px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}
.eff-4{
  width:400px;
  height:50px;
  left:-400px;
  background:#34495e;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}
.button-4:hover .eff-4{
  left:0;
}
.button-4:hover a{
  color:#fff;
}

#rcorners2 {
    border-radius: 25px;
    border: 2px solid #0d3464;
    padding:10px;
    padding-left: 30px; 
    width: 100%;
    height: 50px;
    font-size: 20px;
    color:white;
    font-weight: bold;
    background-color: #0d3464;  
}
</style>
</head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-sm" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
			<div class="hidden-sm"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>			
			<div class="col-xs-11 col-sm-11 portfolioContainer">
            <br><br><br><br>
            <div class="row">
				<c:set var="list" value="${arr[0]}" />
			        <form class="form-horizontal" name="update" role="form">
			        
			        <input type="hidden" name="mem_id" value="${list.mem_id}">
			   
			          <div class="form-group" id="divPassword">
			                <label for="inputPassword" class="col-lg-2 control-label" style="text-align: right;">비밀번호</label>
			                <div class="col-lg-8">
			                    <input type="password" class="form-control" id="password" name="mem_pwd" required="required" placeholder="비밀번호는 8자 이상입니다." maxlength="30" value="${list.mem_pwd}">
			                </div>
			          </div>
			            <div class="form-group" id="divPasswordCheck">
			                <label for="inputPasswordCheck" class="col-lg-2 control-label" style="text-align: right;">비밀번호 확인</label>
			                <div class="col-lg-8">
			                    <input type="password" class="form-control" id="passwordCheck" name="mem_pwd2" required="required" placeholder="동일한 비밀번호를 입력해주세요." maxlength="30" value="${list.mem_pwd}">
			                </div>
			            </div>
			            
			            <div class="form-group" id="divName">
			                <label for="inputName" class="col-lg-2 control-label" style="text-align: right;">이름</label>
			                <div class="col-lg-8">
			                    <input type="text" class="form-control onlyHangul" id="name" name="mem_name" required="required" placeholder="이름" maxlength="15" value="${list.mem_name}">
			                </div>
			            </div>
			             
			         	<div class="form-group" id="divEmail">
			                <label for="inputEmail" class="col-lg-2 control-label" style="text-align: right;">이메일</label>
			                <div class="col-lg-8">
			                    <input type="email" class="form-control" id="email" name="mem_email" required="required" placeholder="이메일" maxlength="40" value="${list.mem_email}">
			                </div>
			            </div>
			         
			            <div class="form-group">
			                <label for="inputPhoneNumber" class="col-lg-2 control-label" style="text-align: right;">성별</label>
			                <div class="col-lg-8">
			                    <select class="form-control" id="gender" name="mem_sex">
			                        <c:if test="${list.mem_sex == 'm'}">
			                        <option value="m" selected="selected">남</option>
			                        <option value="m">여</option>
			                        </c:if>
			                        <c:if test="${list.mem_sex == 'w'}">
			                        <option value="m">남</option>
			                        <option value="m" selected="selected">여</option>
			                        </c:if>
			                    </select>
			                </div>
			            </div>
			          
			            <div class="form-group" id="divAddr11">
			                <label for="inputPhoneNumber" class="col-lg-2 control-label" style="text-align: right;">기본주소</label>
			                <div class="col-lg-8">
			                	<c:if test="${list.mem_nation == 'KR'}">
			                    <input type="text" class="form-control" id="addr1" name="mem_addr1" readonly="readonly" placeholder="기본주소" maxlength="100" onclick="searchPost()" value="${list.mem_addr1}">
			                	</c:if>
			                	<c:if test="${list.mem_nation != 'KR'}">
			                    <input type="text" class="form-control" id="addr1" name="mem_addr1" required="required" placeholder="기본주소" maxlength="100" value="${list.mem_addr1}">
			                	</c:if>
			                </div>
			            </div>
			        	<div class="form-group" id="divAddr22">
			                <label for="inputPhoneNumber" class="col-lg-2 control-label" style="text-align: right;">상세주소</label>
			                <div class="col-lg-8">
			                    <input type="text" class="form-control" id="addr2" name="mem_addr2" required="required" placeholder="상세주소" maxlength="100" value="${list.mem_addr2}">
			                </div>
			            </div>
			         
			            <br>
			            <div id="container">
						<div class="button-4">
			  		    <div class="eff-4"></div>
			    			<a href="javascript:nextPage()"> 수정 </a>
						</div>
						</div>
			            
			            <br> 
			        </form>
		        </div>
			</div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
</div>

</body>
</html>