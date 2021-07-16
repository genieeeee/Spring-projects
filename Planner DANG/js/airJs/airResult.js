/**this function is for round trip airlines
 * It must need startDate, endDate
기본적인 정보 INNERHTML 작성 내용!
[출발 -> 도착지
 출발시간 도착 시간, 출발날짜,도착 날짜
 경유 횟수, 총 여정 시간 
 가격
 ]
function getConnector(){
	xhr = new XMLHttpRequest();
	var key ='AIzaSyDxUhUBvVgaihAutbHR2OsXEdgnL0di-G0';
	//var key ='AIzaSyA_d3i1PehbxBmrxdteQIztu6eiVIwJRfs';
	//var key = 'key=AIzaSyDV4gWxEpC3pZYQ2MwMtHwePFZzuQc9CTU';
	var url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key="+key;
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json");
}
*/
var xhr='';
var proto; //stopNum에 의한 경우의 수
var airList; //요청 받은 값 객체화 시킨것

//airline schedule info. It should be array type it could not be only one data
var origin;
var destination;
var startDate;
var endDate;
var stopNum;
var airline;
var price;
var arrTime;
var depTime;
var totalDuration;
var solu;

//For Table 
var div;
var tName;
var cnt;
var rowlen;
function getConnector(){
	xhr = new XMLHttpRequest();
	var key ='AIzaSyDxUhUBvVgaihAutbHR2OsXEdgnL0di-G0';
	//var key ='AIzaSyA_d3i1PehbxBmrxdteQIztu6eiVIwJRfs';
	//var key = 'key=AIzaSyDV4gWxEpC3pZYQ2MwMtHwePFZzuQc9CTU';
	var url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key="+key;
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json");
}
/*function getConnector(){ //Connection method through XMLHttpRequest()
	xhr = new XMLHttpRequest();
	var url='json/GUM.jsp'; //왕복
	//var url = 'json/NYC.jsp'; //편도
	xhr.open('POST',url, true );
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
}*/
//It is differen case of Max stop
function getProto(stopNum, origin,destination,startDate, earliest, latest, alliance){
	console.log(stopNum);
		if(stopNum==0){
			proto = {
					"origin": origin,
	                "destination": destination ,
	                "date": startDate,
					"maxStops" : 0,
					"alliance": alliance,
					"permittedDepartureTime": {
				          "earliestTime": earliest,
				          "latestTime": latest
				        }
			};
		}else{
			proto = {
					"origin": origin,
		            "destination": destination,
		            "date": startDate, 
		            "alliance": alliance,
		            "permittedDepartureTime": {
				          "earliestTime": earliest,
				          "latestTime": latest
				        }
			};
		}	
	
	return proto;
}

//ROUNDTRIP ticket Info
function getResultRound(origin,destination, startDate, endDate, stopNum, adult, kid, solution, earliest, latest, alliance){
	getConnector();
	var proto1 =getProto(stopNum, origin,destination,startDate, earliest, latest, alliance);
	var proto2 =getProto(stopNum, destination,origin,endDate, earliest, latest, alliance);
	
	var data = JSON.stringify({
		"request": {
	            "slice": [
	                proto1,     
	                proto2
	            ],
	            "passengers": {
	                "adultCount": adult,
	                "infantInLapCount": 0,
	                "infantInSeatCount": 0,
	                "childCount": kid,
	                "seniorCount": 0
	            },
	            "solutions": solution,
	            "refundable": false
	        }
	});
	getReadyState(data);
}

//ONEWAY ticket Info
function getResultOneway(origin,destination, startDate, stopNum, adult, kid, solution, earliest, latest, alliance){
	getConnector();
	proto =getProto(stopNum, origin,destination,startDate, earliest, latest, alliance);
	
	var data = JSON.stringify({
		"request": {
	            "slice": [
	                proto
	            ],
	            "passengers": {
	                "adultCount": adult,
	                "infantInLapCount": 0,
	                "infantInSeatCount": 0,
	                "childCount": kid,
	                "seniorCount": 0
	            },
	            "solutions": solution,
	            "refundable": false
	        }
	});
	getReadyState(data);
}

function openModal() {document.getElementById('showAirfare').style.display = 'none';
    document.getElementById('airLoad').style.display = '';
    var btn = document.getElementById('showRe');
    btn.setAttribute('onclick', function (){
    	return false;
    });
}

function closeModal() {
	document.getElementById('airLoad').style.display = 'none';
	document.getElementById('showAirfare').style.display = '';
	var btn = document.getElementById('showRe');
	btn.setAttribute('onclick',function (){
    	return true;
    	});
}

function getReadyState(data){
	openModal();
	setTimeout(function(){
		xhr.send(data);
	},3000);
	xhr.onreadystatechange = function () {
		if(xhr.readyState==4){
			if(xhr.status==200){
				closeModal();
				var air=xhr.responseText;
				airList=eval('('+air+')');
				getResult(airList);
			}  
		}
	}
}

function getResult(airList){ //get Air Fare Information from QPX Express API
	div = document.getElementById('airResult');
	var airState = airList.trips.tripOption;
	if(airState==undefined){
		solu=0;
		div.innerHTML = '<label>검색결과가 없습니다</label>';
	}else{
		solu = airList.trips.tripOption.length;
		for(var s=0; s<solu;s++){
			price = airList.trips.tripOption[s].saleTotal; //왕복 및 편도 가격
			//Solution에 따른 Table 생성
			tName = 'table'+s;
			tName = eval(document.createElement('table'));
			var slice = airList.trips.tripOption[s].slice.length; //왕복 여부에 따른 진행
			for(var i=0; i<slice;i++){
				totalDuration = airList.trips.tripOption[s].slice[i].duration; //총 경유 시간
				
				var segment = airList.trips.tripOption[s].slice[i].segment.length; // 경유를 알 수 있음 TRANSFER //adto.air_stopNum = segment-1; 경유 횟수
				stopNum=segment;
				airline = airList.trips.tripOption[s].slice[i].segment[0].flight.carrier; //항공사		
				for(var j=0; j<segment; j++){
					/*Transit!! :: 같은 비행기 잠시 내려서 다시 같은 항공기를 타는 것이다!!!! 
					 * >> segement[j].leg[z]에서 바뀌는 것은 duraton, arrivalTime, destinatonTime, mileage, ConnectionDuration, origin, destinaiton
					 * 동일한것, Carrier , Number* */
					var leg = airList.trips.tripOption[s].slice[i].segment[j].leg.length;//transit인 경우의 수
					origin = airList.trips.tripOption[s].slice[i].segment[0].leg[0].origin; //최초 출발지
					arrTime = airList.trips.tripOption[s].slice[i].segment[0].leg[0].arrivalTime; //최초 출발 시간
					if(leg>1){
						stopNum=leg;
						//console.log('TRANSIT');
						for(var z=0; z<leg; z++){
							depTime = airList.trips.tripOption[s].slice[i].segment[j].leg[z].departureTime;
							destination = airList.trips.tripOption[s].slice[i].segment[j].leg[z].destination;
						}
					}else{
						destination = airList.trips.tripOption[s].slice[i].segment[j].leg[0].destination; //최종 도착지
						depTime= airList.trips.tripOption[s].slice[i].segment[j].leg[0].departureTime;
					}
					stopDuration = airList.trips.tripOption[s].slice[i].segment[j].connectionDuration; //경유 시간
				}
				createTable(tName,(i+1),slice,s);
			}
		}
	}
	var text= document.createElement('input');
	text.setAttribute('id','solution');
	text.setAttribute('type','hidden');
	text.setAttribute('value',solu);
	div.appendChild(text);
	/* 결과값 수 반영 */
	document.getElementById('air_solution').value = document.getElementById('solution').value;
}

function createTable(tName,i,slice,s){//Creating Shortly Air Fare Info Table	  	
	tName.setAttribute('width','680px');
	rowlen = tName.rows.length;

	startDate = depTime.split('T');
	start = startDate[0];
	depTime = startDate[1];
	endDate = arrTime.split('T');
	end = endDate[0];
	arrTime = endDate[1];
	h = parseInt(totalDuration/60);
	m = totalDuration-h*60;
	
    var row1 = tName.insertRow(rowlen); //ROW 생성 //tName.appendChild(tr);
    var col1 = row1.insertCell(0);//tr.appendChild(td);
      	col1.rowSpan='3';
        col1.style.verticalAlign='middle';
        col1.innerHTML = '<img src="img/air/airFlag/'+airline+'.png" onerror="javascript:this.src=\'img/air/airFlag/NONS.png\'" width="150" height="25">';
    var col2 = row1.insertCell(1);
        col2.innerHTML='<label id="startTime">'+depTime+'</label>';
    var col3 = row1.insertCell(2);
        col3.innerHTML='<label id="duration">'+h+'시간 '+m+'분</label>';
    var col4 = row1.insertCell(3);
        col4.innerHTML='<label id="endTime">'+arrTime+'</label>'
    var col5 = row1.insertCell(4);
        if(i==slice){
        	col5.rowSpan='6';
        	if(slice==1){        		
        		col5.rowSpan='3';
        	}
        	col5.innerHTML = '<label id="totalPrice">'+price+'</label>'
    			+'<br><button type="button" data-toggle="modal" data-target="#myModal" onclick="showModalResult('+s+')">선택</button>';
        	col5.align = 'center';
        }
  
    var row2 = tName.insertRow(rowlen+1);
    var col2 = row2.insertCell(0);
    	col2.colSpan='3';
    	col2.align='center';
    	col2.height='15';
    	col2.innerHTML='<img src="img/air/flightTime.png" width="150" height="15">';
        
    var row3 = tName.insertRow(rowlen+2);
    var col2 = row3.insertCell(0);
        col2.innerHTML='<label id="originCode">'+origin+'</label>';
    var col3 = row3.insertCell(1);
    	if((stopNum-1)==0){
    		col3.innerHTML='<label>직항</label>';
    	}else{
    		col3.innerHTML='<label>경유'+(stopNum-1)+'회</label>';
    	}
        
    var col4 = row3.insertCell(2);
        col4.innerHTML='<label id="destinationCode">'+destination+'</label>';
 
  	div.appendChild(tName);
  	br = document.createElement('hr');
  	div.appendChild(br);
  	div.appendChild(br);
}

