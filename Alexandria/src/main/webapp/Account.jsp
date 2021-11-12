<%@page import="account.Util"%>
<%@page import="account.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
<link rel="stylesheet" href="AccountCSS.css">
</head>
<body>
<div id="loginDiv">
	<form>
		<div id="userNameBlock">		
	   	 	<label id="userNameLabel">Username: </label>
			<input type="text" id="username"/><br/>
		</div>
		<label id="passwordLabel">Password: </label>
		<input type="text" id="password"/><br/>
		<button type="button" onclick="login()">login</button>
	</form>
</div>
<div id="logoutButtonDiv">
	<button type="button" onclick="logout()" id="logoutButton">Logout</button>
</div>
<p id="pleaseLoginId">Please log in with a user account to see checked out books.</p>
<div id="checkedOutBooksDiv">
	<h1 id="CheckedOutBooksHeading">Checked out books:</h1>
	<ul id="checkedOutList"></ul>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/AccountJS.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

</html>