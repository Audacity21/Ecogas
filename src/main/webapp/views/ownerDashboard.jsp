
<!DOCTYPE html>
<%@page import="java.util.List"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Owner Dashboard</title>
    <style>
        .container{
            width: 100vw;
            min-height:calc(100vh - 55px) !important;
            width: 100vw;
            background: rgb(19,42,19);
            background: linear-gradient(145deg, rgba(19,42,19,1) 15%, rgba(49,87,44,1) 68%);
        }
        .info-screen{
            height: 60%;
            width: 100vw;
            display: flex;
        }
        .data{
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: aliceblue;
        }
        .quantity{
            position: relative;
            min-height: 300px;
            width: 80%;
            margin: 10px;
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
        .quantity footer{
            position: absolute;
            width: 100%;
            text-align: center;
            bottom: 10px;
        }
        .quantity footer a{
            color: rgb(219, 196, 52);
        }
        .info{
            width: 50%;
            color: aliceblue;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .info p{
            display: flex;
            align-items: center;
            justify-content: center;
            height: 300px;
            padding: 40px;
            font-size: 1.5vw;
        }
        .tiles{
            min-height: 40%;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            flex-wrap: wrap;
        }
        .card{
            position: relative;
            width: 250px;
            height: 300px;
            margin: 30px;
            box-shadow: 20px 20px 50px rgba(0, 0, 0, 0.5);
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.1);
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: flex-start;border-top: 1px solid ;
            border-top: 1px solid rgba(255, 255, 255, 0.5);
            border-left: 1px solid rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(5px);
            color: aliceblue;
        }
        .card img{
            position:absolute;
            bottom: 10px;
            right: 10px;
            font-size: 6em;
            color: rgba(255, 255, 255, 0.10);
            pointer-events: none;
            width: 100px;
            z-index: -1;
        }
        .card h2{
            font-size: 16px;
            padding: 10px;
            z-index: 1;
        }
        .heading{
            width: 100vw;
            text-align: center;
            color: aliceblue;
        }
        @media screen and (max-width: 768px){
        	.info-screen{
                flex-direction: column;
            }
            .data{
                width: 100%;
            }
            .info{
                width: 100%;
            }
            .info p{
                font-size: 10px;
            }
            .quantity footer{
                display: none;
            }
        }
    </style>
</head>
<body>
<%@include file="navowner.jsp" %>

<%
List<Integer> l = (List<Integer>) session.getAttribute("ownerdash");
%>
    <div class="container">
        <div class="info-screen">
            <div class="data">
                <h1>Your Plant Status:</h1>
                <div class="quantity">
                    <h5>Gas Sold: <%=l.get(0) %> Unit </h5>
                    <h5>Fertilizer Sold: <%=l.get(1) %> KG</h5>
                    <h5>Purchased requirement: <%=l.get(2) %> KG</h5>
                    <h5>Revenue generated: rs. <%=l.get(3) %> </h5>
                    <footer>*You can update the plant details in <a href="/plant/update">update plant</a> page*</footer>
                </div>
            </div>
            <div class="info">
                <h1>About Us</h1>
                <p>Ecogas, A well known technology to all but it is not widely used, because of its daily requirement and management, So we came up with an idea which will connect the plants with the users and both will get benefited. If we scale up then this will create a huge impact on our environemnt. Be a part of our ecology [JOIN US].</p>
            </div>
        </div>
        <div class="heading"><h1>Why choose us?</h1></div>
        <div class="tiles">
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/2131/2131033.png" alt="" />
                <h2>Our organic waste was formerly thrown away without any further use, but now we are maximising its potential. Sell your organic waste to make an impact while earning money.</h2>
            </div>
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/4643/4643226.png" alt="" />
                <h2>Utilize our biogas cylinders to prepare food and assist your community. They are far less expensive than LPG cylinders  </h2>
            </div>
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/1674/1674057.png" alt="" />
                <h2>Buy fertilisers from us because they are fully chemical-free. More importantly, they are good for our earth and preserves the non-renewable resources for our future generations.</h2>
            </div>
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/7799/7799393.png" alt="" />
                <h2>Our pricing system is set in a way that benefits both the owners and plant owners.
                    <li>1 Unit Gas Cylinder(approx 17kg): Rs. 500</li>
                    <li>Organic Waste per kg: Re. 1</li>
                    <li>Fertilizer per kg: Rs. 2</li>
                </h2>
            </div>
        </div>
    </div>
</body>
</html>
    