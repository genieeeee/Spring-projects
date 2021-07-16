/**
This function is getting suggestion keyword for IATA 3-code 
 */
var checkFirst=false;
var lastKeyword='';
var loopSendKeyword = false;
var keyType='';

function startSuggest(type){
	checkFirst=false;
	if(checkFirst == false){
		if(type=='key1'){
			document.getElementById('suggestResult1').style.display='';
			document.getElementById('suggestResult2').style.display='none';
		}else if(type=='key2'){
			document.getElementById('suggestResult1').style.display='none';
			document.getElementById('suggestResult2').style.display='';
		}
		keyType=type;
			sendKeyword();
		loopSendKeyword =true;
	}
	checkFirst =true;
}

function sendKeyword(){
	if(loopSendKeyword ==false) return;
	var keyword='';
	var	keyword1 = document.airSearch.air_origin.value;
	var	keyword2 = document.airSearch.air_destination.value;
	if(keyType=='key1'){
		keyword = keyword1;
		lastKeyword = keyword;
		var params = 'keyword='+keyword;
		sendRequest('airKeyword.pd', params, displayResult1, 'POST');
	}else if(keyType=='key2'){
		keyword = keyword2;
		lastKeyword = keyword;
		var params = 'keyword='+keyword;
		sendRequest('airKeyword.pd', params, displayResult2, 'POST');	
	}
		
		if(keyword1 ==''){
			lastKeyword='';
			hide('key1');
		}
		if(keyword2==''){
			lastKeyword='';
			hide('key2');
		}
		setTimeout(function(){
			sendKeyword(keyType);
		},1500);
}

function displayResult1(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var resultText = XHR.responseText;
			var parser = new DOMParser();
			var doc = parser.parseFromString(resultText,'text/html');
			var elem = doc.getElementById('suggest');
			var listView = document.getElementById('suggestResult1');
			listView.style.display='';
			listView.innerHTML = elem.innerHTML;
		}
	}
}

function displayResult2(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var resultText = XHR.responseText;
			var parser = new DOMParser();
			var doc = parser.parseFromString(resultText,'text/html');
			var elem = doc.getElementById('suggest');
			var listView = document.getElementById('suggestResult2');
			listView.style.display='';
			listView.innerHTML = elem.innerHTML;
		}
	}
}

function select(selectKeyword){
	document.airSearch.keyword.value = selectKeyword;
	loopSendKeyword =false;
	checkFirst = false;
	hide();
}

function hide(keyType){
	if(keyType=='key1'){
		var listView = document.getElementById('suggestResult1');
		listView.style.display='none';
	}else{
		var listView = document.getElementById('suggestResult2');
		listView.style.display='none';
	}
	
}