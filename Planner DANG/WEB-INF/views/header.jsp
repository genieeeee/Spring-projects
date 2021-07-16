<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- Modal View Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>

.styleChat {
    height: 0;
    width: 350px;
    position: fixed;
    z-index: 1000;
    bottom: 0;
    right: 12%;
    background-color: #F5F5F5;
    overflow-x: hidden;
    transition: 0.5s;
}

.styleChat a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}
.closebtn2 {
    position: absolute;
    top: 0;
    right: 5;
    font-size: 36px !important;
    margin-left: 30px;
}
hr.animated-gradient {
   background-color: #835823;
}
</style>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/planner/planner.js"></script>

<!-- 구글번역 -->
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'ko', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script>
function showTrans(){
	$('#google_translate_element').show();
}
</script>

<script>
var toggle = true;
$(document).ready(function (){
	    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
	    $('#footerText').css("display","none");
	$(".sidebar-icon").click(function() {                
	  if (!toggle){
		$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
	    $("#menu span").css({"position":"absolute"});
	    $('#footerText').css("display","none");
	  }
	  else {//open SideMenu
	    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
	    $('#footerText').css("display","");
	    setTimeout(function() {
	      $("#menu span").css({"position":"relative"});
	    }, 400);
	  }
	                
	toggle = !toggle;

	});
});


	function login() {
		var popupX= (window.screen.width / 2) - (280/2);
		var popupY= (window.screen.height / 2) - (500/2);
		window.open('memLogin.pd', 'login', 'width=280, height=350, left='+popupX+', top='+popupY+', screenX='+popupX+', screenY='+popupY);
	}
	
	
	/*Chat Function*/
	 var wsocket;
	   
	 function chatToServer(mem_id) {   
	      var params="mem_id="+mem_id;
	      sendRequest('chatMain.pd',params,chatFromServer,'POST');   
	      
	   }
	   
	   function chatFromServer(){
	      if(XHR.readyState == 4 && XHR.status ==200){
	         
	    	 //wsocket = new WebSocket("ws://192.168.20.46:9090/pd/chat/chat-ws");
	         wsocket = new WebSocket("ws://192.168.20.49:9090/pd/chat/chat-ws");
	         //wsocket = new WebSocket("ws://localhost:9090/pd/chat/chat-ws");
	         var data=XHR.responseText;
	         document.getElementById("chatMain").innerHTML='<a href="javascript:void(0)" class="closebtn2" onclick="closeChat()">x</a><br><br><hr class="animated-gradient">'+data;
	         document.getElementById("chatMain").style.height = "50%";
	         
	      }
	   }
	   
	   function chatContentToServer(mem, user){
	      var params="mem_id="+mem+"&user_id="+user;
	      sendRequest('chat-ws.pd',params,chatContentFromServer,"POST");
	      
	   }
	   
	   function chatContentFromServer(){
	      if(XHR.readyState == 4 && XHR.status == 200){
	         
	         var data=XHR.responseText;
	         document.getElementById("chatMain").innerHTML=data;
	         document.getElementById("chatMain").style.height = "50%";
	         $("#message").focus();
	      	
	         setTimeout("txtState()",2000);
	      }
	   }
	   
	   function txtState(){
	      var mem=document.all.real_id.value;
	      var user=document.all.user_id.value;
	      if($("#message").val() == ''){
	         chatContentToServer(mem, user);
	      }
	   }
	   
	   function disconnect(mem_id) {
	      chatToServer(mem_id);
	      wsocket.close();
	   }

	   function goSend(mem_id, user_id, real_id) {

	      if (event.keyCode == 13) {
	         var msg = document.chatws.message.value;
	         if (msg.length > 0) {
	            return send(mem_id, user_id, real_id);
	         }
	      }
	   }
	   
	   function send(mem_id, user_id, real_id) {
	      
	   
	      var msg = $("#message").val();
	      if (msg.length > 0) {
	         wsocket.send(real_id + "," + mem_id + "," + user_id + "," + msg);
	      }
	         chatContentToServer(mem_id, user_id);
	   }

	   function closeChat() {
	      document.getElementById("chatMain").style.height = "0";
	   }
	   function openBot() {
	      document.getElementById("chatBot").style.height = "50%";
	   }
	   function closeBot() {
	      document.getElementById("chatBot").style.height = "0";
	   }
	   /************PLANNER FUNCTION*******************************/
		var bucket; 		//플래너 ui
		var bucketform; 	//플래너 ui안에 전체div
		var sPlan;			//사용메뉴얼,플래너시작, 일정담기 session값
		var baseplan;		//기본 전체 예시 폼
		var view=1;			//플래너 열고 닫기


		/**PLANNER OPEN CLOSE FUNCTION*/
		function closePlaner() {
		    document.getElementById("myPlaner").style.height = "0";
		   // document.getElementById("main").style.marginLeft= "0";
		}
		/**BEFORE GETTING START CANLENDAR*/
		 function planStart(){
		 	var start=confirm("플래너를 시작하시겠습니까?");
		 	if(start==true){
		 		location.href="pStart.pd";
		 	}else{
		 		document.getElementById("myPlaner").style.height = "0%";
		 		view=1;
		 	}
		 }
		function openPlaner() {
			sPlan='${sessionScope.sPlan}'; 
		    bucket=document.getElementById('planbucket'); 
		  	bucketform=document.getElementById('planbucketForm');
		  	//sPlan='사용메뉴얼';//${sessionScope.sPlan} 
		  	
		  	view=view*(-1);
		  	if(view==-1){
		  		document.getElementById("myPlaner").style.height = "60%";
		  	}else if(view==1){
		  		document.getElementById("myPlaner").style.height = "0%";
		  	}
		  	switch(sPlan){
		  		case '사용메뉴얼':document.getElementById('plancheck').style.display='none';plan(sPlan);break;
		  		case '플래너시작':plan(sPlan);break;
		  	}
		}
		function plan(sPlan){//플래너 버튼 누른 후 폼 결정	
		   	if(sPlan=='사용메뉴얼'){		
		   		sendRequest('manual.pd',null,showManual,'GET');  				
		   	}else if(sPlan=='플래너시작'){
		   		sendRequest('planAdd.pd',null,showManual,'GET');
		   		document.getElementById('plancheck').style.display='block';
		   	}
		 }
		
		function showManual(){												//manual & baseplan 폼 불러옴
		  	if(XHR.readyState==4&&XHR.status==200){
		 		var bucketform=document.getElementById('planbucketForm');
			 	var content=XHR.responseText;
			 	bucketform.innerHTML=content;
		  	}
		 }
		/**PLANNER ADD FUNCTION :: GETTING START*/
		   var nsv=0;
		   var asv=0;
		   var count=0
		   function planAdd(pr,naraName,areaName,touristName,lat,lng){
			  var mem_id= '${sessionScope.mem_id}';
			  if(mem_id==''){
				 	var add=confirm("로그인이 필요한 서비스입니다.");
				 	if(add==true){
				 		login();
				 	}else{
				 		document.getElementById("myPlaner").style.height = "0%";
				 		view=1;
				 	}
			  }else{
				  
			      sPlan='플래너시작';/*${sessionScope.sPlan}  */
			      if(sPlan=='플래너시작'){
			         document.getElementById("myPlaner").style.height = "60%";
			         
			         bucketform=document.getElementById('planbucketForm');
			         
			         var get_naraText=$('#'+naraName+nsv).attr('value'); 
			         var get_areaText=$('#'+areaName+(asv-1)).attr('value');
			          
			         sendRequest('planAdd.pd',null,show,'GET');
			         if(nsv==0 && asv==0){//처음 시작
			            console.log('처음 시작');
			         
			            document.all.nsvValue =nsv;
			            document.getElementById('arrayStep').value=asv;
			            
			            narabucket(nsv,naraName,lat,lng);
			            areabucket(count,nsv,asv,areaName,naraName,lat,lng); count++;
			            touristbucket(count,nsv,asv,touristName,naraName,areaName,lat,lng); asv++;
			            document.getElementById('count').value=count;
			            
			            pr.value='-';
			  	      	pr.setAttribute('onclick','planDelete(this,"'+naraName+'","'+areaName+'","'+touristName+'","'+lat+'","'+lng+'")');
			         }else{
				            if(get_naraText==naraName){
				               console.log('나라가같다');
				               if(get_areaText==areaName){            //0 idx
				                  console.log('지역이 같다');
				               
				                  count=document.getElementById('count').value;count++;
				                  touristbucket(count,nsv,asv,touristName,naraName,areaName,lat,lng);
				                  document.getElementById('arrayStep').value=asv; asv++;
				                  document.getElementById('count').value=count;
				                  
				                  pr.value='-';
				        	      pr.setAttribute('onclick','planDelete(this,"'+naraName+'","'+areaName+'","'+touristName+'","'+lat+'","'+lng+'")');
				        	      
				                  return;
				               }else if(get_areaText!=areaName){
				                  console.log('나라는 같지만 지역이 달라');
				                  count=document.getElementById('count').value; count++;
				                  areabucket(count,nsv,asv,areaName,naraName,lat,lng); count++;
				                  touristbucket(count,nsv,asv,touristName,naraName,areaName,lat,lng);
				                  document.getElementById('arrayStep').value=asv; asv++;
				                  document.getElementById('count').value=count;
				                  
				                  pr.value='-';
				        	      pr.setAttribute('onclick','planDelete(this,"'+naraName+'","'+areaName+'","'+touristName+'","'+lat+'","'+lng+'")');
				                  return;
				               }
				            }else{
				               console.log('새로운 나라');
				               nsv++;
				               document.all.nsvValue =nsv;
				               asv=0;
				               narabucket(nsv,naraName,lat,lng);
				               count=document.getElementById('count').value; count++
				               areabucket(count,nsv,asv,areaName,naraName,lat,lng); count++;
				               touristbucket(count,nsv,asv,touristName,naraName,areaName,lat,lng);
				               document.getElementById('arrayStep').value=asv; asv++;
				               document.getElementById('count').value=count;
				               
				               pr.value='-';
				     	       pr.setAttribute('onclick','planDelete(this,"'+naraName+'","'+areaName+'","'+touristName+'","'+lat+'","'+lng+'")');
				            }
			         }
			      }else{
			         alert('사용메뉴얼을 읽고 플래너시작버튼을 눌러주세요.');
			      }
			  }
			   
		         
		   }

		/**빈bucket*/
		function show() {
			if (XHR.readyState == 4 && XHR.status == 200) {
				var planempty = document.getElementById('planempty');
				var content = XHR.responseText;
				planempty.innerHTML = content;
			}
		}
		function narabucket(nsv, naraName, lat, lng) {//나라담기
			var naraDiv = document.createElement('div');

			naraDiv.setAttribute('id', naraName + 'plan');
			naraDiv.setAttribute('class', 'row');
			naraDiv.style.border.radius = '15px';
			//naraDiv.style.border='1px solid #e1e1e1';
			naraDiv.style.padding = '25px';

			naraDiv.innerHTML += "<div id='"+naraName+"div' class='col-xs-12' style='font-size:15px;border:2px solid #e1e1e1;padding:3px;'>"
									+ "<div style='border-bottom:1px solid #e1e1e1;'>"
										+ "<img src='/pd/img/plan/gukgi/"+naraName+".PNG'>"
										+ "<input type='text' name='calendaritem["+nsv+"].cal_nation' id='"+naraName+nsv+"' value='"+naraName+"' style='border:none'>"
									+ "</div>"
									+ "<div style='font-size:13px;text-align:center;'>"
										+ "<div><span>머물날짜</span></div>"
										+ "<div><input type='date' name='calendaritem["+nsv+"].cal_startdate' onblur='checkDay(this)' required='required'><input type='text' name='calendaritem["+nsv+"].cal_startday' style='border:none;width:25px;'></div>"
										+ "<div><input type='date' name='calendaritem["+nsv+"].cal_enddate' onblur='checkDay(this)' required='required'><input type='text' name='calendaritem["+nsv+"].cal_endday' style='border:none;width:25px;'></div></br>"
									+ "<input type='hidden' name='calendaritem["+nsv+"].lat' value='"+lat+"'>"
									+ "<input type='hidden' name='calendaritem["+nsv+"].lng' value='"+lng+"'>"
									+ "<input type='hidden' name='nsvValue'>";
								+"</div><br>"

			bucketform.appendChild(naraDiv);
		}

		function areabucket(count, nsv, asv, areaName, naraName, lat, lng) {//지역담기
			var areaDiv = document.createElement('div');
			areaDiv.setAttribute('class', 'col-xs-12');
			areaDiv.setAttribute('id', areaName + 'plan');
			areaDiv.style.border.radius = '15px';
			//areaDiv.style.border='1px solid #e1e1e1';

			areaDiv.innerHTML += "<div id='"+areaName+"' style='border:1px solid #e1e1e1;'>"
									+ "<div style='font-size:13px;text-align:center;border-bottom:1px solid #e1e1e1;padding:3px;'>"
										+ "<input type='text' name='calendardetailitem["+count+"].cald_place' id='"+areaName+asv+"' value='"+areaName+"' style='border:none'>"
									+ "</div><br>"
									+ "<div style='font-size:13px;text-align:center;border-bottom:1px solid #e1e1e1;'>"
										+ "<div><input type='date' name='calendardetailitem["+count+"].cald_startdate' onblur='checkDay(this)' required='required'><input type='text' name='calendardetailitem["+count+"].cald_startday' style='border:none;width:25px;'></div>"
										+ "<div><input type='date' name='calendardetailitem["+count+"].cald_enddate' onblur='checkDay(this)' required='required'><input type='text' name='calendardetailitem["+count+"].cald_endday' style='border:none;width:25px;'></div></br>"
									+ "</div><br>"
									+ "<input type='hidden' name='calendardetailitem["+count+"].cald_nara' value='"+naraName+"'>" //2번째 나라
									+ "<input type='hidden' name='calendardetailitem["+count+"].cald_area' value='"+areaName+"'>"
									+ "<input type='hidden' name='calendardetailitem["+count+"].lat' value='"+lat+"'>"
									+ "<input type='hidden' name='calendardetailitem["+count+"].lng' value='"+lng+"'>";
								+"</div><br>"

			var get_naraPlan = eval("document.getElementById('"+naraName+"div')");
			get_naraPlan.appendChild(areaDiv);

		}

		function touristbucket(count, nsv, asv, touristName, naraName, areaName,lat, lng) {//명소 담기
			asv++;
			var toDiv = document.createElement('div');
			toDiv.setAttribute('id', touristName + 'div');
			toDiv.style.border.top = '1px solid #e1e1e1';

			toDiv.innerHTML += "<div id='"+areaName+asv+"div' style='text-align:center;font-size:13px;'>"
								+ "<div style='text-align:center;'><span>#<input type='text' name='calendardetailitem["+count+"].cald_place' id='"+touristName+"' value='"+touristName+"'readonly style='border:none'><span>"
									+ "<input type='date' name='calendardetailitem["+count+"].cald_startdate' id='명소s날짜"+count+"' onblur='checkToDay(this,"+count+")' required='required'><input type='text' name='calendardetailitem["+count+"].cald_startday' id='명소s요일"+count+"' style='border:none;width:25px;'>"
									+ "<input type='date' name='calendardetailitem["+count+"].cald_enddate' id='명소e날짜"+count+"' required='required'><input type='text' name='calendardetailitem["+count+"].cald_endday' id='명소e요일"+count+"'style='border:none;width:25px;'>"
								+ "</div><br>"
					+ "<input type='hidden' name='calendardetailitem["+count+"].cald_nara' value='"+naraName+"'>" 
					+ "<input type='hidden' name='calendardetailitem["+count+"].cald_area' value='"+areaName+"'>"
					+ "<input type='hidden' name='calendardetailitem["+count+"].lat' value='"+lat+"'>"
					+ "<input type='hidden' name='calendardetailitem["+count+"].lng' value='"+lng+"'>";
			+"</div></br>"

			var get_areaDiv = eval("document.getElementById('" + areaName + "')");
			get_areaDiv.appendChild(toDiv);
			document.getElementById('arrayStep').value = asv;
		}

		function checkToDay(pr, asv) {
			var toSdate = eval("document.getElementById('명소s날짜" + count + "')");
			var toEdate = eval("document.getElementById('명소e날짜" + count + "')");

			var toSday = eval("document.getElementById('명소s요일" + count + "')");
			var toEday = eval("document.getElementById('명소e요일" + count + "')");

			toEdate.value = pr.value;

			var dateVal = pr.value;

			if (dateVal != '' && dateVal != null) {
				var year = parseInt(dateVal.substring(0, 4), 10);
				var mon = parseInt(dateVal.substring(5, 7), 10);
				var day = parseInt(dateVal.substring(8, 10), 10);
				var cdate = new Date(year, mon - 1, day);
				var weekNum = cdate.getDay();

				toSday.value = "(" + week(weekNum) + ")";
				toEday.value = "(" + week(weekNum) + ")";
			}
		}
		/*일정빼기*/
		function planDelete(pr, naraName, areaName, touristName, lat, lng) {
			console.log('명소삭제fun');
			var areaDiv = eval("document.getElementById('" + areaName + "')");
			var toriDiv = eval("document.getElementById('" + touristName + "div')");
			areaDiv.removeChild(toriDiv);
			count--;
			document.getElementById('count').value = count;
			pr.value = '+';
			if (touristName == '런던아이') {
				pr.setAttribute('onclick',
						'planAdd(this,\'영국\',\'런던\',\'런던아이\',54.8,-4.6)');
			} else if (touristName == '셜록홈즈박물관') {
				pr.setAttribute('onclick',
						'planAdd(this,\'영국\',\'런던\',\'셜록홈즈박물관\',54.8,-4.6)');
			} else if (touristName == '맨체스터FootballMuseum') {
				pr
						.setAttribute('onclick',
								'planAdd(this,\'영국\',\'맨체스터\',\'맨체스터FootballMuseum\',54.8,-4.6)');
			} else if (touristName == '시티오브맨체스터스타디움') {
				pr.setAttribute('onclick',
						'planAdd(this,\'영국\',\'맨체스터\',\'시티오브맨체스터스타디움\',54.8,-4.6)');
			} else if (touristName == '에펠탑') {
				pr.setAttribute('onclick',
						'planAdd(this,\'프랑스\',\'파리\',\'샹 젤리제 거리\',54.8,-4.6)');
			} else if (touristName == '레푸블리카 광장') {
				pr.setAttribute('onclick',
						'planAdd(this,\'이탈리아\',\'로마\',\'레푸블리카 광장\',41.9,12.6)');
			} else if (touristName == '플로렌스') {
				pr.setAttribute('onclick',
						'planAdd(this,\'이탈리아\',\'피렌체\',\'플로렌스\',54.8,-4.6)');
			} else if (touristName == '두오모 성당') {
				pr.setAttribute('onclick',
				'planAdd(this,\'이탈리아\',\'밀라노\',\'두오모 성당\',54.8,-4.6)');
			} 
			else if (touristName == '푸오클라 수를레이') {
				pr
						.setAttribute('onclick',
								'planAdd(this,\'스위스\',\'루체른\',\'푸오클라 수를레이\',46.822399,8.223952999999938)');
			} else if (touristName == '스위스국립 박물관') {
				pr
						.setAttribute('onclick',
								'planAdd(this,\'스위스\',\'취리히\',\'스위스국립 박물관\',46.822399,8.223952999999938)');
			}else if (touristName == '스위스 연방 궁전') {
				pr
				.setAttribute('onclick',
						'planAdd(this,\'스위스\',\'베른\',\'스위스 연방 궁전\',46.822399,8.223952999999938)');
			} else if (touristName == '똘레도') {
				pr
						.setAttribute(
								'onclick',
								'planAdd(this,\'스페인\',\'똘레도\',\'똘레도\',40.4417819,-3.7536662999999635)');
			} else if (touristName == '사그라다 파밀리아') {
				pr
						.setAttribute('onclick',
								'planAdd(this,\'스페인\',\'바르셀로나\',\'사그라다 파밀리아\',40.4417819,-3.7536662999999635)');
			}else if (touristName == '마드리드광장') {
					pr
							.setAttribute('onclick',
									'planAdd(this,\'스페인\',\'마드리드\',\'마드리드광장\',40.4115165,-3.707644500000015)');
			}else if (touristName == '붉은광장') {
				pr
						.setAttribute('onclick',
								'planAdd(this,\'러시아\',\'모스크바\',\'붉은광장\',55.754136,37.620774)');
			}else if (touristName == '크렘린 궁전') {
				pr
				.setAttribute('onclick',
						'planAdd(this,\'러시아\',\'모스크바\',\'붉은광장\',55.754136,37.620774)');
			}	

		}
		function checkDay(pr) {
			var dateVal = pr.value;

			if (dateVal != '' && dateVal != null) {

				var year = parseInt(dateVal.substring(0, 4), 10);
				var mon = parseInt(dateVal.substring(5, 7), 10);
				var day = parseInt(dateVal.substring(8, 10), 10);

				var cdate = new Date(year, mon - 1, day);
				var weekNum = cdate.getDay();
				pr.nextSibling.value = "(" + week(weekNum) + ")";
			}
		}
		function week(w) {

			switch (w) {
			case 0:w = '일';break;
			case 1:w = '월';break;
			case 2:w = '화';break;
			case 3:w = '수';break;
			case 4:w = '목';break;
			case 5:w = '금';break;
			default:w = '토';break;
			}
			return w;
		}
		$(function() {
			var f = document.planf;
			$('#planf').submit(function() {
				if ($('#planbucketForm').html() == '') {
					alert('일정을 담아주세요');
					return false;
				}
			});
		});	   

</script>
	

<div class="sidebar-menu">
    <header class="logo">
    	<a href="#" class="sidebar-icon"><span class="fa fa-bars"></span></a> 
    	<a href="index.pd"><img src="img/main/logo.PNG" id="logo" width="120" height="55"></a><!-- PLANNER DANG LOGO -->
    </header>
    <div style="border-top:1px solid rgba(69, 74, 84, 0.7)"></div>
    <div class="menu">
		<ul id="menu" >
	        <li id="menu-home" ><a href="sightseeing.pd"><i class="fa fa-map-marker"></i><span>여행지</span></a></li>
	        <li id="menu-comunicacao" ><a href="airSearch.pd"><i class="fa fa-plane"></i><span>항공</span><span class="fa fa-angle-double-right" style="float: right"></span></a></li>
	        <li id="menu-academico" ><a href="hotel.pd"><i class="fa fa-home"></i><span>호텔</span><span class="fa fa-angle-right" style="float: right"></span></a></li>
	        <li><a href="blog.pd"><i class="fa fa-users"></i><span>블로그</span><span class="fa fa-angle-right" style="float: right"></span></a> </li>
	        <li><a href="event.pd"><i class="fa fa-history"></i><span>이벤트</span></a></li>	
	<!-- PLANNER -->
			<li>
				<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" id="plannerbtn" onclick="openPlaner()">
					<i class="glyphicon glyphicon-log-in"></i>
					<span>플래너</span>
				</a>	
			</li>
	<!-- MyPAGE -->
			<c:if test="${empty id}">
				<li><a href="javascript:login()"><i class="fa fa-power-off"></i><span>로그인</span></a></li>
	            <li><a href="memJoin.pd"><i class="fa fa-check-square"></i><span>회원가입</span></a></li>
			</c:if>
			<c:if test="${not empty id}">
				<li><a href="memLogout.pd"><i class="fa fa-power-off"></i><span>로그아웃</span></a></li>
				<c:choose>
					<c:when test="${memInfo[0].mem_grade == 0}">
						<li><a href="pdMM.pd"><i class="fa fa-info"></i><span>관리자페이지</span></a></li>
					</c:when>
					<c:otherwise>
              			<li><a href="mypage.pd"><i class="fa fa-info"></i><span>마이페이지</span></a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
		</ul>
	<!-- CHAT BOT -->
	<div class="btn-group" role="group" aria-label="Default button group" id="footerText">
		<nav class="footer_btn">
		
		<input type="hidden" name="mem_id" value="${mem_id }">
		<c:if test="${mem_id!=null }">
				<button type="button" class="btn btn-sm" onclick="chatToServer('${mem_id}')">
					<i class="fa fa-comments fa-3x"></i>
				</button>
		</c:if>
				<button type="button" class="btn btn-sm" onclick="openBot()">
					<i class="fa fa-android fa-3x"></i>
				</button>
		
		
		<img src="img/member/translate.jpg" width="48" height="48" onclick="showTrans()">
		</nav>
	</div>
	<div id="google_translate_element" style="display: none;"></div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<div id="footerText">
			
		</div>
    </div><!-- .menu -->
		

</div><!-- sideBar menu -->

<!-- /header -->
<!--myPlanner -->
<div id="myPlaner" class="planer" class="container">
	<div class="row">
		<div class="col-xs-12">
			<input type="button" value="x" onclick="closePlaner()" style="background-color: white; border: none; font-size: 30px;">
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<ul id="planbucket" style="padding-left:0px;">
				<form name="planf" id="planf" action="planCheck.pd" method="POST">
					<div id="planempty"></div>
					<div id="planbucketForm"></div>
					<button type="submit" class="btn btn-danger" id="plancheck"
						style="text-align: center; margin-left: 2px; width: 290px;">일정담기완료</button>
				</form>
			</ul>
		</div>
	</div>
</div>
<!-- /chat -->
<div id="chatMain" class="styleChat"></div>

<div id="chatBot" class="styleChat">
	<a href="javascript:void(0)" class="closebtn2" onclick="closeBot()">x</a>
	<jsp:include page="/WEB-INF/views/chat/chatBot.jsp"></jsp:include>
</div>

