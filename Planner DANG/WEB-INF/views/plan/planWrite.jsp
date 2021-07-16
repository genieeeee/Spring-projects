<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>	
<% pageContext.setAttribute("replace", "\n");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPlanContent</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" id="default">
<link rel="stylesheet" type="text/css" href="/pd/css/mypage.css">
<link rel="stylesheet" type="text/css" href="css/plan/planContent.css">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
<style type="text/css">
/**planwrite css*/

/*tab*/
/* links: outlines and underscores */  
a.btn, 			
a.btn:active,	
a.btn:focus, 

button.btn:active, 
button.btn:focus,   
button.btn:active, 
button.btn:focus, 

.dropdown-menu li a,
.dropdown-menu li a:active,
.dropdown-menu li a:focus,
.dropdown-menu li a:hover,

ul.dropdown-menu li a,
ul.dropdown-menu li a:active,
ul.dropdown-menu li a:focus,
ul.dropdown-menu li a:hover,

.nav-tabs li a,
.nav-tabs li a:active,
.nav-tabs li a:focus { outline:0px !important; -webkit-appearance:none;  text-decoration:none; }  

/* panel */ 
.panel {margin-top: 25px;}
.panel .panel-heading { padding: 5px 5px 0 5px;}
.panel .nav-tabs {border-bottom: none;}

/* inactive tabs */ 
.nav > li > a				{ background-color: #f5f5f5; color: #676767; border-color: #dddddd; border-width: 1px; padding: 5px 15px; line-height: 2; -webkit-transition: all 0.75s; -moz-transition: all 0.75s; transition: all 0.75s; }} 
.nav > li > a:active		{ background-color: #f5f5f5; color: #676767;}
.nav > li > a:focus 		{ background-color: #f5f5f5; color: #676767;} 
.nav > li > a:hover 		{ background-color: #eeeeee; color: #676767; border-color: #dddddd;} 

/* active tabs */ 
.nav > li.active > a:hover 	{color: #222222;} 



/* buttons */ 
.btn-default.btn-outline:active,
.btn-default.btn-outline:focus, 
.btn-default.btn-outline 		{ color: #676767; border-color: #676767; background-color: transparent; border-width: 2px; -webkit-transition: all 0.25s; -moz-transition: all 0.25s; transition: all 0.25s;} 	
.btn-default.btn-outline:hover 	{ color: #000000; border-color: #000000; background-color: transparent; border-width: 2px; -webkit-transition: all 0.75s; -moz-transition: all 0.75s; transition: all 0.75s; } 


/* panel buttons */ 
.btn-group button.btn.btn-outline.btn-default 			{ background-color: #f5f5f5; color: #676767; border-color: #dddddd; border-width: 1px; padding: 5px 15px; line-height: 2; -webkit-transition: all 0.75s; -moz-transition: all 0.75s; transition: all 0.75s; }} 
.btn-group button.btn.btn-outline.btn-default:focus		{ background-color: #f5f5f5;} 
.btn-group button.btn.btn-outline.btn-default:active   	{ background-color: #f5f5f5;}
.btn-group button.btn.btn-outline.btn-default:hover 	{ background-color: #eeeeee; border-width: 1px; -webkit-transition: all 0.75s; -moz-transition: all 0.75s; transition: all 0.75s; } 

.btn-outline.btn-highlight	{ color: #676767; border-color: #676767; background-color: transparent; border-width: 2px;}

.display-title { font family: verdana, arial, helvetica; color:#008400;}


ul.nav.nav-tabs li.btn-group.active > a.btn.btn-default
{
border: 1px solid #dddddd;
background-color: #ffffff;
border-right:0px;
margin-right: 0px;
border-bottom: 0px;
}

ul.nav.nav-tabs li.btn-group > a.btn.btn-default
{
border: 1px solid #F5F5F5;
border-right:0px;
margin-right: 0px;
border-bottom: 0px;
}

ul.nav.nav-tabs > li.btn-group.active > a.btn.dropdown-toggle
{
border: 1px solid #dddddd;
background-color: #ffffff;
margin-left: 0px;
border-left:0px;
border-bottom: 0px;
 
}

ul.nav.nav-tabs > li.btn-group > a.btn.dropdown-toggle
{
border: 1px solid #F5F5F5;
margin-left: 0px;
border-left: 0px;
border-bottom: 0px;
}

 ul.nav.nav-tabs li.btn-group a.btn.dropdown-toggle span.caret
{
color: #F5F5F5;
}

 ul.nav.nav-tabs li.btn-group.active > a.btn.dropdown-toggle > span.caret
{
color: #999999;
}
/*자세히 css*/
.message-item {
margin-bottom: 25px;
margin-left: 40px;
position: relative;
}
.message-item .message-inner {
background: #fff;
border: 1px solid #ddd;
border-radius: 3px;
padding: 10px;
position: relative;
}
.message-item .message-inner:before {
border-right: 10px solid #ddd;
border-style: solid;
border-width: 10px;
color: rgba(0,0,0,0);
content: "";
display: block;
height: 0;
position: absolute;
left: -20px;
top: 6px;
width: 0;
}
.message-item .message-inner:after {
border-right: 10px solid #fff;
border-style: solid;
border-width: 10px;
color: rgba(0,0,0,0);
content: "";
display: block;
height: 0;
position: absolute;
left: -18px;
top: 6px;
width: 0;
}
.message-item:before {
background: #fff;
border-radius: 2px;
bottom: -30px;
box-shadow: 0 0 3px rgba(0,0,0,0.2);
content: "";
height: 100%;
left: -30px;
position: absolute;
width: 3px;
}
.message-item:after {
background: #fff;
border: 2px solid #ccc;
border-radius: 50%;
box-shadow: 0 0 5px rgba(0,0,0,0.1);
content: "";
height: 15px;
left: -36px;
position: absolute;
top: 10px;
width: 15px;
}
.clearfix:before, .clearfix:after {
content: " ";
display: table;
}
.message-item .message-head {
border-bottom: 1px solid #eee;
margin-bottom: 8px;
padding-bottom: 8px;
}
.message-item .message-head .avatar {
margin-right: 20px;
}
.message-item .message-head .user-detail {
overflow: hidden;
}
.message-item .message-head .user-detail h5 {
font-size: 16px;
font-weight: bold;
margin: 0;
}
.message-item .message-head .post-meta {
float: left;
padding: 0 15px 0 0;
}
.message-item .message-head .post-meta >div {
color: #333;
font-weight: bold;
text-align: right;
}
.post-meta > div {
color: #777;
font-size: 12px;
line-height: 22px;
}
.message-item .message-head .post-meta >div {
color: #333;
font-weight: bold;
text-align: right;
}
.post-meta > div {
color: #777;
font-size: 12px;
line-height: 22px;
}

#gukgi {
 min-height: 40px;
 max-height: 40px;
}
/*자세한일정버튼*/
.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
.btn-circle.btn-lg {
  width: 50px;
  height: 50px;
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.33;
  border-radius: 25px;
}
.btn-circle.btn-xl {
  width: 70px;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  border-radius: 35px;
}
</style>

<c:if test = "${empty mem_id}">
	<script>
		alert("로그인이 필요한 서비스입니다.");
		location.href='index.pd';
	</script>
</c:if>

<script>
$(function() {
	$('div.product-chooser').not('.disabled').find(
			'div.product-chooser-item').on(
			'click',
			function() {
				$(this).parent().parent().find('div.product-chooser-item')
						.removeClass('selected');
				$(this).addClass('selected');
				$(this).find('input[type="radio"]').prop("checked", true);

			});
});
function planSaveChk(){
	var plansortval=document.planwriform.plan_sort.value;
	var planwithwhomval=document.planwriform.plan_withwhom.value;
	var plantitleval=document.planwriform.plan_title.value;
	var planmemoval=document.planwriform.plan_memo.value;
	var pbm=document.getElementById('planbtnmoal');
	
	if(plantitleval==null||plantitleval==''){
		pbm.setAttribute('data-target','');
		alert('간단한 여행 설명을 입력해주세요');
		$('#plantitle').focus(); return;
	}else if(planmemoval==null||planmemoval==''){
		pbm.setAttribute('data-target','');
		alert('메모 사항들을 입력해주세요.'); 
		$('#planmemo').focus(); return;
	}else if(plansortval=='여행종류'){
		pbm.setAttribute('data-target','');
		alert('여행종류를 선택해주세요');return;
	}else if(planwithwhomval=='누구와'){
		pbm.setAttribute('data-target','');
		alert('누구와 함께 여행하는 지 선택해주세요');return;
	}else{
		pbm.setAttribute('data-target','#planSaveModal');
	}
}
function planSave(){
	var f = document.planwriform;
	f.submit();
}
function calDetail(event_id,plan_wrinum,mem_id,cal_nation){
	var collapse=eval("document.getElementById('calDetailW"+event_id+"')");
	var params='event_id='+event_id+'&plan_wrinum='+plan_wrinum+'&mem_id='+mem_id+'&cal_nation='+cal_nation;
	sendRequest('calDetail.pd',params,calDetailResult,'POST');
	function calDetailResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var content=XHR.responseText;
			collapse.innerHTML=content;
		}
	}
}
</script>

</head>
<body >
	<div class="page-container">
		<div class="content">
			<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
				<div class="col-xs-6 col-xs-offset-3 visible-sm"><%@include
						file="../mypage/mobileMenu.jsp"%></div>
				<%@include file="../mypage/topMenu.jsp"%>
				<div class="hidden-sm"><%@include file="../mypage/sideMenu.jsp"%></div>
				<!--planwrite -->
				<form name="planwriform" action="planwriok.pd" method="POST">
					<input type="hidden" name="mem_id" value="${mem_id}">
					<input type="hidden" name="plan_wrinum" value="${plan_wrinum}">
					<input type="hidden" name="plan_term" value="${totalterm1}">
					<div class="row">
						<div class="col-xs-11">
							<h4 style="border-bottom: 1px solid #c5c5c5;">
								<i class="glyphicon glyphicon-user"> </i> <b>내 일정 만들기</b>
							</h4>
							<div class="row" style="text-align: center;">
								<div class="col-xs-12">
									<div class="form-login">
										<h4 style="text-align:left"> ${totalterm1}박 ${totalterm2}일  여행 </h4>
										<span class="form-group"> 
											<input type="text" name="plan_title" id="plantitle" class="form-control input-lg" size="73px" placeholder="여행 글 제목을 간단히 입력해주세요. ex)유럽 여행 " autocomplete="off" required="required">
										</span> </br> 
										<span class="form-group"> 
											<textarea name="plan_memo" id="planmemo" class="form-control" rows="3" placeholder="메모 사항을 남겨주세요.1000자이하" autocomplete="off" required="required" maxlength="1000" style="resize: none;"></textarea>
										</span> </br> 
										<span class="form-group">
											<div class="row">
												<div class="col-xs-6">
													<select name="plan_sort" class="form-control">
														<option value="자유여행" id="freeP">자유여행</option>
														<option value="단체여행" id="teamP">단체여행</option>
													</select>
												</div>
												<div class="col-xs-6">
													<select name="plan_withwhom" class="form-control">
														<option value="가족과 함께" id="familyP">가족과 함께</option>
														<option value="친구와  함께" id="friendP">친구와 함께</option>
														<option value="지인들과 함께" id="acqP">지인들과 함께</option>
														<option value="나홀로 " id="aloneP">나홀로</option>
														<option value="커플" id="toP">커플</option>
													</select>
												</div>
											</div> 
										</span></br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				
				<!-- calendar & map & detail plan  -->
				<div class="row">
					<div class="col-xs-11">
						<div class="panel panel-default panel-fade">
							<div class="panel-heading">
								<span class="panel-title">
									<div class="pull-left">
										<ul class="nav nav-tabs">
											<li class="active">
												<a href="#letters" data-toggle="tab">캘린더</a>
											</li>
											<li>
												<a href="#loglist" data-toggle="tab">자세히</a>
											</li>
										</ul>
									</div>
									<div class="btn-group pull-right">
										<div class="btn-group">
											<a href="#" class="btn  dropdown-toggle"
												data-toggle="dropdown"> <span
												class="glyphicon glyphicon-cog"></span>
											</a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Action 1</a></li>
												<li><a href="#">Action 2</a></li>
												<li class="divider"></li>
												<li><a href="#">Another Action</a></li>
											</ul>
										</div>
									</div>
									<div class="clearfix"></div>
								</span>
							</div>
							<div class="panel-body">
								<div class="tab-content">
									<div class="tab-pane fade in active" id="letters">
										<div style="text-align:center;">
											<div class="col-xs-6">${calendar}</div>
											<!-- <div class="col-xs-6"><img src="img/plan/기본지도.PNG" style="width:640px;height:585px;padding-top:60px;"></div> -->
										</div>
									</div>

									<div class="tab-pane fade" id="loglist">
										<c:forEach var="callist" items="${callist}">
												<div class="qa-message-list" id="wallmessages">
													<div class="message-item" id="m16">
														<div class="message-inner">
															<div class="message-head clearfix">
																<div class="avatar pull-left">
																	<img id="gukgi" src="/pd/img/plan/gukgi/${callist.cal_nation}.PNG">
																</div>
																<div class="user-detail">
																	<h5 class="handle">${callist.cal_nation }</h5>
																	<div class="post-meta">
																		<div class="asker-meta">
																		<c:set var="psd" value="${callist.cal_startdate}" />
																		<c:set var="psd" value="${callist.cal_enddate}" />
																			<span class="qa-message-when"> 
																			<span class="qa-message-when-data">
																			${fn:substring(psd,0,11)} ${callist.cal_startday}~${fn:substring(psd,0,11)}${callist.cal_endday}</span>
																			</span>
																		</div>
																	</div>
																	<c:set var="datatarget" value="#calDetailW${callist.event_id}" />
																	<c:set var="collapse" value="calDetailW${callist.event_id}" />
																	<div style="text-align:right;">자세한 일정
																	<button type="button" style="background-color:#337ab7;"class="btn btn-info btn-circle" data-toggle="collapse" data-target="${datatarget}" onclick="calDetail(${callist.event_id}, ${callist.plan_wrinum},'${callist.mem_id}','${callist.cal_nation}')"><b>↓</b></button>
																	</div>
																</div>
															
															</div>
															<div class="qa-message-content">
															<div id="${collapse}" class="collapse"></div>
															</div>
														</div>
													</div>
												</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- button  -->
				<div class="row">
					<div class="col-xs-11" style="text-align:center;">
						<button id="planbtnmoal" class="btn btn-primary btn-lg" data-toggle="modal" onclick="planSaveChk()">
							<i class="fa fa-refresh fa-spin"></i>일정저장</button>
					</div>
					<div class="modal fade" id="planSaveModal" role="dialog">
  					<div class="modal-dialog" id="planSaveModalDialog">
  						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title"></h4>
							</div>
							<div class="modal-body">
								<p>여행일정을 정말 저장하시겠습니까?</p>
								<p>저장한 일정은 '마이페이지'에서 확인 할 수 있습니다.</p>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-info" value="확인" onclick="planSave()">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
  				</div>
				</div>	
				</div>				
				<div class="row">
					<div class="col-xs-11">&nbsp;</div>	
				</div>							
			</div>
		<%@ include file="../header.jsp"%>
	</div>
</body>
</html>