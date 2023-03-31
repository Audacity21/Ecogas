<%@page import="com.ecogas.owner.PlantOwner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%
PlantOwner p = (PlantOwner)session.getAttribute("ownerD");
%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update | Ecogas</title>
    <link rel="stylesheet" href="info.css">
</head>
<body>
<%@include file="navowner.jsp" %>



    <div class="container">
        <div class="info-details">
            <h1>User Profile</h1>
            <div class="info-box">
                <h3>Name: <%=p.getName() %></h3>
                <h3>Email: <%=p.getEmail() %></h3>
                <h3>Mobile:<%=p.getMobile() %></h3>
                <h3>Address: <%=p.getAdd() %></h3>
            </div>
        </div>
        <div class="info-body">
            <h1>Update Profile</h1>
            <form class="info-form" method="post" action="/owner/updation">
            <input type="text" name="name" placeholder="Name" class="info-input">
            <input type="email" name="email" placeholder="Email" class="info-input" >
            <input type="text" name="address" placeholder="Office address" class="info-input">
            <input type="number" name="mobile"  pattern="[6-9]{1}[0-9]{9}" placeholder="Mobile no." class="info-input">
            <h3 style="color: red; font-size: 16px;">${ackU }</h3>
            <div class="info-btn">
                <input type="Submit" value="Update" class="btn-1">
                </div>
                </form>
               
           </div>
    </div>
    <%
    session.setAttribute("ackU", "");
    %>
</body>
<style>
	*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body{
    font-family: 'Poppins', sans-serif;
}
.container{
    width: 100vw;
    min-height: calc(100vh - 55px) !important;
    display: flex;
    background: rgb(19,42,19);
    background: linear-gradient(145deg, rgba(19,42,19,1) 15%, rgba(49,87,44,1) 68%);
    flex-wrap: wrap;
    color: aliceblue;
}
.info-details{
    margin-top: 40px;
    width: 50%;
    height: 90%;
    display: flex;
    flex-direction: column;
    align-items: left;
    padding: 30px;
    text-align: center;
}
.info-form{
	display: flex;
	width: 100%;
	flex-direction: column;
	align-items: center;
}
.info-box{
    position: relative;
    width: 100%;
    box-shadow: 20px 20px 50px rgba(0, 0, 0, 0.5);
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.1);
    overflow: hidden;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;border-top: 1px solid ;
    border-top: 1px solid rgba(255, 255, 255, 0.5);
    border-left: 1px solid rgba(255, 255, 255, 0.5);
    backdrop-filter: blur(5px);
    color: aliceblue;
    padding: 20px;
}
.info-box h3{
    font-size: 20px !important;
}
.info-details h1{
    font-size: 40px;
    font-weight: 600;
    margin-bottom: 20px;
}
.info-details h3{
    font-size: 36px;
    font-weight: 400;
    margin-bottom: 20px;
}
.info-body{
    margin-top: 40px;
    width: 50%;
    padding: 30px;
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-items: center;
}
.info-body h1{
    font-size: 40px;
    font-weight: 600;
    margin-bottom: 20px;
}
.info-input{
    width: 40%;
    min-width: 200px;
    height: 40px;
    margin: 10px 0;
    border: none;
    border-radius: 5px;
    padding: 0 10px;
    font-size: 16px;
    font-family: 'Poppins', sans-serif;
}
.info-btn{
    display: flex;
    flex-direction: column;
}
.btn-1{
    width: 40%;
    min-width: 200px;
    height: 40px;
    margin: 10px 0;
    border: none;
    border-radius: 5px;
    padding: 0 10px;
    font-size: 16px;
    font-family: 'Poppins', sans-serif;
    background-color: #90A955;
    color: aliceblue;
    cursor: pointer;
}
.btn-1:hover{
    background-color: #B2C67F;
}
.btn-2{
    width: 40%;
    min-width: 200px;
    height: 40px;
    margin: 10px 0;
    border: none;
    border-radius: 5px;
    padding: 0 10px;
    font-size: 16px;
    font-family: 'Poppins', sans-serif;
    background-color: #ECF39E;
    color: rgb(0, 0, 0);
    cursor: pointer;
}
.btn-2:hover{
    background-color: #F2F7C7;
}
.info-body p{
    font-size: 16px;
    font-weight: 400;
    margin-bottom: 20px;
}
.btn-2 a{
	text-decoration: none;
}
@media screen and (max-width: 768px){
    .info-body{
        width: 100%;
        height: 100%;
        margin-top: 0;
        padding: 20px;
    }
    .info-details{
        width: 100%;
        height: 100%;
        margin-top: 40px;
        padding: 20px;
        align-items: center;
    }
    .info-input{
        width: 90%;
    }
}
</style>
</html>