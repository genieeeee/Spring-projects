<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPlanList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/pd/css/mypage.css">
<link rel="stylesheet" type="text/css" href="/pd/css/plan/planList.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<style type="text/css">


.container {
    padding: 25px;
    position: fixed;
}

.form-login {
    background-color: #EDEDED;
    padding-top: 10px;
    padding-bottom: 20px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 15px;
    border-color:#d2d2d2;
    border-width: 5px;
    box-shadow:0 1px 0 #cfcfcf;
}



.form-control {
    border-radius: 10px;
}

.wrapper {
    text-align: center;
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
.nav > li > a            { background-color: #f5f5f5; color: #676767; border-color: #dddddd; border-width: 1px; padding: 5px 15px; line-height: 2; -webkit-transition: all 0.75s; -moz-transition: all 0.75s; transition: all 0.75s; }} 
.nav > li > a:active      { background-color: #f5f5f5; color: #676767;}
.nav > li > a:focus       { background-color: #f5f5f5; color: #676767;} 
.nav > li > a:hover       { background-color: #eeeeee; color: #676767; border-color: #dddddd;} 

/* active tabs */ 
.nav > li.active > a:hover    {color: #222222;} 



/* buttons */ 
.btn-default.btn-outline:active,
.btn-default.btn-outline:focus, 
.btn-default.btn-outline       { color: #676767; border-color: #676767; background-color: transparent; border-width: 2px; -webkit-transition: all 0.25s; -moz-transition: all 0.25s; transition: all 0.25s;}    
.btn-default.btn-outline:hover    { color: #000000; border-color: #000000; background-color: transparent; border-width: 2px; -webkit-transition: all 0.75s; -moz-transition: all 0.75s; transition: all 0.75s; } 


/* panel buttons */ 
.btn-group button.btn.btn-outline.btn-default          { background-color: #f5f5f5; color: #676767; border-color: #dddddd; border-width: 1px; padding: 5px 15px; line-height: 2; -webkit-transition: all 0.75s; -moz-transition: all 0.75s; transition: all 0.75s; }} 
.btn-group button.btn.btn-outline.btn-default:focus      { background-color: #f5f5f5;} 
.btn-group button.btn.btn-outline.btn-default:active      { background-color: #f5f5f5;}
.btn-group button.btn.btn-outline.btn-default:hover    { background-color: #eeeeee; border-width: 1px; -webkit-transition: all 0.75s; -moz-transition: all 0.75s; transition: all 0.75s; } 

.btn-outline.btn-highlight   { color: #676767; border-color: #676767; background-color: transparent; border-width: 2px;}

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
#gukgi {
 min-height: 40px;
 max-height: 40px;
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
function planUpdateChk(){
   var p=document.planUpdateform;
   var plantitleval=p.plan_title.value;
   var planmemoval=p.plan_memo.value;
   var pbm=document.getElementById('planbtnmoal');
   
   if(plantitleval==null||plantitleval==''){
      pbm.setAttribute('data-target','');
      alert('간단한 여행 설명을 입력해주세요');
      $('#plantitle').focus(); return;
   }else if(planmemoval==null||planmemoval==''){
      pbm.setAttribute('data-target','');
      alert('메모 사항들을 입력해주세요.'); 
      $('#planmemo').focus(); return;
   }else{
      pbm.setAttribute('data-target','#planUpdateModal');
   }
}
function goUpdate(){
   var planF = document.planUpdateform;
   planF.action='planUpdate.pd';
   planF.method='post';
   planF.submit();
}
</script>
</head>
<body>
   <div class="page-container">
      <div class="content">
         <div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
            <div class="col-xs-6 col-xs-offset-3 visible-sm"><%@include
                  file="../mypage/mobileMenu.jsp"%></div>
            <%@include file="../mypage/topMenu.jsp"%>
            <div class="hidden-sm"><%@include file="../mypage/sideMenu.jsp"%></div>
            <!--planlist -->
            <form name="planUpdateform" action="planUpdate.pd" method="post">
            <c:set var="pdto" value="${plandto}"></c:set>
               <input type="hidden" name="plan_idx" value="${pdto.plan_idx }">
               <input type="hidden" name="mem_id" value="${pdto.mem_id}">
               <input type="hidden" name="plan_wrinum" value="${pdto.plan_wrinum}">
               <input type="hidden" name="plan_term" value="${pdto.plan_term}">
               <div class="row">
                  <div class="col-xs-11">
                     <h4 style="border-bottom: 1px solid #c5c5c5;">
                        <i class="glyphicon glyphicon-user"> </i> <b>일정 정보 수정하기</b>
                     </h4>
                     <div class="row" style="text-align: center;">
                        <div class="col-xs-12">
                           <div class="form-login">
                              <h4 style="text-align:left"> ${pdto.plan_term}박 ${pdto.plan_term+1}일 여행 </h4>
                              <span class="form-group"> 
                                 <input type="text" name="plan_title" id="plantitle" class="form-control input-lg" size="73px" value="${pdto.plan_title}" required="required">
                              </span> </br> 
                              <span class="form-group"> 
                                 <textarea name="plan_memo" id="planmemo" class="form-control" rows="3" required="required">${pdto.plan_memo}</textarea>
                              </span> </br> 
                              <span class="form-group">
                              <div class="row">
                                    <div class="col-xs-6">
                                       <select name="plan_sort" class="form-control">
                                          <c:choose>
                                             <c:when test="${pdto.plan_sort eq '자유여행'}">
                                                <option value="자유여행" id="freeP" selected>자유여행</option>
                                                <option value="단체여행" id="teamP" >단체여행</option>
                                             </c:when>
                                             <c:otherwise>
                                                <option value="자유여행" id="freeP" >자유여행</option>
                                                <option value="단체여행" id="teamP" selected>단체여행</option>
                                             </c:otherwise>
                                          </c:choose>
                                       </select>
                                    </div>
                                    
                                    <div class="col-xs-6">
                                   <select name="plan_withwhom" class="form-control">
                                          <option value="가족과함께" id="familyP" <c:if test="${pdto.plan_withwhom eq '가족과함께'}">selected</c:if>>가족과 함께</option>
                                          <option value="친구와함께" id="friendP" <c:if test="${pdto.plan_withwhom eq '친구와함께'}">selected</c:if>>친구와 함께</option>
                                          <option value="지인들과함께" id="acqP" <c:if test="${pdto.plan_withwhom eq '지인들과함께'}">selected</c:if>>지인들과 함께</option>
                                          <option value="나홀로" id="aloneP" <c:if test="${pdto.plan_withwhom eq '나홀로'}">selected</c:if>>나홀로</option>
                                          <option value="커플" id="toP" <c:if test="${pdto.plan_withwhom eq '커플'}">selected</c:if>>커플</option>                                     
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
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-xs-11" style="text-align: center;">
               <button id="planbtnmoal" class="btn btn-primary btn-lg" data-toggle="modal" onclick="planUpdateChk()">
							<i class="fa fa-refresh fa-spin"></i>수정완료</button>
                 </div>
            </div>
            <div class="row">
               <div class="col-xs-11" style="text-align: center;">&nbsp;</div>
            </div>            
            <!-- Modal -->
               <div class="modal fade" id="planUpdateModal" role="dialog">
                    <div class="modal-dialog" id="planSaveModalDialog">
                    <!-- Modal content-->
                     <div class="modal-content">
                        <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                           <h4 class="modal-title"></h4>
                        </div>
                        <div class="modal-body">
                           <p>여행일정을 정말 수정하시겠습니까?</p>
                           <p>저장한 일정은 '마이페이지'에서 확인 할 수 있습니다.</p>
                        </div>
                        <div class="modal-footer">
                           <a href="javascript:goUpdate()"><input type="button" class="btn btn-info" value="확인"></a>
                           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                     </div>
                  </div>
                 </div>
         </div>
      </div>
      <%@ include file="../header.jsp"%>
   </div>
</body>
</html>