<%@page import="account.Util"%>
<%@page import="account.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accounts!</title>
<link rel="stylesheet" href="AccountCSS.css">
</head>
<body>

	<div class="main-background">
	
		<div class="navbar">
			<img src="images/logo.png" class="logo">
			<!-- need better image logo -->
			<nav>
				<ul>
					<li><a href="home.jsp">HOME</a></li>
					<li><a href="books.jsp">BOOKS</a></li>
					<li><a href="Account.jsp">MY ACCOUNT</a></li>
				</ul>
			</nav>
			<img src="images/menu.png" class="menu-icon">
		</div>
		
		<div class="header" style="display: flex; align-items: center;">
			<h1>My Account</h1>
			<form style="margin-left: 25px;">
				<!-- 
		   	 	<label id="userNameLabel" style="color: #fff">Username: </label>
				<input type="text" id="username"/><br/>
				<label id="passwordLabel" style="color: #fff">Password: </label>
				<input type="text" id="password"/><br/>
				 -->
				<input type="text" id="username" placeholder="Username..."><br>
				<input type="password" id="password" placeholder="Password..."><br>
			</form>
			<!-- use display:none to hide other button when appropriate? -->
			<!-- append "display:none" to the style of unwanted button and it will work -->
			<!-- "style="margin-top: 0px; margin-left: 25px; display:none" -->
			<button type="button" onclick="login()"                    style="margin-top: 0px; margin-left: 25px;">Login</button>
			<button type="button" onclick="logout()" id="logoutButton" style="margin-top: 0px; margin-left: 25px;">Logout</button>

		</div>
		
		<div class="main-content">
			<div class="main-content-entry">
				<!-- Books are cards. Below is a template example. -->
				<!-- Also should probably make it so the image path is from /usr/share/images on the ubuntu server. -->
				<div class="card" style="background-image: url(images/sea-bear.png);">
					<!-- You can put the book name, author, etc. here -->
				</div>
				<!-- Below are example book cards that use css to configure the background image. Probably not what we want. -->
				<div class="card card2">
				</div>
				<div class="card card3">
				</div>
				<div class="card card4">
				</div>
			</div>
		</div>
		

	</div>
	
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/AccountJS.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

</html>