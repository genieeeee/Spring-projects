<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>플레너당 +_+</title>
<style>
table{
   width:100%;
}
a:link, a:VISITED, a:ACTIVE, a:HOVER{
   text-decoration: none;
   color:black;
}
#rcorners2 {
    border-radius: 25px;
    border: 2px solid #0d3464;
    padding:10px;
    padding-left: 30px; 
    width: 100%;
    height: 50px;
    font-size: 20px;
    color:white;
    font-weight: bold;
    background-color: #0d3464;  
}
</style>
<script>
function showIng(){
   $("#ing").show();
   $("#end").hide();
}
function showEnd(){
   $("#end").show();
   $("#ing").hide();
}
</script>
</head>
<body style="margin-left: 50px;">
<div class="page-container">
   <div class="content">
      <div class="col-xs-8 col-sm-9 col-md-10">
    <br><br>
            <!-- 헤더 들어가는 부분 -->
            <br><br><br><br>

<p id="rcorners2" align="left"><a href="javascript:showIng()" style="color: white;">진행중인 이벤트</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="javascript:showEnd()" style="color: white;">종료된 이벤트</a></p>

<br><br><br><br><br><br><br><br>
<table id="ing">
   <tr>
   <c:if test="${cp==0}">
      <td><a href="#"><img src="event/left.png" width="50" height="50"></a></td>
   </c:if>
   <c:if test="${cp!=0}">
      <td><a href="event.pd?cp=${cp-1}"><img src="event/left.png" width="50" height="50"></a></td>
   </c:if>
   <c:forEach var="idx" items="${eventIndex}" varStatus="status">
   <c:if test="${eventSubject[status.count-1] ne null}">
      <td style="text-align: center;">
         <a href="eventIngContent.pd?idx=${idx}&subject=${eventSubject[status.count-1]}&fullName=${fullName[status.count-1]}">
         <img src="/pd/event/upload/${img[status.count-1]}" width="200" height="200"><br>
         <font size="3">마감일 : ${eventDate[status.count-1]}</font>
         </a>
      </td>
   </c:if>
   <c:if test="${eventSubject[status.count-1] eq null}">
      <td><img src="event/none.jpg" width="200" height="200"><br>&nbsp;<br>&nbsp;</td>
   </c:if>
   </c:forEach>
      
      <c:if test="${lastPage!=-1 }">
         <td><a href="event.pd?cp=${cp+1}"><img src="event/right.png" width="50" height="50"></a></td>
      </c:if>
      <c:if test="${lastPage==-1 }">
         <td><img src="event/none.jpg" width="50" height="50"></td>
      </c:if>
      
   </tr>
</table>


<table id="end" style="display: none;">
   <tr>
   <c:if test="${endCp==0}">
      <td><a href="#"><img src="event/left.png" width="50" height="50"></a></td>
   </c:if>
   <c:if test="${endCp!=0 }">      
      <td><a href="event.pd?endCp=${endCp-1 }"><img src="event/left.png" width="50" height="50"></a></td>
   </c:if>
   <c:forEach var="endIdx" items="${endIndex}" varStatus="endStatus">
   <c:if test="${endSubject[endStatus.count-1] ne null}">
      <td style="text-align: center;">
         <a href="eventEndContent.pd?idx=${endIdx}&subject=${endSubject[endStatus.count-1]}&FullName=${endFullName[endStatus.count-1]}">
         <img src="/pd/event/upload/${endImg[endStatus.count-1]}" width="200" height="200"><br>종료된 이벤트입니다
         </a>
      </td>
   </c:if>
   <c:if test="${endSubject[endStatus.count-1] eq null}">
      <td><img src="event/none.jpg" width="200" height="200"><br>&nbsp;<br>&nbsp;</td>
   </c:if>
   </c:forEach>
      <c:if test="${endlastPage!=-1 }">
         <td><a href="event.pd?endCp=${endCp+1}"><img src="event/right.png" width="50" height="50"></a></td>
      </c:if>
      <c:if test="${endlastPage==-1 }">
         <td><img src="event/none.jpg" width="50" height="50"></td>
      </c:if>
   </tr>
</table>
</div>    
</div>
<%@ include file="../header.jsp"%>   
</div>
</body>
</html>