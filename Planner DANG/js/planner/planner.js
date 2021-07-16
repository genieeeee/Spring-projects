/**
 * 
 */
var step=-1; 		//배열step
var naraplus=-1; 	//나라step 
var bucket; 		//플래너 ui
var bucketform; 	//플래너 ui안에 전체div
var planchk;		//일정 확인 버튼
var sPlan;			//사용메뉴열,기본 예시 폼,일정담기 폼 판단
//플래너 버튼 누를 때 
function planbtn(){
	plan();
	var view = bucket.style.display=='block' ? 1:-1;
	console.log(view);
	if(view==-1){
		bucket.style.display='block';
	//bucket 열고 접고
	}else if(view==1){
		bucket.style.display='';
	}
}

//플래너 시작 버튼 누를 때
function planStart(){
	var start=confirm("플래너를 시작하시겠습니까?");
	if(start==true){
		window.location="plannerStart.pd";
	}else{
		bucket.style.display=='block';
	}
}
function planAdd(nara,area,tourist,food,decide){//나라,지역,명소,맛집 명,유효성판단
	step++;//0부터 
/* 	alert(step);
	alert(nara);
	alert(area);
	alert(tourist);
	alert(food);*/
	//alert(decide); 
	var bucket=document.getElementById('planbucket');

	var msg='${msg}';
	if(bucket.style.display='none'){
		bucket.style.display='block';
	}
	if(msg=='사용메뉴얼'){
		alert('플래너 시작▶\n버튼을 눌러주세요.');
		//window.location='planmake.pd';
	}else if(msg=='플래너시작'&&step==0){
		sendRequest('planmake.pd','planmake='+'일정만들기', null, 'POST');
		bucketform.innerHTML="";
		decideFunc(step,nara,area,tourist,food,decide);	
		//어떤 걸 담을 지 결정
	}else if(msg=='일정만들기'&&step>=1){
			decideFunc(step,nara,area,tourist,food,decide);	
	}
	
}
/*처음에 플래너 시작하고 
1.나라만 담을 때 
2.지역만 담을 때
3.나라검색하고 명소& 맛집 담을 때는 나라 먼저 담게.
4.지역검색하고 명소& 맛집 담을 때도 지역담고(나라명도 같이) 담게
*/
function decideFunc(step,nara,area,tourist,food,decide){
	var naraname=document.getElementById('naraName');
	
	switch(decide){
	case '나라':narabucket(step,nara);
			  	//alert('1');
			  	break;
	case '지역':narabucket(step,nara);
			  	areabucket(step,area);//->plandiv에 붙이기
			  	//alert('2');
			  	break;
	case '명소': narabucket(step,nara);
				areabucket(step,area);
				touristbucket(step,tourist);
				//alert('3');
				break;
	case '맛집':narabucket(step,nara);
				areabucket(step,area);
				foodbucket(step,food);
				//alert('4');
				break;
	}	
}
//나라담기
function narabucket(step,nara){
	var addDiv=document.createElement('div');
	var bucketform=bucketform=document.getElementById('planbucketForm'); 
	//naraplus++;
	addDiv.setAttribute('id','plandiv'+step);
	addDiv.setAttribute('class','container');
	addDiv.style.border='1px solid #e1e1e1';
	addDiv.style.width='370px';
	addDiv.style.padding='15px';
	addDiv.innerHTML+="<div id='naradiv"+step+"' class='col-xs-12' style='border:1px solid #e1e1e1;padding:3px;'>"
    						+"<div style='border-bottom:1px solid #e1e1e1;padding:3px;'>"
        						+"<img src='/pd/img/"+nara+".PNG'>"
        						+"<input type='text' value='"+nara+"' id='naraName"+step+"' style='border:none'>"
    						+"</div>"
    						+"<div style='padding:3px;'>"
        						+"<span>머물날짜</span><br>"
        						+"<input type='date' onblur='checkDay(this)' style='width:129px;'><span></span> ~" 
        						+"<input type='date' onblur='checkDay(this)' style='width:129px;'><span></span>"
   	 						+"</div>"
						+"</div>&nbsp;"
	bucketform.appendChild(addDiv);
}
//지역담기
function areabucket(step,area){
	var planDiv=document.getElementById('plandiv'+step);
	var areaDiv=document.createElement('div');
	areaDiv.setAttribute('class','col-xs-12');
	areaDiv.setAttribute('id','areadiv'+step)
	areaDiv.style.border='1px dashed #e1e1e1';
	areaDiv.style.padding='13px';
	areaDiv.innerHTML+="<div style='border-bottom:1px solid #e1e1e1;padding:3px;'>"
	            		+"<input type='text' value='"+area+"' style='border:none'>"
	        	   	   +"</div>"
	                   +"<div style='border-bottom:1px solid #e1e1e1;padding:3px;'>"
	                        +"<span>머물날짜</span><br>"
	                        +"<input type='date'  onblur='checkDay(this)' style='width:129px;'><span></span> ~"
	                        +"<input type='date'  onblur='checkDay(this)' style='width:129px;'><span></span>"
	                   +"</div>"
	planDiv.appendChild(areaDiv);
}
//명소 담기
function touristbucket(step,tourist){
	var planDiv=document.getElementById('plandiv'+step);
	var areaDiv=document.getElementById('areadiv'+step);
	var toDiv=document.createElement('div');//명소 div
	toDiv.setAttribute('id',planDiv+'_tourist');
	toDiv.style.border='1px solid #e1e1e1';
	toDiv.innerHTML+="<span>명소</span></br>"
	            	+"<div id='"+planDiv+"_tourist'>"
	            	+"<span>#<input type='text'value='"+tourist+"'readonly size='5px'><span>"
	            	+"</div></br>";
	areaDiv.appendChild(toDiv);           	        
}
//맛집 담기
function foodbucket(step,food){
	//var planDiv=document.getElementById('plandiv'+step);
	var areaDiv=document.getElementById('areadiv'+step);
	var foDiv=document.createElement('div');//명소 div
	foDiv.setAttribute('id',planDiv+'_food');
	foDiv.style.border='1px solid #e1e1e1';
	foDiv.innerHTML+="<span>맛집</span></br>"
	            	+"<div id='"+planDiv+"_fod'>"
	            	+"<span>#<input type='text'value='"+food+"'readonly size='5px'><span>"
	            	+"</div></br>";
	areaDiv.appendChild(toDiv); 
}
//날짜 선택한 뒤 요일넣기
function checkDay(pr){
	var dateVal=pr.value;
	if(dateVal!='' && dateVal != null){
		var year=parseInt(dateVal.substring(0,4), 10);
		var mon=parseInt(dateVal.substring(5,7), 10);
		var day=parseInt(dateVal.substring(8,10), 10);
		var cdate=new Date(year,mon-1,day);
		var weekNum=cdate.getDay();
		pr.nextSibling.innerHTML="("+week(weekNum)+")";
	}
}
//요일 판단
function week(w){
	switch(w){
		case 0: w='일';break;
		case 1: w='월';break;
		case 2: w='화';break;
		case 3: w='수';break;
		case 4: w='목';break;
		case 5: w='금';break;
		default: w='토';break;//case 6
	}
	return w;	
}
//일정빼기
function planDel(pr){
	pr.value='+';
	pr.setAttribute('onclick','planAdd(this)');
}