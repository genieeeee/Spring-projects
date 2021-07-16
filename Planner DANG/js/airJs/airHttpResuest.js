/**
 * 
 */
var airXhr = null;
function getXHR(){
	if(window.ActiveXObject) return new ActiveXObject('Msxml2.XMLHTTP');
	else if(window.XMLHttpRequest) return new XMLHttpRequest();
	else return null;
}
function airSendRequest(url, params, callback, method){
	airXhr = getXHR();
	var httpMethod = method ? method : 'GET';
	if(httpMethod != 'GET' && httpMethod != 'POST') httpMethod = 'GET';
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if(httpMethod == 'GET' && httpParams != null) httpUrl = httpUrl + '?' + httpParams;
	airXhr.onreadystatechange = callback;
	airXhr.open(httpMethod, httpUrl, true);
	airXhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
	airXhr.send(httpMethod == 'POST' ? httpParams : null);
}