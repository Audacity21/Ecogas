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
    <link rel="stylesheet" href="home.css">
    <title>Ecogas</title>
</head>
<body>
        <div class="navbar">
            <div class="logo"></div>
            <div class="items">
                <ul>
                    <li>Home</li>
                    <li>About</li>
                    <li>Github</li>
                    <li>Contact</li>
                </ul>
            </div>
            <div class="buttons">
                <button class="btn-1">Login</button>
                <button class="btn-2">Sign Up</button>
            </div>
        </div>
       
</body>
<style>


body{
    font-family: 'Poppins', sans-serif;
}

.navbar{
    color: #fff;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    height: 90px;
    font-size: 24px;
    z-index: 1;
}
.navbar ul{
    display: flex;
    list-style: none;
}
.navbar ul li{
    margin: 0 20px;
    border-bottom: 2px solid transparent;
}
.navbar ul li:hover{
    border-bottom: 2px solid #fff;
    cursor: pointer;
}
.buttons{
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    width: 250px;
}
.btn-1 {
  background-color: #90A955;
  border: 1px solid transparent;
  border-radius: 3px;
  box-shadow: rgba(255, 255, 255, .4) 0 1px 0 0 inset;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  font-size: 24px;
  padding: 5px 10px;
  width: 110px;
}
.btn-1:hover{
    background-color: #738745;
}
.btn-2 {
  background-color: #ECF39E;
  border: 1px solid transparent;
  border-radius: 3px;
  box-shadow: rgba(255, 255, 255, .4) 0 1px 0 0 inset;
  box-sizing: border-box;
  color: black;
  cursor: pointer;
  font-size: 24px;
  padding: 5px 10px;
  width: 110px;
}
.btn-2:hover{
    background-color: #9da16a;
}
.content{
    display: flex;
    z-index: 1;
}
.image-side{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 50%;
    float: left;
    z-index: 1;
}
.image-side img{
    width: 100%;
    height: 100%;
}
.text-side{
    width: 50%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: #fff;
    z-index: 1;
}

</style>

</html>