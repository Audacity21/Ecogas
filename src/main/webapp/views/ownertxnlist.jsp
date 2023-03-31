<%@page import="com.ecogas.booking.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>bookings</title>
  </head>
  <body>
    <%@include file="navowner.jsp" %>
    <div class="container">
    <%if(session.getAttribute("listob")==null) {%>
    <h3>No Booking found</h3>
    <%} %>
    
    <%if(session.getAttribute("listob") !=null) {
    	List<Booking> bk = (List<Booking>)session.getAttribute("listob");
    	for(Booking b : bk)
    	
 { %>
    
    
      <div class="app-card">
        <h3>Order id : <%=b.getOrderId() %></h3>
        <h3>Timestamp : <%=b.getTime() %></h3>
        <h3>Price: <%=b.getAmount() %></h3>
        <button class="btn-1">
        <a href="/booking/owner/<%=b.getOrderId() %>">View</a>
        </button>
      </div>
      <%} }%>
    </div>
  </body>
  <style>
    .container {
      min-height:calc(100vh - 55px) !important;
      width: 100vw;
      background: rgb(19,42,19);
      background: linear-gradient(145deg, rgba(19,42,19,1) 15%, rgba(49,87,44,1) 68%);
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
    }
    .app-card {
      position: relative;
      height: 100px;
      width: 80%;
      min-width: 200px;
      margin: 10px;
      box-shadow: 20px 20px 50px rgba(0, 0, 0, 0.5);
      border-radius: 15px;
      background: rgba(255, 255, 255, 0.1);
      overflow: hidden;
      display: flex;
      justify-content: space-evenly;
      align-items: center;
      border-top: 1px solid;
      border-top: 1px solid rgba(255, 255, 255, 0.5);
      border-left: 1px solid rgba(255, 255, 255, 0.5);
      backdrop-filter: blur(5px);
      color: aliceblue;
      padding: 20px;
    }
    .btn-1 {
      background-color: #5594a9;
      border: 1px solid transparent;
      border-radius: 3px;
      box-shadow: rgba(255, 255, 255, 0.4) 0 1px 0 0 inset;
      box-sizing: border-box;
      color: #fff;
      cursor: pointer;
      font-size: 24px;
      padding: 5px 10px;
      width: 110px;
      z-index: 3;
    }
    .btn-1:hover {
      background-color: #457487;
    }

    @media screen and (max-width: 500px) {
      .app-card{
        flex-direction: column;
        min-height: 300px;
      }
      .app-card h1{
        font-size: 16px !important;
      }
    }
  </style>
</html>
