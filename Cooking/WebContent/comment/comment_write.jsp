<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cooking</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="../css/comment_write.css">
<style>
	#td4{
		background:#218559;
	}
</style>
<%
	String user_id=(String)session.getAttribute("user_id");
	if(user_id==null||user_id.equals("")){
		%>
		<script>
		window.alert('로그인 후 서비스 이용이 가능합니다.');
		window.self.close();
		location.href='../comment/comment_main.jsp';
		</script>
		<%
	}
%>
<title>Insert title here</title>

<script type="text/javascript">
function inImg() {
	if(document.getElementById("comment_imgDiv")==null){
		document.getElementById("comment_content_div").innerHTML+="<span id='comment_imgDiv'><img src='' width='100px' height='100px' id='comment_img'></span><br><br>";
	}
	else{
		document.getElementById("comment_imgDiv").outerHTML="";
		document.getElementById("comment_content_div").innerHTML+="<span id='comment_imgDiv'><img src='' width='100px' height='100px' id='comment_img'></span><br><br>";
	}
}

function imgPreview() {
	  var preview = document.getElementById('comment_img');
	  var file    = document.getElementById('comment_file').files[0];
	  var reader  = new FileReader();
	  var text = document.getElementById('comment_text');
	  
	  if(file==null){
		  preview.src="";
		  text.value="선택된 파일 없음";
	  }
	  else{
		  text.value=document.getElementById('comment_file').value;
		  reader.addEventListener("load", function () {
		    preview.src = reader.result;
		  }, false);
	
		  if (file) {
		    reader.readAsDataURL(file);
		  }
	  }
}

function hiddenGo() {
	if(document.getElementById("comment_imgDiv")!=null){
		document.getElementById("comment_imgDiv").outerHTML="|img|";
	}
	document.getElementById("comment_content").value=document.getElementById("comment_content_div").innerHTML;
}

function divDel() {
	document.getElementById("comment_content_div").innerHTML="";
}

function checkDiv() {
	if(document.getElementById("comment_content_div").innerText==""){
		alert("본문이 비어 있음");
	}
	else{
		var title=document.getElementById("comment_title").value;
		if(title==""){
			alert("제목이 비어 있음");
		}
		else{
			hiddenGo();
			document.getElementById("comment_ok").submit();
		}
	}
}

</script>

</head>
<body>
<%@include file="../header.jsp" %>
<%
	String nickname = (String)session.getAttribute("user_nickname");
%>
<section>
	<article>
		<form name="comment_ok" action="comment_write_ok.jsp" enctype="multipart/form-data" method="post" id="comment_ok">
		<input type="hidden" name="comment_readnum" value="1">
			<br>
			<fieldset id="title">
				<h1>후기등록</h1>
			</fieldset>
			<br>
			<fieldset id="main">
				<table border="1" cellspacing="0" id="info">
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="comment_title" size="70" required="required" id="comment_title"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><%=nickname %></td>
					</tr>
					<tr>
						<th>분류</th>
						<td>
						<input type="radio" name="comment_category" value="한식">한식
						<input type="radio" name="comment_category" value="중식">중식
						<input type="radio" name="comment_category" value="양식">양식
						<input type="radio" name="comment_category" value="일식">일식
						<input type="radio" name="comment_category" value="야식">야식
						<input type="radio" name="comment_category" value="기타" checked="checked">기타
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button id="comment_button">파일선택</button>
							<input type="file" name="comment_img" id="comment_file" value="이미지삽입" accept=".jpg, .png, .gif" onChange="inImg();imgPreview();">
							<input type="text" id="comment_text" value="선택된 파일 없음" readonly="readonly">
						</td>
					</tr>
				</table>
				<br>
				<hr>
				<br>
				<div contentEditable="true" id="comment_content_div" style="border:1px solid black; height:300px; width:810px;"></div>
				<input type="hidden" name="comment_content" id="comment_content">
				<br>
				<hr>
				<p><input type="button" value="후기등록" onClick="checkDiv()" id="ok">
				<input type="reset" value="다시작성" onClick="divDel()" id="re"></p>
			</fieldset>	
		</form>		
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>