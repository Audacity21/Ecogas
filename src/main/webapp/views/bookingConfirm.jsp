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
      <% PlantDetails pd = (PlantDetails)session.getAttribute("bookingP");
      Booking b = (Booking)session.getAttribute("confB"); User u =
      (User)session.getAttribute("confU"); %>

      <div class="form">
        <h1>
          Thank you for doing business with us! <br /><span
            >Here are your order details</span
          >
        </h1>

        <h6>Plant Name: <input placeholder="<%=pd.getName() %>" readonly /></h6>
        <h6>Order Type: <input placeholder="<%=b.getType() %>" readonly /></h6>
        <h6>
          Quantity: <input placeholder="<%=b.getQuantity() %>" readonly />
        </h6>
        <h6>
          Order Status: <input placeholder="<%=b.getStatus() %>" readonly />
        </h6>
        <h6>
          Order Total: <input placeholder="<%=b.getAmount() %>" readonly />
        </h6>
        <h6>Email: <input placeholder="<%=u.getEmail() %>" readonly /></h6>
        <h6>Phone: <input placeholder="<%=u.getMobile() %>" readonly /></h6>
        <button class="btn"><a href="/booking/confirmation">Confirm</a></button>
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
      padding-top: 100px;
      width: 100%;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .form {
      position: relative;
      width: 30%;
      min-width: 300px;
      min-height: 80%;
      padding-bottom: 20px;
      box-shadow: 20px 20px 50px rgba(0, 0, 0, 1);
      border-radius: 15px;
      background: rgba(255, 255, 255, 0.5);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      align-items: center;
      border-top: 1px solid;
      border-top: 1px solid rgba(255, 255, 255, 0.5);
      border-left: 1px solid rgba(255, 255, 255, 0.5);
      backdrop-filter: blur(5px);
      color: aliceblue;
    }
    .form h1 span {
      font-size: 20px;
      font-weight: 400;
      color: black;
    }
    .form h6 {
      display: flex;
      justify-content: space-between;
      width: 100%;
      align-items: center;
      padding: 0 20px;
      color: black;
    }
    .form h1 {
      text-align: center;
      color: black;
    }
    .form input {
      width: 75%;
      background: rgba(255, 255, 255, 0.5);
      border: none;
      border-bottom: 2px solid rgba(39, 39, 39, 0.5);
      padding: 5px 5px;
      color: black;
      border-radius: 0 10px 0 10px;
    }
    .form input::placeholder {
      color: black;
      opacity: 1;
    }
    .form input:focus {
      outline: none;
      background: rgba(255, 255, 255, 0.5);
    }
    .btn {
      width: 80%;
      height: 40px;
      border: none;
      border-radius: 5px;
      background-color: #4f772d;
      color: aliceblue;
      font-size: 20px;
      font-weight: bold;
      margin-top: 20px;
      cursor: pointer;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
    .btn:hover {
      background-color: #5d8f31;
    }
  </style>
</html>
