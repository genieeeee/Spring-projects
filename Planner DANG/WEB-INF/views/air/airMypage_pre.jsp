<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약대기</title>
<link rel="stylesheet" type="text/css" href="css/airMypage.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
/*결제 Function*/
function airPay(num){
	window.open('airPayForm.pd?air_bookNum='+num, 'airPayForm', 'width=600px, height=500px');
}

/*AJAX*/
var type='';
function pages(page,cpType){
	type= cpType;
	var params =cpType+"="+page+"&cpType="+cpType;
	sendRequest('airMypage.pd', params, divPage, 'GET');	
}

function divPage(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var airPage=XHR.responseText;
			var parser = new DOMParser();
		    var doc = parser.parseFromString(airPage, "text/html");
		    console.log(doc);
		    if(type=='beforeCp'){
		    	var elem = doc.getElementById("tab1");
			 	var div = document.getElementById('tab1');
				div.innerHTML=	elem.innerHTML;
		    }else if(type=='payCp'){
		    	var elem = doc.getElementById("tab2");
			 	var div = document.getElementById('tab2');
				div.innerHTML=	elem.innerHTML;
		    }else if(type=='endCp'){
		    	var elem = doc.getElementById("tab3");
			 	var div = document.getElementById('tab3');
				div.innerHTML=	elem.innerHTML;
		    }else if(type=='cancelCp'){
		    	var elem = doc.getElementById("tab4");
			 	var div = document.getElementById('tab4');
				div.innerHTML=	elem.innerHTML;
		    }
		}
	}
}

</script>
</head>
<body>
<div class="page-container wrapper">
<div class="content-main">
	<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
		<div class="col-xs-6 col-xs-offset-3 visible-xs" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
		<div class="hidden-xs"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>
		<div class="col-xs-11 col-sm-11 portfolioContainer">
	    <div class="page-header" style="margin-top: -8px">
	   	</div>
           <div class="panel with-nav-tabs panel-default">
                <div class="panel-heading">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1default" data-toggle="tab">항공권 예약대기</a></li>
                        <li><a href="#tab2default" data-toggle="tab">항공권 예약확정</a></li>
                        <li><a href="#tab3default" data-toggle="tab">항공권 예약내역</a></li>
                        <li><a href="#tab4default" data-toggle="tab">항공권 결제내역</a></li>
			<li><a href="#tab5default" data-toggle="tab">호텔 예약내역</a></li>
                    </ul>
                </div><!-- #PANEL HEADING -->
                <div class="panel-body"  style="overflow-y: auto;">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">
                    	<c:if test="${!empty msg }">
							${msg }
						</c:if>
						<c:if test="${empty msg }">
                        	<div class="box" id="tab1">          	
							<c:forEach  items="${payBefore }" var="before">
									<div class="offer offer-radius offer-danger">
										<div class="shape">
											<div class="shape-text">
												PRE								
											</div>
										</div>
										<div class="offer-content" id="boxContent"><br>
											<h3 class="lead">
												항공권 예약확정 전
												<span id="airDate">
												일정 [${before.aGoInfo.air_goStartDate } ${before.aGoInfo.air_goEndDate }]
												</span>  
											</h3>
											<hr>					
											<p>
											예약번호 [<a href="airContent.pd?air_bookNum=${before.aPsgInfo[0].air_bookNum }">${before.aPsgInfo[0].air_bookNum }</a>]<br>
											출발 도착<br>
											${before.aGoInfo.air_goOrigin }
											${before.aGoInfo.air_goDestination}
											<c:set var="stopNum" value="${before.aGoInfo.air_goStopNum }"/>
											<c:if test="${stopNum ==0 }">
											직항
											</c:if>
											<c:if test="${stopNum !=0 }">
											${stopNum }회 경유
											</c:if>
											</p>
											<span id="airBtn">
											<a href="airCancel.pd?air_bookNum=${before.aPsgInfo[0].air_bookNum }"><button>취소</button></a>
											<button onclick="airPay('${before.aPsgInfo[0].air_bookNum }')">결제</button>
											</span>
										</div>
									</div>
								</c:forEach>
							</div><!-- Before BOX -->
							<div class="box" id="resultTab1"></div>
						<p style="text-align: center;"><label>${beforePages }</label></p>
						</c:if><!-- msg EMPTY -->
                    </div><!-- #default1 :: 예약대기 -->
                    <div class="tab-pane fade" id="tab2default">
                    	<c:if test="${!empty msg }">
							${msg }
						</c:if>
						<c:if test="${empty msg }">
	                        <div class="box" id="tab2">        	
							<c:forEach  items="${pay }" var="payOK">
									<div class="offer offer-radius offer-success">
										<div class="shape">
											<div class="shape-text">
												OK							
											</div>
										</div>
										<div class="offer-content" id="boxContent"><br>
											<h3 class="lead">
												항공권 예약확정
												<span id="airDate">
												일정 [${payOK.aGoInfo.air_goStartDate } ${payOK.aGoInfo.air_goEndDate }]
												</span>  
											</h3>
											<hr>					
											<p>
											예약번호 [<a href="airContent.pd?air_bookNum=${payOK.aPsgInfo[0].air_bookNum }">${payOK.aPsgInfo[0].air_bookNum }</a>]<br>
											출발 도착<br>
											${payOK.aGoInfo.air_goOrigin }
											${payOK.aGoInfo.air_goDestination}
											<c:set var="stopNum" value="${payOK.aGoInfo.air_goStopNum }"/>
											<c:if test="${stopNum ==0 }">
											직항
											</c:if>
											<c:if test="${stopNum !=0 }">
											${stopNum }회 경유
											</c:if>
											</p>
											<span id="airBtn">
											<a href="airCancel.pd?air_bookNum=${payOK.aPsgInfo[0].air_bookNum }"><button>취소</button></a>
											</span>
										</div>
									</div>
							</c:forEach>
							</div><!-- PAY BOX -->
							<div class="box" id="resultTab2"></div>
							<p style="text-align: center;"><label>${payPages }</label></p>	
						</c:if><!-- msg EMPTY -->
                        </div><!-- #default2 :: 예약확정 -->
                        <div class="tab-pane fade" id="tab3default">
	                        <div class="box" id="tab3">
								<c:forEach items="${endDate }" var="end">
								<div class="offer offer-radius offer-default">
									<div class="shape">
										<div class="shape-text">
											END								
										</div>
									</div>
									<div class="offer-content" id="boxContent">
										<h3 class="lead">
											항공권 사용만료
										</h3>
										<p>
											예약번호 [<a href="airContent.pd?air_bookNum=${end.aPsgInfo[0].air_bookNum }">${end.aPsgInfo[0].air_bookNum }</a>]<br>
											출발 도착<br>
											${end.aGoInfo.air_goOrigin }
											${end.aGoInfo.air_goDestination}
										</p>
									</div>
								</div>
								</c:forEach>
							</div><!--End Box -->
                        <p style="text-align: center;"><label>${endPages }</label></p>
                        </div><!-- #default3 :: 예약내역-->
                        <div class="tab-pane fade" id="tab4default">
                        <table class="table">
                        	<thead>
                        	<tr>
                        		<th>
                        			항공내용
                        		</th>
                        		<th>
                        			결제상태
                        		</th>
                        		<th>
                        			결제일
                        		</th>
                        		<th>
                        			비고
                        		</th>
                        	</tr>
                        	</thead>
                        	<tbody id="tab4">
                        		<c:forEach items="${payCancel }" var="all">                        		
                        		<tr>
                        			<td>
                        				<c:if test="${all.air_tripType=='oneway' }">
                        					${all.air_goOrigin } -> ${all.air_goDestination }
                        				</c:if>
                        				<c:if test="${all.air_tripType=='round' }">
                        					${all.air_goOrigin } -> ${all.air_goDestination }<br>
                        					${all.air_backOrigin } -> ${all.air_backDestination }
                        				</c:if>

                        			</td>
                        			<td>
                        				<c:if test="${all.air_payState==1 }">
                        					결제완료
                        				</c:if>
                        				<c:if test="${all.air_payState==2 }">
                        					결제취소
                        				</c:if>
                        				<c:if test="${all.air_payState==3 }">
                        					사용완료
                        				</c:if>
                        			</td>
                        			<td>${all.air_payDate }</td>
                        			<td><a href="airContent.pd?air_bookNum=${all.air_bookNum }"/>${all.air_bookNum }</a></td>
                        		</tr>
                        		</c:forEach>
                        	</tbody>
                        </table>
                       <p style="text-align: center;"> <label>${cancelPages }</label></p>
                        </div><!-- #default4 -->
			<div class="tab-pane fade" id="tab5default">
                        	<div class="box">
										<c:forEach  items="${list}" var="dto">
								<div class="offer offer-radius offer-danger">
									<div class="shape">
										<div class="shape-text">
											PRE								
										</div>
									</div>
									<div class="offer-content" id="boxContent">
										<form name="yeyakDel" action="yeyakDel.pd" method="post">
										<input type="hidden" name="ye_idx" value="${dto.ye_idx}">
											<table class="table-responsive">
											<tr>
												<td text-align="center" rowspan="6" width="200px">
													<img src="${dto.ye_photo}">
												</td>
											</tr>
												<tr>
													<td colspan="3"><h2>${dto.ye_name}</h2></td>
												</tr>
												<tr>
													<td colspan="3">투숙객 ID : ${dto.ye_userid}</td>
												</tr>
												<tr>
													<td>체크인<br>${dto.ye_in}</td> 
													<td>체크아웃<br>${dto.ye_out}</td>
													<td>가격<br>${dto.ye_price}$<br>${dto.ye_price*1134}\</td>
												</tr>
												<tr colspan="3">
													<td colspan="3">무료 wifi </td>
												</tr>
												<tr>
													<td colspan="3">샤워 &bull; 욕조 &bull; 헤어드라이어 &bull; 냉장고 &bull; 업무용 책상 &bull; 화장실 &bull; 욕실 &hellip;</td>
												</tr>
												<tr>
														<td colspan="3" style="text-align:right"><br><input type="submit" value="예약취소"></td>
												</tr>
											</table>	
											</form>
									</div>
								</div>
										</c:forEach>
							</div>
	
                        </div><!-- #default5 :: 호텔내역 -->
                    </div><!-- #PANEL content -->
                    </div>
                </div><!-- #PANEL BODY -->
            </div><!-- #NAV PANDEL -->
        </div><!--  -->
</div><!-- .content -->
	<%@include file="/WEB-INF/views/header.jsp" %>
</div><!-- page-Container -->

</body>
</html>