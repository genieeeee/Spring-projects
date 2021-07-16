<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.intro{
  width:100%;
  height:30px;
}
.intro h1{
  font-family:'Oswald', sans-serif;
  letter-spacing:2px;
  font-weight:normal;
  font-size:14px;
  color:#222;
  text-align:center;
  margin-top:10px;
}
.intro a{
  color:#e74c3c;
  font-weight:bold;
  letter-spacing:0;
}
.intro img{
  width:20px;
  heght:20px;
  margin-left:5px;
  margin-right:5px;
  position:relative;
  top:5px;
}

*{margin:0;padding:0;box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;}
#container{
  width:715px;
  height:230px;
  margin:50px auto;
}


.button-4{
  width:300px;
  height:50px;
  border:2px solid #34495e;
  float:left;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:0 0 40px 50px;
}
.button-4 a{
  font-family:arial;
  font-size:16px;
  color:#34495e;
  text-decoration:none;
  line-height:50px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}
.eff-4{
  width:300px;
  height:50px;
  left:-300px;
  background:#34495e;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}
.button-4:hover .eff-4{
  left:0;
}
.button-4:hover a{
  color:#fff;
}


h1{
  font-family: 'Oswald', sans-serif;
  font-weight:normal;
  font-size:24px;
  color:#34495e;
  text-align:center;
  margin:0 auto 40px 0;
}
h1:first-letter{
  color:#e74c3c;
  border-bottom:1px solid #e74c3c;
}
footer{
  position:absolute;
  width:100%;
  height:30px;
  border-top:1px solid #34495e;
  bottom:0;
  display:none;
}
footer h1{
  font-family: 'Oswald', sans-serif;
  font-weight:normal;
  font-size:14px;
  color:#34495e;
  text-align:left;
  margin-left:5%;
}
footer a{
  font-family: 'Oswald', sans-serif;
  font-weight:normal;
  font-size:14px;
  color:#34495e;
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
function notEntry(){
   alert('비회원 | SNS회원은 응모하실 수 없습니다');
}
</script>
</head>
<body>
<div class="page-container">
   <div class="content">
      <div class="col-xs-8 col-sm-9 col-md-10" style="margin-left: 150px;">
   
   
    <br><br>
	<a href="event.pd"><p id="rcorners2" align="center" style="width:80%">${subject}</p></a>
    <br><br><br>
    
    
<c:forEach var="imgList" items="${imgSrc}">
   <img src="event/upload/${subject}/${imgList}" style="width: 80%;"><br>
</c:forEach><br><br><br><br><br><br>


<c:if test="${mem_id ne null and memInfo[0].mem_grade != 2 }">
   <div id="container">
	<div class="button-4" style="margin-left: 150px;">
    <div class="eff-4"></div>
   		<a href="eventEntry.pd?id=${mem_id}&fullName=${fullName}"> 응모하기 </a>
   </div>
	</div>
</c:if>

</div></div>
<c:if test="${mem_id eq null or memInfo[0].mem_grade == 2 }">
	<div id="container">
	<div class="button-4" style="margin-left: 150px;">
    <div class="eff-4"></div>
    	<a href="javascript:notEntry()"> 응모하기 </a>
	</div>
	</div>
</c:if>

<%@ include file="../header.jsp"%>  
</div>
</body>
</html>