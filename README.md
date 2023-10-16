# Ecogas

## Overview
Our project aims to solve the UN sustainable development goal of generating clean and renewable energy by promoting the use of biofuel in India. Biofuel is often used as energy source but not on a large scale. Ecogas aims to scale it up by providing an interface for biogas plant owners to connect with people who are ready to supply organic waste to them, who in turn will be able to purchase fuel, fertilizers and other products from the plant owners. Ecogas facilitates everything for the end users which gives this app/idea a huge potential if implemented properly.

## Technoligies Used
- Google Cloud Platform
- Google Maps Platform
- Spring Boot and JSP
- HTML5, CSS3, JavaScript
- MySQL

## Project Setup Guidelines
1. Login to the Google Cloud console, create a new project
2. Open the Google Maps API and generate a new API key. Remember the key.
3. Make sure you have [MySQL](http://https://www.mysql.com/downloads/ "MySQL") and [Spring Boot IDE](http://https://spring.io/tools "Spring Boot IDE") installed in your system. If not, you can head over to the hyperlinks in the names and install them first.
4. Download the code from this repository as a zip file.
5. Open Spring Tools IDE and create a new workspace.
6. Extract the zip file in the workspace.
7. Go to `File->Import->Directory` and choose the folder which has the **pom.xml** file.
8. Click on import project.
9. Once the project is imported, right click, go to `Maven->Update Project`, click on that and check on `Force Update`. This will download all the dependencies.
10. Go to MySQL workbench and create a new schema called ecogas.
10. Open `src->main->resources->application.properties`, change the configuration of the variables according to your system. Replace the `{api_key}` variable in **points.jsp**, **updateplant.jsp** and **addplant.jsp**.
11. Right click on the project directory and click on `Run As->Spring Boot App`. The project should run successfully.

## Screenshots
#### Homepage: 
![image](https://user-images.githubusercontent.com/83300897/229124674-83e83c58-fa8d-41eb-a79d-e387b7d96016.png)

#### Registration Page(for both user and plant owner):
![image](https://user-images.githubusercontent.com/83300897/229124825-73f6aac7-a8eb-41d0-becf-f305eb701892.png)

#### Plant Owner Dashboard:
![image](https://user-images.githubusercontent.com/83300897/229125425-14946ae3-d648-40ca-9107-0cac7b875715.png)

#### Plant Details and location update page: 
![image](https://user-images.githubusercontent.com/83300897/229125225-eecb014d-6c99-4d40-99e8-52a52030b3a3.png)

#### Plant List:
![image](https://user-images.githubusercontent.com/83300897/229126086-9aae3fef-b72b-4232-930d-4967d9eb2838.png)

#### Order Page: 
![image](https://user-images.githubusercontent.com/83300897/229126419-c203c27b-f1b3-4829-b8e6-9a81e44aa2ca.png)

**P.S: All the pages are responsive and can be viewed in mobile.**

## Contribution Guide
We won't be accepting any PR's till the Solution Challenge evaluation is not done, after that we will keep the application open-source and would welcome contributions to this project. 
