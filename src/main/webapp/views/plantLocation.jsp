<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.2.1/axios.min.js"></script>
<meta charset="UTF-8">
<title>Ecogas</title>
<script>	
	var lat = null;
	var lng = null;
	navigator.geolocation.getCurrentPosition(function(position) {
		  lat = position.coords.latitude;
		  lng =  position.coords.longitude;
		  console.log(lat);
		   
		    axios.post('/coordinates', { lat: lat, lng: lng })
		    .then(response => console.log(response.data))
		    .catch(error => console.error(error));
		  
		});
	</script>

</head>
<body>
<%@include file="navowner.jsp" %>
<div class="container">
	<h3>Address:-  ${add }</h3>
	<%
	if(session.getAttribute("war")!=null) {
	String s = (String)session.getAttribute("war");
	if(s.equalsIgnoreCase("Location updated")) { 
	%>
		<h3 style="color: blue" >${war }</h3>
		<a href="/plant/addPlant">See on map</a>
	<%} %>
	<%
	if(!s.equalsIgnoreCase("Location updated")) {
	%>
	<h3 style="color: blue" >${war }</h3>
	<% } }%>
	
	
	<h3 style="color: blue;font-weight: bold;" >*Note:- If you are not seeing your address please turn on location and click reload.</h3>
	<button class="reload-btn" type="button" onClick="window.location.reload()">
	   Reload Page
	</button>
	<a class="save-btn" href="/updatelocation">Update Location</a>
</div>
<%session.setAttribute("war", ""); %>
</body>
<style>
	.container {
	margin: auto;
	margin-top: 10vh;
  	width: 50%;
  	border: 3px solid green;
  	padding: 10px;
	}
	.container  h3{
	font-size: 20px;
	}
	.reload-btn {
		background-color: red;
		border: none;
   		border-radius: 5px;
   		height: 35px;
   		cursor: pointer;
   		padding: 5px 10px 10px 10px;
	}
	.reload-btn:hover{
		background-color: #ee4848;
	}
	
	.save-btn {
		background-color: #32b440;
		border: none;
   		border-radius: 5px;
   		height: 35px;
   		cursor: pointer;
   		padding: 5px 10px 10px 10px;
   		text-decoration: none;
	}
	.save-btn:hover{
		background-color: #2bc43c;
	}
	
	@media screen and (max-width: 768px){
		.container{
			display: flex;
	  	align-items: center;
	  	justify-content: center;
	  	flex-direction: column;
		}
		.reload-btn{
			margin-bottom: 20px;
		}
	}
	
}
	
</style>
</html>