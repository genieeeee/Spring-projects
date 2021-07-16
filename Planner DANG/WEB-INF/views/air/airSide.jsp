<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>airSide</title>
<script type="text/javascript" src="js/airJs/airHttpResuest.js"></script>
<link rel="stylesheet" href="css/rangeSingle.css">
<link rel="stylesheet" href="css/rangeDouble.css">
<script src="js/multirange.js"></script>
<script>
var max=3;
var skytype='';
var early='';
var late='';
function changeDepTime(){
	var e = document.getElementById('earlyTime');
	var l = document.getElementById('lateTime');
	var time = document.getElementById('depTime');
	time = time.value;
	var startH = time.split(',')[0];
	var endH = time.split(',')[1];
  	
	if(startH== endH){
		startH=0;
	} 
	
	if(startH<10){
		early ='0'+startH+':00';
		e.innerHTML ='0'+startH+'시';
	}else{
		early = startH+':00';
		e.innerHTML =startH+'시';
	}
	if(endH<10){
		late ='0'+endH+':00';
		l.innerHTML ='0'+endH+'시';
	}else{
		late = endH+':00';
		l.innerHTML =endH+'시';
		if(endH==24){
			late = '23:59';
		}
	}
	setTimeout(goAjax, 1500);
}

function changeMaxstop(){
	var dir = document.getElementsByName('direct');
	for(var i=0;i<3;i++){
		if(dir[i].checked == true){
			max = max > i ? max : i;
		}
	}
	
	goAjax();
	
}
function getAlliance(skyAlliance){
	skytype = skyAlliance;
	goAjax();
}
function goAjax(){//결과값 재 반영
	//sessionStorage.removeItem('adto');
	var dto={
		"air_earliest" : early,
		"air_latest" : late,
		"air_stopNum" : max,
		"air_alliance" : skytype
	}; // late : ~까지  early : ~이후
	var adto = JSON.stringify(dto);
	airSendRequest('airResearch.pd', adto, getAjaxData, 'POST');
}

//AIR SEARCH Ajax Data Processing
function getAjaxData(){
	if(airXhr.readyState==4){
		if(airXhr.status==200){
			var airSearchData=airXhr.responseText;
			var airData = eval('('+airSearchData+')');
			var pre = airData.model.adto;
			maxStop = pre.air_stopNum;
			skyType = pre.air_alliance;
			early = pre.air_earliest;
			late = pre.air_latest;
			getAirResult();
			//dataSetting(pre);//getAurResult.jsp이동
		}
	}
}
</script>
</head>
<body style="background-color: transparent;">
<div class="col-xs-12" id="airSide">
	경유<br>
	<div id="stopOver">
		<hr>
		<input type="checkbox" name="direct" value=0 checked="checked" onchange="changeMaxstop()">&nbsp;직항<br>
		<input type="checkbox" name="direct" value=1 checked="checked" onchange="changeMaxstop()">&nbsp;1회 경유<br>
		<input type="checkbox" name="direct" value=2 checked="checked" onchange="changeMaxstop()">&nbsp;2회 이상 경유<br>
	</div>
	<br>
	<div id="earliesTime">
		출발 시간대 설정
		<hr>
		출발 시간 : <br>
		<input type="hidden">
		<input type="range"  name="air_earlt" multiple min="0" max="24" id="depTime" class="doubleRange" onchange="changeDepTime()" style="background-color: transparent;"><br>
		<span id="earlyTime">00시</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="lateTime">24시</span>
		<br>
	</div>
	<br>
	<div id="airMember">
		항공사<br>
		<hr>
		<a href="javascript:getAlliance('SKYTEAM')">SKY TEAM</a><br>
		<a href="javascript:getAlliance('STAR')">STAR ALLIANCE</a><br>
		<a href="javascript:getAlliance('ONEWORLD')">ONEWORLD</a><br>
		<br>
	</div>
</div>
</body>
</html>