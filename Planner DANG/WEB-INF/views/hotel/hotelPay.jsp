<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#tone_div {
	margin-top: 100px;
}

#tone_div table {
	margin: 0px auto;
	width: 600px;
}

#ttwo {
	margin: 0px auto;
	width: 600px;
}

#tthree {
	margin: 0px auto;
	width: 600px;
}

#tfour {
	margin: 0px auto;
	width: 600px;
}

#tfive {
	margin: 0px auto;
	text-align: center;
}

input[type=text], select {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.row {
	border-radius: 5px;
	/* background-color: #f2f2f2; */
	padding: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous">	
</script>

<script>
function nameInput() {
	
	var a = document.hotelpay.ye_first.value;
	var b =a.toUpperCase();
	document.hotelpay.ye_first.value = b;
	
	var c = document.hotelpay.ye_last.value;
	var d = c.toUpperCase();
	document.hotelpay.ye_last.value =d;
	
}
	$(document)
			.ready(
					function() {
						  
						$('#email').keyup(function() {
							$('#msg').text('');
						});
						
						$('#email_ok').keyup(function() {
							var email = $('#email').val();
							var email_ok = $('#email_ok').val();
							if (email != email_ok) {
								$('#msg').text('');
								$('#msg').html("이메일이 일치하지않습니다." + mon);
							} else {
								$('#msg').text('');
								$('#msg').html("이메일이 일치합니다.");
								$('#email_s').val(email_ok);
							}
						});

						var roomnum = $('#hot_roomnum').val();
						var roomnum1 = $('#hot_roomnum1').val();
						var roomnum2 = $('#hot_roomnum2').val();
						var roomnum3 = $('#hot_roomnum3').val();

						if (roomnum == 0) {
						} else if (roomnum != 0) {
							$('#room').html("2인실 : ");
							$('#roomnum').html(roomnum + "개");
						}

						if (roomnum1 == 0) {
						} else if (roomnum1 != 0) {
							$('#room1').html("1인실 : ");
							$('#roomnum1').html(roomnum1 + "개");
						}

						if (roomnum2 == 0) {
						} else {
							$('#room2').html("3인실 : ");
							$('#roomnum2').html(roomnum2 + "개");
						}

						if (roomnum3 == 0) {
						} else {
							$('#room3').html("4인실 : ");
							$('#roomnum3').html(roomnum3 + "개");
						}
						

					//submit 확인								
/* 					$("form").submit(function() {
						var text = $("#first").val();
						var text2 = $("#last").val();
						var regexp = /[A-Z]/;
						for (var i = 0; i < text.length; i++) {
							if (text.charAt(i) != " " && regexp.test(text.charAt(i)) == false) {
								alert('성은 영문 대문자만 입력해주세요');
								$("#first").focus();
								return false;
							}else{
								return true;
							}
						}
						for (var i = 0; i < text2.length; i++) {
							if (text2.charAt(i) != " " && regexp.test(text2.charAt(i)) == false) {
								alert('이름은 영문 대문자만 입력해주세요'); 
								return false;									
							}else{
								return true;
							}
						}
					}); */
					
/* 					$("form").submit(function() {
						var text = $("#last").val();
						var regexp = /[A-Z]/;
						for (var i = 0; i < text.length; i++) {
							if (text.charAt(i) != " " && regexp.test(text.charAt(i)) == false) {
								alert('이름은 영문 대문자만 입력해주세요'); 
								return false;									
							}else{
								return true;
							}
						}
					}); 
					
					$('form').submit(function() {
						var email = $('#email').val();
						var email_ok = $('#email_ok').val();
						if (email != email_ok) {
							alert('이메일이 일치하지 않습니다.'); 
							return false;
						} else {
							return true;
						}
					}); */
					  var now = new Date();
					  var year = now.getFullYear();
					  var mon = (now.getMonth()+1)>9?''+(now.getMonth()+1):'0'+(now.getMonth()+1);
					  var day = now.getDate()>9?''+now.getDate():'0'+now.getDate();
					  					  
						$('form').submit(function() {
							var ye_year = $('#ye_year').val();
							var ye_month = $('#ye_month').val();
							if(ye_month.length == 1){
								ye_month = '0' + ye_month;
							}
							if (year > ye_year) {
								alert('카드의 만료기간은 현재 일로부터 이전일 수 없습니다.');
								$('#ye_month').focus();
								return false;
							} else {
								return true;
							}
						});
					  
						//이름 영문확인  	
						$('#first').keyup(function() {
							$('#first_ok').text('');
						});

						$('#first')
								.keyup(
										function() {
											var text = $("#first").val();
											var regexp = /[A-Z]/;
											var test = $('#first').val();
											for (var i = 0; i < text.length; i++) {
												if (text.charAt(i) != " "
														&& regexp.test(text
																.charAt(i)) == false) {
													$('#first_ok').text('');
													$('#first_ok')
															.html(
																	"영문 대문자만 입력 가능합니다.");
												}
											}
										});

						$('#last').keyup(function() {
							$('#last_ok').text('');
						});

						$('#last')
								.keyup(
										function() {
											var text = $("#last").val();
											var regexp = /[A-Z]/;
											var test = $('#last').val();
											for (var i = 0; i < text.length; i++) {
												if (text.charAt(i) != " "
														&& regexp.test(text
																.charAt(i)) == false) {
													$('#last_ok').text('');
													$('#last_ok')
															.html(
																	"영문 대문자만 입력 가능합니다.");
												}
											}
										});

						$('#cardnum').keyup(function() {
							$('#cardnum_ok').text('');
						});

						$('#cardnum')
								.keyup(
										function() {
											var text = $("#cardnum").val();
											var regexp = /[0-9]/;
											var test = $('#cardnum').val();
											for (var i = 0; i < text.length; i++) {
												if (text.charAt(i) != " "
														&& regexp.test(text
																.charAt(i)) == false) {
													$('#cardnum_ok').text('');
													$('#cardnum_ok').html(
															"숫자만 입력 가능합니다.");
												}
											}
										});

						$('#cvc').keyup(function() {
							$('#cvc_ok').text('');
						});

						$('#cvc')
								.keyup(
										function() {
											var text = $("#cvc").val();
											var regexp = /[0-9]/;
											var test = $('#cvc').val();
											for (var i = 0; i < text.length; i++) {
												if (text.charAt(i) != " "
														&& regexp.test(text
																.charAt(i)) == false) {
													$('#cvc_ok').text('');
													$('#cvc_ok').html(
															"숫자만 입력 가능합니다.");
												}
											}
										});

					});
</script>

</head>
<body>
	<div class="page-container">
	<div class="content">
	<%@ include file="../header.jsp"%>
	<div class="col-sm-10 col-xs-12">
	<form name="hotelpay" action="hotel_ok.pd" method="post">
		<input type="hidden" value="${dto.hot_lat}" name="hot_lat"><input
			type="hidden" value="${dto.hot_lat}" name="ye_lat"> <input
			type="hidden" value="${dto.hot_lng}" name="hot_lng"> <input
			type="hidden" value="${dto.hot_lng}" name="ye_lng"> <input
			type="hidden" value="${dto.hot_rating}" name="hot_rating">
		
				<div class="row2">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
		<div id="tone_div">
			<input type="hidden" name="hot_photo" value="${dto.hot_photo}">
			<input type="hidden" name="ye_photo" value="${dto.hot_photo}">
			<table class="table">
				<tr>
					<td>호텔가격</td>
					<td>${ydto.ye_price}$<input type="hidden" name="ye_price"
						value="${ydto.ye_price}">
					</td>
				</tr>
				<tr>
					<td>호텔이름</td>
					<td>${dto.hot_name}
					<input type="hidden" name="hot_name" value="${dto.hot_name}"> 
					<input type="hidden" name="ye_name" value="${dto.hot_name}">
					</td>
				</tr>
				<tr>
					<td>호텔주소</td>
					<td>${dto.hot_address}<input type="hidden" name="hot_address"
						value="${dto.hot_address}">
					</td>
				</tr>
				<tr>
					<td>체크인</td>
					<td>${ydto.ye_in}<input type="hidden" name="ye_in"
						value="${ydto.ye_in}">
					</td>
				</tr>
				<tr>
					<td>체크아웃</td>
					<td>${ydto.ye_out}<input type="hidden" name="ye_out"
						value="${ydto.ye_out}">
					</td>
				</tr>
			</table>
			<input type="hidden" name="hot_roomnum" value="${dto.hot_roomnum}" id="hot_roomnum"> 
			<input type="hidden" name="hot_roomnum1" value="${dto.hot_roomnum1}" id="hot_roomnum1"> 
			<input type="hidden" name="hot_roomnum2" value="${dto.hot_roomnum2}" id="hot_roomnum2"> 
			<input type="hidden" name="hot_roomnum3" value="${dto.hot_roomnum3}" id="hot_roomnum3"> 
			<br>
			<table class="table">
				<tr>
					<td id="room" width=120px></td>
					<td id="roomnum"></td>
				</tr>
				<tr>
					<td id="room1"></td>
					<td id="roomnum1"></td>
				</tr>
				<tr>
					<td id="room2"></td>
					<td id="roomnum2"></td>
				</tr>
				<tr>
					<td id="room3"></td>
					<td id="roomnum3"></td>
				</tr>
			</table>
		</div>
		</div>
		<div class="col-sm-2"></div>
		</div>
		
		<br>

		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<label for="fname">성(영문)</label> 
				<font color="red" id="first_ok"></font>
				<input type="text" id="first" name="ye_first" placeholder="예 : HONG" required="required" onkeyup="nameInput()"> 
				
				<label for="lname">이름(영문)</label>
				<font color="red" id="last_ok"></font>
				<input type="text" id="last" name="ye_last" required="required" placeholder="예 : GILDONG" onkeyup="nameInput()"> 

				<label for="email">이메일 주소</label> 
				<input type="text" name="email" id="email" required="required" placeholder="오타 입력 주의"> 
				<label for="email_ok">이메일 주소 확인</label> 
				<font color="red" id="msg"></font> 
				<input type="text" name="ye_email" id="email_ok" required="required"> 
				<input type="hidden" id="email_s"> 
				<label for="msg">예약 확인서 및 여행 가이드가 여기로 전송됩니다.</label>
				<br>
				<hr>
				<br>
				<label for="phone">전화번호 (가능한 경우 휴대폰)</label>
				<input type="text" name="ye_tel" required="required">
				
				<label for="tel">숙소와 연락 방법</label>
				<select id="tel" name="tel">
					<option value="이메일">이메일</option>
					<option value="전화">전화</option>
				</select>
				
				<br>
				<hr>
				<br>
				
				<label for="pay">신용/체크카드 (예약 보장에 사용됩니다.)</label>
				<select name="ye_card">
					<option>--선택--</option>
					<option>Visa</option>
					<option>Mastercard</option>
					<option>아메리칸 익스프레스</option>
				</select>
				
				<label for="card">카드번호</label>
				<font color="red" id="cardnum_ok"></font>
				<input type="text" id="cardnum" name="ye_cardnum" required="required">
				
				<label for="date">만료날짜 (월 / 년)</label>
				<select name="ye_month" id="ye_month">
						<c:set var="n" value="1" />
						<c:forEach begin="1" end="12">
							<option value=${n}>${n}</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
				</select>
				&nbsp;
				<select name="ye_year" id="ye_year">
						<c:set var="n" value="2018" />
						<c:forEach begin="2017" end="2047">
							<option value=${n}>${n}</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
				</select>
				
				<label for="cvc">CVC코드</label>
				<font color="red" id="cvc_ok"></font>
				<input type="text" id="cvc" name="ye_cvc" maxlength="3" required="required">
				
	
				<div id="tfive">
					<input type="submit" value="예약 완료" id="yeyak_ok" >
				</div>
				
			</div>
			<div class="col-sm-3"></div>
		</div>

	</form>
	</div>
	</div>
	</div>
</body>
</html>