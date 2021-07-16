<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#hotel_ok{
		margin-top:100px;
	}
	#ok h1{
		text-align:center;
				margin-top:100px;
	}
	
	/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
.row2 {
	border-radius: 5px;
	padding: 20px;
	text-align:center;
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
</style>
	<script>
	window.onload = function(){
		init();
	}
	</script>
	
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous">	
</script>

<script>

	function yeyakList(){
		window.location.href="yeyak.pd";
	}

	$(document).ready(function() {
						var roomnum = $('#hot_roomnum').val();
						var roomnum1 = $('#hot_roomnum1').val();
						var roomnum2 = $('#hot_roomnum2').val();
						var roomnum3 = $('#hot_roomnum3').val();

						if (roomnum == 0) {
						} else if (roomnum != 0) {
							$('#room').html("2인실 : " + roomnum + "개");
						}

						if (roomnum1 == 0) {
						} else if (roomnum1 != 0) {
							$('#room1').html("1인실 : " + roomnum1 + "개");
						}

						if (roomnum2 == 0) {
						} else {
							$('#room2').html("3인실 : " + roomnum2 + "개");
						}

						if (roomnum3 == 0) {
						} else {
							$('#room3').html("4인실 : " + roomnum3 + "개");
						}
	});
	function close() {
		modal.style.display = 'none';
	}

</script>
	
</head>
<body>
<div class="page-container">
<div class="content">
			<input type="hidden" name="hot_roomnum" value="${dto.hot_roomnum}" id="hot_roomnum"> 
			<input type="hidden" name="hot_roomnum1" value="${dto.hot_roomnum1}" id="hot_roomnum1"> 
			<input type="hidden" name="hot_roomnum2" value="${dto.hot_roomnum2}" id="hot_roomnum2"> 
			<input type="hidden" name="hot_roomnum3" value="${dto.hot_roomnum3}" id="hot_roomnum3">
  <%@ include file="../header.jsp"%>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
    	<p style="text-align: right;"><a href="javascript:close()">X</a></p>
      <h2>호텔 예약 내역</h2>
    </div>
    <div class="modal-body">
    	<h4>호텔 정보</h4>
    	<table class="table">
    		<tr>
    			<th>호텔이름</th>
    			<td>${dto.hot_name}</td>
    		</tr>
    		<tr>
    			<th>호텔주소</th>
    			<td>${dto.hot_address}</td>
    		</tr>
    		<tr>
    			<th>호텔가격</th>
    			<td>${ydto.ye_price}$</td>
    		</tr>
    		<tr>
    			<td>일정</td>
    			<td>[${ydto.ye_in} ~ ${ydto.ye_out}]</td>
    		</tr>
    		<tr>
    			<td>선택 하신 방 정보 </td>
    			<td id="room">2인실 : ${dto.hot_roomnum}&nbsp;&nbsp;&nbsp;1인실 : ${dto.hot_roomnum1}&nbsp;&nbsp;&nbsp;3인실 : ${dto.hot_roomnum2}&nbsp;&nbsp;&nbsp;4인실 : ${dto.hot_roomnum3}</td>

    		</tr>
    	</table>
    	<br>
      <h4>예약자 정보</h4>
      <table class="table">
      	<tr>
      		<th>이름&nbsp;&nbsp;&nbsp;${ydto.ye_first}&nbsp;${ydto.ye_last}</th>
      		<th>이메일&nbsp;&nbsp;&nbsp;${ydto.ye_email}</th>
      		<th>전화번호&nbsp;&nbsp;&nbsp;${ydto.ye_tel}</th>
      	</tr>
      </table>
    </div>
    <div class="modal-footer">
      <h3>예약 완료</h3>
    </div>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
window.onload = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

</script>

<div class="row2">
<div class="col-sm-1"></div>
<div class="col-sm-8">
<div id="ok">
<h1>예약 완료</h1>
</div>
<div id="hotel_ok">
<label>확정된 예약입니다 : ${dto.hot_name}</label>
</div>
<br>
<form name="yeyakList" action="airMypage.pd">
<input type="hidden" value="${dto.hot_lat}" name="hot_lat"> 
<input type="hidden" value="${dto.hot_lat}" name="ye_lat"> 
<input type="hidden" value="${dto.hot_lng}" name="hot_lng"> 
<input type="hidden" value="${dto.hot_lng}" name="ye_lng">
<input type="hidden" name="ye_photo" value="${dto.hot_photo}">
<table class="table">
	<tr>
		<td rowspan="3"><img src="${dto.hot_photo}"></td>
		<td>${ydto.ye_in} <br>15:00부터</td>
		<td>${ydto.ye_out} <br>10:00까지</td>
		<td>
		${ydto.ye_price}달러<br>
		${ydto.ye_price*1118}원<br>
		${ydto.ye_price*110.8}엔
		</td>
	</tr>
	<tr>
		<td colspan="3">2인실 : ${dto.hot_roomnum}&nbsp;&nbsp;&nbsp;1인실 : ${dto.hot_roomnum1}&nbsp;&nbsp;&nbsp;3인실 : ${dto.hot_roomnum2}&nbsp;&nbsp;&nbsp;4인실 : ${dto.hot_roomnum3}</td>
	</tr>
	<tr>
		<td colspan="3">
		<input type="submit" value="예약목록">
		</td>
	</tr>
</table>
</form>
<table class="table">
	<tr>
		<td>취소 수수료 3일전까지 무료 이후에 취소할 경우 ${ydto.ye_price}$ 수수료가 부가됩니다.</td>
	</tr>
</table>
</div>
<div class="col-sm-3"></div>
</div>
  <%@ include file="../header.jsp"%>
  </div>
  </div>
</body>
</html>