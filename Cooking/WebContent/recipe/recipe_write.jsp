<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cooking</title>
	<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">
	
	<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
	<link rel="stylesheet" type="text/css" href="../css/recipe_write.css">
	
	<style>
	#td2{
		background:#218559;
	}
	</style>	
	<%
		String user_id=(String)session.getAttribute("user_id");
		if(user_id==null || "".equals(user_id)){
			%>
			<script type="text/javascript">
				alert("회원만 작성 할 수 있습니다.");
				location.href="recipe_main.jsp";
			</script>
			<%
		}
	%>
	
	<script type="text/javascript">
		var stepNum=0;
		function stepAdd() {
			if(stepNum>9){
				alert("더이상 만들수 없습니다.");
				return;
			}else if(stepNum<0){
				alert("잘못된 접근입니다.");
				return;
			}
			stepNum++;
			var inStr="<h3 id='h3_"+stepNum+"'>STEP "+ stepNum +"</h3>"
						+"<p><img id='img_"+ stepNum +"' width='30px' height='30px'> <br> "
						+"<button id='file_Button_"+ stepNum +"'>파일선택</button>"
						+"<input type='file' id='file_"+ stepNum +"' name='file_"+ stepNum +"' onChange='imgPreview("+stepNum+")' required='required' accept='.jpg, .gif, .png'>"
						+"<input type='text' id='file_text_"+ stepNum +"' value='선택된 파일이 없음' readonly='readonly'></p>"
						+"<textarea id='text_"+stepNum+"' name='recipe_step_"+stepNum+"' required='required' maxlength='400'></textarea>";
			document.getElementById("div_"+stepNum).innerHTML=inStr;
			document.getElementById("stepNum").value=stepNum;
		}
		
		function stepDel() {
			if(stepNum==1){
				alert("최소 Step 1은 존재 하여야 합니다.");
				return;
			}
			else{
				document.getElementById("div_"+stepNum).innerHTML="";
				stepNum=stepNum-1;
				document.getElementById("stepNum").value=stepNum;
			}
		}
		
		
		function imgPreview(i) {
			  var preview = document.getElementById('img_'+i);
			  var file    = document.getElementById('file_'+i).files[0];
			  var reader  = new FileReader();
			  var text = document.getElementById('file_text_'+i);
			  
			  if(file==null){
				  preview.src="";
				  text.value="선택된 파일 없음";
			  }
			  else{
				  text.value=document.getElementById('file_'+i).value;
				  reader.addEventListener("load", function () {
				    preview.src = reader.result;
				  }, false);
	
				  if (file) {
				    reader.readAsDataURL(file);
				  }
			  }
		}
		
		function mainImg() {
			  var preview = document.getElementById('img_main');
			  var file    = document.getElementById('file_main').files[0];
			  var reader  = new FileReader();
			  var text = document.getElementById('file_main_text');
			  
			  if(file==null){
				  preview.src="";
				  text.value="선택된 파일 없음";
			  }
			  else{
				  text.value=document.getElementById('file_main').value;
				  reader.addEventListener("load", function () {
				    preview.src = reader.result;
				  }, false);
	
				  if (file) {
				    reader.readAsDataURL(file);
				  }
			  }
		}
		
		function imgDel() {
			document.getElementById("img_main").src="";
			for(var i=1 ; i<stepNum+1 ; i++){
				document.getElementById("img_"+i).src="";
			}
		}
		
		function stepDef() {
			if(stepNum<1){
				stepAdd();
			}
		}
		
		function positiveNum(obj) {
			    if (event.keyCode>= 48 && event.keyCode<=57) {
			        return true;
			    } else {
			        event.returnValue = false;
			    }
		}
		
		function maxLengthCheck(object){
			  if (object.value.length > object.maxLength){
			   object.value = object.value.slice(0, object.maxLength);
			  }    
		 }
		
		function minMaxsize(object) {
			var start_str=document.recipe_write.recipe_time_s.value;
			var end_str=document.recipe_write.recipe_time_a.value;
			var start=parseInt(start_str);
			var end=parseInt(end_str);
			if(start!="" && end!=""){
				if(start>end){
					if(object.name=="recipe_time_s"){
						alert("최소시간이 최대시간보다 클 수 없습니다.");
						object.value=end;
					}
					else if(object.name=="recipe_time_a"){
						alert("최대시간이 최초시간보다 작을 수 없습니다.");
						object.value=start;
					}
				}
			}
		}

	</script>
</head>
<body onLoad="stepDef()">
	<%@include file="../header.jsp" %>

	<article id="writeArticle">
		<section id="writeSection">
			<h2 id="writeH2">레시피 작성</h2>
	
			<form action="recipe_write_ok.jsp" method="post" name="recipe_write" enctype="multipart/form-data">
			<table id="writeTable">
			
				<!-- 메인 타이틀 -->
				<tr>
					<th>타이틀</th>
					<td>
						<input type="text" name="recipe_title" id="recipe_title" required="required" maxlength="30">
				 	</td>
				</tr>
				
				<!-- 메인 이미지 -->
				<tr>
					<th>이미지</th>
					<td>
						<img src="" id="img_main" width="50px" height="50px">
						<br>
						<button id="file_main_Button">파일선택</button>
						<input type="file" id="file_main" onChange="mainImg()" name="recipe_img" required="required" accept=".jpg, .gif, .png">
						<input type="text" id="file_main_text" value="선택된 파일이 없음" readonly="readonly">
				 	</td>
				</tr>
				
				<!-- 간단 소개 -->
				<tr>
					<th>간단소개 </th>
					<td><textarea name="recipe_simple_comment" id="recipe_simple_comment" required="required" maxlength="400"></textarea></td>
				</tr>
		
				<!-- 요리시간 -->		
				<tr>
					<th>요리시간</th>
					<td>
						<input type="number" name="recipe_time_s" onkeypress="positiveNum(this)" required="required" max="1000" maxlength="4" onInput="maxLengthCheck(this)" onChange="minMaxsize(this)">
						&nbsp; ~ &nbsp;
						<input type="number" name="recipe_time_a" onkeypress="positiveNum(this)" required="required" max="1000" maxlength="4" onInput="maxLengthCheck(this)" onChange="minMaxsize(this)">
						&nbsp;분
					</td>
				</tr>
				
				<!-- 가격 -->
				<tr>
					<th>가격</th>
					<td>
						<input type="number" name="recipe_price" onkeypress="positiveNum(this)" required="required" max="100000" maxlength="6" onInput="maxLengthCheck(this)">&nbsp; 원
					</td>
				</tr>
				
				<!-- 재료 -->
				<tr>
					<th>재료</th>
					<td>
						주재료<br>
						<input type="text" name="recipe_material_1" required="required" id="recipe_material_main" maxlength="30"><br>
						부재료<br>
						<input type="text" name="recipe_material_2" class="recipe_material_side" maxlength="30"><br>
						<input type="text" name="recipe_material_3" class="recipe_material_side" maxlength="30"><br>
						<input type="text" name="recipe_material_4" class="recipe_material_side" maxlength="30"><br>
						<input type="text" name="recipe_material_5" class="recipe_material_side" maxlength="30">
					</td>
				</tr>
				
				<!-- 종류 -->
				<tr>
					<th>종류</th>
					<td>
						<label><input type="radio" name="recipe_category" value="한식" checked="checked">한식</label>
						<label><input type="radio" name="recipe_category" value="중식">중식</label>
						<label><input type="radio" name="recipe_category" value="양식">양식</label>
						<label><input type="radio" name="recipe_category" value="일식">일식</label>
						<label><input type="radio" name="recipe_category" value="야식">야식</label>
						<label><input type="radio" name="recipe_category" value="기타">기타</label>
					</td>
				</tr>
			</table>
			
			<input type="hidden" name="stepNum_s" id="stepNum">
			<div id="div_1"></div>
			<div id="div_2"></div>
			<div id="div_3"></div>
			<div id="div_4"></div>
			<div id="div_5"></div>
			<div id="div_6"></div>
			<div id="div_7"></div>
			<div id="div_8"></div>
			<div id="div_9"></div>
			<div id="div_10"></div>
			
			<div id="stepDiv">
			<input type="button" onclick="stepAdd()" value="스탭 증가" id="stepAddButton">
			<input type="button" onclick="stepDel()" value="스탭 삭제" id="stepDelButton">
			</div>
			
			<div id="subDiv">
			<input type="submit" value="작성" id="submitButton">
			<input type="reset" onClick="imgDel()" id="resetButton">
			</div>
			</form>
		</section>
	</article>
	
	<%@include file="../footer.jsp" %>
</body>
</html>