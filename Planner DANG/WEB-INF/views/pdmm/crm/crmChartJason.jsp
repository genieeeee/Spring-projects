<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pd.pdmm.model.PdMMCrmDTO" %>
<%@ page import="java.util.*" %>
<% 
String typeValue = (String)request.getAttribute("typeValue");
String chartType = (String)request.getAttribute("chartType");
String dateType = (String)request.getAttribute("dateType");
String dateValue = (String)request.getAttribute("dateValue");
List<PdMMCrmDTO> list = (List<PdMMCrmDTO>)request.getAttribute("list");
int len = list.size();
if(typeValue.equals("sales")){
	if(chartType.equals("line")){
		if(dateType.equals("week")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 나이: '<%=list.get(i).getMem_age()%>대', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 나이: '<%=list.get(i).getMem_age()%>대', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}else if(dateType.equals("month")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 나이: '<%=list.get(i).getMem_age()%>대', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 나이: '<%=list.get(i).getMem_age()%>대', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}else if(dateType.equals("quarter")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 나이: '<%=list.get(i).getMem_age()%>대', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 나이: '<%=list.get(i).getMem_age()%>대', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}
	}else if(chartType.equals("area")){
		if(dateType.equals("week")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 국적: '<%=list.get(i).getMem_nation()%>', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 국적: '<%=list.get(i).getMem_nation()%>', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}else if(dateType.equals("month")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 국적: '<%=list.get(i).getMem_nation()%>', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 국적: '<%=list.get(i).getMem_nation()%>', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}else if(dateType.equals("quarter")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 국적: '<%=list.get(i).getMem_nation()%>', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 국적: '<%=list.get(i).getMem_nation()%>', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}
	}else if(chartType.equals("bar")){
		if(dateType.equals("week")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 목적지: '<%=list.get(i).getAir_godestination()%>', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 목적지: '<%=list.get(i).getAir_godestination()%>', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}else if(dateType.equals("month")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 목적지: '<%=list.get(i).getAir_godestination()%>', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 목적지: '<%=list.get(i).getAir_godestination()%>', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}else if(dateType.equals("quarter")){
			%>
		  	{result : [
		  	<%
			for(int i = 0 ; i < len ; i++){
	  			if(i < len - 1){
		  			%>
		  			{ 목적지: '<%=list.get(i).getAir_godestination()%>', 매출액: <%=list.get(i).getAir_totalprice()%> },
		  			<%
	  			}else{
		  			%>
		  			{ 목적지: '<%=list.get(i).getAir_godestination()%>', 매출액: <%=list.get(i).getAir_totalprice()%> }	
		  			<%
	  			}
	  		}
			%>
			]}
			<%
		}
	}else if(chartType.equals("donut")){
		if(dateType.equals("week")){
			%>
		  	{result : [
		  	<%
		  	if(list.size() == 2){
		  	%>
		  		{ label: '<%=list.get(0).getMem_sex()%>', value: <%=list.get(0).getAir_totalprice()%>},
		  		{ label: '<%=list.get(1).getMem_sex()%>', value: <%=list.get(1).getAir_totalprice()%> }	
			]}
			<%
		  	}else if(list.size() == 1){
		  		String mem_sex = list.get(0).getMem_sex();
		  		if(mem_sex.equals("남자")){
		  		%>
			  		{ label: '남자', value: <%=list.get(0).getAir_totalprice()%>},
			  		{ label: '여자', value: 0 }	
				]}
		  		<%
		  		}else{
		  		%>
		  			{ label: '여자', value: <%=list.get(0).getAir_totalprice()%>},
			  		{ label: '남자', value: 0 }	
				]}
		  		<%
		  		}	
		  	}else if(list.size() == 0){
		  		%>
		  		]}
		  		<%
		  	}
		}else if(dateType.equals("month")){
			%>
		  	{result : [
		  	<%
		  	if(list.size() == 2){
		  	%>
		  		{ label: '<%=list.get(0).getMem_sex()%>', value: <%=list.get(0).getAir_totalprice()%>},
		  		{ label: '<%=list.get(1).getMem_sex()%>', value: <%=list.get(1).getAir_totalprice()%> }	
			]}
			<%
		  	}else if(list.size() == 1){
		  		String mem_sex = list.get(0).getMem_sex();
		  		if(mem_sex.equals("남자")){
		  		%>
			  		{ label: '남자', value: <%=list.get(0).getAir_totalprice()%>},
			  		{ label: '여자', value: 0 }	
				]}
		  		<%
		  		}else{
		  		%>
		  			{ label: '여자', value: <%=list.get(0).getAir_totalprice()%>},
			  		{ label: '남자', value: 0 }	
				]}
		  		<%
		  		}	
		  	}else if(list.size() == 0){
		  		%>
		  		]}
		  		<%
		  	}
		}else if(dateType.equals("quarter")){
			%>
		  	{result : [
		  	<%
		  	if(list.size() == 2){
		  	%>
		  		{ label: '<%=list.get(0).getMem_sex()%>', value: <%=list.get(0).getAir_totalprice()%>},
		  		{ label: '<%=list.get(1).getMem_sex()%>', value: <%=list.get(1).getAir_totalprice()%> }	
			]}
			<%
		  	}else if(list.size() == 1){
		  		String mem_sex = list.get(0).getMem_sex();
		  		if(mem_sex.equals("남자")){
		  		%>
			  		{ label: '남자', value: <%=list.get(0).getAir_totalprice()%>},
			  		{ label: '여자', value: 0 }	
				]}
		  		<%
		  		}else{
		  		%>
		  			{ label: '여자', value: <%=list.get(0).getAir_totalprice()%>},
			  		{ label: '남자', value: 0 }	
				]}
		  		<%
		  		}	
		  	}else if(list.size() == 0){
		  		%>
		  		]}
		  		<%
		  	}
		}
	}
}
%>
