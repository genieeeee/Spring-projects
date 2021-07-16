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
function showProvision(){
  	if(document.all.pValue.value == 1){
	document.all.pValue.value = 2;    		
  		$("textarea").show();
	$(".radio").show();
  	
  	}else{
	document.all.pValue.value = 1;  
 			$("textarea").hide();
	$(".radio").hide();
	}
}
function nationResult(){
  	if(document.all.mem_nation.value != 'KR')
  		document.getElementById("divAddr1").innerHTML='<input type="text" class="form-control" id="addr1" name="mem_addr1" required="required" placeholder="기본주소" maxlength="100">';
  	else
  		document.getElementById("divAddr1").innerHTML='<input type="text" class="form-control" id="addr1" name="mem_addr1" readonly="readonly" placeholder="기본주소" maxlength="100" onclick="searchPost()">';
}

function submitForm(){
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
	
	
   	var birth=document.all.mem_birth.value;
    var birthState = 0;
    
    var y = parseInt(birth.substr(0, 4), 10); 
    var m = parseInt(birth.substr(4, 2), 10); 
    var d = parseInt(birth.substr(6, 2), 10); 

    var dt = new Date(y, m-1, d); 
    if(dt.getDate() != d) { birthState = -1; } 
    else if(dt.getMonth()+1 != m) { birthState = -1; } 
    else if(dt.getFullYear() != y) { birthState = -1; } 
    else { birthState = 0 }
	
     var provision = $('#provision');
  
    
        if(document.all.mem_name.value == ''){
        	$('#divName').removeClass("has-success");
	        $('#divName').addClass("has-error");
	        $('#divName').focus();
    	}else if(document.all.mem_birth.value.length != 8 || birthState == -1){
    		$('#divBirth').removeClass("has-success");
	        $('#divBirth').addClass("has-error");
	        $('#divBirth').focus();
    	}else if(document.all.mem_email.value == ''){
    		$('#divEmail').removeClass("has-success");
	        $('#divEmail').addClass("has-error");
	        $('#divEmail').focus();
    	}else if(emailCheck1==0 || emailCheck2==0){
    		$('#divEmail').removeClass("has-success");
	        $('#divEmail').addClass("has-error");
	        $('#divEmail').focus();
    	}else if(document.all.mem_tel.value.length != 11){
    		$('#divPhoneNumber').removeClass("has-success");
	        $('#divPhoneNumber').addClass("has-error");
	        $('#divPhoneNumber').focus();
    	}else if(document.all.mem_addr1.value == ''){
    		$('#divAddr11').removeClass("has-success");
	        $('#divAddr11').addClass("has-error");
	        $('#divAddr11').focus();
    	}else if(document.all.mem_addr2.value == ''){
    		$('#divAddr22').removeClass("has-success");
	        $('#divAddr22').addClass("has-error");
	        $('#divAddr22').focus();
    	}else if($('#provisionY:checked').val()!="Y"){
    		$('#divAgree').removeClass("has-success");
	        $('#divAgree').addClass("has-error");
	        $('#divAgree').focus();
    	}else{
    		document.init.action="memInit.pd";
    		document.init.method="post";
    		document.init.submit(); 
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
         
        $('#birth').keyup(function(event){
             
            var divBirth = $('#divBirth');
             
            if($.trim($('#birth').val())=="" || $('#birth').val().length!=8){
            	divBirth.removeClass("has-success");
            	divBirth.addClass("has-error");
            }else{
            	divBirth.removeClass("has-error");
            	divBirth.addClass("has-success");
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
<body style="margin-left: 50px;">
<div class="page-container">
	<div class="content">
		<div class="col-xs-8 col-sm-9 col-md-10">
    <br><br>
            <p id="rcorners2" align="center">추가정보 입력</p><br><br><br>
        <form class="form-horizontal" name="init" role="form">
   
          	 <input type="hidden" name="mem_id" value="${mem_id}">
           
            <div class="form-group" id="divName">
                <label for="inputName" class="col-lg-2 control-label" style="text-align: left;">이름</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="name" name="mem_name" placeholder="이름" maxlength="15">
                </div>
            </div>
             
            <div class="form-group" id="divBirth">
                <label for="inputNickname" class="col-lg-2 control-label" style="text-align: left;">생년월일</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyNumber" id="birth" name="mem_birth" placeholder="생년월일 8자리를 입력해주세요   ex)19920731" maxlength="8">
                </div>
            </div>
             
            <div class="form-group" id="divEmail">
                <label for="inputEmail" class="col-lg-2 control-label" style="text-align: left;">이메일</label>
                <div class="col-lg-10">
                    <input type="email" class="form-control" id="email" name="mem_email" placeholder="이메일" maxlength="40">
                </div>
            </div>
            <div class="form-group" id="divPhoneNumber">
                <label for="inputPhoneNumber" class="col-lg-2 control-label" style="text-align: left;">휴대폰</label>
                <div class="col-lg-10">
                    <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="mem_tel" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPhoneNumber" class="col-lg-2 control-label" style="text-align: left;">성별</label>
                <div class="col-lg-10">
                    <select class="form-control" id="gender" name="mem_sex">
                        <option value="m">남</option>
                        <option value="f">여</option>
                    </select>
                </div>
            </div>
             <div class="form-group">
                <label for="inputPhoneNumber" class="col-lg-2 control-label" style="text-align: left;">국적</label>
                <div class="col-lg-10">
                    <select class="form-control" id="gender" name="mem_nation" onchange="nationResult()">
                        <option value="GH">가나</option>
                        <option value="GR">그리스</option>
                        <option value="NL">네덜란드</option>
                        <option value="NZ">뉴질랜드</option>
                        <option value="KR" selected="selected">대한민국</option>
                        <option value="DE">독일</option>
                        <option value="LA">라오스</option>
                        <option value="LU">룩셈부르크</option>
                        <option value="MY">말레이시아</option>
                        <option value="US">미국</option>
                        <option value="VN">베트남</option>
                        <option value="BR">브라질</option>
                        <option value="CH">스위스</option>
                        <option value="ES">스페인</option>
                        <option value="GB">영국</option>
                        <option value="IT">이탈리아</option>
                        <option value="JP">일본</option>
                        <option value="JM">자메이카</option>
                        <option value="CN">중국</option>
                        <option value="CZ">체코</option>
                        <option value="CL">칠레</option>
                        <option value="CA">캐나다</option>
                        <option value="CO">콜롬비아</option>
                        <option value="TH">태국</option>
                        <option value="TR">터키</option>
                        <option value="PT">포르투칼</option>
                        <option value="FR">프랑스</option>
                        <option value="AU">호주</option>
                        <option value="HK">홍콩</option>
                        <option value="ZZ">기타국가</option>
                    </select>
                </div>
            </div>
            <div class="form-group" id="divAddr11">
                <label for="inputPhoneNumber" class="col-lg-2 control-label" style="text-align: left;">기본주소</label>
                <div class="col-lg-10" id="divAddr1">
                    <input type="text" class="form-control" id="addr1" name="mem_addr1" readonly="readonly" placeholder="기본주소" maxlength="100" onclick="searchPost()">
                </div>
            </div>
        	<div class="form-group" id="divAddr22">
                <label for="inputPhoneNumber" class="col-lg-2 control-label" style="text-align: left;">상세주소</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="addr2" name="mem_addr2" placeholder="상세주소" maxlength="100">
                </div>
            </div>
            
              <div class="form-group" id="divAgree">
                <label for="provision" class="col-lg-2 control-label" style="text-align: left;">개인정보약관</label>
                <div class="col-lg-10" id="provision">
                <input type="text" class="form-control" id="provision" name="provision" readonly="readonly" onclick="showProvision()" style="text-align: center;" value="내용보기">
                    <textarea class="form-control" rows="12" style="resize:none; display: none;">
제 1 조 (목적)
이 약관은 플래너당 주식회사 ("회사" 또는 "플래너당")가 제공하는 플래너당 및 플래너당 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 플래너당 및 플래너당 관련 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
제 3 조 (약관의 게시와 개정)
①"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
②"회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
③"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
④회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.
제 4 조 (약관의 해석)
①"회사"는 "유료서비스" 및 개별 서비스에 대해서는 별도의 이용약관 및 정책(이하 "유료서비스약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "유료서비스약관 등"이 우선하여 적용됩니다.
②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "유료서비스약관 등" 및 관계법령 또는 상관례에 따릅니다.
제 5 조 (이용계약 체결)
①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
②"회사"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
2.실명이 아니거나 타인의 명의를 이용한 경우
3.허위의 정보를 기재하거나, "회사"가 제시하는 내용을 기재하지 않은 경우
4.14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
5.이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
③제1항에 따른 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
④"회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
⑥이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
⑦"회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
⑧"회사"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.
제 6 조 (회원정보의 변경)
①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.
③제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
제 7 조 (개인정보보호 의무)
"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.
제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)
①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
②"회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "회사" 및 "회사"의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.
④제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
제 9 조 ("회원"에 대한 통지)
①"회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.
②"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.
제 10 조 ("회사"의 의무)
①"회사"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
②"회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.
③"회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.
제 11 조 ("회원"의 의무)
①"회원"은 다음 행위를 하여서는 안 됩니다.
1.신청 또는 변경 시 허위내용의 등록
2.타인의 정보도용
3."회사"가 게시한 정보의 변경
4."회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5."회사"와 기타 제3자의 저작권 등 지적재산권에 대한 침해
6."회사" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7.외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
8.회사의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
9.기타 불법적이거나 부당한 행위
②"회원"은 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항 등을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 하여서는 안 됩니다.
③"회원"이 카페, 블로그 서비스를 이용하여 통신판매 또는 통신판매중개를 업으로 하는 경우 전자상거래 등에서의 소비자보호에 관한 법률에 따른 의무를 준수하여야 하며, 회사는 개별 서비스 이용약관 및 정책에서 관련 내용을 규정할 수 있습니다.
제 12 조 ("서비스"의 제공 등)
①회사는 회원에게 아래와 같은 서비스를 제공합니다.
1.검색 서비스
2.개방형 서비스(블로그, 카페 등)
3.게시판형 서비스(지식iN, 뉴스 등)
4.메일서비스
5.보안패치, 백신서비스
6.기타 "회사"가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스
②회사는 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.
③"서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
④"회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "회사"는 제9조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
⑤"회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.
제 13 조 ("서비스"의 변경)
①"회사"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있습니다.
②"서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시하여야 합니다.
③"회사"는 무료로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.
제 14 조 (정보의 제공 및 광고의 게재)
①"회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.
②제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 제외됩니다.
③"회사"는 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "회사"에게 할 수 있습니다.
④"이용자(회원, 비회원 포함)"는 회사가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지 않습니다.
제 15 조 ("게시물"의 저작권)
①"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
②"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
③"회사"는 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.
제 16 조 ("게시물"의 관리)
①"회원"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "회사"는 관련법에 따라 조치를 취하여야 합니다.
②"회사"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다.
③본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 "회사"가 정한 "게시중단요청서비스"에 따릅니다.
- 게시중단요청서비스 : http://help.naver.com/claim_main.asp
제 17 조 (권리의 귀속)
①"서비스"에 대한 저작권 및 지적재산권은 "회사"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
②"회사"는 서비스와 관련하여 "회원"에게 "회사"가 정한 이용조건에 따라 계정, "아이디", 콘텐츠, "포인트" 등을 이용할 수 있는 이용권만을 부여하며, "회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
제 18 조 (포인트)
"회사"는 서비스의 효율적 이용 및 운영을 위해 사전 공지 후 "포인트"의 일부 또는 전부를 조정할 수 있으며, "포인트"는 회사가 정한 기간에 따라 주기적으로 소멸할 수 있습니다.
제 19 조 (계약해제, 해지 등)
①"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
②"회원"이 계약을 해지할 경우, 관련법 및 개인정보처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다.
③"회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 메일, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.
제 20 조 (이용제한 등)
①"회사"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.
②"회사"는 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "포인트" 및 기타 혜택 등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다.
③"회사"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.
④"회사"는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.
⑤본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 "회사"는 제9조["회원"에 대한 통지]에 따라 통지합니다.
⑥"회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "서비스"의 이용을 재개합니다.
제 21 조 (책임제한)
①"회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
②"회사"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
③"회사"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
④"회사"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
⑤"회사"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
제 22 조 (준거법 및 재판관할)
①"회사"와 "회원"간 제기된 소송은 대한민국법을 준거법으로 합니다.
②"회사"와 "회원"간 발생한 분쟁에 관한 소송은 제소 당시의 "회원"의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 "회원"의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.
③해외에 주소나 거소가 있는 '회원' 의 경우 '회사'와 '회원'간 발생한 분쟁에 관한 소송은 전항에도 불구하고 대한민국 서울중앙지방법원을 관할 법원으로 합니다.
                    </textarea>
                    <div class="radio" style="display:none;">
                        <label>
                            <input type="radio" id="provisionY" name="provisionYn" value="Y">
                            동의합니다.
                        </label>
                    </div>
                    <div class="radio" style="display:none;">
                        <label>
                            <input type="radio" id="provisionN" name="provisionYn" value="N" checked>
                            동의하지 않습니다.
                        </label>
                    </div>
                </div>
            </div>
         
            <input type="hidden" name="pValue" value="1">
            <br>
            <div id="container">
			<div class="button-4" style="margin-left: 180px;">
  		    <div class="eff-4"></div>
    			<a href="javascript:submitForm()"> 작성완료 </a>
			</div>
			</div>
            
            <br>
        </form>
    </div>
</div>
	<%@ include file="../header.jsp"%>	
</div>
    </body>
</html>