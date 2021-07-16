<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>

$(function(){
    //전역변수
    var obj = [];              
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "editor",
        sSkinURI: "resource/editor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false,
        }
     }); 
    
    var org = document.form.test.value;
    $("#editor").text(org);
	//obj.getById["editor"].exec("LOAD_CONTENTS_FIELD");
    	

    
    //전송버튼
    $("#savebutton").click(function(){
        //id가 editor인 textarea에 에디터에서 대입
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
        
    	var StrObj = $('#editor').val();
    	var src = "<img class=\"thumb-img\" alt=\"work-thumbnail\" height=\"270px\" src=\"/pd/resource/editor/multiupload";
    	var aa = StrObj.split("<img src=\"multiupload");
    	var content = aa[0];
    	for(var i=1;i<aa.length; i++){
    		var cc = src+aa[i];
    		content += cc;
    	}
    	document.form.dia_content.value = content;
    	
    	var img = "<img class=\"thumb-img\" alt=\"work-thumbnail\" height=\"250px\" src=''>"; // if no match, use this
		var imgArray = content.match(/<img\ssrc=\"\/pd\/resource\/editor\/multiupload\/\w+[-_]?\w+\.\w+&#\d+;\"\stitle=\"\w+[-_]?\w+\.\w+\">/gi);
		if (imgArray) {
			img = "";
			img += imgArray[0];
		}
		var src1 = "<img class=\"thumb-img\" alt=\"work-thumbnail\" height=\"250px\" src=\"";
		var src2 = img.substr(10, img.length);
		var src3 = src1 + src2;
		document.form.Mimg.value = src3;
		
        //폼 submit
        $("#frm").submit(); 
    });  

});
</script>
</head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-sm" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
			<div class="hidden-sm"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>			
			<div class="col-xs-11 col-sm-11 portfolioContainer">
				<form name="form" action="diaryUpdate.pd" method="post" id="frm">
					<c:forEach var="li" items="${dia_content}">
						<input type="hidden" name="dia_idx" value="${li.dia_idx }">
						<input type="hidden" name="Mimg">
						<p style="text-align: left;">
							<label>제 목 </label> <input type="text" size="93" name="dia_subject" value="${li.dia_subject}">
							<input type="submit" id="savebutton" value="수정">
						</p>
						<textarea style="display: none;" name="test">${li.dia_content}</textarea>
						<textarea id="editor" rows="10" cols="100" style="width: 766px; height: 412px;" name="dia_content"></textarea>
						<br>
					</c:forEach>			
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
</div>
</body>
</html>