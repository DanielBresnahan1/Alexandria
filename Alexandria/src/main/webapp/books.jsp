<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="booksCSS.css"/> 
<title>Books!</title>
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
			<h1>Books</h1>
			<a href="search.jsp">
				<button type="button" style="margin-top: 0px; margin-left: 25px;">Search Library</button>
			</a>
		</div>
		
		<div class="main-content">
			<div class="main-content-entry">
				<div class="card" style="background-image: url(images/books/kill-mockingbird.jpg);">
					<!--  
						<h3>Stopping Sea-Bears</h3>
						<p>Stuff</p>
					-->
				</div>
				<div class="card" style="background-image: url(images/books/hobbit.jpg);">
					<!--  
					<h3>News2</h3>
					<p>Stuff</p>
					-->
				</div>
				<div class="card" style="background-image: url(images/books/pride-prejudice.jpg);">
					<!--  
					<h3>News3</h3>
					<p>Stuff</p>
					-->
				</div>
				<div class="card" style="background-image: url(images/books/it.jpg);">
					<!--  
					<h3>News4</h3>
					<p>Stuff</p>
					-->
				</div>
				<div class="card" style="background-image: url(images/books/harry-potter.jpg);">
					<!--  
					<h3>News5</h3>
					<p>Stuff</p>
					-->
				</div>
				<div class="card" style="background-image: url(images/books/1984.png);">
					<!--  
					<h3>News6</h3>
					<p>Stuff</p>
					-->
				</div>
				<div class="card" style="background-image: url(images/books/handmaid-tale.jpg);">
					<!--  
					<h3>News7</h3>
					<p>Stuff</p>
					-->
				</div>
				<div class="card" style="background-image: url(images/books/cat-in-hat.jpg);">
					<!--  
					<h3>News8</h3>
					<p>Stuff</p>
					-->
				</div>
			</div>
		</div>
		
	</div>
	

</body>
</html>
