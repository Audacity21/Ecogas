<%@page import="com.ecogas.Plant.PlantDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Google Map</title>
    <style>
        .map-container{
    		display: flex;
    		height:calc(100vh - 55px) !important;
    	}
        #map {
            width: 80%;
            height: 100%;
        }
        .details{
        	width: 29%;
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
        }
        .details-body h1{
        	margin-left: auto;
        	margin-right: auto;
        }
        .details-body li{
        	list-style: none;
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
<%@include file="navuser.jsp" %>
    <div class="map-container">
    	<div id="map"></div>
    	<div class="details">
    		<div class="details-body">
    			<%
    			if(session.getAttribute("plantId")==null) { %>
    				<h3 style="font-weight: bold; margin-top: 30vh;"> Click on the plant icon to view details, if map not visible turn on location and reload page</h3>
    			<%} %>
    			
    			<%
    			if(session.getAttribute("plantId")!=null) { %>
    				<%
							PlantDetails pd = (PlantDetails) session.getAttribute("plantId");    			
    				%>
    			<h1>Plant Details</h1>
    			
    			<ul>
    				<li>Plant ID: <%=pd.getPlantId() %></li> 
	    			<li>Plant Name: <%=pd.getName() %></li> 
	    			<li>Plant Phone: <%=pd.getMobile() %></li>
	    			<li><a href="/booking/<%=pd.getPlantId() %>/requirement">Amount Required: <%=pd.getRequire() %> KG</a></li> 
	    			<li><a href="/booking/<%=pd.getPlantId() %>/gas">Gas Available: <%=pd.getGasAvail() %>  unit</a></li> 
	    			<li><a href="/booking/<%=pd.getPlantId() %>/fertilizer">Fertilizer Available: <%=pd.getFertAvail() %> KG</a></li>
    			</ul>
    			<h3>*Note:- Click on item to buy/sell</h3>
    				
    				
    			<%} %>
    			
    			
    		</div>
    	</div>
    </div>
    <script>
    var map = null;
    var marker = null;
        function initMap() {
            fetch('/mypoints')
                .then(response => response.json())
                .then(points => {
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: new google.maps.LatLng(points.lat, points.lng),
                        zoom: 13
                    });
                    
                    console.log(points.lat, points.lng);
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(points.lat, points.lng),
                        map: map,
                        //icon: '/views/images/mylocation.png',
                        title: "You are here"
                    });
                    
                    fetch('/points')
                    .then(response => response.json())
                    .then(points => {
                    	for (var i = 0; i < points.length; i++) {
                        	console.log(points[i].lat+"owner");
                            marker = new google.maps.Marker({
                                position: new google.maps.LatLng(points[i].lat, points[i].lng),
                                map: map,
                               icon: '/views/images/factory.png',
                                title: points[i].plantId+": "+points[i].plantName,
                               url: '/plant/'+points[i].plantId
                            });
                            google.maps.event.addListener(marker, 'click', function() {
                                window.location.href = this.url;
                            });
                        }
                    });
                });
            
            
            
            
            
        }
    </script>
    
    
 
    
    <script src="https://maps.googleapis.com/maps/api/js?key={api_key}&callback=initMap" async defer></script>
</body>
</html>
    