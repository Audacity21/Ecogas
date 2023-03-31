<%@page import="com.ecogas.booking.Booking"%>
<%@page import="com.ecogas.Plant.PlantDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    
    <%
    PlantDetails pd = (PlantDetails) session.getAttribute("bookingP");
    Booking b = (Booking) session.getAttribute("bookingB");
    %>
    
    
    <title>Ecogas</title>
</head>
<body>
    <%@include file="navuser.jsp" %>
    <div class="container">
        <form class="form" action="/booking/confirm/<%=b.getType() %>" method="post">
            <h1>Booking Order</h1>
            <input class="filled" placeholder="Plant ID: <%=pd.getPlantId() %>" readonly>
            <input class="filled" placeholder="Plant Name: <%=pd.getName() %>" readonly>

            <input class="filled" placeholder="Price per unit/kg : ₹<%=b.getAmount() %>">
            <input class="filled" placeholder="Item: <%=b.getType() %>">
            <%if(pd.getRequire() > 0) { %>
            	<input  type="number" name="quant"  placeholder="Quantity available : <%=pd.getRequire() %>" min="1" max="<%=pd.getRequire() %>" required>
            <%} %>
            <%if(pd.getGasAvail() > 0) { %>
            	<input  type="number" name="quant"  placeholder="Quantity available : <%=pd.getGasAvail() %>" min="1" max="<%=pd.getGasAvail() %>" required>
            <%} %>
            <%if(pd.getFertAvail() > 0) { %>
            	<input type="number" name="quant" placeholder="Quantity available : <%=pd.getFertAvail() %>" min="1" max="<%=pd.getFertAvail() %>" required>
            <%} %>
            <button  class="btn" type="submit">Order</button>
        </form>
    </div>
</body>
<style>
    body{
        background-image: url("/views/images/booking-back.png");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }
    .container{
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .form{
        position: relative;
        width: 30%;
        min-width: 300px;
        height: 80vh;
        box-shadow: 20px 20px 50px rgba(0, 0, 0, 1);
        border-radius: 15px;
        background: rgba(255, 255, 255, 0.5);
        overflow: hidden;
        display: flex;
        justify-content: space-evenly;
        flex-direction: column;
        align-items: center;
        border-top: 1px solid ;
        border-top: 1px solid rgba(255, 255, 255, 0.5);
        border-left: 1px solid rgba(255, 255, 255, 0.5);
        backdrop-filter: blur(5px);
        color: aliceblue;
    }
    .form h1{
        color: black;
    }
    .form input{
        width: 75%;
        background: transparent;
        border: none;
        border-bottom: 2px solid rgba(39, 39, 39, 0.5);
        color: black;
        padding: 10px 5px;
    }
    .form input::placeholder{
        color: black;
        opacity: 1;
    }
    .form input:focus{
        outline: none;
        background:rgba(255, 255, 255, 0.5) ;
    }
    .filled{
        background:rgba(255, 255, 255, 0.5) !important;
    }
    .btn{
    width: 80%;
    height: 40px;
    border: none;
    border-radius: 5px;
    background-color: #4F772D;
    color: aliceblue;
    font-size: 20px;
    font-weight: bold;
    margin-top: 20px;
    cursor: pointer;
    box-shadow: 0 0 10px rgba(0,0,0,0.5);
}
.btn:hover{
    background-color: #5d8f31;
}
</style>

</html>