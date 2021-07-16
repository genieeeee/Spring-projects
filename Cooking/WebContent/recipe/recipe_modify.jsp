<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="project.recipe_modify.*" %>
<%@ page import="project.recipe.view_img.*" %>
<jsp:useBean id="rmDAO" class="project.recipe_modify.recipe_modifyDAO" scope="page"/>
<jsp:useBean id="viDAO" class="project.recipe.view_img.view_imgDAO" scope="page"/>
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
		int recipe_idx=Integer.parseInt(request.getParameter("recipe_idx"));
		recipe_modifyDTO rmDTO=rmDAO.showRecipe(recipe_idx);
		
		/**권한 검사*/
		int write_user_idx=rmDTO.getUser_idx();
		int login_user_idx=-1;
		if(session.getAttribute("user_idx")==null || "".equals(session.getAttribute("user_idx"))){
		}
		else{
			login_user_idx=(Integer)session.getAttribute("user_idx");
		}
		
		if(login_user_idx!=write_user_idx && login_user_idx!=0){
			%>
			<script>
				alert("권한이 없습니다.");
				location.href="recipe_view.jsp?recipe_idx=<%=recipe_idx%>&recipe_category=<%=rmDTO.getRecipe_category()%>";
			</script>
			<%
			return;
		}
	%>

	<script type="text/javascript">
		function positiveNum(obj) {
		    if (event.keyCode>= 48 && event.keyCode<=57) {
		        return true;
		    } else {
		        event.returnValue = false;
		    }
		}
		
		var stepNum=<%=rmDTO.getRecipe_step().split("\\|").length%>;
		
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
						+"<p><img id='img_"+ stepNum +"' width='30px' height='30px'> <br>"
						+"<button id='file_Button_"+ stepNum +"'>파일선택</button>"
						+" <input type='file' id='file_"+ stepNum +"' name='file_"+ stepNum +"' onChange='imgPreview("+stepNum+")' required='required' accept='.jpg, .gif, .png'>"
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
<body>
	
	<%@include file="../header.jsp" %>

	<article id="writeArticle">
		<section id="writeSection">
			<h2 id="writeH2">레시피 수정</h2>
	
			<form action="recipe_modify_ok.jsp?recipe_idx=<%=recipe_idx %>" method="post" name="recipe_write" enctype="multipart/form-data">
			<table id="writeTable">
			
				<!-- 메인 타이틀 -->
				<tr>
					<th>타이틀</th>
					<td>
						<input type="text" name="recipe_title" id="recipe_title" value="<%= rmDTO.getRecipe_title()%>" required="required" maxlength="30">
				 	</td>
				</tr>
				
				<!-- 메인 이미지 -->
				<tr>
					<th>이미지</th>
					<td>
						<%
							String[] imgNums=rmDTO.getRecipe_img().split("\\|");
							int img_idx=Integer.parseInt(imgNums[0]);
							view_imgDTO viDTO=viDAO.view_img(img_idx);
						%>
						<img src="<%=viDTO.getImg_path()+viDTO.getImg_idx()+viDTO.getImg_extension() %>" id="img_main">
						<br>
						<input type="button" onClick="window.open('recipe_modify_img.jsp?recipe_idx=<%=recipe_idx%>&img_num=0', 'recipe_modify', 'width=430px height=130px');" value="이미지 변경" id="mainimgButton">
				 	</td>																																											
				</tr>
				
				<!-- 간단 소개 -->
				<tr>
					<th>간단소개 </th>
					<td><textarea name="recipe_simple_comment" id="recipe_simple_comment" required="required" maxlength="400"><%=rmDTO.getRecipe_simple_comment() %></textarea></td>
				</tr>
		
				<!-- 요리시간 -->		
				<tr>
					<th>요리시간</th>
					<td>
						<input type="number" name="recipe_time_s" onkeypress="positiveNum(this)" value="<%=rmDTO.getRecipe_time_s()%>" required="required" max="1000" maxlength="4" onInput="maxLengthCheck(this)" onChange="minMaxsize(this)">
						&nbsp; ~ &nbsp;
						<input type="number" name="recipe_time_a" onkeypress="positiveNum(this)" value="<%=rmDTO.getRecipe_time_a()%>" required="required" max="1000" maxlength="4" onInput="maxLengthCheck(this)" onChange="minMaxsize(this)">
						&nbsp;분
					</td>
				</tr>
				
				<!-- 가격 -->
				<tr>
					<th>가격</th>
					<td>
						<input type="number" name="recipe_price" onkeypress="positiveNum(this)" value="<%=rmDTO.getRecipe_price()%>" required="required" max="100000" maxlength="6" onInput="maxLengthCheck(this)">&nbsp; 원
					</td>
				</tr>
				
				<!-- 재료 -->
				<tr>
					<th>재료</th>
					<%
						String[] materials=rmDTO.getRecipe_material().split("\\|");
					%>
					<td>
						주재료<br>
						<input type="text" name="recipe_material_1" value="<%=materials[0]%>" required="required" id="recipe_material_main" maxlength="30"><br>
						부재료<br>
						<%
							for(int i=1 ; i<materials.length ; i++){
									%><input type="text" name="recipe_material_<%=i+1%>" value="<%=materials[i]%>" class="recipe_material_side" maxlength="30"><br><%
							}
							for(int i=materials.length ; i<5 ; i++){
									%><input type="text" name="recipe_material_<%=i+1%>" class="recipe_material_side" maxlength="30"><br><%
							}
						%>
					</td>
				</tr>
				
				<!-- 종류 -->
				<tr>
					<th>종류</th>
					<td>
						<label><input type="radio" name="recipe_category" value="한식" <%="한식".equals(rmDTO.getRecipe_category())?"checked='checked'":""%>>한식</label>
						<label><input type="radio" name="recipe_category" value="중식" <%="중식".equals(rmDTO.getRecipe_category())?"checked='checked'":""%>>중식</label>
						<label><input type="radio" name="recipe_category" value="양식" <%="양식".equals(rmDTO.getRecipe_category())?"checked='checked'":""%>>양식</label>
						<label><input type="radio" name="recipe_category" value="일식" <%="일식".equals(rmDTO.getRecipe_category())?"checked='checked'":""%>>일식</label>
						<label><input type="radio" name="recipe_category" value="야식" <%="야식".equals(rmDTO.getRecipe_category())?"checked='checked'":""%>>야식</label>
						<label><input type="radio" name="recipe_category" value="기타" <%="기타".equals(rmDTO.getRecipe_category())?"checked='checked'":""%>>기타</label>
					</td>
				</tr>
			</table>
			
			<input type="hidden" name="stepNum_s" id="stepNum" value="<%=rmDTO.getRecipe_step().split("\\|").length%>">
			<%
				String[] steps=rmDTO.getRecipe_step().split("\\|");
				for(int i=0 ; i<steps.length ; i++){
					img_idx=Integer.parseInt(imgNums[i+1]);
					viDTO=viDAO.view_img(img_idx);
					%>
					<div id='div_<%=i+1%>'>
					<h3 id='h3_<%=i+1%>'>STEP <%=i+1%></h3> 
					<p id="imgP_<%=i+1%>"><img id='img_<%=i+1%>'  width='30px' height='30px' src="<%=viDTO.getImg_path()+viDTO.getImg_idx()+viDTO.getImg_extension()%>" id="stepImg<%=i+1%>"> <br> </p>
					<p id="buttonP_<%=i+1%>"><input type="button" onClick="window.open('recipe_modify_img.jsp?recipe_idx=<%=recipe_idx%>&img_num=<%=i+1 %>' , 'recipe_modify', 'width=400px height=100px;');" value="이미지 변경" id="imgButton_<%=i+1%>"></p>
					<textarea id='text_<%=i+1%>' name='recipe_step_<%=i+1%>' required="required"><%=steps[i] %> </textarea>
					</div>
					<%
				}
				for(int i=steps.length ; i<10 ; i++){
					%>
					<div id='div_<%=i+1%>'></div>
					<%
				}
			%>
			
			<div id="stepDiv">
			<input type="button" value="스탭 증가" id="stepAddButton" onClick="stepAdd()">
			<input type="button" value="스탭 삭제" onClick="stepDel()" id="stepDelButton">
			</div>
			
			<div id="subDiv">
			<input type="submit" value="작성" id="submitButton">
			</div>
			</form>
		</section>
	</article>
	
	
	
</body>
</html>