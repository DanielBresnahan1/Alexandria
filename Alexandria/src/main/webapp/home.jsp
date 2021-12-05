<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="homeCSS.css"/> 
<title>OnLibrary Home!</title>
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
		
		<div class="main-content">
			<div class="main-content-entry">
				<h1>OnLibrary</h1>
				<p>Make everything yours.</p>
				<!-- It's all yours. ? -->
				<a href="search.html">
					<button type="button">Search Library</button>
				</a>
			</div>
			<div class="main-content-entry">
				<div id="sea-bears" class="card" style="background-image: url(./images/sea-bear.png);">
					<!--  
						<h3>Stopping Sea-Bears</h3>
						<p>Stuff</p>
					-->
				</div>
				<div id="sexy-trump" class="card" style="background-image: url(./images/sexy.jpg);">
					<!--  
					<h3>News2</h3>
					<p>Stuff</p>
					-->
				</div>
				<div id="smothering" class="card" style="background-image: url(./images/smothering.jpg);">
					<!--  
					<h3>News3</h3>
					<p>Stuff</p>
					-->
				</div>
				<div id="saxton-hale" class="card" style="background-image: url(./images/saxton.jpg);">
					<!--  
					<h3>News4</h3>
					<p>Stuff</p>
					-->
				</div>
			</div>
		</div>
		
	</div>
	
	<!-- modal box tutorial content adapted from https://www.w3schools.com/howto/howto_css_modals.asp -->
	<!-- The Modal -->
	<div id="modal-box" class="modal">
	
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span id="modal-closer">&times;</span>
	    <h1 id="modal-box-header">modal box header holder</h1>
	    <p id="modal-box-text">modal box text holder</p>
	  </div>
	
	</div>
	<!-- end of modal box tutorial content -->
	

<script type="text/javascript" src="home.js"></script> <!-- This is at the button to avoid load order errors. Neat! -->
</body>
</html>
