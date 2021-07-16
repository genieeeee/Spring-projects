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


<style type="text/css">
/**planInfo css*/
/* Portlet */
.portlet {
	background: #fff;
	padding: 20px;
	border:1px solid #e1e1e1;
}

.portlet.portlet-gray {
	background: #f7f7f7;
}

.portlet.portlet-bordered {
	border: 1px solid #eee;
}

/* Portlet Title */
.portlet-title {
	padding: 0;
  	min-height: 40px;
  	border-bottom: 1px solid #eee;
  	margin-bottom: 18px;
}

.caption {
	float: left;
	display: inline-block;
	font-size: 18px;
	line-height: 18px;
}

.caption.caption-green .caption-subject,
.caption.caption-green i {
	color: #4db3a2;
	font-weight: 200;
}

.caption.caption-red .caption-subject,
.caption.caption-red i {
	color: #e26a6a;
	font-weight: 200;
}

.caption.caption-purple .caption-subject,
.caption.caption-purple i {
	color: #8775a7;
	font-weight: 400;
}

.caption i {
	color: #777;
	font-size: 15px;
	font-weight: 300;
	margin-top: 3px;
}

.caption-subject {
	color: #666;
	font-size: 16px;
	font-weight: 600;
}

.caption-helper {
	padding: 0;
	margin: 0;
	line-height: 13px;
	color: #9eacb4;
	font-size: 13px;
	font-weight: 400;
}


/* Tab */
.portlet-title > .nav-tabs {
	background: none;
	margin: 0;
	float: right;
	display: inline-block;
	border: 0;
}

.portlet-title > .nav-tabs > li {
	background: none;
	margin: 0;
	border: 0;
}

.portlet-title > .nav-tabs > li > a {
	background: none;
	border: 0;
	padding: 2px 10px 13px;
	color: #444;
}

.portlet-title > .nav-tabs > li.active,
.portlet-title > .nav-tabs > li.active:hover {
  	border-bottom: 4px solid #f3565d;
  	position: relative;
  }

  .portlet-title > .nav-tabs > li:hover {
  	border-bottom: 4px solid #f29b9f;
  }

.portlet-title > .nav-tabs > li.active > a,
.portlet-title > .nav-tabs > li:hover > a {
	color: #333;
	background: #fff;
	border: 0;
}
/**planInfo memo*/
.shape{	
	border-style: solid; border-width: 0 70px 40px 0; float:right; height: 0px; width: 0px;
	-ms-transform:rotate(360deg); /* IE 9 */
	-o-transform: rotate(360deg);  /* Opera 10.5 */
	-webkit-transform:rotate(360deg); /* Safari and Chrome */
	transform:rotate(360deg);
}
.offer{
	background:#fff; border:1px solid #ddd; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); margin: 15px 0; overflow:hidden;
}
.offer-radius{
	border-radius:7px;
}
.offer-danger {	border-color: #d9534f; }
.offer-danger .shape{
	border-color: transparent #d9534f transparent transparent;
	border-color: rgba(255,255,255,0) #d9534f rgba(255,255,255,0) rgba(255,255,255,0);
}
.offer-success {	border-color: #5cb85c; }
.offer-success .shape{
	border-color: transparent #5cb85c transparent transparent;
	border-color: rgba(255,255,255,0) #5cb85c rgba(255,255,255,0) rgba(255,255,255,0);
}
.offer-default {	border-color: #999999; }
.offer-default .shape{
	border-color: transparent #999999 transparent transparent;
	border-color: rgba(255,255,255,0) #999999 rgba(255,255,255,0) rgba(255,255,255,0);
}
.offer-primary {	border-color: #428bca; }
.offer-primary .shape{
	border-color: transparent #428bca transparent transparent;
	border-color: rgba(255,255,255,0) #428bca rgba(255,255,255,0) rgba(255,255,255,0);
}
.offer-info {	border-color: #5bc0de; }
.offer-info .shape{
	border-color: transparent #5bc0de transparent transparent;
	border-color: rgba(255,255,255,0) #5bc0de rgba(255,255,255,0) rgba(255,255,255,0);
}
.offer-warning {	border-color: #f0ad4e; }
.offer-warning .shape{
	border-color: transparent #f0ad4e transparent transparent;
	border-color: rgba(255,255,255,0) #f0ad4e rgba(255,255,255,0) rgba(255,255,255,0);
}

.shape-text{
	color:#fff; font-size:12px; font-weight:bold; position:relative; right:-40px; top:2px; white-space: nowrap;
	-ms-transform:rotate(30deg); /* IE 9 */
	-o-transform: rotate(360deg);  /* Opera 10.5 */
	-webkit-transform:rotate(30deg); /* Safari and Chrome */
	transform:rotate(30deg);
}	
.offer-content{
	padding:0 20px 10px;
}
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
#scheduler_here.dhx_cal_container.dhx_scheduler_month {
	width:200px;
}
</style>


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
function calDetail(event_id,plan_wrinum,mem_id,cal_nation){
	var collapse=eval("document.getElementById('calDetail"+event_id+"')");
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
				<!--plancontent -->
				<!-- PlanInfo-->
				<div class="row">
					<div class="col-xs-11">
						<div class="portlet">
							<div class="portlet-title">
								<div class="caption">
									<i class="glyphicon glyphicon-calendar"></i>
									<c:set var="pdto" value="${plandto}"></c:set>
									<span class="caption-subject text-uppercase">PlanInfo</span> <span
										class="caption-helper"> </span>
								</div>
							</div>
							<div class="portlet-body">
								<p>
									<b>${pdto.plan_term}박 ${pdto.plan_term+1}일 여행</b>
								</p>
								<c:set var="psd" value="${planstartdate }" />
								<c:set var="ped" value="${planenddate }" />
								<p id="pfont">여행 전&nbsp;&nbsp;|&nbsp;&nbsp;${pdto.plan_sort}&nbsp;&nbsp;|&nbsp;&nbsp;${pdto.plan_withwhom}</p>
								<p id="pfont">여행 시작일&nbsp;&nbsp;:&nbsp;${fn:substring(psd,0,11)}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;여행 마지막일 &nbsp;:&nbsp;${fn:substring(ped,0,11)}</p>
								<p id="pfont">처음 만든 날&nbsp;:&nbsp;${pdto.plan_wridate}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;마지막 수정 한 날&nbsp;:&nbsp;${pdto.plan_wriupdate}&nbsp;&nbsp;|&nbsp;&nbsp;조회수&nbsp;:&nbsp;${pdto.plan_readnum}</p>
							</div>
						</div>
					</div>
				</div>
				<!--planMemo  -->
				<div class="row">
					<div class="col-xs-11">	
						<div class="panel panel-default"><div class="panel-body">${fn:replace(pdto.plan_memo,replace,"</br>")}</div></div>
					</div>
				</div>
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
										<!-- 	<div class="col-xs-6"><img src="img/plan/기본지도.PNG" style="width:640px;height:585px;padding-top:60px;"></div>
										 --></div>
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
																	<c:set var="datatarget" value="#calDetail${callist.event_id}" />
																	<c:set var="collapse" value="calDetail${callist.event_id}" />
																	<div style="text-align:right;">자세한 일정
																	<button type="button" style="background-color:#337ab7;" class="btn btn-info btn-circle" data-toggle="collapse" data-target="${datatarget}" onclick="calDetail(${callist.event_id}, ${callist.plan_wrinum},'${callist.mem_id}','${callist.cal_nation}')"><b>↓</b></button>
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
					<div class="col-xs-11" style="text-align: center;">
						<c:url var="planUpdate" value="planUpdate.pd">
							<c:param name="plan_idx">${pdto.plan_idx}</c:param>
							<c:param name="plan_wrinum">${pdto.plan_wrinum}</c:param>
							<c:param name="mem_id">${pdto.mem_id}</c:param>
						</c:url>
						<%-- <a href="${planUpdate}"><button type="button" class="btn btn-danger" data-dismiss="modal">일정수정</button></a> --%>
						<c:if test="${mem_ids eq mem_id}">
							<a class="btn icon-btn btn-info" href="${planUpdate}" data-dismiss="modal"><span class="glyphicon btn-glyphicon glyphicon-share img-circle text-info"></span>일정수정</a>
							<a class="btn icon-btn btn-danger" data-toggle="modal" data-target="#planDel"><span class="glyphicon btn-glyphicon glyphicon-trash img-circle text-danger"></span>일정삭제</a>							
						</c:if>
							<!-- <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#planDel">일정삭제</button> -->
							<!-- planDelModal -->
							<div class="modal fade" id="planDel" role="dialog">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title"></h4>
										</div>
										<div class="modal-body">
											<p style="text-align: center;">정말 일정을 삭제하시겠습니까?</p>
										</div>
										<div class="modal-footer">
											<c:url var="planDelete" value="planDelete.pd">
												<c:param name="plan_idx">${pdto.plan_idx}</c:param>
												<c:param name="plan_wrinum">${pdto.plan_wrinum}</c:param>
												<c:param name="mem_id">${pdto.mem_id}</c:param>
											</c:url>
											<a href="${planDelete}"><input type="button"
												class="btn btn-info" value="확인"></a>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
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