<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>퍄퍄</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
   height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}

table {
   font-size: 12px;
}

#map {
   height: 470px;
}

#listing {
   position: absolute;
   width: 200px;
   height: 458px;
   overflow: auto;
   top: 12px;
   cursor: pointer;
   overflow-x: hidden;
}
#country {
   width: 100%;
}

.placeIcon {
   width: 20px;
   height: 34px;
   margin: 4px;
}

.hotelIcon {
   width: 24px;
   height: 24px;
}

#resultsTable {
   border-collapse: collapse;
   width: 240px;
}

#rating {
   font-size: 13px;
   font-family: Arial Unicode MS;
}

.iw_table_row {
   height: 18px;
}

.iw_attribute_name {
   font-weight: bold;
   text-align: right;
}

.iw_table_icon {
   text-align: right;
}

.divTable {
   display: table;
   width: 70%;
   margin: auto 0;
   text-align: center;
}

.divTableRow {
   display: table-row;
}

.divTableHeading {
   display: table-header-group;
}

.divTableCell, .divTableHead {
   border: 1px solid;
   display: table-cell;
   padding: 3px 10px;
}

.divTableHeading {
   display: table-header-group;
   font-weight: bold;
}

.divTableFoot {
   display: table-footer-group;
   font-weight: bold;
}

.divTableBody {
   display: table-row-group;
}
</style>
<script type="text/javascript">
   function jkd() {
      var autocomplete = document.getElementById('autocomplete').value;
      document.abc.searcopy.value = autocomplete;
  }
</script>

</head>

<body>
   <form action="" name="abc" id="searbar">
      <div>
         <input type="button" value="restaurant" onclick="butt(this)" id="res">
         <input type="button" value="park" onclick="search()"> <input
            id="autocomplete" type="text" placeholder="" min="10" /> <input
            type="button" id="autoClick" value="검색" onclick="jkd();">
         <div id="map"></div>
      </div>



      <div class="divTable" style="border: 1px solid #000; margin: auto;">
         <div class="divTableBody" id="locationField"></div>
         <div class="divTableRow">
            <div class="divTableCell">담기 위치</div>
            <div class="divTableCell">
               <input type="text" name="searcopy" id="searcopy">
            </div>
         </div>
      </div>

   </form>

   <div id="controls">

      <input type="hidden" id="country" value="all">
   </div>



   <div id="listing">
      <table id="resultsTable">
         <tbody id="results"></tbody>
      </table>
   </div>

   <div style="display:none;" id="greenInfo">
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
         <!--    <tr id="iw-price-row" class="iw_table_row">
               <td class="iw_attribute_name">Price:</td>
               <td></td>
            </tr> -->
         </table>
      </div>
   </div>

   <div id="latlng"></div>

   <div id="info"></div>
   <hr>
   <div id="info2"></div>


   <script>

      // This example requires the Places library. Include the libraries=places :: 라이브러리에 대한 설명
      var map, places, infoWindow,inff;
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
         'ko' : {
            center : {
               lat : 37.552455,
               lng : 126.991189
            },
            zoom : 12
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
      
      
         inff = new google.maps.InfoWindow({
            content : document.getElementById('info-content')
         });

         infoWindow = new google.maps.InfoWindow({
            content : document.getElementById('info-content')
         });

         service = new google.maps.places.PlacesService(map);

         // Restrict the search to the default country, and to place type "cities".
         //자동검색 목록 객체 생성 
         autocomplete = new google.maps.places.Autocomplete(
         /** @type {!HTMLInputElement} */
         (document.getElementById('autocomplete')), {
            types : [ '(cities)' ],
            componentRestrictions : countryRestrict
         });

         places = new google.maps.places.PlacesService(map);

         //검색 버튼을 눌러야 검색이 된다. --- 진효가 바꿈
         document.getElementById('autoClick').addEventListener('click',
               function() {
                  autocomplete.addListener('click', onPlaceChanged);
                  onPlaceChanged();
               });

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
            types : [ 'park' ]
         };
         var geocoder = new google.maps.Geocoder;
         places.nearbySearch(search,function(results, status) {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
               clearResults();
               clearMarkers();
               clearInfo();

   //마커 생성하고 마커에 A부터 나열하게 한다.
           resultNum = results.length;
            for (var i = 0; i < resultNum; i++) {
               var markerLetter = String.fromCharCode('A'.charCodeAt(0)+ (i % 26));
               var markerIcon = MARKER_PATH + markerLetter + '.png';
                              // Use marker animation to drop the icons incrementally on the map.
                markers[i] = new google.maps.Marker({
                             position : results[i].geometry.location,
                             animation : google.maps.Animation.DROP,
                             icon : markerIcon
              });
                //화면에 마커 클릭하면 자세한 정보나오게 한다.
                 markers[i].placeResult = results[i];
               //  console.log(i+ '= '+ markers[i].placeResult.place_id);
                  var placeI = markers[i].placeResult.place_id;
                  /* getInfo(placeI,i); */
                  google.maps.event.addListener(markers[i],'animation_changed',showInfoWindow); //마커 클릭시 정보뜬다.
                  console.log(i);
                  setTimeout(dropMarker(i), i * 100);
                  addResult(results[i], i); //마커의 주소 불러오기
                  getInfo(results[i]);
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
         places.nearbySearch(search,function(results, status) {
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
                              console
                                    .log(i
                                          + '= '
                                          + markers[i].placeResult.place_id);
                              var placeI = markers[i].placeResult.place_id;

                              /* getInfo(placeI,i); */
                              google.maps.event.addListener(
                                    markers[i],
                                    'animation_changed',
                                    showInfoWindow); //마커 클릭시 정보뜬다.
                              console.log(i);
                              setTimeout(dropMarker(i), i * 100);
                              addResult(results[i], i); //마커의 주소 불러오기
                              restbtn(results[i]);

                           }//for문끝

                        }

                     });

      }
      
      
      function clearInfo() {
         document.getElementById('info').innerHTML = null;
      }

      function clearInfo() {
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
         /*       var name = document.createTextNode(result.name);
               iconTd.appendChild(icon);
               nameTd.appendChild(name);
               tr.appendChild(iconTd);
               tr.appendChild(nameTd);
               results.appendChild(tr); */
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
            //초록색 정보창
            marker.addListener('click', function() {
            	console.log('초록 정보 클릭');
               infoWindow.open(map, marker);
               buildIWContent(place);
               clearInfo();
            }); 

         });
      }

      function getInfo(place) {
         var photos = place.photos;
         if (!photos) {
            return;
         }
         document.getElementById('info').innerHTML += '<br><table style="margin:0px auto;width:800px;border-top:1px solid lightgray;border-bottom:1px solid lightgray;"><tr><td rowspan="7" width="200"><img src = "'
               + photos[0].getUrl({
                  'maxWidth' : 200,
                  'maxHeight' : 200
               })
               + '"></td><th style="width:100px;">관관지명 : </th><td>'
               + place.name
               + '</td></tr><tr><th>위치 : </th><td>'
               + place.vicinity
               + '</td></tr><tr><th>평가점수 : </th><td>'
               + place.rating
               +'</tr></table>'
      }

      
      /////////////식당 
      function restbtn(place) {
         var photos = place.photos;
         if (!photos) {
            return;
         }
         document.getElementById('info').innerHTML += '<br><table style="margin:0px auto;width:800px;border-top:1px solid lightgray;border-bottom:1px solid lightgray;"><tr><td rowspan="7" width="200"><img src = "'
               + photos[0].getUrl({
                  'maxWidth' : 200,
                  'maxHeight' : 200
               })
               + '"></td><th style="width:100px;">식당명 : </th><td>'
               + place.name
               + '</td></tr><tr><th>주소 : </th><td>'
               + place.vicinity
               + '</td></tr><tr><th>전화번호 : </th><td>'
               + place.formatted_phone_number
               + '</td></tr><tr><th>평가점수 : </th><td>'
               + place.rating
               + '</td></tr><tr><th>평균가격 : </th><td>'
               + price
               + '$ <td><td width="100"><a href="yeyak.pd">담자</a></td></tr></table>'
      }
      
      
      
      
      
      //호텔에 대한 정보 표시할 내용 
      function buildIWContent(place) {
        if(place==''){
        	clearBuildIWContent();
        }else{
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
      }
      
      
 function clearBuildIWContent(){
	 document.getElementById('greenInfo').style.display='none';
 }
 
 
      // alert('레이더 시작');
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
         //RaderClick
         google.maps.event.addListener(marker,'click',function() {
            service.getDetails(place,function(result, status) {
            	
               if (status !== google.maps.places.PlacesServiceStatus.OK) {
                  console.error(status);
                  return;
                  }
               document.getElementById('greenInfo').style.display='none';
               console.log('빨간점');
         inff.setContent(result.name);
         inff.open(map, marker); 

        document.getElementById('info2').innerHTML += '<br><table style="margin:0px auto;width:800px;border-top:1px solid lightgray;border-bottom:1px solid lightgray;"><tr><td rowspan="7" width="200"><img src = "'
                               + result.photos[0].getUrl({
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
                                             + '</td></tr></table>'

          });
       });
    }
   </script>
   
   <!-- AIzaSyA_d3i1PehbxBmrxdteQIztu6eiVIwJRfs
   AIzaSyBHKZ6fNfKwS5XoHoq1b3NrKtWa7ML5atU -->
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_d3i1PehbxBmrxdteQIztu6eiVIwJRfs&libraries=places&callback=initMap&sensor=false&language=ko&region=KR"async defer></script>
   <!-- &language=ko -->
   


   <div id="resultHotel"></div>
</body>
</html>