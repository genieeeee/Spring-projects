<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권 예약 내용</title>
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
/*결제 Function*/
function airPay(){
	window.open('airPayForm.pd', 'airPayForm', 'width=300px, height=400px');
}
window.onload=function(){
	var str=document.getElementById('share').innerHTML;
	str='<html><head><meta charset="UTF-8">'
		+'<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">'
		+'<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">'
		+'</head><bdoy>'+str+'</body></html>';
	var text=document.getElementById('htext2');
	text.innerHTML=str;
}
</script>
<script>

</script>
</head>
<body style="text-align: ">
<div class="page-container wrapper">
<div class="content-main">
	<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
		<div class="col-xs-6 col-xs-offset-3 visible-xs" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
		<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
		<div class="hidden-xs"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>
		<div class="col-xs-11 col-sm-11 portfolioContainer">
		<div class="page-header" style="margin-top: -6px">
	        <h1 style="display: inline;"></h1>
	        <a  data-toggle="modal" data-target="#myModal"><i class="fa fa-share-alt-square fa-2x pull-right"></i></a>
	        <span class="pull-right"><h4>예약번호[${aboDto.aBookInfo.air_bookNum }]</h4></span>
	        <input type="hidden" name="air_bookNum" value="${aboDto.aBookInfo.air_bookNum }">
	   	</div>
	   	<br>
	   	<div id="airScheduleInfo">
			<a href="javascript:showHideGo()">
			<div id="goInfoTitle" style="text-align: center;">
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
			</div>
				</a>
				<div id="goInfo" style="display: none; text-align: center; ">
				<c:forEach items="${aboDto.aGoDetail }" var="aGo" >
				<table class="table">
					<tr>
						<td><label>${aGo.air_origin }</label></td>
						<td rowspan="2" style="width: 100px">
							<!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
							<img src="/pd/img/air/airMove2.png" width="80" height="60">
						</td>
						<td><label>${aGo.air_destination }</label> </td>
						<td rowspan="2" style="vertical-align: middle;">
								비행시간
								[<c:set var="goDur" value="${aGo.air_duration }"/>
								<f:parseNumber integerOnly="true" var="h" value="${goDur/60 }" />
								<c:if test="${h>0 }">
									${h }시간
								</c:if>
								<c:set var="m" value="${goDur mod 60 }"/>
								<c:if test="${m>0 }">
									${m }분
								</c:if>]
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
					<tfoot>
						<tr>
							<c:if test="${aGo.air_stopDuration != 0}">
								<td colspan="4">
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
								</td>
								</c:if>
							<c:if test="${aGo.air_stopDuration ==0 }">
								<td colspan="4" style="text-align: right;">
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
								</td>
							</c:if>
						</tr>
					</tfoot>
				</table>		
				</c:forEach>
			</div><!--goInfo -->
				
			<!-- ********************************BAKC INFO****************************************************** -->
			<c:if test="${aboDto.aBookInfo.air_tripType eq 'round' }">
			<a href="javascript:showHideBack()">
				<div id="backInfoTitle" style="text-align: center;">
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
			</div>
			</a>
			<div id="backInfo" style="display: none; text-align: center;">
			<c:forEach items="${aboDto.aBackDetail }" var="aBack" >
				<table class="table">
					<tr>
						<td><label>${aBack.air_origin }</label></td>
						<td rowspan="2">
							<img src="/pd/img/air/airMove2.png" width="80" height="60">
						</td>
						<td><label>${aBack.air_destination }</label> </td>
						<td rowspan="2" style="vertical-align: middle;">
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
					<tfoot>
					<tr>
						<c:if test="${aBack.air_stopDuration != 0}">
							<td colspan="4">
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
							</td>
						</c:if>
						<c:if test="${aBack.air_stopDuration == 0 }">
							<td colspan="4">
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
							</td>
						</c:if>
					</tr>
					</tfoot>
				</table>
			</c:forEach>	
		</div><!--backInfo -->
		</c:if>
		</div><!-- ariSchedule -->
		<hr>
		<h3>예약자정보</h3>
		<table class="table">
			<thead>
			<tr>
				<th>예약자명</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>이메일</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>${aboDto.aBookInfo.air_mName }</td>
				<td>${aboDto.aBookInfo.air_mBirth }</td>
				<td>${aboDto.aBookInfo.air_mTel }</td>
				<td>${aboDto.aBookInfo.air_mEmail }</td>
			</tr>
			</tbody>
		</table>
		<hr>
		<h3>승객정보</h3>
		<table class="table">
			<thead>
			<tr>
				<th>승객</th>
				<th>승객성명</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>여권번호</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${aboDto.aPsgInfo }" var="psg" varStatus="i">
				<tr>
					<td>승객${i.count }</td>
					<td>${psg.air_psgName }</td>
					<td>${psg.air_psgSex }</td>
					<td>${psg.air_psgBirth }</td>
					<td>${psg.air_psgPassportNum }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<hr>
		<a href="airMypage.pd"><button>예약내역</button></a>
		<c:if test="${payState ==0 }">		
			<a href="javascript:airPay()"><button>결제</button></a>
		</c:if>
	</div><!-- #col-sm8 -->
	<div class="col-sm-1"></div>
</div>
	<%@include file="/WEB-INF/views/header.jsp" %>
</div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
			<a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20'
			+encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog',
			 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank"
			 alt="Share on Twitter" ><img src="img/twiiter.png" width="40px" height="40px"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u='
			+encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog',
			 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank"
			 alt="Share on Facebook" ><img src="img/facebook.png" width="40px" height="40px"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="#" onclick="javascript:window.open('https://plus.google.com/share?url='+encodeURIComponent(document.URL),
			'googleplussharedialog','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=350,width=600');
			 return false;" target="_blank" alt="Share on Google+">
			<img src="img/google.png" width="40px" height="40px"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url='
			+encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title),
			 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" 
			target="_blank" alt="Share on Naver" ><img src="img/naver.png" width="40px" height="40px"></a>
			<hr>
			<h6>HTML태그를 복사해 사용할 곳에 붙여넣으세요.</h6>
			<textarea rows="20" cols="60" id="htext2"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
<!--  -->
<div id="share" style="display: none;">
	
			<div id="goInfoTitle" style="text-align: center;">
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
			</div>
				<div id="goInfo" style="text-align: center; ">
				<c:forEach items="${aboDto.aGoDetail }" var="aGo" >
				<table class="table">
					<tr>
						<td><label>${aGo.air_origin }</label></td>
						<td rowspan="2" style="width: 100px">
							<!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
							<img src="/pd/img/air/airMove2.png" width="80" height="60">
						</td>
						<td><label>${aGo.air_destination }</label> </td>
						<td rowspan="2" style="vertical-align: middle;">
								비행시간
								[<c:set var="goDur" value="${aGo.air_duration }"/>
								<f:parseNumber integerOnly="true" var="h" value="${goDur/60 }" />
								<c:if test="${h>0 }">
									${h }시간
								</c:if>
								<c:set var="m" value="${goDur mod 60 }"/>
								<c:if test="${m>0 }">
									${m }분
								</c:if>]
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
					<tfoot>
						<tr>
							<c:if test="${aGo.air_stopDuration != 0}">
								<td colspan="4">
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
								</td>
								</c:if>
							<c:if test="${aGo.air_stopDuration ==0 }">
								<td colspan="4" style="text-align: right;">
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
								</td>
							</c:if>
						</tr>
					</tfoot>
				</table>		
				</c:forEach>
			</div><!--goInfo -->
				
			<!-- ********************************BAKC INFO****************************************************** -->
			<c:if test="${aboDto.aBookInfo.air_tripType eq 'round' }">

				<div id="backInfoTitle" style="text-align: center;">
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
			</div>
	
			<div id="backInfo" style=" text-align: center;">
			<c:forEach items="${aboDto.aBackDetail }" var="aBack" >
				<table class="table">
					<tr>
						<td><label>${aBack.air_origin }</label></td>
						<td rowspan="2">
							<img src="/pd/img/air/airMove2.png" width="80" height="60">
						</td>
						<td><label>${aBack.air_destination }</label> </td>
						<td rowspan="2" style="vertical-align: middle;">
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
					<tfoot>
					<tr>
						<c:if test="${aBack.air_stopDuration != 0}">
							<td colspan="4">
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
							</td>
						</c:if>
						<c:if test="${aBack.air_stopDuration == 0 }">
							<td colspan="4">
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
							</td>
						</c:if>
					</tr>
					</tfoot>
				</table>
			</c:forEach>	
		</div><!--backInfo -->
		</c:if>
		</div>
</div>
</body>
</html>