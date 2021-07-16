<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String typeValue = (String)request.getAttribute("typeValue");
String chartType = (String)request.getAttribute("chartType");
String dateType = (String)request.getAttribute("dateType");
String dateValue = (String)request.getAttribute("dateValue");
%>
<h4><%=dateValue%></h4>
<%
if(typeValue.equals("sales")){
	if(chartType.equals("line")){
		if(dateType.equals("week")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewLine('morrisWeekLine', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisWeekLine"></div>
			<%
		}else if(dateType.equals("month")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewLine('morrisMonthLine', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisMonthLine"></div>
			<% 
		}else if(dateType.equals("quarter")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewLine('morrisQuarterLine', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisQuarterLine"></div>
			<%
		}
	}else if(chartType.equals("area")){
		if(dateType.equals("week")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewArea('morrisWeekArea', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisWeekArea"></div>
			<%
		}else if(dateType.equals("month")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewArea('morrisMonthArea', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisMonthArea"></div>
			<%
		}else if(dateType.equals("quarter")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewArea('morrisQuarterArea', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisQuarterArea"></div>
			<%
		}
	}else if(chartType.equals("bar")){
		if(dateType.equals("week")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewBar('morrisWeekBar', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisWeekBar"></div>
			<%
		}else if(dateType.equals("month")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewBar('morrisMonthBar', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisMonthBar"></div>
			<%
		}else if(dateType.equals("quarter")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewBar('morrisQuarterBar', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisQuarterBar"></div>
			<%
		}
	}else if(chartType.equals("donut")){
		if(dateType.equals("week")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewDonut('morrisWeekDonut', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisWeekDonut"></div>
			<%
		}else if(dateType.equals("month")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewDonut('morrisMonthDonut', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisMonthDonut"></div>
			<%
		}else if(dateType.equals("quarter")){
			%>
			<button type="button" class="btn btn-danger" onclick="viewDonut('morrisQuarterDonut', '<%=dateType%>', '<%=dateValue%>')">누르시오</button>
			<div id="morrisQuarterDonut"></div>
			<%
		}
	}
}
%>
