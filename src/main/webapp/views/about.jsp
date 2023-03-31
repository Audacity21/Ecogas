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
    <script
      src="https://kit.fontawesome.com/4fe1c0aab7.js"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    />
    <link rel="stylesheet" href="home.css" />
    <title>Team | Ecogas</title>
  </head>
  <body>
    <div class="container">
      <div class="navbar">
        <div class="logo"></div>
        <div class="items">
          <ul>
           <a href="/" style="text-decoration: none; color: aliceblue;"><li>Home</li></a>
            <a href="/user/about" style="text-decoration: none; color: aliceblue;"><li>Team </li></a>
             <a href="#" target="_blank" style="text-decoration: none; color: aliceblue;"><li>Github</li></a>
           
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
        <h1>Team Members</h1>
        <div class="image-side">
          <div class="profile-card">
            <img
              src="https://avatars.githubusercontent.com/u/74983916?v=4"
              alt="dp"
            />
            <h1>Ankit Seth</h1>
            <h3>2000031281</h3>
            <div class="profile-footer">
              <ul>
                <li><i class="fa-brands fa-linkedin"></i></li>
                <li><i class="fa-solid fa-globe"></i></li>
                <li><i class="fa-brands fa-github"></i></li>
                <li><i class="fa-brands fa-instagram"></i></li>
              </ul>
            </div>
          </div>
          <div class="profile-card">
            <img
              src="https://avatars.githubusercontent.com/u/83300897?v=4"
              alt="dp"
            />
            <h1>Virat Anand</h1>
            <h3>2000031089</h3>
            <div class="profile-footer">
              <ul>
                <li><i class="fa-brands fa-linkedin"></i></li>
                <li><i class="fa-solid fa-globe"></i></li>
                <li><i class="fa-brands fa-github"></i></li>
              </ul>
            </div>
          </div>
        </div>
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
      overflow: hidden;
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
      margin-top: 70px;
      justify-content: center;
      align-items: center;
      width: 100%;
      flex-direction: column;
    }
    .content h1 {
      color: aliceblue;
    }
    .profile-card {
      position: relative;
      width: 250px;
      height: 300px;
      margin: 30px;
      box-shadow: 20px 20px 50px rgba(0, 0, 0, 0.5);
      border-radius: 15px;
      background: rgba(255, 255, 255, 0.1);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      border-top: 1px solid;
      border-top: 1px solid rgba(255, 255, 255, 0.5);
      border-left: 1px solid rgba(255, 255, 255, 0.5);
      backdrop-filter: blur(5px);
      color: aliceblue;
    }
    .profile-card img {
      width: 40%;
      border-radius: 60px;
    }

    .image-side {
      display: flex;
    }

    .profile-footer {
      position: absolute;
      bottom: 10px;
      width: 100%;
    }
    .profile-footer ul {
      display: flex;
      justify-content: space-evenly;
    }

    .profile-footer ul li {
      list-style: none;
      cursor: pointer;
    }
    .text-side {
      display: flex;
      align-items: center;
      flex-direction: column;
    }
    .text-side p {
      color: aliceblue;
      font-size: large;
      width: 50%;
      min-width: 200px;
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
      .image-side {
        flex-direction: column;
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
      .image-side {
        flex-direction: column;
      }
    }
  </style>
</html>
