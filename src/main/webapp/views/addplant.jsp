
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Plant map</title>
    <style>
        .map-container{
    		display: flex;
    		height:calc(100vh - 55px) !important;
    	}
        #map {
            width: 50%;
            height: 100%;
        }
        .details{
        	width: 50%;
        	height: 100%;
        	padding: 10px;
        }
        .details-body{
        	border: 2px solid black;
        	display: flex;
        	flex-direction: column;
        	align-items: flex-start;
        	height: 100%;
        	padding: 10px;
            justify-content: center;
            align-items: center;
        }
        .details-body h1{
        	margin-left: auto;
        	margin-right: auto;
        }
        .details-body li{
        	list-style: none;
        }
        .details-body form{
            display: flex;
            width: 100%;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .details-body form input{
            margin: 5px;
            width: 75%;
            min-width: 300px;
            border-radius: 5px;
            height: 35px;
            padding-left: 5px;
        }
        .grey{
            background-color: #ababab;
        }
        .btn{
            background-color: #31572C;
            color: white;
            border: none;
            width: 75%;
            min-width: 300px;
            height: 35px;
            margin: 5px;
            border-radius: 5px;
        }
        .btn-2{
            background-color: #4F772D;
            color: white;
            border: none;
            width: 75%;
            min-width: 300px;
            height: 35px;
            margin: 5px;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn-2 a{
            text-decoration: none;
            color: white;
        }
        @media screen and (max-width: 768px){
        	.map-container{
        		flex-direction: column;
        	}
        	#map{
        		width: 100%;
        		height: 100%;
        	}
        	.details{
        		width: 100%;
        	}
        }
    </style>
</head>
<body>
<%@include file="navowner.jsp" %>
    <div class="map-container">
    	<div id="map"></div>
    	<div class="details">
    		<div class="details-body">
    			<h1>Add plant Details</h1>
    			<h3>${plantA }</h3>
    			<form method="post" action="/plant/AddPlant">
    				<input type="text" name="name" placeholder="plant name" required >
    				<input type="text" name="add" placeholder="Additional address" required >
    				<input type="number" name="mobile" pattern="[6-9]{1}[0-9]{9}" placeholder="mobile" required >
    				<input type="number" name="fert" placeholder="Fertilizer available (KG)" required >
    				<input type="number" name="gas" placeholder="Gas available (Unit)" required >
    				<input type="number" name="require" placeholder="Organic waste requirement (KG)" required ><br>
    				<input class="btn" type="submit" value="Add">
    			</form>
    		</div>
    	</div>
    </div>
    <script>
    var map = null;
    var marker = null;
        function initMap() {
            fetch('/myplantpoint')
                .then(response => response.json())
                .then(points => {
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: new google.maps.LatLng(points.lat, points.lng),
                        zoom: 16
                    });
                    
                    console.log(points.lat, points.lng);
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(points.lat, points.lng),
                        map: map,
                       icon: 'http://maps.google.com/mapfiles/kml/pal2/icon2.png',
                        title: "Click to update location",
                        	url: '/owner/location'
                    });
                    
                    google.maps.event.addListener(marker, 'click', function() {
                        window.location.href = this.url;
                    });
                });
            
            
            
            
            
        }
    </script>
    
    
 
    
    <script src="https://maps.googleapis.com/maps/api/js?key={api_key}&callback=initMap" async defer></script>
</body>
</html>
    