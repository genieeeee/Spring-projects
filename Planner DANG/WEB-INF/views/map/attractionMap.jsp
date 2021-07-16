<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>readd</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 70%;
        margin: 0;
        padding: 0;
      }
    </style>
    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var map;
      var infoWindow;
      var service;

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.867, lng: 151.206},
          zoom: 2,
          mapTypeId: 'roadmap'
      /*     styles: [{
          /*   stylers: [{ visibility: 'simplified' }]
          }, {
            elementType: 'labels',
            stylers: [{ visibility: 'off' }]
          }] */ 
        });
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        
        // Bias the SearchBox results towards current map's viewport.
        //검색 이벤트
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });
        
        
        var markers = [];
  

        infowindow = new google.maps.InfoWindow();
       service = new google.maps.places.PlacesService(map);
        
      // 마우스 이벤트
       map.addListener('idle', performSearch);
       //검색 
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();
                  
          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };
            
            service.nearbySearch({
              location: place.geometry.location,
              radius: 800,
              type: ['restaurant']
            }, callback);
            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
           
              position: place.geometry.location
            }));
           
         
            
            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
     
        map.addListener('idle', performSearch);
      }

      function performSearch() {
        var request = {
          bounds: map.getBounds(),
          keyword: 'best view'
        };
        service.radarSearch(request, callback);
      }

      function callback(results, status) {
        if (status !== google.maps.places.PlacesServiceStatus.OK) {
          console.error(status);
          return;
        }
        window.alert(results.length);
        for (var i = 0;  i<results.length; i++) {
          addMarker(result);
        }
      }

      
      
      function addMarker(place) {

         // var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
          map: map,
          title: place.name,
          position: place.geometry.location,
          icon: {
            url: 'https://developers.google.com/maps/documentation/javascript/images/circle.png',
            anchor: new google.maps.Point(10, 10),
            scaledSize: new google.maps.Size(10, 17)
          }
        
        });
        marker.addListener('click', function() {
            infowindow.open(map, marker);
          });

        document.getElementById('info').innerHTML += '<div><img src="'+place.photos[0].getUrl({'maxWidth': 305, 'maxHeight': 305})+'">'+'<br>장소명 : '+place.name+'<br>평점 : '+place.rating+'<br>위치 : '+place.address_component+'<br>전화번호 : '+place.formatted_phone_number+'<br>영업시간 : '+place.opening_hours.day+'<br><a href="#">담기</a><br></div>';
        
        
        
        google.maps.event.addListener(marker, 'click', function() {
          service.getDetails(place, function(result, status) {
            if (status !== google.maps.places.PlacesServiceStatus.OK) {
              console.error(status);
              return;
            }
            
          //  infoWindow.setContent('<div><strong>' + result.name + '</strong><br>'+result.formatted_address+'<br>'+result.formatted_phone_number+ '</div>');
            infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
                    'Place ID: ' + place.place_id + '<br>' +
                    place.formatted_address + '<br>'+place.url+'</div>');
            
            
                  infowindow.open(map, this);
            //  infoWindow.open(map, marker);
          });
        });
      }
    </script>
  </head>
  <body>
    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
    <div id="map"></div>
    <div id="info"></div>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQm8rE9eHUQJSa68izEDpCCFRAb9myErE&callback=initMap&libraries=places,visualization" async defer></script>
  </body>
</html>