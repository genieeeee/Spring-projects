<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공예약 확인</title>
<style>
#air{
	margin-top: 150px;
}
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

/* TABLE BOOTSTRAP CSS*/
#bookMem {
    border-collapse: separate;
    border-spacing: 0 5px;
}

#bookMem thead th {
    background-color: #006DCC;
    color: white;
}

#bookMem tbody td {
    background-color: #EEEEEE;
}

#bookMem tr td:first-child,
#bookMem tr th:first-child {
    border-top-left-radius: 6px;
    border-bottom-left-radius: 6px;
}

#bookMem tr td:last-child,
#bookMem tr th:last-child {
    border-top-right-radius: 6px;
    border-bottom-right-radius: 6px;
}
/*Passenger Table*/
#psgTable{
	width: 300px;
}
</style>
<script>
/*FUNCTION :: Show & Hide*/
function showHideGo(){
	var go = document.getElementById('goInfo');
	go.style.display = (go.style.display=='') ? 'none' : '';
}
function showHideBack(){
	var back = document.getElementById('backInfo');
	back.style.display = (back.style.display=='')? 'none' : '';
}

/*Back To airBookForm*/
function editPsgInfo(){
	document.airBookCheck.action='airBook.pd';
	document.airBookCheck.method='post';
	document.airBookCheck.submit();
}
</script>
</head>
<body>
<form name="airBookCheck" action="airBookOk.pd" method="post">
<div class="page-container wrapper" id="air">
	<div class="content-main">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="stepwizard">
			    <div class="stepwizard-row">
			        <div class="stepwizard-step">
			            <button type="button" class="btn-default btn-circle" disabled="disabled">1</button>
			            <p>Book Form</p>
			        </div>
			        <div class="stepwizard-step">
			            <button onclick="return false" class="btn-primary btn-circle" style="background-color: #3cb5f9; 
					           				border-color: #ffffff;" disabled="disabled">2</button>
			            <p>Book Check</p>
			        </div>
			        <div class="stepwizard-step">
			            <button type="button" class="btn-default btn-circle" disabled="disabled">3</button>
			            <p>Book Confirm</p>
			        </div> 
			    </div>
			</div>
		<div class="col-sm-1"></div>
		</div>
	</div>
	<br>
	<div class="content-secondary">
		<div class="col-sm-1 col-lg-1" style="margin-left: 20px"></div>
	<!-- Main Info -->
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
				</div></a>
				<hr>
				<div id="goInfo" style="display: none">
				<c:forEach items="${aboDto.aGoDetail }" var="aGo" varStatus="in">
				<c:set var="g" value="${in.index }"/>
				<table>
					<tr>
						<td><label>${aGo.air_origin }</label></td>
						<td rowspan="2">
							<img src="">
						</td>
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
						<c:forTokens var="aEndStart" items="${aGo.air_endDate }" delims="T" varStatus="i">
						<c:set var="i" value="${i.index }"/>
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
							<input type="hidden" name="aGoDetail[${g }].air_bookGrade" value="${aGo.air_bookGrade }">
							<input type="hidden" name="aGoDetail[${g }].air_mileage" value="${aGo.air_mileage }">
							<input type="hidden" name="aGoDetail[${g }].air_aircraft" value="${aGo.air_aircraft }">
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
				<f:parseNumber var="h" integerOnly="true" value="${(totDur/60)}"/>
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
				</div></a>
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
 		<h3>예약자 정보</h3>
		<hr>		
		<div id="bookMemberInfo" class="table-responsive">
		<table class="table" id="bookMem">
			<tbody>
			<tr>
				<th>예약자명</th><td>${aboDto.aBookInfo.air_mName }</td>
				<th>생년월일</th><td>${aboDto.aBookInfo.air_mBirth }</td>
				<th>국적</th><td>${aboDto.aBookInfo.air_mNation }</td>
			</tr>
			<tr>
				<th>연락처</th><td colspan="2">${aboDto. aBookInfo.air_mTel}</td>
				<th>이메일</th><td colspan="2">${aboDto.aBookInfo.air_mEmail }</td>
			</tr>
			</tbody>
		</table>
		<!-- AirBookInfo -->
		<input type="hidden" name="mem_id" value="${sessionScope.mem_id}">
 		<input type="hidden" name="aBookInfo.mem_id" value="${aboDto.aBookInfo.mem_id }" >
		<input type="hidden" name="aBookInfo.air_mName"  value="${aboDto.aBookInfo.air_mName }">
		<input type="hidden" name="aBookInfo.air_mBirth" value="${aboDto.aBookInfo.air_mBirth }" >
		<input type="hidden" name="aBookInfo.air_mTel" value="${aboDto.aBookInfo.air_mTel}">
		<input type="hidden" name="aBookInfo.air_mEmail" value="${aboDto.aBookInfo.air_mEmail }">
		<input type="hidden" name="aBookInfo.air_mNation" value="${aboDto.aBookInfo.air_mNation }">
	</div> 
	
	<br><br>
		<h3 style="float: left;">탑승객정보</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:editPsgInfo()" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-pencil"></span>수정하기</a>
		<hr>
		 <div id="passengerInfo">
			<div id="passengerNotice">
			작성하신 고객님의 이름과 성이 옮은 순서(성, 이름)로 올바르게 표시되어 있는지 확인하시기 바랍니다.<br>
			예약 후 모든 정보의 변경은 일반적으로 허용하지 않으며 혹, 허용할 시에는 추가 수수료를 부가할 수 있습니다.
			</div>
			<hr>
			<div id="passenger" class="table-responsive">
				<c:forEach var="psg" items="${aboDto.aPsgInfo}" varStatus="i">
				<c:set var="p" value="${i.index }"/>
				<h4>승객${p+1 }</h4>
				<table class="table table-bordered" id="psgTable">
					<tr>
						<th>성별</th>
						<td><label>${psg.air_psgSex }</label></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><label>${psg.air_psgName }</label></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><label>${psg.air_psgBirth }</label></td>
					</tr>
					<tr>
						<th>여권번호</th>
						<td><label>${psg.air_psgPassportNum }</label></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="aPsgInfo[${p }].air_psgName" value="${psg.air_psgName }">
							<input type="hidden" name="aPsgInfo[${p }].air_psgSex" value="${psg.air_psgSex }">
							<input type="hidden" name="aPsgInfo[${p }].air_psgBirth" value="${psg.air_psgBirth }">
							<input type="hidden" name="aPsgInfo[${p }].air_psgPassportNum" value="${psg.air_psgPassportNum }">
						</td>
					</tr>
				</table>
				<br>
				</c:forEach>
			</div>
		</div><!-- PassengerInfo --> 
	
	<hr>
	<input type="submit" class="btn btn-default" value="예약완료">
	</div> <!-- #col-sm-8 -->	
	
	<!-- Side Info :: Air Fare Info-->
		<div class="col-sm-2 col-lg-2">
			<div id="priceInfo">
			<h3>가격 세부내역</h3>
			<hr>
				<table>
					<tr>
						<th>인원</th>
						<td>성인<label>${aboDto. aBookInfo.air_adult }</label>명&nbsp;&nbsp;&nbsp;
						<c:if test="${aboDto. aBookInfo.air_kid>0}">
						|&nbsp;&nbsp;&nbsp;유/소아<label>${aboDto. aBookInfo.air_kid }</label>명
						</c:if>
						</td>
					</tr>
					<tr>
						<th>운임</th>
						<td><label>${aboDto. aBookInfo.air_basePrice }</label></td>
					</tr>
					<tr>
						<th>세금</th>
						<td><label>${aboDto. aBookInfo.air_taxPrice }</label></td>
					</tr>
					<tr>
						<td colspan="2"><label>총액</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>${aboDto. aBookInfo.air_totalPrice }</label></td>
					</tr>
					<tr>
						<td colspan="2">
							<!-- Air Fare Common Info :: AirBookInfo -->
							<input type="hidden" name="aBookInfo.air_tripType" value="${aboDto.aBookInfo.air_tripType }">
							<input type="hidden" name="aBookInfo.air_adult" value="${aboDto.aBookInfo.air_adult }">
							<input type="hidden" name="aBookInfo.air_kid" value="${aboDto.aBookInfo.air_kid }">
							<textarea rows="1" cols="5" name="aBookInfo.air_priceInfo" style="display: none">${aboDto.aBookInfo.air_priceInfo }</textarea>
							<input type="hidden" name="aBookInfo.air_totalPrice" value="${aboDto.aBookInfo.air_totalPrice }">
							<input type="hidden" name="aBookInfo.air_basePrice" value="${aboDto.aBookInfo.air_basePrice }">
							<input type="hidden" name="aBookInfo.air_taxPrice" value="${aboDto.aBookInfo.air_taxPrice }">
							<input type="hidden" name="aBookInfo.air_latestTicket" value="${aboDto.aBookInfo.air_latestTicket }">
						</td>
					</tr>
				</table>
			</div>
		</div><!-- #col-sm-2 :: side -->
	</div><!-- .content-secondary -->
	<%@include file="/WEB-INF/views/header.jsp" %>
</div>
</form>
</body>
</html>