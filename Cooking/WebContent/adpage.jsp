<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#adTable{
			margin: 0px auto;
		}
		.adButton{
			width: 30px;
		    height: 30px;
		    border: 0px;
		    border-radius: 10px;
		    background-color: #268463;
		    color: #ffffff;
		    cursor: pointer;
		}
	</style>
	<script type="text/javascript">
		var num=0;
		var str="";
		function slideA() {
			num=num+1;
			if(num>3){
				num=1;
			}
			var alink="<a href='";
			switch(num){
				case 1 : alink+="http://bontamall.com/product/detail.html?product_no=5067&cate_no=490&display_group=1"; break;
				case 2 : alink+="http://skin-skin16.kkkwon95.cafe24.com/product/search.html?banner_action=&keyword=%EC%B9%B4%EC%95%BC%EC%9E%BC"; break; 
				case 3 : alink+="http://bontamall.com/product/search.html?banner_action=&keyword=%EC%BD%94%EC%BD%94%EB%84%9B%EC%98%A4%EC%9D%BC"; break; 
			}
			str=alink + "' target='_blank'><img src='/project/ad/ad_" + num + ".jpg' width='450px' height='182px'></a>";
			document.getElementById("adSpan").innerHTML=str;
			window.setTimeout('slideA()', 3000);
		}
		
		function adControl(control) {
			if(control==1){
				num=num-1;
				if(num<1){
					num=3;
				}
			}
			else if(control==3){
				num=num+1;
				if(num>3){
					num=1;
				}
			}
			var alink="<a href='";
			switch(num){
				case 1 : alink+="http://bontamall.com/product/detail.html?product_no=5067&cate_no=490&display_group=1"; break;
				case 2 : alink+="http://skin-skin16.kkkwon95.cafe24.com/product/search.html?banner_action=&keyword=%EC%B9%B4%EC%95%BC%EC%9E%BC"; break; 
				case 3 : alink+="http://bontamall.com/product/search.html?banner_action=&keyword=%EC%BD%94%EC%BD%94%EB%84%9B%EC%98%A4%EC%9D%BC"; break; 
			}
			str=alink + "' target='_blank'><img src='/project/ad/ad_" + num + ".jpg' width='450px' height='182px'></a>";
			document.getElementById("adSpan").innerHTML=str;
		}
		
		window.addEventListener("load", function() {
			slideA();
			}, false);
	</script>
</head>
<body>
	<table id="adTable">
		<tr>
			<td>
				<input type="button" value="&lt;" onClick="adControl(1)" class="adButton">
			</td>
			<td>
				<span id="adSpan"></span>
			</td>
			<td>
				<input type="button" value="&gt;" onClick="adControl(3)" class="adButton">
			</td>
		</tr>
	</table>
</body>
</html>