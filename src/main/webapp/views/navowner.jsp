<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka&family=Lato&display=swap" rel="stylesheet">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
    <title>Ecogas</title>
    
</head>
<body>
    <nav class="navbar">
        <div class="brand-name">Ecogas</div>
        <i class="toggle-button fa fa-2x fa-bars"></i>
        <div class="navbar-links">
            <ul>
                <li><a href="/owner/dashboard">Dashboard</a></li>
                <li><a href="/owner/update">Profile</a></li>
                <li><a href="/plant/addPlant">Add Plant</a></li>
                <li><a href="/plant/update">Update Plant</a></li>
                <li><a href="/booking/transaction">Transaction</a></li>
                <li class="w3-dropdown-hover">
                    <button class="w3-button">@${user }<i class="fa-solid fa-caret-down"></i></button>
                    <div class="w3-dropdown-content w3-bar-block">
                      <a href="/user/logout" class="w3-bar-item w3-button">Logout</a>
                    </div>
                </li>
                
            </ul>
        </div>
    </nav>
    <script>
        const toggleButton = document.getElementsByClassName('toggle-button')[0]
        const navbarLinks = document.getElementsByClassName('navbar-links')[0]

        if(toggleButton){
            toggleButton.addEventListener('click', () => {
                navbarLinks.classList.toggle('active')
            })
        }
    </script> 
</body>
<style>
	*{
    margin: 0;
    padding: 0;
}
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #31572C;
    color: white;
    font-family: 'Poppins', sans-serif;
}

.brand-name {
    font-size: 1.5rem;
    margin: .5rem;
    padding-left: 10px;
}

.navbar-links ul {
    margin: 0;
    padding: 0;
    display: flex;
}

.navbar-links li {
    list-style: none;
}

.w3-dropdown-hover{
    margin: .5rem;
}

.w3-button:hover{
    background-color: #90A955;
}
.navbar-links li a {
    text-decoration: none;
    color: white;
    padding: 1rem;
    display: block;
}

.navbar-links li:hover {
    background-color: #90A955;
}

.toggle-button {
    position: absolute;
    top: .4rem;
    right: 1rem;
    cursor: pointer;
    display: none;
}

.w3-dropdown-content{
    background-color: red;
}


.index-image {
    display: flex;
    align-items: center;
    justify-content: center;
}

.index-title {
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.index-text {
    width: 30%;
    min-width: 300px;
    font-size: 28px;
}

.index-text span {
    position: relative;
    font-size: 16px;
    margin-top: 30px;
}

.index-logo {
    width: 10%;
    min-width: 100px;
}

.index-button {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px;
}

.button-7 {
  background-color: rgb(41,168,223);
  border: 1px solid transparent;
  border-radius: 3px;
  box-shadow: rgba(255, 255, 255, .4) 0 1px 0 0 inset;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  font-family: -apple-system,system-ui,"Segoe UI","Liberation Sans",sans-serif;
  font-size: 20px;
  font-weight: 400;
  line-height: 1.15385;
  margin: 0;
  outline: none;
  padding: 8px .8em;
  position: relative;
  text-align: center;
  text-decoration: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: baseline;
  white-space: nowrap;
}

.button-7:hover,
.button-7:focus {
  background-color: rgb(41,168,223);
}

.button-7:focus {
  box-shadow: 0 0 0 4px rgba(0, 149, 255, .15);
}

.button-7:active {
  background-color: rgb(41,168,223);
  box-shadow: none;
}

@media (max-width: 550px) {
    .toggle-button {
        display: flex;
    }

    .navbar-links {
        display: none;
        width: 100%;
    }

    .navbar {
        flex-direction: column;
        align-items: flex-start;
    }

    .w3-button{
        width: 100%;
    }

    .w3-dropdown-content:hover{
        background-color: #90A955;
    }

    .w3-dropdown-content{
        width: 100%;
    }

    .navbar-links ul {
        flex-direction: column;
        width: 100%;
    }

    .navbar-links li {
        text-align: center;
    }

    .navbar-links li a {
        padding: .5rem 1rem;
    }

    .navbar-links.active {
        display: flex;
    }
}
</style>
</html>