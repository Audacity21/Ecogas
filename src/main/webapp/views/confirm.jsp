<%@page import="com.ecogas.user.User"%> <%@page
import="com.ecogas.booking.Booking"%> <%@page import="java.awt.print.Book"%>
<%@page import="com.ecogas.Plant.PlantDetails"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
      rel="stylesheet"
    />
    <title>Ecogas</title>
  </head>
  <body>
    <%@include file="navuser.jsp" %>
    <div class="container">
      <div class="app-card">
        <h3>Order confirmed with id:- ${bid}</h3>
        <a class="btn" href="/user/dashboard">Go to Dashboard</a>
      </div>
    </div>
  </body>
  <style>
    body {
      background-image: url("/views/images/booking-back.png");
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }
    .container {
      width: 100vw;
      display: flex;
      justify-content: center;
    }
    .app-card {
      position: relative;
      min-height: 100px;
      width: 80%;
      margin: 10px;
      box-shadow: 20px 20px 50px rgba(0, 0, 0, 0.5);
      border-radius: 15px;
      background: rgba(255, 255, 255, 0.5);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      border-top: 1px solid;
      border-top: 1px solid rgba(255, 255, 255, 0.5);
      border-left: 1px solid rgba(255, 255, 255, 0.5);
      backdrop-filter: blur(5px);
      color: black;
      padding: 20px;
    }
    .btn {
      width: 200px;
      height: 40px;
      border: none;
      border-radius: 5px;
      background-color: #4f772d;
      color: aliceblue;
      font-size: 16px;
      font-weight: bold;
      margin-top: 20px;
      cursor: pointer;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
      display: flex;
      justify-content: center;
      align-items: center;
      text-decoration: none;
    }
    .btn:hover {
      background-color: #5d8f31;
    }
  </style>
</html>
