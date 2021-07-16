<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권조회</title>
<link rel="stylesheet" type="text/css" href="css/airSearchCss.css">
<style>
#airBG{
	background-image: url('img/air/airMain3.jpg');
	background-size : cover;
	background-position:center;
	width:100%;
	min-height: 50%;
}
</style>
<script type="text/javascript" src="js/airJs/airResult.js"></script>
<script type="text/javascript" src="js/airJs/airSearchKeyword.js"></script>
<script>
var start=''; //일정 출발일, 도착일
var end='';
var today='';

var adults=1; //인원 어른, 아이
var kids=0;

var solution=40; //조회수 기본값 세팅

var maxStop=1; //직항, 경유
var tripWay='round';

var ori='';
var des='';

function getToday(){
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth()+1;
	if(month<10){
		month='0'+month;
	}
	var date = now.getDate();
	var nextDate = date+1;
	if(date<10){
		date ='0'+date;
	}
	if(nextDate<10){
		nextDate = '0'+nextDate;
	}
	today = year+'-'+month+'-'+date;
	start=today;
	end = year+'-'+month+'-'+nextDate;
}


window.onload = function(){
	getToday();
	var type='${airDto.air_tripType}';
	if(type==''){//처음
		document.airSearch.air_startDate.value = start;
		document.airSearch.air_endDate.value = end;
	}else{//airResult.jsp를 위한
		dataSetting();
		getAirResult();
		document.getElementById('airLoad').style='';
		var btn = document.getElementById('showRe');
		btn.style.display='';
		var sh = document.getElementById('searchBar');
		sh.style.display='none';
	}	
}
function dataSetting(){//controller 다녀온 이후에도 값 유지를 위해
	ori = '${airDto.air_origin}';
	des ='${airDto.air_destination}';
	start = '${airDto.air_startDate}';
	end = '${airDto.air_endDate}';
	kids = parseInt('${airDto.air_kid}');
	adults = parseInt('${airDto.air_adult}');
	tripWay='${airDto.air_tripType}';
	solution =parseInt('${airDto.air_solution}');
	maxStop =parseInt('${airDto.air_stopNum}');
	
	document.airSearch.air_origin.value =ori;
	document.airSearch.air_destination.value = des;
	document.airSearch.air_startDate.value = start;
	document.airSearch.air_endDate.value = end;
	document.airSearch.air_kid.value = kids;
	document.airSearch.air_adult.value = adults;
	if(maxStop==0){
		document.airSearch.direct.checked= true;
	}
	var ch = document.airSearch.air_tripType;
	for(var i=0;i<ch.length;i++){
		if(tripWay==ch[i].value){
			ch[i].checked=true;
		}
	}
} 
function showDetail(){ //검색 후 화면 접힘	
/* 	var btn = document.getElementById('showRe');
	btn.style.display=''; */
	
	var sh = document.getElementById('searchBar');
	sh.style.display=(sh.style.display=='none')?'':'none';
}
function getAirResult(){ //검색결과 가지러가기
	if(tripWay=='round'){
		getResultRound(ori, des, start,end, maxStop, adults, kids, solution, early, late, skytype);
	}else{
		getResultOneway(ori, des, start, maxStop, adults, kids, solution, early, late, skytype);
	}	
}
/****************KEY WORDS RESULTS***************************************************************************/
function getSearch3Code(cityCode){
	var iataCode1 = cityCode.split('(')[1];
	var iataCode = iataCode1.split(')')[0];
	if(document.getElementById('suggestResult1').style.display==''){
		document.airSearch.air_origin.value = iataCode;
		loopSendKeyword=false;
		document.getElementById('suggestResult1').style.display='none';
	}else if(document.getElementById('suggestResult2').style.display==''){
		document.airSearch.air_destination.value = iataCode;
		loopSendKeyword=false;
		document.getElementById('suggestResult2').style.display='none';
	}
	
}
/******************************************************************************************/


function changePlace(){//This function is for being able to exchange ori to des or des to ori.
	ori = document.airSearch.air_origin.value;
	des = document.airSearch.air_destination.value;
	
	var temp='';
	temp = ori;
	ori= des;
	des = temp;
	
	document.airSearch.air_origin.value = ori;
	document.airSearch.air_destination.value = des;
}

function getChangeVal(){//not to need button whenever changing number of adults and kids count
	adults = document.airSearch.air_adult.value;
	kids = document.airSearch.air_kid.value;
	
	start = document.airSearch.air_startDate.value;
	end = document.airSearch.air_endDate.value;
}

function roundTrip(){
	tripWay = document.airSearch.air_tripType.value;
	if(tripWay=='round'){ //round Trip
		document.airSearch.air_endDate.readOnly =false;
	}else{//oneway Trip
		document.airSearch.air_endDate.readOnly =true;
		end='';
		document.airSearch.air_endDate.value = end;
	}
}

function getValues(){
	ori = document.airSearch.air_origin.value;
	des =document.airSearch.air_destination.value;
	
	var dir = document.airSearch.direct.checked;
	
	if(dir == true){//Non - STOP
		maxStop=0;
	}
	document.airSearch.air_stopNum.value = maxStop;
	document.airSearch.air_solution.value=solution;
}

function researchHead(){
	start = document.all.startDate.value;
	end = document.all.endDate.value;
	
	showResult();
}

function showResult(){
	
	getValues();
	
	if(ori=='' || des==''){
		window.alert('출발지 및 도착지를 확인해주세요');
		return;
	}
	
	if(start == ''){
		window.alert('출발일을 선택해주세요');
		return;
	}
	
	if(start<today){
		window.alert('출발일을 다시 확인해주세요');
		return;
	}
	
	if(tripWay=='round'){ //roundTrip
		if(start>end){//when date is wrong
			window.alert('출발일을 다시 확인해주세요');
			return;
		}
	}	
	goController();
 }

function goController(){
	document.airSearch.method='POST';
	document.airSearch.action='airSearch.pd';
	document.airSearch.submit();
}
</script>
</head>
<body>
<div class="page-container wrapper">
<div class="content-main">
 	<!-- SERCH_AREA -->
 	<div id="airBG" class=" col-sm-12 col-xs-12 col-md-12">						
		<div class="col-md-offset-3 col-sm-offset-2 col-xs-offset-1 col-md-6 col-sm-3 col-xs-4" id="airBox">
			<div  class="form-inline">
			<a href="javascript:showDetail()"  style="display: none; color: black;" id="showRe">
				<table style="background-color: rgba(55, 70, 110, 0.66);color:white; margin-bottom: 0.5px; border-width: 0;" class="table table-borderless">
					<thead>
					<tr>	
						<td><label>${airDto.air_origin }</label>&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp; <label>${airDto.air_destination }</label></td>
						<td class="pull-right"><input type="date" name="startDate" value="${airDto.air_startDate }" onchange="researchHead()" class="form-control">
							<c:set var="end" value="${airDto.air_endDate }" />  
							<c:if test="${!empty end}">
								<label for="end"></label>
								<input type="date" id="end" value="${end }" name="endDate" onchange="researchHead()" class="form-control">
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right;">${airDto.air_adult } 성인 &nbsp;
							<c:if test="${airDto.air_kid >0 }">
							${airDto.air_kid } 유/소아 
							</c:if>
							| 일반석
						</td>
					</tr>
					</thead>
				</table><!-- Search Result HeadLine INFO -->
			</a>		
			</div>
			<!-- Search Table Input Origin, Destination, Date, and People-->
			<form name="airSearch" class="form-inline">
			<div id="searchBar">
				<table summary="항공권 조회" id="findAirFormTable" style="background-color: rgba(255, 255, 255, 0.36);" class="table">
					<tr>
						<td colspan="6">
							<input type="radio" name="air_tripType" value="round" checked="checked" onclick="roundTrip()">왕복
							<input type="radio" name="air_tripType" value="oneway" onclick="roundTrip()">편도
						</td>
					</tr>	
					<tr>
						<td colspan="2">
							<label>출발지</label>
						</td>
						<td rowspan="2" colspan="2"><a href="javascript:changePlace()"><img src="/pd/img/air/exchange.png" height="40" width="25" style="vertical-align: middle;"></a></td>
						<td colspan="2">
							<label>도착지</label>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" name="air_origin" id="keyword" class="form-control" placeholder="국가, 도시 또는 공항" onkeydown="startSuggest('key1')" ><!-- onkeydown="startSuggest('key1')" -->
							<div id="suggestResult1"></div>
						</td>
						
						<td colspan="2">
							<input type="text" name="air_destination" class="form-control"  placeholder="국가, 도시 또는 공항" onkeydown="startSuggest('key2')">
							<div id="suggestResult2"></div>
						</td>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">가는날</td>
						<td colspan="2">오는 날</td>
						<td>성인</td>
						<td>유아/소아</td>
					</tr>		
					<tr>
						<td colspan="2"><input type="date" class="form-control" name="air_startDate" onchange="getChangeVal()" ></td>
						<td colspan="2"><input type="date" class="form-control" name="air_endDate" onchange="getChangeVal()"></td>
						<td>
							<select name="air_adult" onchange="getChangeVal()" class="form-control">
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							</select>
						</td>
						<td>
							<select name="air_kid" onchange="getChangeVal()" class="form-control">
								<option value="0" selected="selected">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
							</select>
						</td>	
					</tr>
					<tr>
						<td colspan="4">
							<div class="checkbox">
							<label>
								<input type="checkbox" name="direct">
								<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>직항만
							</label>
							</div>
						</td>
						<td align="right" colspan="2"><input type="button" value="항공권검색" onclick="showResult()" class="right-full btn btn-default"></td>
					</tr>
				</table>
				<!-- Hidden ::  Number of transfer Airline & Number of getting Air fare result -->
				<input type="hidden" name="air_stopNum">
				<input type="hidden" name="air_solution">
			</div><!-- SearchBar -->
			</form>
		</div><!-- 화면size조절 -->		
	</div><!-- #map_Area :: BackGround -->
	
	<div class="content-secondary">
		<div >
		<%@ include file="/WEB-INF/views/air/getAirResult.jsp" %>
		</div>
	</div><!-- Result -->
	
</div><!-- CONTENT -->
	<%@ include file="/WEB-INF/views/header.jsp" %>
</div>
</body>
</html>