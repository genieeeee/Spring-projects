<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너당 +_+</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
<script src="/pd/js/httpRequest.js"></script>
<script>
var all = document.all;
function lineChart(dateType){
	var dateValue;
	if(dateType == 'week') dateValue = all.weekLineChartSelector.value;
	else if(dateType == 'month') dateValue = all.monthLineChartSelector.value;
	else if(dateType == 'quarter')	dateValue = all.quarterLineChartSelector.value;
	if(dateValue == 'none'){
		if(dateType == 'week') all.weekLineChartResult.innerHTML = '';
		else if(dateType == 'month') all.monthLineChartResult.innerHTML = '';
		else if(dateType == 'quarter') all.quarterLineChartResult.innerHTML = '';
		return;
	}
	sendRequest('crmChartAjax.pd', 'typeValue=sales&chartType=line&dateType=' + dateType + '&dateValue=' + dateValue, lineAjaxResult, 'POST');
	function lineAjaxResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			if(dateType == 'week') all.weekLineChartResult.innerHTML = data;
			else if(dateType == 'month') all.monthLineChartResult.innerHTML = data;
			else if(dateType == 'quarter') all.quarterLineChartResult.innerHTML = data;
		}	
	}
}
function viewLine(morrisView, dateType, dateValue){
	sendRequest('crmChartJason.pd', 'typeValue=sales&chartType=line&dateType=' + dateType + '&dateValue=' + dateValue, lineJasonResult, 'POST');
	function lineJasonResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var dataJason = XHR.responseText;
			var resultTemp = eval('(' + dataJason + ')');
			Morris.Line({
				element: morrisView,
				data: resultTemp.result,
				xkey: '나이',
				ykeys: ['매출액'],
				labels: ['매출액']
			});
		}
	}
}
function areaChart(dateType){
	var dateValue;
	if(dateType == 'week') dateValue = all.weekAreaChartSelector.value;
	else if(dateType == 'month') dateValue = all.monthAreaChartSelector.value;
	else if(dateType == 'quarter')	dateValue = all.quarterAreaChartSelector.value;
	if(dateValue == 'none'){
		if(dateType == 'week') all.weekAreaChartResult.innerHTML = '';
		else if(dateType == 'month') all.monthAreaChartResult.innerHTML = '';
		else if(dateType == 'quarter') all.quarterAreaChartResult.innerHTML = '';
		return;
	}
	sendRequest('crmChartAjax.pd', 'typeValue=sales&chartType=area&dateType=' + dateType + '&dateValue=' + dateValue, areaAjaxResult, 'POST');
	function areaAjaxResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			if(dateType == 'week') all.weekAreaChartResult.innerHTML = data;
			else if(dateType == 'month') all.monthAreaChartResult.innerHTML = data;
			else if(dateType == 'quarter') all.quarterAreaChartResult.innerHTML = data;
		}	
	}
}
function viewArea(morrisView, dateType, dateValue){
	sendRequest('crmChartJason.pd', 'typeValue=sales&chartType=area&dateType=' + dateType + '&dateValue=' + dateValue, areaJasonResult, 'POST');
	function areaJasonResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var dataJason = XHR.responseText;
			var resultTemp = eval('(' + dataJason + ')');
			Morris.Area({
				element: morrisView,
				data: resultTemp.result,
				xkey: '국적',
				ykeys: ['매출액'],
				labels: ['매출액']
			});
		}
	}
}
function barChart(dateType){
	var dateValue;
	if(dateType == 'week') dateValue = all.weekBarChartSelector.value;
	else if(dateType == 'month') dateValue = all.monthBarChartSelector.value;
	else if(dateType == 'quarter')	dateValue = all.quarterBarChartSelector.value;
	if(dateValue == 'none'){
		if(dateType == 'week') all.weekBarChartResult.innerHTML = '';
		else if(dateType == 'month') all.monthBarChartResult.innerHTML = '';
		else if(dateType == 'quarter') all.quarterBarChartResult.innerHTML = '';
		return;
	}
	sendRequest('crmChartAjax.pd', 'typeValue=sales&chartType=bar&dateType=' + dateType + '&dateValue=' + dateValue, barAjaxResult, 'POST');
	function barAjaxResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			if(dateType == 'week') all.weekBarChartResult.innerHTML = data;
			else if(dateType == 'month') all.monthBarChartResult.innerHTML = data;
			else if(dateType == 'quarter') all.quarterBarChartResult.innerHTML = data;
		}	
	}
}
function viewBar(morrisView, dateType, dateValue){
	sendRequest('crmChartJason.pd', 'typeValue=sales&chartType=bar&dateType=' + dateType + '&dateValue=' + dateValue, barJasonResult, 'POST');
	function barJasonResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var dataJason = XHR.responseText;
			var resultTemp = eval('(' + dataJason + ')');
			Morris.Bar({
				element: morrisView,
				data: resultTemp.result,
				xkey: '목적지',
				ykeys: ['매출액'],
				labels: ['매출액']
			});
		}
	}
}
function donutChart(dateType){
	var dateValue;
	if(dateType == 'week') dateValue = all.weekDonutChartSelector.value;
	else if(dateType == 'month') dateValue = all.monthDonutChartSelector.value;
	else if(dateType == 'quarter')	dateValue = all.quarterDonutChartSelector.value;
	if(dateValue == 'none'){
		if(dateType == 'week') all.weekDonutChartResult.innerHTML = '';
		else if(dateType == 'month') all.monthDonutChartResult.innerHTML = '';
		else if(dateType == 'quarter') all.quarterDonutChartResult.innerHTML = '';
		return;
	}
	sendRequest('crmChartAjax.pd', 'typeValue=sales&chartType=donut&dateType=' + dateType + '&dateValue=' + dateValue, donutAjaxResult, 'POST');
	function donutAjaxResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var data = XHR.responseText;
			if(dateType == 'week') all.weekDonutChartResult.innerHTML = data;
			else if(dateType == 'month') all.monthDonutChartResult.innerHTML = data;
			else if(dateType == 'quarter') all.quarterDonutChartResult.innerHTML = data;
		}	
	}
}
function viewDonut(morrisView, dateType, dateValue){
	sendRequest('crmChartJason.pd', 'typeValue=sales&chartType=donut&dateType=' + dateType + '&dateValue=' + dateValue, donutJasonResult, 'POST');
	function donutJasonResult(){
		if(XHR.readyState == 4 && XHR.status == 200){
			var dataJason = XHR.responseText;
			var resultTemp = eval('(' + dataJason + ')');
			Morris.Donut({
				element: morrisView,
				data: resultTemp.result,
			});
		}
	}
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
	<article>
		<div class="container-fluid" style="margin-top:50px">
			<div class="panel panel-default">
				<%@ include file="crmHeader.jsp" %>
			    <div class="panel-body">
			    	<div class="container-fluid">
			    		<div class="col-xs-12">
			    			<h2 data-toggle="collapse" data-target="#everyWeek">주별 분석</h2>
							<div class="collapse" id="everyWeek">
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="weekLineChartSelector" onchange="lineChart('week')">
							    				<option value="none" selected="selected">Line Chart</option>
							    				<c:choose>
							    					<c:when test="${empty weekList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultWeek" items="${weekList}">
							    							<option value="${resultWeek}">${resultWeek}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="weekLineChartResult">
							    			<div id="morrisWeekLine" class="col-xs-12"></div>
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="weekAreaChartSelector" onchange="areaChart('week')">
							    				<option value="none" selected="selected">Area Chart</option>
							    				<c:choose>
							    					<c:when test="${empty weekList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultWeek" items="${weekList}">
							    							<option value="${resultWeek}">${resultWeek}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="weekAreaChartResult">
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="weekBarChartSelector" onchange="barChart('week')">
							    				<option value="none" selected="selected">Bar Chart</option>
							    				<c:choose>
							    					<c:when test="${empty weekList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultWeek" items="${weekList}">
							    							<option value="${resultWeek}">${resultWeek}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="weekBarChartResult">
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="weekDonutChartSelector" onchange="donutChart('week')">
							    				<option value="none" selected="selected">Donut Chart</option>
							    				<c:choose>
							    					<c:when test="${empty weekList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultWeek" items="${weekList}">
							    							<option value="${resultWeek}">${resultWeek}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="weekDonutChartResult">
							    		</div>
							    	</div>
							    </div>
							</div>
						</div>
			    		<div class="col-xs-12">
			    			<h2 data-toggle="collapse" data-target="#everyMonth">월별 분석</h2>
							<div class="collapse" id="everyMonth">
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="monthLineChartSelector" onchange="lineChart('month')">
							    				<option value="none" selected="selected">Line Chart</option>
							    				<c:choose>
							    					<c:when test="${empty monthList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultMonth" items="${monthList}">
							    							<option value="${resultMonth}">${resultMonth}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="monthLineChartResult">
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="monthAreaChartSelector" onchange="areaChart('month')">
							    				<option value="none" selected="selected">Area Chart</option>
							    				<c:choose>
							    					<c:when test="${empty monthList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultMonth" items="${monthList}">
							    							<option value="${resultMonth}">${resultMonth}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="monthAreaChartResult">
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="monthBarChartSelector" onchange="barChart('month')">
							    				<option value="none" selected="selected">Bar Chart</option>
							    				<c:choose>
							    					<c:when test="${empty monthList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultMonth" items="${monthList}">
							    							<option value="${resultMonth}">${resultMonth}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="monthBarChartResult">
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="monthDonutChartSelector" onchange="donutChart('month')">
							    				<option value="none" selected="selected">Donut Chart</option>
							    				<c:choose>
							    					<c:when test="${empty monthList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultMonth" items="${monthList}">
							    							<option value="${resultMonth}">${resultMonth}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="monthDonutChartResult">
							    		</div>
							    	</div>
							    </div>
							</div>
						</div>
			    		<div class="col-xs-12">
			    			<h2 data-toggle="collapse" data-target="#everyQuarter">분기별 분석</h2>
							<div class="collapse" id="everyQuarter">
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="quarterLineChartSelector" onchange="lineChart('quarter')">
							    				<option value="none" selected="selected">Line Chart</option>
							    				<c:choose>
							    					<c:when test="${empty quarterList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultQuarter" items="${quarterList}">
							    							<option value="${resultQuarter}">${resultQuarter}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="quarterLineChartResult">
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="quarterAreaChartSelector" onchange="areaChart('quarter')">
							    				<option value="none" selected="selected">Area Chart</option>
							    				<c:choose>
							    					<c:when test="${empty quarterList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultQuarter" items="${quarterList}">
							    							<option value="${resultQuarter}">${resultQuarter}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="quarterAreaChartResult">
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="quarterBarChartSelector" onchange="barChart('quarter')">
							    				<option value="none" selected="selected">Bar Chart</option>
							    				<c:choose>
							    					<c:when test="${empty quarterList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultQuarter" items="${quarterList}">
							    							<option value="${resultQuarter}">${resultQuarter}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="quarterBarChartResult">
							    		</div>
							    	</div>
							    </div>
								<div class="col-xs-6">
									<div class="panel panel-default">
							    		<div class="panel-heading">
							    			<select id="quarterDonutChartSelector" onchange="donutChart('quarter')">
							    				<option value="none" selected="selected">Donut Chart</option>
							    				<c:choose>
							    					<c:when test="${empty quarterList}"></c:when>
							    					<c:otherwise>
							    						<c:forEach var="resultQuarter" items="${quarterList}">
							    							<option value="${resultQuarter}">${resultQuarter}</option>
							    						</c:forEach>
							    					</c:otherwise>
							    				</c:choose>
							    			</select>
							    		</div>
							    		<div class="panel-body" id="quarterDonutChartResult">
							    		</div>
							    	</div>
							    </div>
							</div>
						</div>
					</div>
			    </div>
			    <div class="panel-footer"></div>
			</div>	    		
		</div>
	</article>
</section>		
</body>
</html>