<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cooking</title>
	<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	<style type="text/css">
	#imgDiv{
		text-align: center;
    	padding-top: 25px;
	}
	
	#file_Button{
		width: 70px;
		height: 25px;
		position: absolute;
		border: 0px;
		border-radius: 10px;
	    background-color: #268463;
	    color: #ffffff;
	    cursor: pointer;
	}
	
	input[type='file']::-webkit-file-upload-button{
		cursor:pointer;
	}
	
	#input_file{
		width: 70px;
		height: 25px;
		opacity: 0;
		position: relative;
	}
	
	#file_text{
	border: 0px;
	height: 20px;
	padding-left: 5px;
	}
	
	#submitButton{
		width: 50px;
	    height: 30px;
	    border: 0px;
	    border-radius: 10px;
	    background-color: #268463;
	    color: #ffffff;
	    cursor: pointer;
	}
	
	#msgP{
		color: #ff0000;
	}
	</style>
	<script type="text/javascript">
		function mainImg() {
			var file=document.getElementById('input_file').files[0];
			var text = document.getElementById('file_text');
			if(file==null){
				text.value="선택된 파일 없음";
			}
				else{
					text.value=document.getElementById('input_file').value;
			}
		}
		
		function changeSubmit() {
			var file=document.getElementById('input_file').files[0];
			if(file==null){
				alert("변경 파일을 선택하지 않았습니다.");
			}
			else{
				document.getElementById("changeForm").submit();
			}
			
		}
	</script>
</head>
<body>
	<%
		String recipe_idx=request.getParameter("recipe_idx");
		String img_num=request.getParameter("img_num");
	%>
	<div id="imgDiv">
	<form id="changeForm" action="recipe_modify_img_ok.jsp?recipe_idx=<%=recipe_idx %>&img_num=<%=img_num %>" method="post" enctype="multipart/form-data">
		<button id="file_Button">파일선택</button>
		<input type="file" name="change_File" accept=".jpg, .gif, .png" id="input_file" onChange="mainImg()">
		<input type="text" id="file_text" value="선택된 파일이 없음" readonly="readonly">
		<input type="button" id="submitButton" value="변경" onClick="changeSubmit()">
	</form>
	<p id="msgP">※ 작성을 중단 하더라도 바뀐 이미지로 적용 됩니다. </p>
	</div>
</body>
</html>