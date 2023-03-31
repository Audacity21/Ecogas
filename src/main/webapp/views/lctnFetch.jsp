<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.2.1/axios.min.js"></script>
<meta charset="UTF-8">
<title>Update | Ecogas</title>
</head>
<body>
<h3>Fetching Location</h3>
<h3>${add }</h3>

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



</body>
</html>