$(document).ready(function(){
    google.maps.event.addDomListener(window, 'load', initialize);
 
	function initialize(){
	    if($("#google_map").length) {
	    	// 오르세펜션 35.870755, 129.281183 
		    var mapOptions = { //구글 맵 옵션 설정
		        zoom : 16, //기본 확대율
		        center : new google.maps.LatLng(35.870755, 129.281183), // 지도 중앙 위치
		        scrollwheel : false, //마우스 휠로 확대 축소 사용 여부
		        mapTypeControl : false //맵 타입 컨트롤 사용 여부
		    };
		 
		    var map = new google.maps.Map(document.getElementById('google_map'), mapOptions); //구글 맵을 사용할 타겟
		    
		    var image = new google.maps.MarkerImage("../images/marker.png"); //마커 이미지 설정
		    //image.size = new google.maps.Size(35, 35);
		    //image.anchor = new google.maps.Point(0, 35);
		    
		    var marker = new google.maps.Marker({ //마커 설정
		        map : map,
		        position : map.getCenter(), //마커 위치
		        icon : image, //마커 이미지
		        title : '오르세펜션'
		    });
		    
		    google.maps.event.addDomListener(window, "resize", function() { //리사이즈에 따른 마커 위치
		        var center = map.getCenter();
		        google.maps.event.trigger(map, "resize");
		        map.setCenter(center); 
		    });
		 
	    }//if-end
	}//function-end
 
});//jQuery-end