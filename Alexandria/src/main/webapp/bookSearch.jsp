<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="SearchStyle.css" type="text/css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="main-background">
		<div class="navbar">
			<img src="./images/logo.png" class="logo">
			<!-- need better image logo -->
			<nav>
				<ul>
					<li><a href="home.jsp">HOME</a></li>
					<li><a href="bookSearch.jsp">BOOKS</a></li>
					<li><a href="Account.jsp">MY ACCOUNT</a></li>
				</ul>
			</nav>
			<img src="./images/menu.png" class="menu-icon">
		</div>
		<div class="header" style="display: flex; align-items: center;">
			<h1>Book Search</h1>
		</div>
		<div class="main-content">
			<div class="main-content-entry">
			
			</div>
			<div class="SearchForm">
				<label for="title" class="label">Title:</label><br>
  				<input type="text" id="title" name="title" value="John"><br>
  				<label for="isbn" class="label">ISBN:</label><br>
  				<input type="text" id="isbn" name="isbn" value="Doe"><br><br>
  				<label for="genre" class="label">Genre:</label><br>
  				<input type="text" id="genre" name="genre" value="Doe"><br><br>
  				<label for="author" class="label">Author:</label><br>
  				<input type="text" id="author" name="author" value="Doe"><br><br>
  				<button type="button" onclick="createSearch()">Search books!</button>
			</div>
		</div>
	</div>
<script src="jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JobsJS.js"></script>

