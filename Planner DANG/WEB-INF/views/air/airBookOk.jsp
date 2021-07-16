<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권 예약 완료</title>
<style>
#air{
	margin-top: 150px;
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

/* AirTicket */
.cardWrap {
  width: 80em;
  color: #fff;
  font-family: sans-serif;
  height: 16em;
}

.card {/* ONE WAY DESIGN*/
  background: linear-gradient(to bottom, #069aec 0%, #3cb5f9 29%, #fff 29%, #fff 100%);
  float: left;
  position: relative;
  padding: 1em;
}

.card2 { /*ROUND DESIGN  */
  background: linear-gradient(to bottom,  #069aec 0%, #3cb5f9 44%, #fff 44%, #fff 100%);
  float: left;
  position: relative;
  padding: 1em;
}


.cardLeft {
  border-top-left-radius: 8px;
  border-bottom-left-radius: 8px;
  width: 50em;
}

.cardRight {
  width: 16em;
  border-left: .18em dashed #fff;
  border-top-right-radius: 8px;
  border-bottom-right-radius: 8px;
  height: 18em;
}

h1 {
  font-size: 1.2em;
  font-weight:1000;
  margin-top: -4;
}
h1 span {
  font-weight: normal;
  font-size: 0.8em;
}

.title, .memberInfo {
  font-weight: normal;
}
.memName, .memBirth, .memTel, .memEmail{
	font-weight: normal;
	display: inline-block;
	margin-right: 25px;
	margin-top: 10px;
}
.title h2, .memberInfo h2, .memName h2, .memBirth h2, .memTel h2, .memEmail h2 {
  font-size: 1.1em;
  color: #525252;
  margin: 0;
}
.title h2{
	display: inline;
	font-size: 1.8em;
}
.memberInfo span{
	font-size: 0.7em;
	color: #a2aeae;
}
.title span, .memName span, .memBirth span, .memTel span, .memEmail span {
  font-size: .9em;
  color: #a2aeae;
}
.title span{
	font-size: 1em;
	float: none;
}

.title {
  margin: 1em 0 0 0;
}

.name, .seat {
  margin: .7em 0 0 0;
}

.time {
  margin: .7em 0 0 1em;
}

.seat, .time {
  float: left;
}

.eye {
	text-align: center;
	vertical-align: middle;
}

.number {
  text-align: center;
  text-transform: uppercase;
}
.number h3 {
  color: black;
  margin: .9em 0 0 0;
  font-size: 2.5em;
}
.number span {
  display: block;
  color: #a2aeae;
}
</style>
<script>
/*결제 Function*/
function airPay(){
	window.open('airPayForm.pd?air_bookNum=${aboDto.aBookInfo.air_bookNum }', 'airPayForm', 'width=600px, height=600px');
}
</script>
</head>
<body>
<div class="page-container wrapper" id="air">
<div class="content-main" >
	<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="stepwizard">
				   <div class="stepwizard-row">
				       <div class="stepwizard-step">
				           <button type="button" class="btn-default btn-circle" disabled="disabled">1</button>
				           <p>Book Form</p>
				       </div>
				       <div class="stepwizard-step">
				           <button type="button" class="btn-default btn-circle" disabled="disabled">2</button>
				           <p>Book Check</p>
				       </div>
				       <div class="stepwizard-step">
				            <button onclick="return false" class="btn-primary btn-circle" style="background-color: #3cb5f9; 
				           				border-color: #ffffff;" disabled="disabled">3</button>
				           <p>Book Confirm</p>
				       </div> 
				   </div>
			</div>
		<div class="col-sm-1"></div>
	</div>
</div>
	<br>
	<div class="content-secondary">
		<div class="col-sm-1 col-lg-1" style="margin-left: 20px"></div> <!-- #colSm1 -->
		<div class="col-sm-9 col-lg-8">
			<h3>항공권구매 완료</h3>
			<hr>
			<label  style="font-size: 25px;">예매확인</label>		
				<div class="cardWrap">
					<c:if test="${aboDto.aBookInfo.air_tripType eq 'oneway' }">
						 <div class="card cardLeft">
					  	<h1>PLANNERDANG <span>BOARDING PASS</span></h1>
						<div class="title">					
							<h2 style="margin-right: 250px;">출발</h2><h2>도착</h2>
							<br>
						   <span style="margin-right: 265px; margin-left: 7px;">${aboDto.aGoInfo.air_goOrigin }</span>
						   <span>${aboDto.aGoInfo.air_goDestination }</span>
						   <br>
						   <c:forTokens var="goDate" items="${aboDto.aGoInfo.air_goStartDate }" delims="T" varStatus="i">
						   	<c:if test="${i.index==0 }">
							   	<span>${goDate }</span>
						   	</c:if>
						   	<c:if test="${i.index==1 }">
						   		<span style="margin-right: 130px;">[${goDate }]</span>
						   	</c:if>
						   </c:forTokens>
						    <c:forTokens var="backDate" items="${aboDto.aGoInfo.air_goEndDate }" delims="T" varStatus="i">
						   	<c:if test="${i.index==0 }">
							   	<span>${backDate }</span>
						   	</c:if>
						   	<c:if test="${i.index==1 }">
						   		<span>[${backDate }]</span>
						   	</c:if>
						   </c:forTokens>
						 </div>
							<c:if test="${aboDto.aBookInfo.air_tripType eq 'oneway' }">
							<div class="memberInfo">
							    <h2>예약자 정보</h2>
							    <span>예약자의 정보가 일치하지 않은 경우 실시간 예약 상황 알림 서비스를 받지 못 할 수 있습니다. 정확히 입력했는지 다시 확인해주세요.</span>
							</div>
							<div class="memName">
							    <h2>예약자명</h2>
							    <span>${aboDto.aBookInfo.air_mName }</span>
							</div>
							<div class="memBirth">
							   <h2>생년월일</h2>
							   <span>${aboDto.aBookInfo.air_mBirth }</span>
							</div>
							<div class="memTel">
								<h2>전화번호</h2>
							     <span>${aboDto.aBookInfo.air_mTel }</span>
							</div> 
							   <div class="memEmail">
							     <h2>이메일</h2>
							     <span>${aboDto.aBookInfo.air_mEmail }</span>
							   </div> 
							</c:if>
						</div><!-- #cardLeft -->
						<div class="card cardRight">
						  <div class="eye">
						  예매번호<br>
						  ${aboDto.aBookInfo.air_bookNum }
						  </div>
						  <div class="number">
						  	<h3>${aboDto.aBookInfo.air_totalPrice }</h3>
						   	<span>PRICE</span>
						   	<ul style="color: black; list-style-type: none; text-align: left">
						   		<li>결제는 24시간이내에 하셔야 예약확정상태가 됩니다.</li>
						   		<li>24시간 이내 미결제시 자동 예약 취소되오니 유의바랍니다.</li>
						   	</ul>
						  </div>
						</div><!-- #cardRight -->
					</c:if>
				
				<!-- ROUND TRIP TICKET -->
				 <c:if test="${aboDto.aBookInfo.air_tripType == 'round' }">
				  <div class="card2 cardLeft">
				  	<h1>PLANNERDANG <span>BOARDING PASS</span></h1>
					<div class="title">					
						<h2 style="margin-right: 250px;">출발</h2><h2>도착</h2>
						<br>
					   <span style="margin-right: 265px; margin-left: 7px;">${aboDto.aGoInfo.air_goOrigin }</span>
					   <span>${aboDto.aGoInfo.air_goDestination }</span>
					   <br>
					   <c:forTokens var="goDate" items="${aboDto.aGoInfo.air_goStartDate }" delims="T" varStatus="i">
					   	<c:if test="${i.index==0 }">
						   	<span>${goDate }</span>
					   	</c:if>
					   	<c:if test="${i.index==1 }">
					   		<span style="margin-right: 130px;">[${goDate }]</span>
					   	</c:if>
					   </c:forTokens>
					    <c:forTokens var="backDate" items="${aboDto.aGoInfo.air_goEndDate }" delims="T" varStatus="i">
					   	<c:if test="${i.index==0 }">
						   	<span>${backDate }</span>
					   	</c:if>
					   	<c:if test="${i.index==1 }">
					   		<span>[${backDate }]</span>
					   	</c:if>
					   </c:forTokens>
					 </div>
						<c:if test="${aboDto.aBookInfo.air_tripType eq 'oneway' }">
						<div class="memberInfo">
						    <h2>예약자 정보</h2>
						    <span>예약자의 정보가 일치하지 않은 경우 실시간 예약 상황 알림 서비스를 받지 못 할 수 있습니다. 정확히 입력했는지 다시 확인해주세요.</span>
						</div>
						<div class="memName">
						    <h2>예약자명</h2>
						    <span>${aboDto.aBookInfo.air_mName }</span>
						</div>
						<div class="memBirth">
						   <h2>생년월일</h2>
						   <span>${aboDto.aBookInfo.air_mBirth }</span>
						</div>
						<div class="memTel">
							<h2>전화번호</h2>
						     <span>${aboDto.aBookInfo.air_mTel }</span>
						</div> 
						   <div class="memEmail">
						     <h2>이메일</h2>
						     <span>${aboDto.aBookInfo.air_mEmail }</span>
						   </div> 
						</c:if>
					</div><!-- #cardLeft -->
					
				  <div class="card cardLeft" style="margin-top: 10px">
				  	<h1>PLANNERDANG <span>ROUND TICKET</span></h1>
					<div class="title">					
						<h2 style="margin-right: 250px;">출발</h2><h2>도착</h2>
						<br>
					   <span style="margin-right: 265px; margin-left: 7px;">${aboDto.aBackInfo.air_backOrigin }</span>
					   <span>${aboDto.aBackInfo.air_backDestination }</span>
					   <br>
					   <c:forTokens var="goDate" items="${aboDto.aBackInfo.air_backStartDate }" delims="T" varStatus="i">
					   	<c:if test="${i.index==0 }">
						   	<span>${goDate }</span>
					   	</c:if>
					   	<c:if test="${i.index==1 }">
					   		<span style="margin-right: 130px;">[${goDate }]</span>
					   	</c:if>
					   </c:forTokens>
					    <c:forTokens var="backDate" items="${aboDto.aBackInfo.air_backEndDate }" delims="T" varStatus="i">
					   	<c:if test="${i.index==0 }">
						   	<span>${backDate }</span>
					   	</c:if>
					   	<c:if test="${i.index==1 }">
					   		<span>[${backDate }]</span>
					   	</c:if>
					   </c:forTokens>
					 </div>
					 <div class="memberInfo">
					    <h2>예약자 정보</h2>
					    <span>예약자의 정보가 일치하지 않은 경우 실시간 예약 상황 알림 서비스를 받지 못 할 수 있습니다. 정확히 입력했는지 다시 확인해주세요.</span>
					  </div>
					  <div class="memName">
					    <h2>예약자명</h2>
					    <span>${aboDto.aBookInfo.air_mName }</span>
					   </div>
					   <div class="memBirth">
					     <h2>생년월일</h2>
					     <span>${aboDto.aBookInfo.air_mBirth }</span>
					   </div>
					   <div class="memTel">
					     <h2>전화번호</h2>
					     <span>${aboDto.aBookInfo.air_mTel }</span>
					   </div> 
					   <div class="memEmail">
					     <h2>이메일</h2>
					     <span>${aboDto.aBookInfo.air_mEmail }</span>
					   </div> 
					</div><!-- #cardLeft -->
					<div class="card cardRight" style="margin-top: 10px">
					  <div class="eye">
						 예매번호<br>
						  ${aboDto.aBookInfo.air_bookNum }
					  </div>
					  <div class="number">
					  	<h3>${aboDto.aBookInfo.air_totalPrice }</h3>
					   	<span>PRICE</span>
					   	<ul style="color: black; list-style-type: none; text-align: left">
					   		<li>결제는 24시간이내에 하셔야 예약확정상태가 됩니다.</li>
					   		<li>24시간 이내 미결제시 자동 예약 취소되오니 유의바랍니다.</li>
					   	</ul>
					  </div>
					</div><!-- #cardRight -->
				 </c:if>
				</div><!-- #cardWrap -->
				<br>
		</div> <!-- #colSm8 -->
		<div class="col-sm-2 col-lg-3" style="float: both;"></div>
		<!-- BUTTON -->
		<div class="col-sm-12"></div>
		<div class="col-sm-1 col-lg-1"></div>
		<div class="col-sm-10 col-lg-9"  style="margin-top: 25px; margin-left: 12px">
		<a href="airContent.pd?air_bookNum=${aboDto.aBookInfo.air_bookNum }"><button>예약 확인</button></a>
		<a href="javascript:airPay()"><button>결제</button></a>
		</div>
		<div class="col-sm-1 col-lg-2"></div>
</div><!-- container-main -->
	<%@include file="/WEB-INF/views/header.jsp" %>
</div>
</body>
</html>