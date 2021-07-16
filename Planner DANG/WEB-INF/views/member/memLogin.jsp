<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="489226382240-pno63aaoqaojrk1jf23ii6a00vu8l30g.apps.googleusercontent.com">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/login.css">

 <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="https://apis.google.com/js/platform.js" async defer></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
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
	
	
});
</script>
<style>
#loginBtn{
  background:#0683c9;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#loginBtn:hover{
  background:#fff;
  color:#0683c9;
}
#loginBtn:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
#loginBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#loginBtn:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
table{
width:90%;
margin : 0 auto;
}
</style>
</head>
<body>
	<div id="loginBody">
	<form name="login" action="memLogin.pd" method="post">
	<br><br>
	<div class="form-group" id="divId">
      <div class="col-lg-10">
             <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="mem_id" placeholder="ID" maxlength="30" required="required" value="${saveid}">
	  </div>
    </div>
    <div class="form-group" id="divPassword">
          <div class="col-lg-10">
             <input type="password" class="form-control" id="password" name="mem_pwd" placeholder="PASSWORD" maxlength="30" required="required">
	      </div>
	</div>
<table>
<tr>
<td colspan="4" id="msg" valign="top" align="center" style="color: red;">${logMsg}</td>
</tr>
<tr>
	<c:if test="${saveid==''}">
	<td colspan="2"><input type="checkbox" name="cb" value="on">ID기억</td>
	</c:if>
	
	<c:if test="${saveid!=''}">
	<td colspan="2"><input type="checkbox" name="cb" value="on" checked="checked">ID기억</td>
	</c:if>
	
	<td colspan="2" align="right" valign="bottom"><a href="idPwdFind.pd">ID/PW 찾기</a></td>
	</tr>
	<tr>
	<td colspan="4">
	<input type="submit" id="loginBtn" value="LOGIN" style="height:40px; width:100%;"><br><br><br>
	</td>
	</tr>
	</form>

<tr align="center">
<td>
	<div class="g-signin2" data-onsuccess="onSignIn" id="user" data-width="40" data-height="40"></div>

	<script>
		function onSignIn(googleUser) {

			var profile = googleUser.getBasicProfile();
			location.href="exMemLogin.pd?mem_id=!"+profile.getEmail()+"&mem_name="+profile.getName();
		};
	</script>
</td>
<td>
	<div id="naver_id_login"></div>
</td>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("FUhdzHyoizz13cx434Pt",
				"http://192.168.20.49:9090/pd/memLogin.pd");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green");
		naver_id_login.setDomain("http://192.168.20.49:9090/pd/memLogin.pd");
		naver_id_login.setState(state);

		naver_id_login.init_naver_id_login();

		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
		function naverSignInCallback() {
			location.href="exMemLogin.pd?mem_id=@"+ naver_id_login
			.getProfileData('email') +"&mem_name="+naver_id_login
			.getProfileData('nickname');
		}
	</script>

<td>
<a id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="img/member/kakao.png" width="40" height="40"/>
</a>
</td>

	<script>
		Kakao.init('18892640de6334c7f98dd318cc6099e1');
	
		function loginWithKakao(){
		Kakao.Auth.login({
					
					success : function(authObj) {

						Kakao.API.request({
									url : '/v1/user/me',
									success : function(res) {
										location.href="exMemLogin.pd?mem_id=_"+ res.id+"&mem_name="+res.properties.nickname;
								
									},
									fail : function(error) {
										alert('요청실패');
									}
								});
					},

					fail : function(err) {
						alert('실패');
					}
				});
		}
	</script>


	

	<script>
	
	function statusChangeCallback(response) {
		if (response.status == 'connected') {
			testAPI();
         } else {
            // The person is not logged into your app or we are unable to tell.
          	FB.login(function(response){ 
          		testAPI();
          	});


         }
      }

      // This function is called when someone finishes with the Login
      // Button.  See the onlogin handler attached to it in the sample
      // code below.
      function checkLoginState() {
    	  
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
         });
      }

      function fbLogin() {
    	
        FB.init({
            appId : '456448684691325',
            cookie : true, // enable cookies to allow the server to access 
            // the session
            xfbml : true, // parse social plugins on this page
            version : 'v2.8' // use graph api version 2.8
         });

         // Now that we've initialized the JavaScript SDK, we call 
         // FB.getLoginStatus().  This function gets the state of the
         // person visiting this page and can return one of three states to
         // the callback you provide.  They can be:
         //
         // 1. Logged into your app ('connected')
         // 2. Logged into Facebook, but not your app ('not_authorized')
         // 3. Not logged into Facebook and can't tell if they are logged into
         //    your app or not.
         //
         // These three cases are handled in the callback function.

         FB.getLoginStatus(function(response) {
        	  statusChangeCallback(response);
         });

      };

      // Load the SDK asynchronously
    (function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

      // Here we run a very simple test of the Graph API after login is
      // successful.  See statusChangeCallback() for when this call is made.
      function testAPI() {
         
         FB.api('/me',function(response) {
        	location.href="exMemLogin.pd?mem_id=,"+response.id+"&mem_name="+response.name;
        });
      }
     
  </script>
<td>
<a href="javascript:fbLogin()"><img src="img/member/face.png" width="40" height="40"/></a>
</td>
</tr>
</table>
</div>
</body>
</html>