<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="utf-8">
<head>
<title>Tourist destination</title>
<link rel="stylesheet" type="text/css" href="css/place.css"> 
<script type="text/javascript">
var neighborhoods = [
   //파리 
     {lat:  48.858372, lng: 2.294471}, 
    //칸
   	 {lat: 43.506065, lng: 6.987305},
   
   //로마
  	 {lat:  41.585319, lng: 12.700195},
    //밀라노
   	 {lat: 45.562782, lng: 9.140625},
    

   //마드리드
   	{lat:  40.257172, lng: -3.383789},
    //발렌시아
    {lat: 39.379603, lng: -0.395508},
    
    
   //베른  
  	{lat:  46.9479739, lng: 7.459717},
    //튠
    {lat: 46.74864455, lng: 7.630005},
    
   
   //영국
    {lat: 51.503293230761045, lng: -0.11960506439208984},
  	{lat: 51.505293230761045, lng: -0.13160506439208984},
 	{lat: 51.513301, lng: -1.164551},
 	{lat: 52.580801, lng: -0.153809}
  ];



	function jkd() {
		var choicebut = document.getElementById("autocomplete").value;
		document.getElementById('info4').innerHTML = '<div class="container" style="width:30%;">'
														+'<div class="btn-group btn-group-justified"><div class="btn-group">'
															+'<button value="식당" onclick="butt(this)"  class="btn btn-primary">식당</button></div>'
															+'<div class="btn-group"><button value="관광지"  onclick="search()" class="btn btn-primary" style="background-color:#5A3C46;">관광지</button></div>'
														+'</div>'
													+'</div>';
		
		var fakesearch = document.getElementById("autocomplete").value;



		if (fakesearch == "영국") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="3" width="30%" style="text-align:center;"><img src="data:image/jpeg;base64,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" width="200",height="200"></td></tr><tr><th >나라 </th><td >영국</td></tr ><tr><th >위치  </th><td >런던</td></tr><tr ><td style="text-align:center;"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=51.503293230761045&jim_longitude=-0.11960506439208984&jim_img=http://www.socuripass.com/wp-content/uploads/2015/12/lon-londoneye-2.jpg&jim_placename=런던아이&jim_addr=런던&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'영국\',\'런던\',\'런던아이\',54.8,-4.6)"></td><th>장소 명 </td><td>런던아이</td></tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="ENGLAND">'
				+ '<input type="hidden" name="place_state" value="LONDON">'
				+ '<input type="hidden" name="place_id" value="LONDONEYE">'
				+ '<input type="hidden" name="lat" value="51.5032">'
				+ '<input type="hidden" name="lng" value="0.119605">'
				document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="3" width="30%" style="text-align:center;"><img src="http://scontent.cdninstagram.com/t51.2885-15/s480x480/e35/c0.134.1080.1080/16230984_615116842019497_7768490219392729088_n.jpg?ig_cache_key=MTQzNTgwODg4NTgwMDgyNzUzNg%3D%3D.2.c" width="200",height="200"></td></tr><tr><th >나라 </th><td >영국</td></tr ><tr><th >위치  </th><td >런던</td></tr><tr ><td style="text-align:center;"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=551.503293230761045&jim_longitude=-0.311960506439208984&jim_img=http://scontent.cdninstagram.com/t51.2885-15/s480x480/e35/c0.134.1080.1080/16230984_615116842019497_7768490219392729088_n.jpg?ig_cache_key=MTQzNTgwODg4NTgwMDgyNzUzNg%3D%3D.2.c&jim_placename=Sherlock Holmes Museum&jim_addr=london&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'영국\',\'런던\',\'셜록홈즈 박물관\',54.8,-4.6)"></td><th>장소 명</td><td>셜록홈즈 박물관</td></tr></table></div>'
					+ '<input type="hidden" name="place_nation" value="ENGLAND">'
					+ '<input type="hidden" name="place_state" value="LONDON">'
					+ '<input type="hidden" name="place_id" value="Sherlock Holmes Museum">'
					+ '<input type="hidden" name="lat" value="51.55032">'
					+ '<input type="hidden" name="lng" value="0.3119605">'
					document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="3" width="30%" style="text-align:center;"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8N3JZyhv4k7JXtrsq6Vz54Cgg7DqSFjoG1P5svUvhl7D8TRXz7Q" width="200",height="200"></td></tr><tr><th >나라 </th><td >영국</td></tr ><tr><th >위치  </th><td >런던</td></tr><tr ><td style="text-align:center;"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=552.503293230761045&jim_longitude=-0.411960506439208984&jim_img=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8N3JZyhv4k7JXtrsq6Vz54Cgg7DqSFjoG1P5svUvhl7D8TRXz7Q&jim_placename=City of Manchester Stadium&jim_addr=Manchester&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'영국\',\'맨체스터\',\'시티오브맨체스터스타디움\',54.8,-4.6)"></td><th>장소 명</td><td>시티오브맨체스터스타디움</td></tr></table></div>'
						+ '<input type="hidden" name="place_nation" value="ENGLAND">'
						+ '<input type="hidden" name="place_state" value="Manchester">'
						+ '<input type="hidden" name="place_id" value="City of Manchester Stadium">'
						+ '<input type="hidden" name="lat" value="52.580801">'
						+ '<input type="hidden" name="lng" value="-0.153809">'
		} else {
			document.getElementById('info3').innerHTML = '';
		}if (fakesearch == "영국잉글랜드런던") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="3" width="30%" style="text-align:center;"><img src="http://scontent.cdninstagram.com/t51.2885-15/s480x480/e35/c0.134.1080.1080/16230984_615116842019497_7768490219392729088_n.jpg?ig_cache_key=MTQzNTgwODg4NTgwMDgyNzUzNg%3D%3D.2.c" width="200",height="200"></td></tr><tr><th >나라 </th><td >영국</td></tr ><tr><th >위치  </th><td >런던</td></tr><tr ><td style="text-align:center;"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=551.503293230761045&jim_longitude=-0.311960506439208984&jim_img=http://scontent.cdninstagram.com/t51.2885-15/s480x480/e35/c0.134.1080.1080/16230984_615116842019497_7768490219392729088_n.jpg?ig_cache_key=MTQzNTgwODg4NTgwMDgyNzUzNg%3D%3D.2.c&jim_placename=Sherlock Holmes Museum&jim_addr=london&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'영국\',\'런던\',\'셜록홈즈 박물관\',54.8,-4.6)"></td><th>장소 명</td><td>셜록홈즈 박물관</td></tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="ENGLAND">'
				+ '<input type="hidden" name="place_state" value="LONDON">'
				+ '<input type="hidden" name="place_id" value="Sherlock Holmes Museum">'
				+ '<input type="hidden" name="lat" value="51.55032">'
				+ '<input type="hidden" name="lng" value="0.3119605">'
		}if (fakesearch == "영국잉글랜드맨체스터") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="3" width="30%" style="text-align:center;"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8N3JZyhv4k7JXtrsq6Vz54Cgg7DqSFjoG1P5svUvhl7D8TRXz7Q" width="200",height="200"></td></tr><tr><th >나라 </th><td >영국</td></tr ><tr><th >위치  </th><td >맨체스터</td></tr><tr ><td style="text-align:center;"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=552.503293230761045&jim_longitude=-0.411960506439208984&jim_img=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8N3JZyhv4k7JXtrsq6Vz54Cgg7DqSFjoG1P5svUvhl7D8TRXz7Q&jim_placename=City of Manchester Stadium&jim_addr=Manchester&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'영국\',\'맨체스터\',\'시티오브맨체스터스타디움\',54.8,-4.6)"></td><th>장소 명</td><td>시티오브맨체스터스타디움</td></tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="ENGLAND">'
				+ '<input type="hidden" name="place_state" value="Manchester">'
				+ '<input type="hidden" name="place_id" value="City of Manchester Stadium">'
				+ '<input type="hidden" name="lat" value="52.580801">'
				+ '<input type="hidden" name="lng" value="-0.153809">'
		}
		if (fakesearch == "프랑스") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="http://cfd.tourtips.com/@cms_600/2014102209/gje0ng/%ED%8C%8C%EB%A6%AC_%EC%83%B9%EC%A0%A4%EB%A6%AC%EC%A0%9C%EA%B1%B0%EB%A6%AC_TTS%EB%B0%95%EC%A7%84%ED%98%95%20(2).JPG"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=48.869916&jim_longitude=2.307915&jim_img=http://cfd.tourtips.com/@cms_600/2014102209/gje0ng/%ED%8C%8C%EB%A6%AC_%EC%83%B9%EC%A0%A4%EB%A6%AC%EC%A0%9C%EA%B1%B0%EB%A6%AC_TTS%EB%B0%95%EC%A7%84%ED%98%95%20(2).JPG&jim_placename=avenue des Champs-Élysées&jim_addr=paris&jim_score=4">담기</a><input type="button" value="+" onclick="planAdd(this,\'프랑스\',\'파리\',\'샹 젤리제 거리\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>프랑스</td></tr><tr><th>위치 : </th><td>파리</td></tr><tr><th>관광지 명 : </th><td>샹 젤리제 거리</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="france">'
				+ '<input type="hidden" name="place_state" value="paris">'
				+ '<input type="hidden" name="place_id" value="avenue des Champs-Élysées">'
				+ '<input type="hidden" name="lat" value="43.506065">'
				+ '<input type="hidden" name="lng" value="6.987305">'

		}if (fakesearch == "프랑스일 드 프랑스파리") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="http://cfd.tourtips.com/@cms_600/2014102209/gje0ng/%ED%8C%8C%EB%A6%AC_%EC%83%B9%EC%A0%A4%EB%A6%AC%EC%A0%9C%EA%B1%B0%EB%A6%AC_TTS%EB%B0%95%EC%A7%84%ED%98%95%20(2).JPG"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=48.869916&jim_longitude=2.307915&jim_img=http://cfd.tourtips.com/@cms_600/2014102209/gje0ng/%ED%8C%8C%EB%A6%AC_%EC%83%B9%EC%A0%A4%EB%A6%AC%EC%A0%9C%EA%B1%B0%EB%A6%AC_TTS%EB%B0%95%EC%A7%84%ED%98%95%20(2).JPG&jim_placename=avenue des Champs-Élysées&jim_addr=paris&jim_score=4">담기</a><input type="button" value="+" onclick="planAdd(this,\'프랑스\',\'맨체스터\',\'샹 젤리제 거리\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>프랑스</td></tr><tr><th>위치 : </th><td>파리</td></tr><tr><th>관광지 명 : </th><td>샹 젤리제 거리</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="france">'
				+ '<input type="hidden" name="place_state" value="paris">'
				+ '<input type="hidden" name="place_id" value="avenue des Champs-Élysées">'
				+ '<input type="hidden" name="lat" value="43.506065">'
				+ '<input type="hidden" name="lng" value="6.987305">'
		}
		
		
		if (fakesearch == "이탈리아") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="https://cdn.pixabay.com/photo/2016/03/17/15/50/firenze-1263163_960_720.jpg"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=43.771683&jim_longitude=11.260026&jim_img=https://cdn.pixabay.com/photo/2016/03/17/15/50/firenze-1263163_960_720.jpg&jim_placename=Different locations in Florence City Center&jim_addr=50122 Florence FI, 이탈리아&jim_score=3">담기</a><input type="button" value="+" onclick="planAdd(this,\'이탈리아\',\'피렌체\',\'플로렌스\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>이탈리아</td></tr><tr><th>위치 : </th><td>피렌체</td></tr><tr><th>관광지 명 : </th><td>플로렌스</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="이탈리아">'
				+ '<input type="hidden" name="place_state" value="50122 Florence FI, 이탈리아">'
				+ '<input type="hidden" name="place_id" value="Florence">'
				+ '<input type="hidden" name="lat" value="43.771683">'
				+ '<input type="hidden" name="lng" value="11.260026">'
			
			
			
			
		}if (fakesearch == "이탈리아라치오로마") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="http://www.viajesblog.es/wp-content/uploads/2015/10/italy-rome-panorama-aerial-view-of-st-peters-square-thinkstockphotos-184809233.jpg"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=41.902563&jim_longitude=12.495643&jim_img=http://www.viajesblog.es/wp-content/uploads/2015/10/italy-rome-panorama-aerial-view-of-st-peters-square-thinkstockphotos-184809233.jpg&jim_placename=Piazza della Repubblica, 61r&jim_addr=00185 Roma&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'이탈리아\',\'로마\',\'레푸블리카 광장\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>이탈리아</td></tr><tr><th>위치 : </th><td>로마</td></tr><tr><th>관광지 명 : </th><td>레푸블리카 광장</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="이탈리아">'
				+ '<input type="hidden" name="place_state" value="Piazza della Repubblica, 61">'
				+ '<input type="hidden" name="place_id" value="이탈리아라치오로마">'
				+ '<input type="hidden" name="lat" value="41.902563">'
				+ '<input type="hidden" name="lng" value="12.495643">'
		}if (fakesearch == "이탈리아롬바르디아밀라노") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="http://cfile22.uf.tistory.com/image/0245B04D50FD4B50355FC9"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=45.464293&jim_longitude=9.191926&jim_img=http://cfile22.uf.tistory.com/image/0245B04D50FD4B50355FC9&jim_placename=밀라노 대성당&jim_addr=Piazza del Duomo, 20122 Milano, 이탈리아&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'이탈리아\',\'밀라노\',\'두오모 성당\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>이탈리아</td></tr><tr><th>위치 : </th><td>밀라노</td></tr><tr><th>관광지 명 : </th><td>두오모 성당</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="이탈리아">'
				+ '<input type="hidden" name="place_state" value="Duomo di Milano">'
				+ '<input type="hidden" name="place_id" value="Piazza del Duomo, 20122 Milano, 이탈리아">'
				+ '<input type="hidden" name="lat" value="45.464293">'
				+ '<input type="hidden" name="lng" value="9.191926">'
		}if (fakesearch == "스위스") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfKKR8P3YqYT0iRrZ_xK4neTTbEH76dInCfDKBWnu6KslcGddl"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=46.787651&jim_longitude=7.895821&jim_img=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfKKR8P3YqYT0iRrZ_xK4neTTbEH76dInCfDKBWnu6KslcGddl&jim_placename=6197 Schangnau&jim_addr=Hohgant, 스위스&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'스위스\',\'루체른\',\'푸오클라 수를레이\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>스위스</td></tr><tr><th>위치 : </th><td>루체른 </td></tr><tr><th>관광지 명 : </th><td>푸오클라 수를레이</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="스위스">'
				+ '<input type="hidden" name="place_state" value="6197 Schangnau, 스위스">'
				+ '<input type="hidden" name="place_id" value="6197 Schangnau">'
				+ '<input type="hidden" name="lat" value="46.787651">'
				+ '<input type="hidden" name="lng" value="7.895821">'
		}if (fakesearch == "스위스취리히") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/2keB/image/eAuSonPV8lrgbv4K3GR1XUVSbQs"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=47.379026&jim_longitude=8.540056&jim_img=https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/2keB/image/eAuSonPV8lrgbv4K3GR1XUVSbQs&jim_placename=스위스 국립박물관&jim_addr=Schweizerisches Nationalmuseum, 스위스&jim_score=3">담기</a><input type="button" value="+" onclick="planAdd(this,\'스위스\',\'취리히\',\'스위스국립 박물관\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>스위스</td></tr><tr><th>위치 : </th><td>취리히</td></tr><tr><th>관광지 명 : </th><td>스위스 국립 박물관</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="스위스">'
				+ '<input type="hidden" name="place_state" value="6197 Schangnau, 스위스">'
				+ '<input type="hidden" name="place_id" value="6197 Schangnau">'
				+ '<input type="hidden" name="lat" value="46.787651">'
				+ '<input type="hidden" name="lng" value="7.895821">'
		}if (fakesearch == "스위스베른") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="http://cfile10.uf.tistory.com/image/262E983F53CBAAE638391E"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=47.379026&jim_longitude=8.540056&jim_img=http://cfile10.uf.tistory.com/image/262E983F53CBAAE638391E&jim_placename=스위스 연방 궁전&jim_addr=Bundesplatz 3, 3005 Bern,스위스&jim_score=3">담기</a><input type="button" value="+" onclick="planAdd(this,\'스위스\',\'베른\',\'스위스연방궁전\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>스위스</td></tr><tr><th>위치 : </th><td>베른</td></tr><tr><th>관광지 명 : </th><td>스위스 연방 궁전</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="스위스">'
				+ '<input type="hidden" name="place_state" value="Bundesplatz 3, 3005 Bern, 스위스">'
				+ '<input type="hidden" name="place_id" value="Bundesplatz 3, 3005 Bern, 스위스">'
				+ '<input type="hidden" name="lat" value="46.949962">'
				+ '<input type="hidden" name="lng" value="7.444993">'
		}if (fakesearch == "스페인") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="http://static-v3b.raileurope-world.com/local/cache-vignettes/L760xH507/spain-girona-_c_denis_mironov-121841095-43a7a.jpg"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=39.425748&jim_longitude=-3.361396&jim_img=http://static-v3b.raileurope-world.com/local/cache-vignettes/L760xH507/spain-girona-_c_denis_mironov-121841095-43a7a.jpg&jim_placename= Villafranca de los Caballeros&jim_addr=Parroquia Nuestra Señora de la Asunción&jim_score=3">담기</a><input type="button" value="+" onclick="planAdd(this,\'스페인\',\'똘레도\',\'똘레도\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>스페인</td></tr><tr><th>위치 : </th><td>똘레도</td></tr><tr><th>관광지 명 : </th><td>똘레도</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="스페인">'
				+ '<input type="hidden" name="place_state" value=" Villafranca de los Caballeros">'
				+ '<input type="hidden" name="place_id" value="Calle Iglesia, 1, 45730 Villafranca de los Caballeros, Toledo, 스페인">'
				+ '<input type="hidden" name="lat" value="39.425748">'
				+ '<input type="hidden" name="lng" value="-3.361396">'
		}if (fakesearch == "스페인카탈루나바르셀로나") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="http://cfile240.uf.daum.net/image/2609093C51BBF937165C20"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=41.402953&jim_longitude=2.175719&jim_img=http://cfile240.uf.daum.net/image/2609093C51BBF937165C20&jim_placename=La Sagrada Família&jim_addr=Carrer de Mallorca, 401, 08013 Barcelona, 스페인&jim_score=3">담기</a><input type="button" value="+" onclick="planAdd(this,\'스페인\',\'바르셀로나\',\'사그라다 파밀리아\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>스페인</td></tr><tr><th>위치 : </th><td>바르셀로나</td></tr><tr><th>관광지 명 : </th><td>사그라다 파밀리아</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="Carrer de Mallorca, 401, 08013 Barcelona">'
				+ '<input type="hidden" name="place_state" value="Carrer de Mallorca, 401, 08013 Barcelona, 스페인">'
				+ '<input type="hidden" name="place_id" value="La Sagrada Família">'
				+ '<input type="hidden" name="lat" value="41.402953">'
				+ '<input type="hidden" name="lng" value="2.175719">'
		}if (fakesearch == "스페인마드리드") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="4" width="150px" style="text-align:center;"><img src="https://img.kr.news.samsung.com/kr/wp-content/uploads/2016/07/%ED%81%AC%EA%B8%B0%EB%B3%80%ED%99%98_%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90-%EC%8A%A4%ED%8E%98%EC%9D%B8-%EB%A7%88%EB%93%9C%EB%A6%AC%EB%93%9C-%EA%B9%8C%EC%95%BC%EC%98%A4-%EA%B4%91%EC%9E%A5%EC%97%90-%EC%B4%88%EB%8C%80%ED%98%95-LED-%EC%98%A5%EC%99%B8-%EC%A0%84%EA%B4%91%ED%8C%90-%EC%84%A4%EC%B9%98-4-664x550.jpg"width="200",heigth="200"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=40.423534&jim_longitude=-3.711887&jim_img=https://img.kr.news.samsung.com/kr/wp-content/uploads/2016/07/%ED%81%AC%EA%B8%B0%EB%B3%80%ED%99%98_%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90-%EC%8A%A4%ED%8E%98%EC%9D%B8-%EB%A7%88%EB%93%9C%EB%A6%AC%EB%93%9C-%EA%B9%8C%EC%95%BC%EC%98%A4-%EA%B4%91%EC%9E%A5%EC%97%90-%EC%B4%88%EB%8C%80%ED%98%95-LED-%EC%98%A5%EC%99%B8-%EC%A0%84%EA%B4%91%ED%8C%90-%EC%84%A4%EC%B9%98-4-664x550.jpg&jim_placename=Plaza de España&jim_addr=Plaza de España, 28008 Madrid, 스페인&jim_score=3">담기</a><input type="button" value="+" onclick="planAdd(this,\'스페인\',\'마드리드\',\'마드리드광장\',54.8,-4.6)"></td></tr><tr ><th>나라 : </th><td>스페인</td></tr><tr><th>위치 : </th><td>마드리드</td></tr><tr><th>관광지 명 : </th><td>마드리드 광장</tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="스페인">'
				+ '<input type="hidden" name="place_state" value="Plaza de España, 28008 Madrid, 스페인">'
				+ '<input type="hidden" name="place_id" value="Plaza de España">'
				+ '<input type="hidden" name="lat" value="41.402953">'
				+ '<input type="hidden" name="lng" value="2.175719">'
		}if(fakesearch == "러시아") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="3" width="30%" style="text-align:center;"><img src="http://cfs8.blog.daum.net/image/18/blog/2008/10/18/10/42/48f93e1b3f877" width="200",height="200"></td></tr><tr><th >나라 </th><td >러시아</td></tr ><tr><th >위치  </th><td >모스크바</td></tr><tr ><td style="text-align:center;"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=55.754136&jim_longitude=37.620774&jim_img=http://cfs8.blog.daum.net/image/18/blog/2008/10/18/10/42/48f93e1b3f877&jim_placename=City of Manchester Stadium&jim_addr=Manchester&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'러시아\',\'모스크바\',\'붉은광장\',55.754136,37.620774)"></td><th>장소 명</td><td>Red Square</td></tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="russia">'
				+ '<input type="hidden" name="place_state" value="moscow">'
				+ '<input type="hidden" name="place_id" value="Red Square">'
				+ '<input type="hidden" name="lat" value="55.754136">'
				+ '<input type="hidden" name="lng" value="37.620774">'
				document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="3" width="30%" style="text-align:center;"><img src="http://upload.wikimedia.org/wikipedia/commons/e/e3/Kremlin_birds_eye_view-1.jpg" width="200",height="200"></td></tr><tr><th >나라 </th><td >러시아</td></tr ><tr><th >위치  </th><td >모스크바</td></tr><tr ><td style="text-align:center;"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=55.754136&jim_longitude=37.620774&jim_img=https://cdn.pixabay.com/photo/2014/09/16/11/25/moscow-448006_960_720.jpg&jim_placename=Московский Кремль&jim_addr=Moskva&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'러시아\',\'모스크바\',\'크렘린 궁전\',55.754136,37.620774)"></td><th>장소 명</td><td>Kremlin</td></tr></table></div>'
					+ '<input type="hidden" name="place_nation" value="russia">'
					+ '<input type="hidden" name="place_state" value="moscow">'
					+ '<input type="hidden" name="place_id" value="Kremlin">'
					+ '<input type="hidden" name="lat" value="55.752035">'
					+ '<input type="hidden" name="lng" value="37.617564">'
				
				
				
		}if(fakesearch == "러시아모스크바") {
			document.getElementById('info3').innerHTML = '';
			document.getElementById('info3').innerHTML += '<div class="container"><table class="table table-bordered"><tr ><td rowspan="3" width="30%" style="text-align:center;"><img src="http://cfs8.blog.daum.net/image/18/blog/2008/10/18/10/42/48f93e1b3f877" width="200",height="200"></td></tr><tr><th >나라 </th><td >러시아</td></tr ><tr><th >위치  </th><td >모스크바</td></tr><tr ><td style="text-align:center;"><img id="img" src="/pd/img/place/2.png" onclick="fakeadd(this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude=55.754136&jim_longitude=37.620774&jim_img=http://cfs8.blog.daum.net/image/18/blog/2008/10/18/10/42/48f93e1b3f877&jim_placename=City of Manchester Stadium&jim_addr=Manchester&jim_score=5">담기</a><input type="button" value="+" onclick="planAdd(this,\'런던\',\'모스크바\',\'붉은광장\',55.754136,37.620774)"></td><th>장소 명</td><td>Red Square</td></tr></table></div>'
				+ '<input type="hidden" name="place_nation" value="russia">'
				+ '<input type="hidden" name="place_state" value="moscow">'
				+ '<input type="hidden" name="place_id" value="Red Square">'
				+ '<input type="hidden" name="lat" value="55.754136">'
				+ '<input type="hidden" name="lng" value="37.620774">'
		}
		for (var i = 0; i < neighborhoods.length; i++) {
			addMarkerWithTimeout(neighborhoods[i], i * 200);
		}
	}

	function addMarkerWithTimeout(position, timeout) {
		window.setTimeout(function() {
			markers.push(new google.maps.Marker({
				position : position,
				map : map,
				animation : google.maps.Animation.DROP
			}));
		}, timeout);
	}
		function random() {
			var random = Math.random() * 30 + 5;
			random = random * 10;
			var arr = new Array(100);
			for (num = 0; num < arr.length; num++) {
				arr[num] = random;
			}
			return arr;
		}

		// This example requires the Places library. Include the libraries=places :: 라이브러리에 대한 설명
		var map, places, infoWindow, fff;
		var markers = [];
		var autocomplete;
		var autoClick;
		var countryRestrict = {
			'country' : countries
		};
		var MARKER_PATH = 'https://developers.google.com/maps/documentation/javascript/images/marker_green';
		var hostnameRegexp = new RegExp('^https?://.+?/');

		//Customize Variations
		var lats = [];
		var lngs = [];
		var resultNum = 0;

		var countries = { //지정한 지역으로 처음 화면 뿌려줄 나라 위도 경도와 화면 확대 정도
			'au' : {
				center : {
					lat : -25.3,
					lng : 133.8
				},
				zoom : 4
			},
			'br' : {
				center : {
					lat : -14.2,
					lng : -51.9
				},
				zoom : 3
			},
			'ca' : {
				center : {
					lat : 62,
					lng : -110.0
				},
				zoom : 3
			},
			'fr' : {
				center : {
					lat : 46.2,
					lng : 2.2
				},
				zoom : 5
			},
			'de' : {
				center : {
					lat : 51.2,
					lng : 10.4
				},
				zoom : 5
			},
			'mx' : {
				center : {
					lat : 23.6,
					lng : -102.5
				},
				zoom : 4
			},
			'nz' : {
				center : {
					lat : -40.9,
					lng : 174.9
				},
				zoom : 5
			},
			'it' : {
				center : {
					lat : 41.9,
					lng : 12.6
				},
				zoom : 2
			},
			'za' : {
				center : {
					lat : -30.6,
					lng : 22.9
				},
				zoom : 5
			},
			'es' : {
				center : {
					lat : 40.5,
					lng : -3.7
				},
				zoom : 5
			},
			'pt' : {
				center : {
					lat : 39.4,
					lng : -8.2
				},
				zoom : 6
			},
			'us' : {
				center : {
					lat : 37.1,
					lng : -95.7
				},
				zoom : 3
			},
			'uk' : {
				center : {
					lat : 54.8,
					lng : -4.6
				},
				zoom : 5
			},
			'kr' : {
				center : {
					lat : 37.00,
					lng : 127.30
				},
				zoom : 7
			}
		};
	
		function initMap() {//callback  받을 함수
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : countries['it'].zoom,
				center : countries['it'].center,
				mapTypeControl : false,
				panControl : false,
				zoomControl : false,
				streetViewControl : false
			});

			infoWindow = new google.maps.InfoWindow({
				content : document.getElementById('info-content')
			});

			fff = new google.maps.InfoWindow({
				content : document.getElementById('info-content')
			});
			service = new google.maps.places.PlacesService(map);

			// Restrict the search to the default country, and to place type "cities".
			//자동검색 목록 객체 생성 
			autocomplete = new google.maps.places.Autocomplete(
			/** @type {!HTMLInputElement} */
			(document.getElementById('autocomplete')), {
				types : [ '(regions)' ],
				componentRestrictions : countryRestrict
			});

			places = new google.maps.places.PlacesService(map);

			//검색 버튼을 눌러야 검색이 된다. --- 진효가 바꿈
			document.getElementById('autoClick').addEventListener('click',
					function() {
						autocomplete.addListener('click', onPlaceChanged);
						onPlaceChanged();
					});

			// autoClick.addListener('click',onPlaceChanged);

			//Even Listener로 나라 선택
			document.getElementById('country').addEventListener('change',
					setAutocompleteCountry);

			map.addListener('idle', performSearch);
		}

		//자동 검색 결과 클릭해야 해당 지역으로 지도 이동
		function onPlaceChanged() {
			var place = autocomplete.getPlace();
			if (place.geometry) {
				map.panTo(place.geometry.location);
				map.setZoom(15);
				search();
				//window.alert(place.geometry.location);//중심 지도 주소 불러오기
			} else {
				document.getElementById('autocomplete').placeholder = '도시입력';
			}
		}

		//검색 결과
		function search() {
			var search = {
				bounds : map.getBounds(),
				types : [ 'regions' ]
			};
			var geocoder = new google.maps.Geocoder;
			places
					.nearbySearch(
							search,
							function(results, status) {
								if (status === google.maps.places.PlacesServiceStatus.OK) {
									clearResults();
									clearMarkers();
									clearInfo();

									//마커 생성하고 마커에 A부터 나열하게 한다.
									resultNum = results.length;
									for (var i = 0; i < resultNum; i++) {
										var markerLetter = String
												.fromCharCode('A'.charCodeAt(0)
														+ (i % 26));
										var markerIcon = MARKER_PATH
												+ markerLetter + '.png';
										// Use marker animation to drop the icons incrementally on the map.
										markers[i] = new google.maps.Marker(
												{
													position : results[i].geometry.location,
													animation : google.maps.Animation.DROP,
													icon : markerIcon
												});
										//화면에 마커 클릭하면 자세한 정보나오게 한다.
										markers[i].placeResult = results[i];
										lat = markers[i].position.lat();
										lng = markers[i].position.lng();
										var placeI = markers[i].placeResult.place_id;

										/* getInfo(placeI,i); */
										google.maps.event.addListener(
												markers[i],
												'animation_changed',
												showInfoWindow); //마커 클릭시 정보뜬다.
										console.log(i);
										setTimeout(dropMarker(i), i * 100);
										addResult(results[i], i); //마커의 주소 불러오기
										getInfo(results[i], i);

									}//for문끝

								}

							});

		}
		 
		
		//레스토랑 
			function butt(btnValue) {
			var search = {
				bounds : map.getBounds(),
				types : [ 'restaurant' ]
			};
			var geocoder = new google.maps.Geocoder;
			places
					.nearbySearch(
							search,
							function(results, status) {
								if (status === google.maps.places.PlacesServiceStatus.OK) {
									clearResults();
									clearMarkers();
									clearInfo();

									//마커 생성하고 마커에 A부터 나열하게 한다.
									resultNum = results.length;
									for (var i = 0; i < resultNum; i++) {
										var markerLetter = String
												.fromCharCode('A'.charCodeAt(0)
														+ (i % 26));
										var markerIcon = MARKER_PATH
												+ markerLetter + '.png';
										// Use marker animation to drop the icons incrementally on the map.
										markers[i] = new google.maps.Marker(
												{
													position : results[i].geometry.location,
													animation : google.maps.Animation.DROP,
													icon : markerIcon
												});
										//화면에 마커 클릭하면 자세한 정보나오게 한다.
										markers[i].placeResult = results[i];
										lat = markers[i].position.lat();
										lng = markers[i].position.lng();
										var placeI = markers[i].placeResult.place_id;

										/* getInfo(placeI,i); */
										google.maps.event.addListener(
												markers[i],
												'animation_changed',
												showInfoWindow); //마커 클릭시 정보뜬다.
										console.log(i);
										setTimeout(dropMarker(i), i * 100);
										addResult(results[i], i); //마커의 주소 불러오기
										restaurantInfo(results[i], i);

									}//for문끝

								}

							});

		}

		function clearInfo() {
			document.getElementById('info').innerHTML = null;
			document.getElementById('info2').innerHTML = null;
		}

		//마커 지우기
		function clearMarkers() {
			for (var i = 0; i < markers.length; i++) {
				if (markers[i]) {
					markers[i].setMap(null);
				}
			}
			//lat, lng, marker all reset
			markers = [];
			lats = [];
			lngs = [];
			resultNum = 0;
		}

		//검색 창
		function setAutocompleteCountry() {
			var country = document.getElementById('country').value;
			if (country == 'all') {
				autocomplete.setComponentRestrictions([]);
				map.setCenter({
					lat : 15,
					lng : 0
				});
				map.setZoom(2);
			} else {
				autocomplete.setComponentRestrictions({
					'country' : country
				});
				map.setCenter(countries[country].center);
				map.setZoom(countries[country].zoom);
			}
			clearResults();
			clearMarkers();
			clearInfo();
		}

		//마커 떨어뜨리기
		function dropMarker(i) {
			return function() {
				markers[i].setMap(map);
			};
		}

		//마커에 A~부터 나열 && 클릭하면 해당 마커 위에 정보를 넣을 테이블 생성
		function addResult(result, i) {
			var results = document.getElementById('results');
			var markerLetter = String
					.fromCharCode('A'.charCodeAt(0) + (i % 26));
			var markerIcon = MARKER_PATH + markerLetter + '.png';

			var tr = document.createElement('tr');
			tr.style.backgroundColor = (i % 2 === 0 ? '#F0F0F0' : '#FFFFFF');
			tr.onclick = function() {
				google.maps.event.trigger(markers[i], 'click');
			};

			var iconTd = document.createElement('td');
			var nameTd = document.createElement('td');
			var icon = document.createElement('img');
			icon.src = markerIcon;
			icon.setAttribute('class', 'placeIcon');
			icon.setAttribute('className', 'placeIcon');
		}

		//결과 화면 지우기
		function clearResults() {
			var results = document.getElementById('results');
			while (results.childNodes[0]) {
				results.removeChild(results.childNodes[0]);
			}
		}

		//사용자가 선택한 마커에 대한 정보 가져온다.
		function showInfoWindow() {
			var marker = this;

			places.getDetails({
				placeId : marker.placeResult.place_id
			}, function(place, status) {
				if (status !== google.maps.places.PlacesServiceStatus.OK) {
					return;

				}
				marker.addListener('click', function() {
					infoWindow.open(map, marker);
					buildIWContent(place);

				});

			});
		}

		//검색 결과및 관굉지 버튼 결과
		function getInfo(place, idx) {
			var price = Math.floor(Math.random() * 20 + 50);
			var photos = place.photos;
			var str_text = "undefined";
			str_text.replace( /undefined/gi, "알수없음");
			console.log(str_text.replace);
			if (!photos) {
				return;
			}
			var score=0;
			if(place.rating>0) score=place.rating; 
		
			document.getElementById('info').innerHTML += '<div class="container"><table class="table table-bordered"><tr><td rowspan="7"width="200px;" id="phototd"><img src = "'+photos[0].getUrl({'maxWidth': 200, 'maxHeight': 200})
					+ '"><div id="likeplus" style="text-align:center;"><img id="img'+idx+'" src="/pd/img/place/2.png" onclick="add('+idx+',this)" width="10%;" height="10%;"><a href="jimPoint.pd?jim_latitude='+lat+'&jim_longitude='+lng+'&jim_img='+photos[0].getUrl({'maxWidth': 200, 'maxHeight': 200})+'&jim_placename='+place.name+'&jim_addr='+place.vicinity+'&jim_score='+score+'">담기</a> </div> </div></td><th style="width:100px;">관광지 명 : </th><td>' 
					+ place.name 
					+ '<input type="hidden" name="place_nation" value="nara">'
					+ '<input type="hidden" name="place_state" value="place">'
					+ '<input type="hidden" name="place_id" value="' + place.name + '">'
					+ '<input type="hidden" name="lat" value="' + lat + '">'
					+ '<input type="hidden" name="lng" value="' + lng + '">'
					+ '<input type="hidden" name="lat" value="' + lat + '">'
					+ '</td></tr><tr><th>관광지 위치 : </th><td>'
					+place.vicinity
					+'</td></tr><tr><th>평가점수 : </th><td>'
					+place.rating
               		+'</tr></table></div>';					
		}		
		
		
		//가짜 좋아요
		function fakeadd(pr) {
		    var mem_id = '${mem_id}';
			if(mem_id == ''){
				 alert('로그인하세요');
				 location.href='index.pd';	
			}else if(mem_id != ''){ 
				var ff = document.fakef;
				var place_id = ff.place_id.value;
				var lat = ff.lat.value;
				var lng = ff.lng.value;
				var place_nation = ff.place_nation.value;
				var place_state = ff.place_state.value;
				/*  alert("아이디 : " + mem_id +  "\n장소명 : " + place_id +  "\n나라 : "+place_nation+ "\n위치 : "+place_state+"\n위도 : " + lat + "\n경도 : " + lng);
				 */sendRequest("likeCntPlus.pd", "mem_id=" + mem_id + "&place_nation=" + place_nation +"&place_state=" + place_state +"&place_id=" + place_id + "&lat=" + lat + "&lng=" + lng, likeCntPlusResult, 'GET');
				function likeCntPlusResult(){
					if(XHR.readyState == 4 && XHR.status == 200){
						var data = XHR.responseText;
					}
				}
				pr.setAttribute('src','/pd/img/place/1.png');
				pr.setAttribute('onclick','fakehate(this)');
			}
		} 
		function fakehate(pr){
			var mem_id = '${mem_id}';
			var ff = document.fakef;
			var place_id = ff.place_id.value;
			var lat = ff.lat.value;
			var lng = ff.lng.value; 
			var place_nation = ff.place_nation.value;
			var place_state = ff.place_state.value;
			
			sendRequest('likeMinus.pd',"mem_id=" + mem_id + "&place_nation=" + place_nation +"&place_state=" + place_state +"&place_id=" + place_id + "&lat=" + lat + "&lng=" + lng, hateminusResult, 'GET');
			function  hateminusResult(){
				if(XHR.readyState == 4 && XHR.status == 200){
					var data = XHR.responseText; 
				}
			}
			pr.setAttribute('src','/pd/img/place/2.png');
			pr.setAttribute('onclick','fakeadd(this)');
		}
		
		//좋아요
		function add(idx, pr) {
		    var mem_id = '${mem_id}';
			if(mem_id == ''){
				 alert('로그인하세요');
				 location.href='index.pd';	
			}else if(mem_id != ''){ 
				var f = document.frm;
				var place_id = f.place_id[idx].value;
				var lat = f.lat[idx].value;
				var lng = f.lng[idx].value;	 
				var place_nation = f.place_nation[idx].value;
				var place_state = f.place_state[idx].value;
				sendRequest("likeCntPlus.pd", "mem_id=" + mem_id + "&place_nation=" + place_nation +"&place_state=" + place_state +"&place_id=" + place_id + "&lat=" + lat + "&lng=" + lng, likeCntPlusResult, 'GET');
				function likeCntPlusResult(){
					if(XHR.readyState == 4 && XHR.status == 200){
						var data = XHR.responseText;
						//if(data.indexOf('true') > 0) 
						//else alert('이미 좋아요를 눌렀습니다.');
					}
				}
						//pr.value='좋아요취소';
						pr.setAttribute('src','/pd/img/place/1.png');
						pr.setAttribute('onclick','hate('+idx+',this)');
			}
		} 
		function hate(idx,pr){
			var mem_id = '${mem_id}';
			var f = document.frm;
			var place_id = f.place_id[idx].value;
			var lat = f.lat[idx].value;
			var lng = f.lng[idx].value;
			var lng = f.lng[idx].value;	 
			var place_nation = f.place_nation[idx].value;
			var place_state = f.place_state[idx].value;
			
			sendRequest('likeMinus.pd',"mem_id=" + mem_id + "&place_nation=" + place_nation +"&place_state=" + place_state +"&place_id=" + place_id + "&lat=" + lat + "&lng=" + lng, hateminusResult, 'GET');
			function  hateminusResult(){
				if(XHR.readyState == 4 && XHR.status == 200){
					var data = XHR.responseText;
					//if(data.indexOf('true') > 0) 
				}
			}
					//pr.value='좋아요';
					pr.setAttribute('src','/pd/img/place/2.png');
					pr.setAttribute('onclick','add('+idx+',this)');
		}

		/////////////식당 
		function restaurantInfo(place, idx) {
			var price = Math.floor(Math.random() * 20 + 50);
			var photos = place.photos;
			if (!photos) {
				return;
			}
			document.getElementById('info').innerHTML +='<div class="container"><table class="table"><tr><td rowspan="7" width="200" id="phototd"><img src = "'+photos[0].getUrl({'maxWidth': 200, 'maxHeight': 200})
				+ '"><div id="likeplus" style="text-align:center;"><img id="img'+idx+'" src="/pd/img/place/2.png" onclick="add('+idx+',this)" width="10%;" height="10%;"><a href="jimRes.pd?jim_latitude='+lat+'&jim_longitude='+lng+'&jim_img='+photos[0].getUrl({'maxWidth': 200, 'maxHeight': 200})+'&jim_placename='+place.name+'&jim_addr='+place.vicinity+'&jim_score='+place.rating+'&jim_call='+place.formatted_phone_number+'&jim_price='+price+'">담기</a> </div> </div></td><th >관광지 명 : </th><td>' 
				+ place.name 
				+ '<input type="hidden" name="place_nation" value="nara">'
				+ '<input type="hidden" name="place_state" value="place">'
				+ '<input type="hidden" name="place_id" value="' + place.name + '">'
				+ '<input type="hidden" name="lat" value="' + lat + '">'
				+ '<input type="hidden" name="lng" value="' + lng + '">'
				+ '<input type="hidden" name="lat" value="' + lat + '">'
				+ '</td></tr><tr><th >식당 위치 : </th><td>'
				+ place.vicinity
				+ '</td></tr><tr><th >전화번호 : </th><td>'
				+ place.formatted_phone_number
				+ '</td></tr><tr><th >가격 : </th><td>'
				+ price
				+ '</td></tr><tr><th >평가점수 : </th><td>'
				+ place.rating
           		+ '</tr></table></div>'
		}

		//호텔에 대한 정보 표시할 내용 
		function buildIWContent(place) {
			document.getElementById('iw-icon').innerHTML = '<img class="hotelIcon" ' +
            'src="' + place.icon + '"/>';
			document.getElementById('iw-url').innerHTML = '<b><a href="' + place.url +
            '">'
					+ place.name + '</a></b>';
			document.getElementById('iw-address').textContent = place.vicinity;

			if (place.formatted_phone_number) {
				document.getElementById('iw-phone-row').style.display = '';
				document.getElementById('iw-phone').textContent = place.formatted_phone_number;
			} else {
				document.getElementById('iw-phone-row').style.display = 'none';
			}

			//호텔 등급
			if (place.rating) {
				var ratingHtml = '';
				for (var i = 0; i < 5; i++) {
					if (place.rating < (i + 0.5)) {
						ratingHtml += '&#10025;';
					} else {
						ratingHtml += '&#10029;';
					}
					document.getElementById('iw-rating-row').style.display = '';
					document.getElementById('iw-rating').innerHTML = ratingHtml;
				}
			} else {
				document.getElementById('iw-rating-row').style.display = 'none';
			}

			//호텔 URL
			if (place.website) {
				var fullUrl = place.website;
				var website = hostnameRegexp.exec(place.website);
				if (website === null) {
					website = 'http://' + place.website + '/';
					fullUrl = website;
				}
				document.getElementById('iw-website-row').style.display = '';
				document.getElementById('iw-website').textContent = website;
			} else {
				document.getElementById('iw-website-row').style.display = 'none';
			}
		}
		function performSearch() {
			var request = {
				bounds : map.getBounds(),
				keyword : 'best view'
			};
			service.radarSearch(request, callback);
		}

		function callback(results, status) {
			if (status !== google.maps.places.PlacesServiceStatus.OK) {
				console.error(status);
				return;
			}
			for (var i = 0, result; result = results[i]; i++) {
				addMarker(result);
			}
		}

		function addMarker(place) {
			var marker = new google.maps.Marker(
					{
						map : map,
						position : place.geometry.location,
						icon : {
							url : 'https://developers.google.com/maps/documentation/javascript/images/circle.png',
							anchor : new google.maps.Point(10, 10),
							scaledSize : new google.maps.Size(10, 17)
						}
					});

			google.maps.event.addListener(marker,'click',function() {
				service.getDetails(place,function(result, status) {
					if (status !== google.maps.places.PlacesServiceStatus.OK) {
						console.error(status);
						return;
					}
						fff.setContent(result.name);
						fff.open(map, marker);
						document.getElementById('info2').innerHTML += '<div class="container"><table class="table table-bordered"><tr><td rowspan="7" width="200"><img src = "'
															+ result.photos[0]
																	.getUrl({
																		'maxWidth' : 200,
																		'maxHeight' : 200
																	})
															+ '"></td><th style="width:100px;">장소명 : </th><td>'
															+ result.name
															+ '</td></tr><tr><th>위치 : </th><td>'
															+ result.vicinity
															+ '</td></tr><tr><th>전화번호 : </th><td>'
															+ result.formatted_phone_number
															+ '</td></tr><tr><th>평가점수 : </th><td>'
															+ result.rating
															+ '</td></tr><tr><th>웹사이트 : </th><td>'
															+ result.website
															+ '</td></tr></table></div>'

				});
			});
		}
</script>
</head>
<body>
 <div class="page-container">
 <div class="content">
 <!-- 일정담기 -->
 <input type="hidden" value="-1" id="arrayStep"><!-- event_id랑 배열의 index값  -->
 <input type="hidden" value="-1" id="naraStep"><!-- 나라가 바뀌면 step++ -->
 <input type="hidden" value="-1" id="count">
 
	<form action="" name="abc" id="searbar">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div id="map" class="img-responsive"></div>
			</div>
			<div class="col-sm-1"></div>
		</div>
		&nbsp;
		<div class="container-fluid">
			<div class="col-sm-12">
				<div class="input-group" id="autocompleteform" style="width: 24%; margin: auto;">
					<input id="autocomplete" type="text" placeholder="Search Here" class="form-control">
					<div class="input-group-btn">
						<input type="button" id="autoClick" value="검색" onclick="jkd(this);" class="btn btn-default">
					</div>
				</div>
			</div>
		</div>
	</form>
<br>
	<div id="info4"></div>
	<div id="controls">
		<input type="hidden" id="country" value="all">
	</div>
	
	<div id="listing">
		<table id="resultsTable">
			<tbody id="results"></tbody>
		</table>
	</div>

	<div style="display: none">
		<div id="info-content">
			<table>
				<tr id="iw-url-row" class="iw_table_row">
					<td id="iw-icon" class="iw_table_icon"></td>
					<td id="iw-url"></td>
				</tr>
				<tr id="iw-address-row" class="iw_table_row">
					<td class="iw_attribute_name">Address:</td>
					<td id="iw-address"></td>
				</tr>
				<tr id="iw-phone-row" class="iw_table_row">
					<td class="iw_attribute_name">Telephone:</td>
					<td id="iw-phone"></td>
				</tr>
				<tr id="iw-rating-row" class="iw_table_row">
					<td class="iw_attribute_name">Rating:</td>
					<td id="iw-rating"></td>
				</tr>
				<tr id="iw-website-row" class="iw_table_row">
					<td class="iw_attribute_name">Website:</td>
					<td id="iw-website"></td>
				</tr>
			</table>
		</div>
	</div>
<br>
	<div id="latlng"></div>
	<form name="fakef">
	<div id="info3"></div>
	</form>
<br>
	<form name="frm">
		<div id="info"></div>
	</form>

	<hr>
	<div id="info2"></div>
 </div>
 	<%@ include file="../header.jsp"%>
 </div>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDV4gWxEpC3pZYQ2MwMtHwePFZzuQc9CTU&libraries=places&callback=initMap&sensor=false&" async defer></script>
</body>
</html>