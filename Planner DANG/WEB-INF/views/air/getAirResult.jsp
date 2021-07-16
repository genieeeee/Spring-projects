<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
div #gap{
	margin-top: 3%;
}
@-webkit-keyframes backgroundScroll {
from {background-position: 50px 10;}
to {background-position: 800px 0;}
}
 
@keyframes backgroundScroll {
from {background-position: 50px 0;}
to {background-position: 400px 0;}
}
.home-product {
    background:url("img/air/loading/airplane.png");
    float: left;
    width: 100%;
    min-height:15%;
    color:#fff !important;
	-webkit-animation: backgroundScroll 40s linear infinite;
	animation: backgroundScroll 10s linear infinite;
	position: absolute;
	background-repeat-x : inherit;
	margin-top: 2%;
}
.airBg{
	background: url("img/air/loading/airBg.png");
	width: 120%;
	min-height:700px;
	background-repeat: no-repeat;
	background-position-y: -10%;
	background-position-x: 10%;
}
</style>
<script>
var totalDuration;
var duration;
var stopDuration;
var airline;
var airName;
var airNum; 
var airCraft;
var depTime;
var arrTime;
var arr;
var dep;
var seatType;

var price;
var basePrice;
var taxPrice;
var priceInfo;
var mileage;
var latestTicket;
var bookGrade;

var div;
var table;
var commonDiv

var h;
var m;


function showModalResult(s){ //선택한 값 자세히 보기 :: MODAL VIEW
	var slice;
	var leg;
	
	var top;
	var bottom;
	var hr1;
	var hr2;
	
	//생성되어 있는 모든 자식 Node를 삭제 하기 위해 선 처리
	div= document.getElementById('modal-table');
	while ( div.hasChildNodes() ){ 
		div.removeChild( div.firstChild );
	}	
	var cnt;
	commonDiv = document.getElementById('commonInfo');
	commonDiv.innerHTML='';
	/* 공통 정보 :: 가격정보, 인원수, 여행타입  */
	price = airList.trips.tripOption[s].saleTotal; //왕복 및 편도 가격
	priceInfo = airList.trips.tripOption[s].pricing[0].fareCalculation; //산출내역		
	basePrice = airList.trips.tripOption[s].pricing[0].baseFareTotal; //산출운임		
	taxPrice = airList.trips.tripOption[s].pricing[0].saleTaxTotal;		
	latestTicket = airList.trips.tripOption[s].pricing[0].latestTicketingTime;//마지막 결제일

	slice = airList.trips.tripOption[s].slice.length; //왕복 여부에 따른 진행
	for(var i=0; i<slice;i++){
		cnt=0;
		table = 'ta'+i;
		table= eval(document.createElement('table'));
		var tName= 'ta'+i;
		table.setAttribute('id',tName);
		table.style.display='none';
		
		top = 'top'+i;
		top= eval(document.createElement('top'));
		bottom = 'bottom'+i;
		bottom= eval(document.createElement('bottom'));
		hr1 = 'hr'+i;
		hr1 = eval(document.createElement('hr'));
		hr2 = 'hr'+i;
		hr2 = eval(document.createElement('hr'));
		
		/*Go or Back Common Info :: AirBook Info*/
		totalDuration = airList.trips.tripOption[s].slice[i].duration; //총 여정 시간
		seatType = getSeatType(airList.trips.tripOption[s].slice[i].segment[0].cabin); //좌석타입
		origin2 = airList.trips.tripOption[s].slice[i].segment[0].leg[0].origin; //최초출발지		
		startDate = airList.trips.tripOption[s].slice[i].segment[0].leg[0].departureTime;
		
		segment = airList.trips.tripOption[s].slice[i].segment.length; // 경유를 알 수 있음 TRANSFER //adto.air_stopNum = segment-1; 경유 횟수
		stopNum = segment;		
		for(var j=0; j<segment; j++){
			/*GO or Back Detail Info */
			stopDuration = airList.trips.tripOption[s].slice[i].segment[j].connectionDuration; // 경유 대기 시간 /경유 할 경우 있다.
			airline = airList.trips.tripOption[s].slice[i].segment[j].flight.carrier; //항공사
			airNum = airList.trips.tripOption[s].slice[i].segment[j].flight.number; //편명
			bookGrade = airList.trips.tripOption[s].slice[i].segment[j].bookingCode;
			
			leg = airList.trips.tripOption[s].slice[i].segment[j].leg.length;//transit인 경우의 수
			if(leg>1){
				stopNum = leg;
				for(var z=0; z<leg; z++){//Transit
					/* GO or Back Detail Info */
					origin = airList.trips.tripOption[s].slice[i].segment[j].leg[z].origin; //출발지
					destination = airList.trips.tripOption[s].slice[i].segment[j].leg[z].destination;//도착지
					arrTime = airList.trips.tripOption[s].slice[i].segment[j].leg[z].arrivalTime; //출발시간
					depTime = airList.trips.tripOption[s].slice[i].segment[j].leg[z].departureTime; //도착시간
					duration = airList.trips.tripOption[s].slice[i].segment[j].leg[z].duration; //비행시간
					stopDuration = airList.trips.tripOption[s].slice[i].segment[j].leg[z].connectionDuration; //경유 시간					
					mileage = airList.trips.tripOption[s].slice[i].segment[j].leg[z].mileage;
					airCraft = airList.trips.tripOption[s].slice[i].segment[j].leg[z].aircraft;	
						
					top.innerHTML = '<a href="javascript:void(0)" onclick="showHide('+i+')">'
								+'<label>출발 '+startDate.split('T')[0]+'</label>&nbsp;&nbsp;&nbsp;|'
								+'<label id="air_origin">&nbsp;&nbsp;&nbsp;'+origin2+'</label><img src="">'
								+' <label id="air_destination">'+destination+'</label></a><hr>';
						if(i==0){
							top.innerHTML +='<input type="hidden" name="aGoInfo.air_goOrigin" value="'+origin2+'">'
									+'<input type="hidden" name="aGoInfo.air_goDestination" value="'+destination+'">'
									+'<input type="hidden" name="aGoInfo.air_goStartDate" value="'+startDate+'">';
						}else{
							top.innerHTML +='<input type="hidden" name="aBackInfo.air_backOrigin" value="'+origin2+'">'
							+'<input type="hidden" name="aBackInfo.air_backDestination" value="'+destination+'">'
							+'<input type="hidden" name="aBackInfo.air_backStartDate" value="'+startDate+'">';
						}
						div.appendChild(top);
					/*Arrival Time & Depature Time HH:MM 으로 수정*/
					var a = arrTime.split('T');
					arrH = getAmPm(a[1].split(':')[0]);
					ch = a[1].split(':')[1].charAt(2);
					if(ch =='-' || ch=='+'){
						arrM = a[1].split(':')[1].split(ch)[0];
					}
					arr = arrH +'시 '+ arrM+'분'+a[1].split(':')[1].split(ch)[1]+ch;
					
					var b = depTime.split('T');
					depH = getAmPm(b[1].split(':')[0]);
					ch = b[1].split(':')[1].charAt(2);
					if(ch =='-' || ch=='+'){
						depM = b[1].split(':')[1].split(ch)[0];
					}
					dep = depH +'시 '+ depM+'분'+b[1].split(':')[1].split(ch)[1]+ch;
					
					
					//TABEL 생성
					modalCreateTable(table,i,cnt);
					cnt++;
				endDate = a[0];
				}
			}else{//Transfer
				/* GO or Back Detail Info */
				origin = airList.trips.tripOption[s].slice[i].segment[j].leg[0].origin;
				destination = airList.trips.tripOption[s].slice[i].segment[j].leg[0].destination;
				arrTime = airList.trips.tripOption[s].slice[i].segment[j].leg[0].arrivalTime;
				depTime = airList.trips.tripOption[s].slice[i].segment[j].leg[0].departureTime;
				duration = airList.trips.tripOption[s].slice[i].segment[j].leg[0].duration;				
				mileage = airList.trips.tripOption[s].slice[i].segment[j].leg[0].mileage;
				airCraft = airList.trips.tripOption[s].slice[i].segment[j].leg[0].aircraft;
				
				top.innerHTML = '<a href="javascript:void(0)" onclick="showHide('+i+')">'
							+'<label>출발 '+startDate.split('T')[0]+'</label>&nbsp;&nbsp;&nbsp;|'
							+'<label>&nbsp;&nbsp;&nbsp;'+origin2+'</label><img src="">'
							+' <label id="air_destination">'+destination+'</label></a><hr>';
					if(i==0){
						top.innerHTML +='<input type="hidden" name="aGoInfo.air_goOrigin" value="'+origin2+'">'
								+'<input type="hidden" name="aGoInfo.air_goDestination" value="'+destination+'">'
								+'<input type="hidden" name="aGoInfo.air_goStartDate" value="'+startDate+'">';
					}else{
						top.innerHTML +='<input type="hidden" name="aBackInfo.air_backOrigin" value="'+origin2+'">'
						+'<input type="hidden" name="aBackInfo.air_backDestination" value="'+destination+'">'
						+'<input type="hidden" name="aBackInfo.air_backStartDate" value="'+startDate+'">';
					}
					div.appendChild(top);
				
				/*Arrival Time & Depature Time HH:MM 으로 수정*/
				var a = arrTime.split('T');
				arrH = getAmPm(a[1].split(':')[0]);
				ch = a[1].split(':')[1].charAt(2);
				if(ch =='-' || ch=='+'){
					arrM = a[1].split(':')[1].split(ch)[0];
				}
				arr = arrH +'시 '+ arrM+'분'+a[1].split(':')[1].split(ch)[1]+ch;
				
				var b = depTime.split('T');
				depH = getAmPm(b[1].split(':')[0]);
				ch = b[1].split(':')[1].charAt(2);
				if(ch =='-' || ch=='+'){
					depM = b[1].split(':')[1].split(ch)[0];
				}
				dep = depH +'시 '+ depM+'분'+b[1].split(':')[1].split(ch)[1]+ch;
				
				//TABLE 생성
				modalCreateTable(table,i,cnt);
				cnt++;
			}
			makeTime(totalDuration);
			bottom.innerHTML='<label>도착 '+arrTime.split('T')[0]+'</label>&nbsp;&nbsp;&nbsp;'
							+'|&nbsp;&nbsp;&nbsp;총 비행 시간'+h+'시간'+m+'분<hr>';
			if(i==0){
				bottom.innerHTML+='<input type="hidden" name="aGoInfo.air_goEndDate" value="'+arrTime+'">';
			}else{
				bottom.innerHTML+='<input type="hidden" name="aBackInfo.air_backEndDate" value="'+arrTime+'">';
			}
			div.appendChild(table);
			div.appendChild(hr2);
			div.appendChild(bottom);
		}//segment끝
		hiddenGoBackCommonInfo(i);
	}//slice 끝
	hiddenComonInfo();
	document.getElementById('seatType').innerHTML = seatType+'클래스';
	document.getElementById('price').innerHTML = price;
}

function modalCreateTable(table,i,cnt){	
	var mRowlen = table.rows.length;
	var mRow1 = table.insertRow(mRowlen);
	var mCol1 = mRow1.insertCell(0);
	mCol1.colSpan='3';
	mCol1.align='center';
	mCol1.innerHTML = '<img src=""><label>'+airline+'&nbsp;'+airNum+'&nbsp;'+getAirName()+'</label>';
	
	makeTime(duration);
	var mRow2 = table.insertRow(mRowlen+1);
	var mCol1 = mRow2.insertCell(0);
	mCol1.rowSpan='2';
	mCol1.style.verticalAlign  = 'middle';
	mCol1.innerHTML='<label>'+h+'시간'+m+'분'+'</label>';
	var mCol2 = mRow2.insertCell(1);
	mCol2.innerHTML = '<label>'+dep+'</label>';
	var mCol3 = mRow2.insertCell(2);
	mCol3.innerHTML = '<label>'+origin+'</label>';
	
	var mRow3 = table.insertRow(mRowlen+2);
	var mCol1 = mRow3.insertCell(0);
	mCol1.innerHTML = '<label>'+arr+'</label>';
	var mCol2 = mRow3.insertCell(1);
	mCol2.innerHTML = '<label>'+destination+'</label>';
	
	if(stopDuration!=undefined){
		makeTime(stopDuration);
		var mRow4= table.insertRow(mRowlen+3);
		var mCol1 = mRow4.insertCell(0);
		mCol1.colSpan='3';
		mCol1.align='center';
		mCol1.innerHTML = '<label>'+h+'시간'+m+'분'+'</label>';
	}else{
		stopDuration=0;
	}
	
	var mRow4 = table.insertRow(mRowlen+3);
	var mCol1 = mRow4.insertCell(0);
	mCol1.colSpan = '3';
	mCol1.innerHTML = hiddenInfo(i,cnt);
}

/////////////////////AIRBOOK OK DTO///////////////////////////////////////////////////////////////////
/* AirBookForm으로 보내는 aGoDetail & aBackDetail */
function hiddenInfo(i,cnt){
	var str;
	if(i==0){
		str='<input type="hidden" name="aGoDetail['+cnt+'].air_airline" value="'+airline+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_airName" value="'+getAirName( )+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_airNum" value="'+airNum+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_aircraft" value="'+getAirCraft()+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_startDate" value="'+depTime+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_endDate" value="'+arrTime+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_origin" value="'+origin+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_destination" value="'+destination+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_duration" value="'+duration+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_stopDuration" value="'+stopDuration+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_mileage" value="'+mileage+'">'
		+'<input type="hidden" name="aGoDetail['+cnt+'].air_bookGrade" value="'+bookGrade+'">';
	}else{ 
		str='<input type="hidden" name="aBackDetail['+cnt+'].air_airline" value="'+airline+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_airName" value="'+getAirName()+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_airNum" value="'+airNum+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_aircraft" value="'+getAirCraft()+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_startDate" value="'+depTime+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_endDate"  value="'+arrTime+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_origin" value="'+origin+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_destination" value="'+destination+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_duration" value="'+duration+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_stopDuration" value="'+stopDuration+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_mileage" value="'+mileage+'">'
		+'<input type="hidden" name="aBackDetail['+cnt+'].air_bookGrade" value="'+bookGrade+'">';
	} 	
	return str;	
}

/* AirBookForm으로 보내는 AirBookInfo */
function hiddenComonInfo(){
	var str3 ='<input type="hidden" name="aBookInfo.air_totalPrice" value="'+price+'">'
	 	+'<textarea rows="1" cols="15"  name="aBookInfo.air_priceInfo" style="display:none">'+priceInfo+'</textarea>'
		+'<input type="hidden" name="aBookInfo.air_basePrice" value="'+basePrice+'">'
		+'<input type="hidden" name="aBookInfo.air_taxPrice" value="'+taxPrice+'">'
		+'<input type="hidden" name="aBookInfo.air_latestTicket" value="'+latestTicket+'">';
	commonDiv.innerHTML += str3;
}
/* AirBookForm으로 보내는 aGoInfo & aBackInfo */
function hiddenGoBackCommonInfo(i){
	var str2;
	if(i==0){
		str2='<input type="hidden" name="aGoInfo.air_goSeatType"value="'+seatType+'">'
		+'<input type="hidden" name="aGoInfo.air_goTotalDuration" value="'+totalDuration+'">'
		+'<input type="hidden" name="aGoInfo.air_goStopNum" value="'+(stopNum-1)+'">';
	}else{
		str2 ='<input type="hidden" name="aBackInfo.air_backSeatType"value="'+seatType+'">'
		+'<input type="hidden" name="aBackInfo.air_backTotalDuration" value="'+totalDuration+'">'
		+'<input type="hidden" name="aBackInfo.air_backStopNum" value="'+(stopNum-1)+'">'
	}
	commonDiv.innerHTML += str2;
}
///////////////////////////////////////////////////////////////////////////////////////////////

/**modalView 관련*/
function makeTime(minutes){
	h = parseInt(minutes/60);
	m = minutes - h*60;
}
function getAmPm(h){
	var time;
	if(h>12 && h<24){
		h= h-12;
		time = '오후'+h;
	}else if(h==12){
		time = '오후'+h;
	}else if(h==24){
		time ='오전'+12;
	}else{
		time ='오전'+h;
	}
	return time;
}
function getSeatType(type){
	switch(type){
	case 'COACH' : return '이코노미';
	case 'PREMIUM_COACH' : return '프리미엄 이코노미';
	case 'BUSINESS' : return '비지니스';
	case 'FIRST' : return '퍼스트';
	}
}
function showHide(i){//modalView 관련
	var tName = 'ta'+i;
	var t = document.getElementById(tName);
	t.style.display=(t.style.display=='none')? '': 'none';
}
function getAirName(){
	var carrier = airList.trips.data.carrier.length;
	for(var i=0;i<carrier;i++){			
		var code = airList.trips.data.carrier[i].code;
		if(code == airline){
			airName = airList.trips.data.carrier[i].name;
			return airName;
		}
	}
}
function getAirCraft(){
	var craft = airList.trips.data.aircraft.length;
	for(var i=0;i<craft;i++){			
		var code = airList.trips.data.aircraft[i].code;
		if(code == airCraft){
			airtype = airList.trips.data.aircraft[i].name;
			return airtype;
		}
	}
}
</script>
<div class="col-sm-12" id="gap"></div>

		<!-- AIR LOADING PAGE -->
		<div class="airBg" id="airLoad" style="display: none; overflow-y:hidden;">
			<div class="home-product">
				   <div class="container-fluid">
					<div class="col-md-6 col-sm-6 col-xs-6">
						<div class="home-product-hedaing left-product"></div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
						<div class="home-product-hedaing right-product"></div>
					</div>
				</div>
			</div>
		</div>
		<div id="showAirfare" style="display: none">
		<!-- Side Menu -->
		<div class="col-sm-2 " id="airSidMenu" style="position: fixed; left: 50px; top: 220px">
			<%@ include file="/WEB-INF/views/air/airSide.jsp" %>
		</div>
		<!-- resultTitle -->
		<div class="col-sm-8 col-xs-6" style="margin-left: 250px;">
			<div class="hidden-sm hidden-xs">
				<table id="resultTitle" style="display: none; border: none">
				<thead>
					<tr>
						<td width="200px"><input type="text" id="air_solution" style="border: none; text-align: right; background-color: transparent;" size="2" readonly="readonly">개 결과</td>
						<td width="530px" align="right">정렬기준<select name="orderby">
								<option value="rowfare">최저가</option>
								<option value="totalTripTiem">전체 여정시간</option>
								<option value="departureTime">출국 : 출발시간</option>
								<option value="overStop">경유</option>
							</select>
						</td>
					</tr>
				</thead>
				</table>
			</div>
			<!-- resultBody -->
			<div id="airResult"></div>
		</div><!-- #coMd8 -->
		</div>


<div class="container col-sm-6">  
<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog">
	  	    
	  <form name="airFareInfo" action="airBook.pd" method="post">
	  <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          	비행 여정      
	        </div>
	     	<div class="modal-body">
	         <div id="modal-table"></div>
	         
	         <input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
	        
	         <!-- AirBookForm으로 보내느 airBookInfo -->
	         <input type="hidden" name="aBookInfo.air_adult" value="${airDto.air_adult }">
	         <input type="hidden" name="aBookInfo.air_kid" value="${airDto.air_kid }">
	         <input type="hidden" name="aBookInfo.air_tripType" value="${airDto.air_tripType }">
	         <div id="commonInfo"></div>
	          <hr>
	          <h2>티켓을 예약하세요</h2><br>
	          <label id="seatType" ></label>,성인 <label>${airDto.air_adult }</label>명
	        </div>
	        <div class="modal-footer">
	        <label id="price"></label>
	        <hr>
	          <button type="submit" class="btn btn-default" >예약</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        </div>
	    </div>	      
	  </form> 
	   </div>
	 </div>
</div>