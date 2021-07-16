<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약Form</title>
<style>
#air{
	margin-top: 150px;
}
#bookMemContactTable{
	width: 100%;
	text-align: left;	
}
#bookMemContactTable th{
	width: 100px;
}

#priceInfoTable td{
	text-align: right;
}

#psgInfoTable{
	width: 680px;
	text-align: left;
}

#vali .has-error .control-label,
#vali .has-error .help-block,
#vali .has-error .form-control-feedback {
    color: #f39c12;
}

#vali .has-success .control-label,
#vali .has-success .help-block,
#vali .has-success .form-control-feedback {
    color: #18bc9c;
}

[data-tooltip-text].msg {
	position: relative;
}

[data-tooltip-text]:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

  margin-bottom: 10px;
	top: 130%;
	left: 0;    
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 300px;
	max-width: 500px;
	word-wrap: break-word;

	z-index: 9999;
}

/**/
.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 40px;
  height: 40px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 30px;
  border:1px solid transparent;
}
</style>

<script>
var pass=false;
var people = parseInt('${aboDto.aBookInfo.air_adult}')+parseInt('${aboDto.aBookInfo.air_kid}');
 window.onload= function(){
	getValues();
}

 /*GET EX BOOK FORM VALUES*/
function getValues(){
	//PASSENGER INFO
	getExSex();
	getExNames();
	getExBirth();
	//MEMBER CONTACT INFO
	getExBookName();
	getExBookBirth();
	getExBookTel();
	getExBookEmail();
	getExBookNation();
}
function getExNames(){
	try{
		for(var i=0;i<people;i++){
			var family = 'family'+i;
			family = document.getElementById(family);
			var fName= 'fName'+i;
			fName = eval(document.getElementById(fName));
			fName.value = family.value;
			
			var given = 'given'+i;
			given = eval(document.getElementById(given));
			var gName = 'gName'+i;
			gName = eval(document.getElementById(gName));
			gName.value = given.value;
		}
	}catch(e){
	}
}
function getExSex(){
	for(var i=0;i<people;i++){
		var sex = 'sex'+i;
		sex = document.getElementById(sex);
		var mSex = 'mSex'+i;
		mSex = document.getElementById(mSex);
		sex.value = mSex.value;
	}
}
function getExBirth(){
	for(var i=0;i<people;i++){
		var bYear = 'bYear'+i;
		bYear = eval(document.getElementById(bYear));
		var bMonth = 'bMonth'+i;
		bMonth = eval(document.getElementById(bMonth));
		var bDate = 'bDate'+i;
		bDate = eval(document.getElementById(bDate));
		
		var mBirth ='mBirth'+i;
		mBirth = eval(document.getElementById(mBirth));
		bYear.value = mBirth.value.substr(0,4);
		var m =  mBirth.value.substr(4,2);
		if(m.substr(0, 1)=='0'){
			m = m.split('0')[1];
		}
		bMonth.value = m;
		var d = mBirth.value.substr(6,2);
		if(d.substr(0, 1)=='0'){
			d = d.split('0')[1];
		}
		bDate.value = d;
	}
}
//////////////////////////////////////////////////////
function getExBookName(){
	var memName = document.getElementById('memName');
	var exName = '${aboDto.aBookInfo.air_mName}';
	var originName ='${mdto.mem_name }';
	memName.value = (exName=='') ? originName : exName;
}
function getExBookBirth(){
	var memBirth = document.getElementById('memBirth');
	var exBirth = '${aboDto.aBookInfo.air_mBirth }';
	var originBirth = '${mdto.mem_birth }';
	memBirth.value = (exBirth=='')? originBirth : exBirth;
}
function getExBookTel(){
	var exTel = '${aboDto.aBookInfo.air_mTel}';
	var memTel = document.getElementById('memTel');
	
	var tel1 = document.airBookForm.tel1;
	var tel2 = document.airBookForm.tel2;
	if(exTel != ''){
		memTel.value =exTel;
		var a = exTel.split('-', 1);
		var b = exTel.split(a+'-');
		tel1.value = a[0];
		tel2.value = b[1];
	}else{
		memTel.value = exTel;
	}
}
function getExBookEmail(){
	var exEmail = '${aboDto.aBookInfo.air_mEmail}';
	if(exEmail!=''){
		var a =exEmail.split('@');
		var email1 = document.airBookForm.email1;
		email1.value = a[0];
		var email2= document.airBookForm.email2;
		email2.value = a[1];
	}
}
function getExBookNation(){
	var exNation ='${aboDto.aBookInfo.air_mNation}';
	if(exNation!=''){
		var memNation = document.airBookForm.memNation;
		memNation.value = exNation;
	}
}
//////////////////////////////////////////////////////
/* Valid Check :: BookMember Info */
function telChk(){
	pass = false;
	var pattern = /^([0-9]{2,3})-[0-9]{3,4}-[0-9]{4}$/;

	var tel1 = document.airBookForm.tel1.value;
	var tel2 = document.airBookForm.tel2.value;
	var tool = document.getElementById('tel');
	if(tel1 ==''){
		tool.innerHTML = '<span data-tooltip-text="국가 선택해주세요" class="msg"></span>';
		pass = false;
		return;
	}else if(tel2==''){
		tool.innerHTML = '<span data-tooltip-text="전화번호를 입력해주세요" class="msg"></span>';
		pass = false;
		return;
	}else{
		if(pattern.test(tel2)==false){
			str='<span data-tooltip-text="xxx-xxxx-xxxx형식으로 입력해주세요" class="msg"></span>';
			tool.innerHTML = str;
			pass = false;
			return;
		}else{
			tool.innerHTML ='';
			var tel3 = document.getElementById('memTel');
			tel3.value = tel1+'-'+tel2;
			pass = true;
		}
	}
}

function mailWrite(){
	var email3 = document.airBookForm.email3;
	var email2 =document.airBookForm.email2;
	if(email3.value=='etc'){
		email2.value='';
		email2.readOnly = false;
	}else{
		email2.readOnly = true;	
		email2.value = email3.value;
	}
	emailChk();
}
function emailChk(){
	pass = false;
	var email1 =document.airBookForm.email1.value;
	var email2 =document.airBookForm.email2.value;
	var email = document.getElementById('memEmail');
	
	email.value =email1+'@'+email2;
	
	var pattern = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	var div = document.getElementById('emailVal');
	if(pattern.test(email.value)==false){
		str='<span data-tooltip-text="이메일 planer@dang.com형식인지 확인해주세요" class="msg"></span>';
		div.innerHTML =str;
		pass = false;
		return;
	}else{
		div.innerHTML ='';
		pass = true;
	}
}
function nationChk(){
	pass = false;
	var nation = document.getElementById('memNation');
	var nationVal = document.getElementById('nationVal');
	if(nation.value==''){
		nationVal.innerHTML ='<span data-tooltip-text="국적을 선택해주세요" class="msg"></span>';
		pass = false;
		return;
	}else{
		nationVal.innerHTML ='';
		pass= true;
	}
}

/* Valid Check :: PASSENGER  */
var fName;
var gName;
var full;
var birth;
function sexChk(i){
	pass = false;
	var sex = 'sex'+i;
	sex = eval(document.getElementById(sex));
	var psgSex = sex.value;
	var mSex = 'mSex'+i;
	mSex = eval(document.getElementById(mSex));
	var sexVal = 'sexVal'+i;
	sexVal = eval(document.getElementById(sexVal));

	if(psgSex==''){
		mSex.value='';
		sexVal.innerHTML ='성별을 선택해주세요';
		pass = false;
		return;
	}else{
		sexVal.innerHTML='';
		mSex.value = psgSex;
		pass = true;
	}
}
function upperFname(i){
	pass = false;
	fName = 'fName'+i;
	fName = eval(document.getElementById(fName));
	var a = fName.value;
	var pattern1 =  /^[a-zA-Z\s]+$/;  //영어 & 띄어쓰기만 가능
	var fNameChk = 'fNameChk'+i;
	fNameChk = eval(document.getElementById(fNameChk));
	if(pattern1.test(a)==false){
		fNameChk.innerHTML ='영문만 입력가능합니다';
		pass = false;
		return;
	}else{
		fNameChk.innerHTML ='';
		fName.value = a.toUpperCase();
		pass = true;
	 	getName(i);
	}
}
function upperGname(i){
	pass = false;
	gName = 'gName'+i;
	gName = eval(document.getElementById(gName));
	var a = gName.value;
	var pattern1 =  /^[a-zA-Z\s]+$/;
	var gNameChk = 'gNameChk'+i;
	gNameChk = eval(document.getElementById(gNameChk));
	if(pattern1.test(a)==false){
		gNameChk.innerHTML ='영문만 입력가능합니다';
		pass=false;
		return;
	}else{
		gNameChk.innerHTML ='';
		gName.value = a.toUpperCase();
	 	getName(i);
	}
}
function getName(i){
	try{
		var a = fName.value;
		var b = gName.value;
		
		var name = b+' '+a;
		
		full = 'mName'+i;
		full = eval(document.getElementById(full));
		full.value=name;
		pass= true;
	}catch(e){
		pass= false;
	}
}
function nameChk(i){
	full = 'mName'+i;
	full = eval(document.getElementById(full));
	if(full.value==''){
		window.alert('탑승자의 이름을 입력해주세요!');
		pass =false;
		return;
	}
		upperFname(i);
		upperGname(i);
}

function birthchk(i){
	pass= false;
	birth = 'mBirth'+i;
	birth = eval(document.getElementById(birth));
	var birthNoti = 'birthNoti'+i;
	birthNoti = eval(document.getElementById(birthNoti));
	
	var year = 'bYear'+i;
	var month = 'bMonth'+i;
	var date = 'bDate'+i;
	
	year= eval(document.getElementById(year));
	var y = year.value;
	if(y==''){
		birth.value='';
		birthNoti.innerHTML ='&nbsp;&nbsp;생년월일을 선택해주세요';
		pass=false;
		return;
	}else{
		month= eval(document.getElementById(month));
		var m = month.value;
		var a=parseInt(m);
		if(a<10){
			m ='0'+a;
		}
		if(m==''){
			birthNoti.innerHTML ='&nbsp;&nbsp;생년월일을 선택해주세요';
			birth.value='';
			pass=false;
			return;
		}else{
			date= eval(document.getElementById(date));
			var d = date.value;
			var b= parseInt(d);
			if(b<10){
				d='0'+b;
			}
			if(d==''){
				birthNoti.innerHTML ='&nbsp;&nbsp;생년월일을 선택해주세요';
				birth.value='';
				pass=false;
				return;
			}else{
				birthNoti.innerHTML='';
				birth.value = y+m+d;
				pass = true;
			}
		}
	}
}
function passNumChk(i){
	pass= false;
	var psgNum = 'psgNum'+i;
	psgNum = eval(document.getElementById(psgNum));
	var passNumNoti = 'passNumNoti'+i;
	passNumNoti = eval(document.getElementById(passNumNoti));
	if(psgNum.value==''){
		pass = false;
		passNumNoti.innerHTML = '여권번호를 입력해주세요';
		return;
	}else{
		passNumNoti.innerHTML='';
		pass = true;
	}
}

/* 버튼 유효성 검사  */
function checkPsgInfo(){
	//MEMBER CONTACT INFO VALID CHECK
	telChk();
	if(pass ==false) return;
	emailChk();
	if(pass == false) return;
	nationChk();
	if(pass == false) return;
	//PASSENGERS INFO VALID CHECK
	for(var i=0;i<people;i++){
		sexChk(i);
		if(pass==false) return;
		nameChk(i);
		if(pass==false) return;
		birthchk(i);
		if(pass==false) return;
		passNumChk(i);
		if(pass == false) return;
	}
	if(pass= true){
		document.airBookForm.action = 'airBookChk.pd';
		document.airBookForm.method='post';
		document.airBookForm.submit();
	}
}


/*FUNCTION :: Show & Hide*/
function showHideGo(){
	var go = document.getElementById('goInfo');
	go.style.display = (go.style.display=='') ? 'none' : '';
}
function showHideBack(){
	var back = document.getElementById('backInfo');
	back.style.display = (back.style.display=='')? 'none' : '';
}

/*뒤로 돌아간다.*/
function backAirSearch(){
	document.airBookForm.action ='airSearch.pd';
	document.airBookForm.method ='post';
	document.airBookForm.submit();
}
</script>
</head>
<body>
<!-- Main Body Air Iteraty Infromation & Try to get Passanger Info -->
<form name="airBookForm" action="airBookChk.pd" method="post">
<div class="page-container wrapper" id="air">
	<div class="content-main">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
		<div class="stepwizard">
			<div class="stepwizard-row">
				<div class="stepwizard-step">
					<button onclick="return false" class="btn-primary btn-circle" style="background-color: #3cb5f9;border-color: #ffffff;" disabled="disabled">1</button>
				    <p>Book Form</p>
				</div>
				<div class="stepwizard-step">
					<button type="button" class="btn-default btn-circle" disabled="disabled">2</button>
					<p>Book Check</p>
				</div>
				<div class="stepwizard-step">
				   <button type="button" class="btn-default btn-circle" disabled="disabled">3</button>
				   <p>Book Confirm</p>
				 </div> 
			</div>
		</div>
		</div><!-- .comSM10 -->
		<div class="col-sm-1"></div>
	</div>
	<br>
	<div class="content-secondary">
		<div class="col-sm-1 col-lg-1" style="margin-left: 20px;"></div>
		<div class="col-sm-9 col-lg-8">
			<h3>항공편 세부 사항</h3>
			<hr>
			<div id="airScheduleInfo">
				<a href="javascript:showHideGo()">
				<div id="goInfoTitle">
				<c:forTokens items="${aboDto.aGoInfo.air_goStartDate }" delims="T" var="go" varStatus="i">
				<c:if test="${i.index==0 }">
					출발&nbsp;<label>${go }</label>&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:if test="${i.index==1 }">
					<label>[${go }]</label>&nbsp;&nbsp;&nbsp;
				</c:if>
				</c:forTokens>
				<label>${aboDto.aGoInfo.air_goOrigin }</label><img src="">
				|&nbsp;&nbsp;&nbsp;
				<c:set var="goStop" value="${aboDto.aGoInfo.air_goStopNum }"/>
				<c:if test="${goStop==0 }">
					직항
				</c:if>
				<c:if test="${goStop>0 }">
					${goStop }회 경유
				</c:if>
				&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<label>${aboDto.aGoInfo.air_goDestination }</label>&nbsp;&nbsp;&nbsp;
				도착 
				<c:forTokens items="${aboDto.aGoInfo.air_goEndDate }" delims="T" var="goEnd" varStatus="i">
				<c:if test="${i.index==0 }">
					<label>${goEnd }</label>&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:if test="${i.index>0 }">
					<label>[${goEnd }]</label>
				</c:if>
				</c:forTokens>
					
				<!-- AirGo CommonInfo -->
				<input type="hidden" name="aGoInfo.air_goStartDate" value="${aboDto.aGoInfo.air_goStartDate }">
				<input type="hidden" name="aGoInfo.air_goEndDate" value="${aboDto.aGoInfo.air_goEndDate }">
				<input type="hidden" name="aGoInfo.air_goOrigin" value="${aboDto.aGoInfo.air_goOrigin}">
				<input type="hidden" name="aGoInfo.air_goDestination" value="${aboDto.aGoInfo.air_goDestination }">
				<input type="hidden" name="aGoInfo.air_goStopNum" value="${goStop }">
				<input type="hidden" name="aGoInfo.air_goSeatType" value="${aboDto.aGoInfo.air_goSeatType }">
				<input type="hidden" name="aGoInfo.air_goTotalDuration" value="${aboDto.aGoInfo.air_goTotalDuration }">
				</div><!-- goInfoTitle -->
				</a>
					
				<hr>
					
				<div id="goInfo" style="display: none">
				<c:forEach items="${aboDto.aGoDetail }" var="aGo" varStatus="in">
				<c:set var="g" value="${in.index }"/>
				<table>
					<tr>
						<td><label>${aGo.air_origin }</label></td>
						<td rowspan="2"><img src=""></td>
						<td><label>${aGo.air_destination }</label> </td>
						<td rowspan="2">
							<c:set var="goDur" value="${aGo.air_duration }"/>
							<f:parseNumber integerOnly="true" var="h" value="${goDur/60 }" />
							<c:if test="${h>0 }">
								${h }시간
							</c:if>
							<c:set var="m" value="${goDur mod 60 }"/>
							<c:if test="${m>0 }">
								${m }분
							</c:if>
						</td>
					</tr>				
					<tr>
						<td>
							<c:forTokens var="aGoStart" items="${aGo.air_startDate }" delims="T" varStatus="i">
							<c:set var="i" value="${i.index }"/>
							<c:if test="${i==0 }">
								<label>${aGoStart}</label><br>
							</c:if>
							<c:if test="${i==1 }">
								<label>${aGoStart}</label>
							</c:if>
							</c:forTokens>
							</td>
							<td>
							<c:forTokens var="aEndStart" items="${aGo.air_endDate }" delims="T" varStatus="i"><c:set var="i" value="${i.index }"/>
							<c:if test="${i==0 }">
								<label>${aEndStart}</label><br>
							</c:if>
							<c:if test="${i==1 }">
								<label>${aEndStart}</label>
							</c:if>
							</c:forTokens>
						</td>
					</tr>	
					<tr>
						<td colspan="4">항공편  ${aGo.air_airline }&nbsp;${aGo.air_airNum }&nbsp;&nbsp;&nbsp;
									|&nbsp;&nbsp;&nbsp;${aGo.air_aircraft }&nbsp;&nbsp;&nbsp;
									|&nbsp;&nbsp;&nbsp;${aboDto.aGoInfo.air_goSeatType }
						</td>
					</tr>
					<tr>
					<td colspan="4">
						<!-- AirGO Detail -->
						<input type="hidden" name="aGoDetail[${g }].air_origin" value="${aGo.air_origin }">
						<input type="hidden" name="aGoDetail[${g }].air_destination" value="${aGo.air_destination }">
						<input type="hidden" name="aGoDetail[${g }].air_startDate" value="${aGo.air_startDate }">
						<input type="hidden" name="aGoDetail[${g }].air_endDate" value="${aGo.air_endDate }">
						<input type="hidden" name="aGoDetail[${g }].air_airline"  value="${aGo.air_airline }">
						<input type="hidden" name="aGoDetail[${g }].air_airNum"  value="${aGo.air_airNum }">
						<input type="hidden" name="aGoDetail[${g }].air_airName"  value="${aGo.air_airName }">
						<input type="hidden" name="aGoDetail[${g }].air_aircraft" value="${aGo.air_aircraft }">
						<input type="hidden" name="aGoDetail[${g }].air_bookGrade" value="${aGo.air_bookGrade }">
						<input type="hidden" name="aGoDetail[${g }].air_mileage" value="${aGo.air_mileage }">
						<input type="hidden" name="aGoDetail[${g }].air_duration" value="${aGo.air_duration }">
						<input type="hidden" name="aGoDetail[${g }].air_stopDuration" value="${aGo.air_stopDuration}">						
					</td>
				</tr>
				</table>
				<hr>
				<c:if test="${aGo.air_stopDuration != 0}">
				경유 대기 시간
				<c:set var="goStop" value="${aGo.air_stopDuration }"/>
				<f:parseNumber integerOnly="true" var="h" value="${goStop/60 }" />
				<c:if test="${h>0 }">
					${h }시간
				</c:if>
				<c:set var="m" value="${goStop mod 60 }"/>
				<c:if test="${m>0 }">
					${m }분
				</c:if>
				<hr>
				</c:if>
				</c:forEach>
					
				[총 비행시간&nbsp;&nbsp;
				<c:set var="totDur" value="${aboDto.aGoInfo.air_goTotalDuration }"/>
				<f:parseNumber var="h" integerOnly="true" value="${(totDur/60)}" />
				<c:if test="${h>0 }">
					${h }시간
				</c:if>
				<c:set var="m" value="${totDur mod 60 }"/>
				<c:if test="${m>0 }">
					${m }분
				</c:if>]
				</div><!--goInfo -->	
				<hr>		
				<!-- ********************************BAKC INFO****************************************************** -->
				<c:if test="${aboDto.aBookInfo.air_tripType eq 'round' }">
				<a href="javascript:showHideBack()">
				<div id="backInfoTitle">
					<c:forTokens items="${aboDto.aBackInfo.air_backStartDate }" delims="T" var="back" varStatus="i">
					<c:if test="${i.index==0 }">
						출발&nbsp;<label>${back }</label>&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${i.index==1 }">
						<label>[${back }]</label>&nbsp;&nbsp;&nbsp;
					</c:if>
					</c:forTokens>
					<label>${aboDto.aBackInfo.air_backOrigin }</label><img src="">
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<c:set var="backStop" value="${aboDto.aBackInfo.air_backStopNum }"/>
					<c:if test="${backStop==0 }">
						직항
					</c:if>
					<c:if test="${backStop>0 }">
						${backStop }회 경유
					</c:if>
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<label>${aboDto.aBackInfo.air_backDestination }</label>&nbsp;&nbsp;&nbsp;
					도착 
					<c:forTokens items="${aboDto.aBackInfo.air_backEndDate }" delims="T" var="backEnd" varStatus="i">
					<c:if test="${i.index==0 }">
						<label>${backEnd }</label>&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${i.index>0 }">
						<label>[${backEnd }]</label>
					</c:if>
					</c:forTokens>
					<!-- AirBACK CommonInfo -->
					<input type="hidden" name="aBackInfo.air_backStartDate" value="${aboDto.aBackInfo.air_backStartDate }">
					<input type="hidden" name="aBackInfo.air_backEndDate" value="${aboDto.aBackInfo.air_backEndDate }">
					<input type="hidden" name="aBackInfo.air_backOrigin" value="${aboDto.aBackInfo.air_backOrigin}">
					<input type="hidden" name="aBackInfo.air_backDestination" value="${aboDto.aBackInfo.air_backDestination }">
					<input type="hidden" name="aBackInfo.air_backStopNum" value="${backStop }">
					<input type="hidden" name="aBackInfo.air_backSeatType" value="${aboDto.aBackInfo.air_backSeatType }">
					<input type="hidden" name="aBackInfo.air_backTotalDuration" value="${aboDto.aBackInfo.air_backTotalDuration }">
					</div>
					</a>
					
					<hr>
					
					<div id="backInfo" style="display: none">
					<c:forEach items="${aboDto.aBackDetail }" var="aBack" varStatus="in">
					<c:set var="b" value="${in.index }"/>
					<table>
						<tr>
							<td><label>${aBack.air_origin }</label></td>
							<td rowspan="2">
								<img src="">
							</td>
							<td><label>${aBack.air_destination }</label> </td>
							<td rowspan="2">
									<c:set var="backDur" value="${aBack.air_duration }"/>
									<f:parseNumber integerOnly="true" var="h" value="${backDur/60 }" />
									<c:if test="${h>0 }">
										${h }시간
									</c:if>
									<c:set var="m" value="${backDur mod 60 }"/>
									<c:if test="${m>0 }">
										${m }분
									</c:if>
							</td>
						</tr>					
						<tr>
							<td>
							<c:forTokens var="aBackStart" items="${aBack.air_startDate }" delims="T" varStatus="i">
							<c:set var="i" value="${i.index }"/>
							<c:if test="${i==0 }">
								<label>${aBackStart}</label><br>
							</c:if>
							<c:if test="${i==1 }">
								<label>${aBackStart}</label>
							</c:if>
							</c:forTokens>
							</td>
							<td>
							<c:forTokens var="aBackEnd" items="${aBack.air_endDate }" delims="T" varStatus="i"><c:set var="i" value="${i.index }"/>
							<c:if test="${i==0 }">
								<label>${aBackEnd}</label><br>
							</c:if>
							<c:if test="${i==1 }">
								<label>${aBackEnd}</label>
							</c:if>
							</c:forTokens>
							</td>
						</tr>					
						<tr>
							<td colspan="4">항공편  ${aBack.air_airline }&nbsp;${aBack.air_airNum }&nbsp;&nbsp;&nbsp;
											|&nbsp;&nbsp;&nbsp;${aBack.air_aircraft }&nbsp;&nbsp;&nbsp;
											|&nbsp;&nbsp;&nbsp;${aboDto.aBackInfo.air_backSeatType }
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<!-- AirBACK Detail -->
								<input type="hidden" name="aBackDetail[${b }].air_origin" value="${aBack.air_origin }">
								<input type="hidden" name="aBackDetail[${b }].air_destination" value="${aBack.air_destination }">
								<input type="hidden" name="aBackDetail[${b }].air_startDate" value="${aBack.air_startDate }">
								<input type="hidden" name="aBackDetail[${b }].air_endDate" value="${aBack.air_endDate }">
								<input type="hidden" name="aBackDetail[${b }].air_airline"  value="${aBack.air_airline }">
								<input type="hidden" name="aBackDetail[${b }].air_airNum"  value="${aBack.air_airNum }">
								<input type="hidden" name="aBackDetail[${b }].air_airName"  value="${aBack.air_airName }">
								<input type="hidden" name="aBackDetail[${b }].air_bookGrade" value="${aBack.air_bookGrade }">
								<input type="hidden" name="aBackDetail[${b }].air_mileage" value="${aBack.air_mileage }">
								<input type="hidden" name="aBackDetail[${b }].air_aircraft" value="${aBack.air_aircraft }">
								<input type="hidden" name="aBackDetail[${b }].air_duration" value="${aBack.air_duration }">
								<input type="hidden" name="aBackDetail[${b }].air_stopDuration" value="${aBack.air_stopDuration}">
								
							</td>
						</tr>
					</table>
					<hr>
					<c:if test="${aBack.air_stopDuration != 0}">
					경유 대기 시간
					<c:set var="backStop" value="${aBack.air_stopDuration }"/>
					<f:parseNumber integerOnly="true" var="h" value="${backStop/60 }" />
					<c:if test="${h>0 }">
						${h }시간
					</c:if>
					<c:set var="m" value="${backStop mod 60 }"/>
					<c:if test="${m>0 }">
						${m }분
					</c:if>
					<hr>
					</c:if>
					</c:forEach>
					
					[총 비행시간&nbsp;&nbsp;
					<c:set var="totDur" value="${aboDto.aBackInfo.air_backTotalDuration }"/>
					<f:parseNumber var="h" integerOnly="true" value="${(totDur/60)}"/>
					<c:if test="${h>0 }">
						${h }시간
					</c:if>
					<c:set var="m" value="${totDur mod 60 }"/>
					<c:if test="${m>0 }">
						${m }분
					</c:if>]
				</div><!--backInfo -->	
				</c:if>
			</div><!-- ariSchedule -->			
			
			<br><br>
			
			<!-- AirBookInfo의 예약자 정보 :: 공통정보 -->
			<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
			<input type="hidden" name="aBookInfo.mem_id" value="${mdto.mem_id }" >
			<input type="hidden" name="aBookInfo.air_mTel" id="memTel">
			<input type="hidden" name="aBookInfo.air_mEmail" id="memEmail">
			
			<h3>예약자 정보</h3>
			<div id="bookMemberInfo" class="form-inline">
				<table id="bookMemContactTable" class="table">
					<tr>
						<th>예약자명</th><td colspan="2"><input type="text" class="form-control" name="aBookInfo.air_mName"  id="memName"></td>
						<th>생년월일</th><td><input type="text" class="form-control" name="aBookInfo.air_mBirth" id="memBirth" placeholder="생년월일 6자리"></td>
						<th>국적</th><td>
										<select class="form-control" name="aBookInfo.air_mNation" id="memNation" style="width: 100px" onchange="nationChk()">
											<option value="" selected="selected">국적선택</option>
													<option value="KR">한국</option>
													<option value="AL">알바니아</option>
													<option value="AM">아르메니아</option>
													<option value="AR">아르헨티나</option>
													<option value="AT">오스트리아</option>
													<option value="AU">호주</option>
													<option value="BE">벨기에</option>
													<option value="BG">불가리아</option>
													<option value="BH">바레인</option>
													<option value="BR">브라질 </option>
													<option value="BY">벨라루스</option>
													<option value="CA">캐나다</option>
													<option value="CH">스위스</option>
													<option value="CN">중국</option>
													<option value="CY">사이프러스</option>
													<option value="CZ">체코 공화국 </option>
													<option value="DE">독일</option>
													<option value="DK">덴마크</option>
													<option value="EE">에스토니아</option>
													<option value="EG">이집트</option>
													<option value="ES">스페인</option>
													<option value="FI">핀란드</option>
													<option value="FR">프랑스</option>
													<option value="GB">영국</option>
													<option value="GR">그리스</option>
													<option value="HK">홍콩</option>
													<option value="HR">크로아티아</option>
													<option value="+36">헝가리</option>
													<option value="ID">인도네시아</option>
													<option value="IE">아일랜드</option>
													<option value="IL">이스라엘 </option>
													<option value="IN">인도</option>
													<option value="IS">아이슬랜드</option>
													<option value="IT">이탈리아</option>
													<option value="JO">요르단</option>
													<option value="JP">일본</option>
													<option value="KW">쿠웨이트</option>
													<option value="KZ">카자흐스탄</option>
													<option value="LT">리투아니아</option>
													<option value="LU">룩셈부르크</option>
													<option value="LV">라트비아</option>
													<option value="MT">Malta</option>
													<option value="MY">말레이시아</option>
													<option value="NL">네덜라든</option>
													<option value="NO">노르웨이</option>
													<option value="NZ">뉴질랜드</option>
													<option value="OM">오만</option>
													<option value="PH">필리핀</option>
													<option value="PL">폴란드</option>
													<option value="PT">포르투갈</option>
													<option value="QA">콰타르</option>
													<option value="RO">로마니아</option>
													<option value="RS">세르비아</option>
													<option value="RU">러시아</option>
													<option value="SA">사우디아라비아</option>
													<option value="SE">스웨덴</option>
													<option value="SG">싱가폴</option>
													<option value="SI">슬로비아</option>
													<option value="SK">슬로바키아</option>
													<option value="TH">태국</option>
													<option value="TR">터키</option>
													<option value="TW">타이완</option>
													<option value="UA">우크라이나</option>
													<option value="US">미국</option>
													<option value="ZA">남아공</option>
											</select><span id="nationVal"></span>
										</td>
						</tr>
						<tr>
							<th>연락처</th><td colspan="2"><select class="form-control " name="tel1"  onchange="telChk()" style="width: 80px">
												<option value="" selected="selected">국가선택</option>
												<option value="+82">한국</option>
												<option value="+355">알바니아</option>
												<option value="+374">아르메니아</option>
												<option value="+54">아르헨티나</option>
												<option value="+43">오스트리아</option>
												<option value="+61">호주</option>
												<option value="+32">벨기에</option>
												<option value="+359">불가리아</option>
												<option value="+973">바레인</option>
												<option value="+55">브라질 </option>
												<option value="+375">벨라루스</option>
												<option value="+1">캐나다</option>
												<option value="+41">스위스</option>
												<option value="+86">중국</option>
												<option value="+357">사이프러스</option>
												<option value="+420">체코 공화국 </option>
												<option value="+49">독일</option>
												<option value="+45">덴마크</option>
												<option value="+372">에스토니아</option>
												<option value="+20">이집트</option>
												<option value="+34">스페인</option>
												<option value="+358">핀란드</option>
												<option value="+33">프랑스</option>
												<option value="+44">영국</option>
												<option value="+30">그리스</option>
												<option value="+852">홍콩</option>
												<option value="+385">크로아티아</option>
												<option value="+36">헝가리</option>
												<option value="+62">인도네시아</option>
												<option value="+353">아일랜드</option>
												<option value="+972">이스라엘 </option>
												<option value="+91">인도</option>
												<option value="+354">아이슬랜드</option>
												<option value="+39">이탈리아</option>
												<option value="+962">요르단</option>
												<option value="+81">일본</option>
												<option value="+965">쿠웨이트</option>
												<option value="+7">카자흐스탄</option>
												<option value="+370">리투아니아</option>
												<option value="+352">룩셈부르크</option>
												<option value="+371">라트비아</option>
												<option value="MT">Malta</option>
												<option value="+60">말레이시아</option>
												<option value="+31">네덜라든</option>
												<option value="+47">노르웨이</option>
												<option value="+64">뉴질랜드</option>
												<option value="+968">오만</option>
												<option value="+63">필리핀</option>
												<option value="+48">폴란드</option>
												<option value="+351">포르투갈</option>
												<option value="QA">콰타르</option>
												<option value="RO">로마니아</option>
												<option value="+381">세르비아</option>
												<option value="+7">Russian</option>
												<option value="+966">사우디아라비아</option>
												<option value="+46">스웨덴</option>
												<option value="+65">싱가폴</option>
												<option value="+386">슬로베니아</option>
												<option value="+421">슬로바키아</option>
												<option value="+66">태국</option>
												<option value="+90">터키</option>
												<option value="+886">타이완</option>
												<option value="+380">우크라이나</option>
												<option value="+1">미국</option>
												<option value="+27">남아프리카 공화국</option>
											</select>-<input type="text" class="form-control" name="tel2" placeholder="xxx-xxx-xxxx" size="15" onkeyup="telChk()"><span id="tel"></span>
											<span id="telVal"></span>
										</td>
							
						<th>이메일</th><td colspan="3"><input type="text" class="form-control" name="email1" size="12" onkeyup="emailChk()">@
								<input type="text" name="email2"  class="form-control" readonly="readonly" size="10" onchange="emailChk()">
								<select class="form-control" name="email3" onchange="mailWrite()">
									<option value="" selected="selected">메일선택</option>
									<option value="gmail.com" >gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="etc">직접입력</option>
								</select><span id="emailVal"></span>
							</td>
						</tr>
					</table>
				</div><!-- bookMemberInfo -->
				
				<br><br>
				<h3>탑승객 정보</h3>
				<hr>
				<div id="passengerInfo" class="form-inline">
				<c:set var="adultCnt" value="${aboDto.aBookInfo.air_adult }" />
				<c:set var="kidCnt" value="${aboDto.aBookInfo.air_kid }" />
				<c:forEach var="psg" begin="0" end="${adultCnt+kidCnt-1 }">
				<h4>승객${psg+1 }</h4>
				<hr>
				<table>
					<tr>
						<th>성별</th>
						<td>
							<select class="form-control" name="psgSex${psg }" id="sex${psg }" onchange="sexChk(${psg })" >
							<option value="" selected="selected">남성혹은 여성 선택</option>
							<option value="M">남성</option>
							<option value="F">여성</option>
							</select>
						</td>
						<td><label id="sexVal${psg }"></label></td>
					</tr>
					<tr>
						<th>성</th>
						<td><input type="text" class="form-control" id="fName${psg }" required="required" placeholder="영문 성" onkeyup="upperFname(${psg})"></td>
						<td><label id="fNameChk${psg }"></label></td>
						</tr>		
						<tr>
						<th>이름</th>
						<td><input type="text" class="form-control" id="gName${psg }" required="required" placeholder="영문 이름" onkeyup="upperGname(${psg})"></td>
						<td><label id="gNameChk${psg }"></label></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><select class="form-control" id="bYear${psg }" onchange="birthchk(${psg })">
								<option value="" selected="selected">년도</option>
								<c:forEach var="year" begin="1930" end="2017">
								<option value="${year }">${year }</option>
								</c:forEach>
							</select>년
							<select class="form-control" id="bMonth${psg }" onchange="birthchk(${psg })">
								<option value="" selected="selected">월</option>
								<c:forEach var="month" begin="01" end="12">
								<option value="${month }">${month }</option>
								</c:forEach>
							</select>월
							<select class="form-control" id="bDate${psg }" onchange="birthchk(${psg })">
								<option value="" selected="selected">일</option>
								<c:forEach var="date" begin="01" end="31">
								<option value="${date }">${date }</option>
								</c:forEach>
							</select>일
						</td>
						<td><label id="birthNoti${psg }"></label></td>
					</tr>
					<tr>
						<th>여권번호</th>
						<td><input type="text" class="form-control" name="aPsgInfo[${psg }].air_psgPassportNum" id="psgNum${psg }" placeholder="여권번호 입력해주세요" value="${aboDto.aPsgInfo[psg].air_psgPassportNum }" onkeyup="passNumChk(${psg})"></td>
						<td><label id="passNumNoti${psg }"></label></td>
					</tr>
				</table>
				<br>
				<input type="hidden" name="aPsgInfo[${psg }].air_psgName" id="mName${psg }" value="${aboDto.aPsgInfo[psg].air_psgName }">
				<input type="hidden" name="aPsgInfo[${psg }].air_psgSex" id="mSex${psg }" value="${aboDto.aPsgInfo[psg].air_psgSex  }">
				<input type="hidden" name="aPsgInfo[${psg }].air_psgBirth" id="mBirth${psg }" value="${aboDto.aPsgInfo[psg].air_psgBirth  }">
				<c:forTokens items="${aboDto.aPsgInfo[psg].air_psgName }" delims=" " var="names" varStatus="n">
					<c:if test="${n.index==0 }">
						<input type="hidden" id="given${psg }" value="${names }">
					</c:if>
					<c:if test="${n.index==1 }">
						<input type="hidden" id="family${psg }" value="${names }">
					</c:if>
				</c:forTokens>
				</c:forEach>
				</div><!-- passengerInfo -->
			<hr>
			<input type="button" class="btn btn-default" value="취소" onclick="backAirSearch()">&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-default" value="예약확인" onclick="checkPsgInfo()">
			</div><!-- col-sm-9 -->
		
		
			<!-- Side Menu :: Price Information -->
			<div class="col-sm-2 col-lg-2">
				<div id="priceInfo">
				<%-- <c:set var="abInfo" value="abookDto.airBook"/> --%>
				<h3>가격 세부 내역</h3>
				<hr>
					<table id="priceInfoTable">
						<tr>
							<th>인원</th>
							<td>성인<label>${aboDto.aBookInfo.air_adult }</label>명
							<c:set var="kid" value="${aboDto.aBookInfo.air_kid }"/>
							<c:if test="${kid !=0 }">
								유/소아<label>${kid }</label>명
							</c:if>
							</td>
						</tr>
						<tr>
							<th>운임</th>
							<td><label for="basePrice">${aboDto.aBookInfo.air_basePrice }</label></td>
						</tr>
						<tr>
							<th>세금</th>
							<td><label for="taxPrice">${aboDto.aBookInfo.air_taxPrice }</label></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><label>총액</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>${aboDto.aBookInfo.air_totalPrice }</label></td>
						</tr>
						<tr>
							<td colspan="2" >
							<!-- Air Fare Common Info :: AirBookInfo -->
								<input type="hidden" name="aBookInfo.air_tripType" value="${aboDto.aBookInfo.air_tripType }">
								<input type="hidden" name="aBookInfo.air_adult" value="${aboDto.aBookInfo.air_adult }">
								<input type="hidden" name="aBookInfo.air_kid" value="${kid }">
								<textarea rows="1" cols="5" name="aBookInfo.air_priceInfo" style="display: none">${aboDto.aBookInfo.air_priceInfo }</textarea>
								<input type="hidden" name="aBookInfo.air_totalPrice" value="${aboDto.aBookInfo.air_totalPrice }">
								<input type="hidden" name="aBookInfo.air_basePrice" value="${aboDto.aBookInfo.air_basePrice }">
								<input type="hidden" name="aBookInfo.air_taxPrice" value="${aboDto.aBookInfo.air_taxPrice }">
								<input type="hidden" name="aBookInfo.air_latestTicket" value="${aboDto.aBookInfo.air_latestTicket }">
							</td>
						</tr>
					</table>
				</div><!-- #priceInfo -->
			</div><!-- .colSm2 -->
	</div><!-- .content-secondary -->
	<%@include file="/WEB-INF/views/header.jsp" %>
</div>
</form>
</body>
</html>