<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    <div class="container">
      <div class="navbar">
        <div class="logo"></div>
        <div class="items">
          <ul>
            <li>Home</li>
            <li><a href="/user/about" style="text-decoration: none; color: aliceblue;">Team</a></li>
            <li>Github</li>
          </ul>
        </div>
        <div class="buttons">
          <button class="btn-1">
            <a href="/user/login">Sign In</a>
          </button>
          <button class="btn-2">
            <a href="/user/register">Sign Up</a>
          </button>
        </div>
      </div>
      <div class="content">
        <div class="image-side">
          <img src="/views/images/biofuel.png" alt="biofuel" />
        </div>
        <div class="text-side">
          <h1>Powering a sustainable future with biogas innovation</h1>
          <p>
            Our biofuel application is dedicated to creating sustainable and
            environmentally friendly fuel alternatives. We use innovative
            technologies to produce high-quality biofuels from renewable sources
            such as agricultural waste, algae, and other organic matter. Our
            mission is to reduce dependence on fossil fuels and promote a
            cleaner and healthier planet for future generations. With our
            biofuels, we aim to provide a cleaner and more efficient alternative
            for transportation and energy needs, while also helping to reduce
            greenhouse gas emissions and combat climate change.
          </p>
        </div>
      </div>
      <div class="footer">
        <p>
          Created with ❤️ at <img src="/views/images/gdsc.png" alt="gdsc" /> K L
          University
        </p>
      </div>
    </div>
  </body>
  <style>
    * {
      padding: 0;
      margin: 0;
      box-sizing: border-box;
    }

    body {
      font-family: "Poppins", sans-serif;
    }
    .container {
      background: rgb(19, 42, 19);
      background: linear-gradient(
        145deg,
        rgba(19, 42, 19, 1) 15%,
        rgba(49, 87, 44, 1) 68%
      );
      min-height: 100vh;
      width: 100vw;
      z-index: -1;
    }
    .container::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(#132a13, #4f772d);
      clip-path: circle(20% at right 90%);
      z-index: 0;
    }

    .container::after {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(#132a13, #4f772d);
      clip-path: circle(15% at 5% 5%);
      z-index: 0;
    }
    .navbar {
      color: #fff;
      display: flex;
      justify-content: flex-end;
      align-items: center;
      height: 90px;
      font-size: 24px;
      z-index: 1;
    }
    .navbar ul {
      display: flex;
      list-style: none;
    }
    .navbar ul li {
      margin: 0 20px;
      border-bottom: 2px solid transparent;
    }
    .navbar ul li:hover {
      border-bottom: 2px solid #fff;
      cursor: pointer;
    }
    .buttons {
      display: flex;
      justify-content: space-evenly;
      align-items: center;
      width: 250px;
    }
    .btn-1 {
      background-color: #90a955;
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
      background-color: #738745;
    }
    .btn-1 a {
      text-decoration: none;
      color: #fff;
    }
    .btn-2 {
      background-color: #ecf39e;
      border: 1px solid transparent;
      border-radius: 3px;
      box-shadow: rgba(255, 255, 255, 0.4) 0 1px 0 0 inset;
      box-sizing: border-box;
      color: black;
      cursor: pointer;
      font-size: 24px;
      padding: 5px 10px;
      width: 110px;
      z-index: 3;
    }
    .btn-2:hover {
      background-color: #9da16a;
    }
    .btn-2 a {
      text-decoration: none;
      color: black;
    }
    .content {
      display: flex;
      z-index: 1;
    }
    .image-side {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 50%;
      float: left;
      z-index: 1;
    }
    .image-side img {
      width: 100%;
      height: 100%;
    }
    .text-side {
      width: 50%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      color: #fff;
      z-index: 1;
    }
    .text-side h1 {
      font-size: 40px;
      margin-bottom: 20px;
    }
    .text-side p {
      font-size: 20px;
      padding-right: 10%;
      margin-bottom: 20px;
    }
    .footer {
      position: fixed;
      background-color: #4f772d;
      bottom: 0;
      width: 100%;
      color: #fff;
      text-align: center;
      font-size: 10px;
      z-index: 4;
    }
    .footer img {
      width: 15px;
    }

    @media screen and (max-width: 1000px) {
      body {
        overflow-y: scroll;
        overflow-x: hidden;
      }
      .logo {
        position: fixed;
        top: 28px;
        left: 30px;
        display: block;
        z-index: 2;
        color: white;
      }
      .toggle-button {
        display: block;
        z-index: 2;
        cursor: pointer;
      }
      .container {
        height: 100%;
        overflow-y: scroll;
        overflow-x: hidden;
      }
      .navbar {
        justify-content: center;
        width: 100vw;
      }
      .items {
        display: none;
      }
      .items:active {
        display: block;
        width: 100vw;
        background-color: #132a13;
        height: 100vh;
        z-index: 999;
        top: 10px;
      }
      .items ul {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100%;
      }
      .content {
        flex-direction: column;
        justify-content: center;
      }
      .image-side {
        margin-left: 20px;
        width: 90%;
        height: 50%;
      }
      .image-side img {
        width: 100%;
        height: 100%;
        padding: 10px;
      }
      .text-side {
        margin-left: 20px;
        height: 50%;
        width: 90%;
        text-align: center;
      }
      .text-side h1 {
        font-size: 30px;
      }
      .text-side p {
        font-size: 15px;
        padding-right: 0;
      }
    }

    @media screen and (max-width: 350px) {
      .navbar {
        justify-content: center;
      }
      .buttons {
        width: 180px;
      }
      .btn-1 {
        width: 80px;
        font-size: 16px;
      }
      .btn-2 {
        width: 80px;
        font-size: 16px;
      }
    }
  </style>
</html>
