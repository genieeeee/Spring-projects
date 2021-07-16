<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous">
</script>

<script>

$(document).ready(function(){
 
  var add = 30;
  var pri;
  var a=0;
  var b=0;
  var c=0;
  var d=0;
  var total;
  var inout = 0;
  var now = new Date();
  var year = now.getFullYear();
  var mon = (now.getMonth()+1)>9?''+(now.getMonth()+1):'0'+(now.getMonth()+1);
  var day = now.getDate()>9?''+now.getDate():'0'+now.getDate();

  
//지도 숨기기
  $("#hide").click(function(){
    $("#map").hide();
  });
  $("#show").click(function(){
    $("#map").show();
  });
  
  $('#in').on("change",function(){
	var c_in = $('#in').val();
	if(c_in.substring(5,7) == mon && day > c_in.substring(8) || c_in.substring(5,7) < mon){
		window.alert('날짜를 잘못 선택하셨습니다.');
		document.location.reload();		
	}
  });
  
//CheckIn Out
	$('#out').on("change",function(){	
		var c_in = $('#in').val();
		var c_out = $('#out').val();
		var arr1 = c_in.split('-');
		var arr2 = c_out.split('-');
		var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
		c_in1 = c_in.substring(8);
		c_out1 = c_out.substring(8);
		
		if(c_in == ''){
			window.alert('체크인 날짜부터 선택해주세요');
			document.location.reload();
			return;
		}else{
			inout = parseInt(c_out1) - parseInt(c_in1);
			if(c_in.substring(5,7) != c_out.substring(5,7)){
				var diff = dat2 - dat1;
				inout = diff/(24*3600*1000);
			}
			$('#stay').html(inout + '박 요금');
			$('#staynum').val(inout);
		}
		for(var i=0; i<=3; i++){
			if(inout > 0){
				var pri = $('#hi_pi'+i).val();
				pri = pri * inout;
				$('#hi_pi'+i).val(pri);
				$('#pri'+i).html(pri + '$');
				
			} else if(inout <= -1){
				window.alert('잘못된 선택입니다.');
				document.location.reload();
				return;
			}
		}
	});
  
//객실선택시 요금 변환
	$('#sel').on("change",function(){
		var num = $('#sel').val();
		var pri = $('#hi_pi0').val();
		var c_out = $('#out').val();
		a = pri * num;
		total = a + b + c + d;
		if(c_out == ''){
			window.alert('날짜부터 선택해주세요');
			document.location.reload();
			return;
		}else{
		$('#price').html('객실 총요금 : <br>' + total + '$<br><br><br><input type="submit" value="예약">');
		$('#hi_pi').val(total);			
		}
	});
	
 	$('#sel1').on("change",function(){
		var num = $('#sel1').val();
		var pri = $('#hi_pi1').val();
		var c_out = $('#out').val();
		b = pri * num;
		total = a+b+c+d;
		if(c_out == ''){
			window.alert('날짜부터 선택해주세요');
			document.location.reload();
			return;
		}else{
		$('#price').html('객실 총요금 : <br>' + total + '$<br><br><br><input type="submit" value="예약">');
		$('#hi_pi').val(total);
		}
	});
 
	$('#sel2').on("change",function(){
		var num = $('#sel2').val();
		var pri = $('#hi_pi2').val();
		var c_out = $('#out').val();
		c = pri * num;
		total = a+b+c+d;
		if(c_out == ''){
			window.alert('날짜부터 선택해주세요');
			document.location.reload();
			return;
		}else{
		$('#price').html('객실 총요금 : <br>' + total + '$<br><br><br><input type="submit" value="예약">');
		$('#hi_pi').val(total);
		}
	});
	
	$('#sel3').on("change",function(){
		var num = $('#sel3').val();
		var pri = $('#hi_pi3').val();
		var c_out = $('#out').val();
		d = pri * num;
		total = a+b+c+d;
		if(c_out == ''){
			window.alert('날짜부터 선택해주세요');
			document.location.reload();
			return;
		}else{
		$('#price').html('객실 총요금 : <br>' + total + '$<br><br><br><input type="submit" value="예약">');
		$('#hi_pi').val(total);
		}
	});

	
});
</script>

<style>
#map {
	height: 470px;
}

#floating-panel {
	position: absolute;
	top: 10px;
	left: 25%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#floating-panel {
	position: absolute;
	top: 5px;
	left: 50%;
	margin-left: -180px;
	width: 350px;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
}

#latlng {
	width: 225px;
}

/* #hide {
	position: absolute;
	margin-top: -100px;
	left: 10px;
	z-index: 5px;
	background-color: white;
	border-color: lightgray;
	width: 90px;
	height: 30px;
	size: 3px;
} */
/* 
#show {
	position: absolute;
	margin-top: -100px;
	left: 105px;
	z-index: 5px;
	background-color: white;
	border-color: lightgray;
	width: 90px;
	height: 30px;
	size: 3px;
} */

#mname {
	text-align: center;
}

input[type=text], select, date {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
}

input[type=date] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
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

.row2 {
	border-radius: 5px;
	padding: 20px;
}
#mySidenav a {
    position: absolute;
    left: -80px;
    transition: 0.3s;
    padding: 15px;
    width: 100px;
    text-decoration: none;
    font-size: 15px;
    color: white;
    border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
    left: 0;
}
#hide {
    top: 250px;
    background-color: #2478FF;
}
#show {
    top: 340px;
    background-color: #2478FF;
}
</style>
</head>
<body>
	<div class="page-container">
	<div class="content">
	<%@ include file="../header.jsp"%>
	<div id="map"></div>
	<script>
    var lats = ${hdto.hot_lat};
    var lngs = ${hdto.hot_lng};
    var places = new google.maps.places.PlacesService(map);
    
      function initMap() {
    	  var myLatLng = {lat: lats, lng: lngs};

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 17,
          center: myLatLng
        });
       
        var marker = new google.maps.Marker({
          position: myLatLng,
          animation: google.maps.Animation.DROP,
          map: map,
          title: '${hdto.hot_name}'
        });
      
        var hot_rating_one = ${hdto.hot_rating};
        
        if (hot_rating_one) {
            var ratingHtml = '';
            for (var i = 0; i < 5; i++) {
              if (hot_rating_one < (i + 0.5)) {
                ratingHtml += '&#10025;';
              } else {
                ratingHtml += '&#10029;';
              }
            document.getElementById('hot_rating_row').style.display = '';
            document.getElementById('hot_rating').innerHTML = '<font color="#FFE400" size="5">'+ratingHtml+'</font>';
            }
          } else {
            document.getElementById('hot_rating_row').style.display = 'none';
          }
      }     
     
      
    </script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDPeF01RZiXAz_ZdlkNPiVevrLHWv_8OSM&callback=initMap">
    </script>
	<form name="yeyak" action="hotelPay.pd">
		<br> <br> <input type="hidden" name="ye_price"
			value="${ydto.ye_price}" id="hi_pi"> <input type="hidden"
			value="${ydto.ye_price}" id="hi_pi0"> <input type="hidden"
			value="${ydto.ye_price-30}" id="hi_pi1"> <input type="hidden"
			value="${ydto.ye_price+30}" id="hi_pi2"> <input type="hidden"
			value="${ydto.ye_price+60}" id="hi_pi3"> <input type="hidden"
			value="${hdto.hot_lat}" name="hot_lat"> <input type="hidden"
			value="${hdto.hot_lng}" name="hot_lng"> <input type="hidden"
			value="${hdto.hot_rating}" name="hot_rating">
			
			<div id="mySidenav" class="sidenav">
			<a href="#" id="hide">지도<br>숨기기</a>
			<a href="#" id="show">지도<br>보기</a>
<!-- 			<input type="button" value="지도숨기기" id="hide"> -->
			<!-- <input type="button" value="지도보기" id="show"> -->
			</div>
			
			<input type="hidden" name="stay" id="staynum">
		<%--     <input id="pac-input" class="controls" type="text" placeholder="Search Box" value="${name}">
    <div id="map"></div> --%>
		<input type="hidden" name="hot_name" value="${hdto.hot_name}">
		
		
		<div class="row2">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
		<hr>
		<br>
		<table style="text-align: center;">
			<tr>
				<td rowspan="4" width="200px" style="text-align: center;"><img
					src="${hdto.hot_photo}" width="100%"> <input type="hidden"
					name="hot_photo" value="${hdto.hot_photo}"></td>
				<td><h2 id="mname">${hdto.hot_name}</h2></td>
			</tr>
			<tr id="hot_rating_row">
				<td id="hot_rating"></td>
			</tr>
			<tr>
				<td>${hdto.hot_address}<input type="hidden" name="hot_address"
					value="${hdto.hot_address}"></td>
			</tr>
			<tr>
				<td>${ydto.ye_price}$</td>
			</tr>
		</table>
			<br>
			<hr>
			<br>
			<label for="in">체크인</label> 
			<input type="date" id="in" name="ye_in" required="required" size="10">
			<label for="out">체크아웃</label> 
			<input type="date" id="out" name="ye_out" required="required" size="10"> 
			<label for="msg">어린이는 3명당 어른1명의 요금으로 추가될 수 있습니다.</label>
		
		<c:set var="roomnum" value="0" />
			<c:forEach var="hdto" items="${list}">
			<c:set var="roomnum" value="${roomnum + hdto.hot_roomnum}" />
			</c:forEach>
			<c:choose>
				<c:when test="${roomnum == 5}">
					<c:set var="roomnum_a" value="마감되었습니다." />
					<c:set var="roomnum_a2" value="0"/>				
				</c:when>
				<c:when test="${roomnum == 4}">
					<c:set var="roomnum_a" value="마감임박!!"/>
					<c:set var="roomnum_a2" value="1" />					
				</c:when>
				<c:otherwise>
					<c:set var="roomnum_a" value="${5-roomnum}"/>
					<c:set var="roomnum_a2" value="${5-roomnum}"/>
					<c:if test="${roomnum_a2 <= 0}">
						<c:set var="roomnum_a" value="마감되었습니다."/>
						<c:set var="roomnum_a2" value="0"/>
					</c:if>
				</c:otherwise>
			</c:choose>
			
		<c:set var="roomnum1" value="0" />
			<c:forEach var="hdto" items="${list}">
			<c:set var="roomnum1" value="${roomnum1 + hdto.hot_roomnum1}" />
			</c:forEach>
			<c:choose>
				<c:when test="${roomnum1 == 5}">
					<c:set var="roomnum_b" value="마감되었습니다." />
					<c:set var="roomnum_b2" value="0" />					
				</c:when>
				<c:when test="${roomnum1 == 4}">
					<c:set var="roomnum_b" value="마감임박!!"/>
					<c:set var="roomnum_b2" value="1" />					
				</c:when>
				<c:otherwise>
					<c:set var="roomnum_b" value="${5-roomnum1}"/>
					<c:set var="roomnum_b2" value="${5-roomnum1}" />
					<c:if test="${roomnum_b2 <= 0}">
						<c:set var="roomnum_b" value="마감되었습니다."/>
						<c:set var="roomnum_b2" value="0"/>
					</c:if>
				</c:otherwise>
			</c:choose>
			
		<c:set var="roomnum2" value="0" />
			<c:forEach var="hdto" items="${list}">
			<c:set var="roomnum2" value="${roomnum2 + hdto.hot_roomnum2}" />
			</c:forEach>
			<c:choose>
				<c:when test="${roomnum2 == 5}">
					<c:set var="roomnum_c" value="마감되었습니다." />
					<c:set var="roomnum_c2" value="0" />					
				</c:when>
				<c:when test="${roomnum2 == 4}">
					<c:set var="roomnum_c" value="마감임박!!"/>
					<c:set var="roomnum_c2" value="1" />					
				</c:when>
				<c:otherwise>
					<c:set var="roomnum_c" value="${5-roomnum2}"/>
					<c:set var="roomnum_c2" value="${5-roomnum2}" />
					<c:if test="${roomnum_c2 <= 0}">
						<c:set var="roomnum_c" value="마감되었습니다."/>
						<c:set var="roomnum_c2" value="0"/>
					</c:if>
				</c:otherwise>
			</c:choose>
		
		<c:set var="roomnum3" value="0" />
			<c:forEach var="hdto" items="${list}">
			<c:set var="roomnum3" value="${roomnum3 + hdto.hot_roomnum3}" />
			</c:forEach>
			<c:choose>
				<c:when test="${roomnum3 == 5}">
					<c:set var="roomnum_d" value="마감되었습니다." />
					<c:set var="roomnum_d2" value="0" />					
				</c:when>
				<c:when test="${roomnum3 == 4}">
					<c:set var="roomnum_d" value="마감임박!!"/>
					<c:set var="roomnum_d2" value="1" />					
				</c:when>
				<c:otherwise>
					<c:set var="roomnum_d" value="${5-roomnum3}"/>
					<c:set var="roomnum_d2" value="${5-roomnum3}" />
					<c:if test="${roomnum_d2 <= 0}">
						<c:set var="roomnum_d" value="마감되었습니다."/>
						<c:set var="roomnum_d2" value="0"/>
					</c:if>
				</c:otherwise>
			</c:choose>
			
			
			
		
		
		<table class="table">
			<tr>
				<th>객실 유형</th>
				<th>정원</th>
				<th id="stay">요금</th>
				<th>옵션</th>
				<th>객실 선택</th>
				<th>예약 확정하기</th>
			</tr>
			<tr>
				<td>트윈룸 <br> 에어컨<br> 난방 시설<br> 옷걸이<br> 화장실<br>
					냉장고
				</td>
				<td id="peo0">2인</td>
				<td id="pri0">${ydto.ye_price}$</td>
				<td>무료취소 기한 : <br>예약일 전까지<br>
				<br>숙소에서 결제<br>
				남은 방개수 : 
				<font color="red">${roomnum_a}</font>
				</td>
				<td><select name="hot_roomnum" id="sel">
						<c:set var="n" value="0" />
						<c:forEach begin="0" end="${roomnum_a2}">
							<option value=${n}>${n}</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
				</select></td>
				<td rowspan="4" id="price" style="text-align:center;"></td>
			</tr>
			<tr>
				<td>싱글룸 <br> 에어컨<br> 난방 시설<br> 옷걸이<br> 화장실<br>
					냉장고
				</td>
				<td>1인</td>
				<td id="pri1">${ydto.ye_price-30}$</td>
				<td>무료취소 기한 : <br>예약일 전까지<br>
				<br>숙소에서 결제<br>
				남은 방개수 : 
				<font color="red">${roomnum_b}</font>
				</td>
				<td><select name="hot_roomnum1" id="sel1">
						<c:set var="n" value="0" />
						<c:forEach begin="0" end="${roomnum_b2}">
							<option value=${n}>${n}</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>트리플룸 <br> 에어컨<br> 난방 시설<br> 옷걸이<br> 화장실<br>
					냉장고
				</td>
				<td>3인</td>
				<td id="pri2">${ydto.ye_price+30}$</td>
				<td>무료취소 기한 : <br>예약일 전까지<br>
				<br>숙소에서 결제<br>
				남은 방개수 : 
				<font color="red">${roomnum_c}</font>
				</td>
				<td><select name="hot_roomnum2" id="sel2">
						<c:set var="n" value="0" />
						<c:forEach begin="0" end="${roomnum_c2}">
							<option value=${n}>${n}</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>쿼드러플룸 <br> 에어컨<br> 난방 시설<br> 옷걸이<br>
					화장실<br> 냉장고
				</td>
				<td>4인</td>
				<td id="pri3">${ydto.ye_price+60}$</td>
				<td>무료취소 기한 : <br>예약일 전까지<br>
				<br>숙소에서 결제<br>
				남은 방개수 : 
				<font color="red">${roomnum_d}</font>
				</td>
				<td><select name="hot_roomnum3" id="sel3">
						<c:set var="n" value="0" />
						<c:forEach begin="0" end="${roomnum_d2}">
							<option value=${n}>${n}</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
				</select></td>
			</tr>
		</table>
			</div>
			<div class="col-sm-2"></div>
		</div>
		<br>
	</form>
	</div>
	</div>
	</div>
</body>
</html>