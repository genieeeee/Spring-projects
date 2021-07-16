<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s="1";	
}
int cp = Integer.parseInt(cp_s);
%>
<form action="search_main.jsp" name="h">
	<input type="text" name="cp">
	<input type="checkbox" name="searchOptionTime_10_less" id="searchOptionTime_10_less">
	<input type="checkbox" name="searchOptionTime_10_20" id="searchOptionTime_10_20">
	<input type="checkbox" name="searchOptionTime_20_30" id="searchOptionTime_20_30">
	<input type="checkbox" name="searchOptionTime_30_40" id="searchOptionTime_30_40">
	<input type="checkbox" name="searchOptionTime_40_over" id="searchOptionTime_40_over">

	<input type="checkbox" name="searchOptionPrice_desc" id="searchOptionPrice_desc">
	<input type="checkbox" name="searchOptionPrice_asc" id="searchOptionPrice_asc">
	
	<input type="text" name="searchOptionPrice">
	
	<input type="checkbox" name="searchOptionCategory_kor" id="searchOptionCategory_kor">
	<input type="checkbox" name="searchOptionCategory_cha" id="searchOptionCategory_cha">
	<input type="checkbox" name="searchOptionCategory_eng" id="searchOptionCategory_eng">
	<input type="checkbox" name="searchOptionCategory_jpn" id="searchOptionCategory_jpn">
	<input type="checkbox" name="searchOptionCategory_night" id="searchOptionCategory_night">
	<input type="checkbox" name="searchOptionCategory_etc" id="searchOptionCategory_etc">
	
	<input type="text" name="searchOptionStr" value="<%=request.getParameter("searchOptionStr")%>">
	<input type="text" name="searchOptionSelected">
</form>

<script>
	document.h.cp.value = '<%=request.getParameter("cp")%>';
	document.getElementById("searchOptionTime_10_less").checked='<%=request.getParameter("searchOptionTime_10_less")%>'=='on'?true:false;
	document.getElementById("searchOptionTime_10_20").checked='<%=request.getParameter("searchOptionTime_10_20")%>'=='on'?true:false;
	document.getElementById("searchOptionTime_20_30").checked='<%=request.getParameter("searchOptionTime_20_30")%>'=='on'?true:false;
	document.getElementById("searchOptionTime_30_40").checked='<%=request.getParameter("searchOptionTime_30_40")%>'=='on'?true:false;
	document.getElementById("searchOptionTime_40_over").checked='<%=request.getParameter("searchOptionTime_40_over")%>'=='on'?true:false;
	
	document.getElementById("searchOptionPrice_desc").checked='<%=request.getParameter("searchOptionPrice_desc")%>'=='on'?true:false;
	document.getElementById("searchOptionPrice_asc").checked='<%=request.getParameter("searchOptionPrice_asc")%>'=='on'?true:false;
	document.h.searchOptionPrice.value = '<%=request.getParameter("searchOptionPrice")%>';
	
	document.getElementById("searchOptionCategory_kor").checked='<%=request.getParameter("searchOptionCategory_kor")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_cha").checked='<%=request.getParameter("searchOptionCategory_cha")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_eng").checked='<%=request.getParameter("searchOptionCategory_eng")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_jpn").checked='<%=request.getParameter("searchOptionCategory_jpn")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_night").checked='<%=request.getParameter("searchOptionCategory_night")%>'=='on'?true:false;
	document.getElementById("searchOptionCategory_etc").checked='<%=request.getParameter("searchOptionCategory_etc")%>'=='on'?true:false;
	
	document.h.searchOptionSelected.value = '<%=request.getParameter("f_select")%>';
	
	document.h.submit();
</script>
