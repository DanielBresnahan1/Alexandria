/**
 * 
 */

var loggedIn = false;
var account;
var checkedOutBooks;
function login() {
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	getLogin(username, password);	
}

function addAccount() {
	var username = document.getElementById("inputUsernameId").value;
	var email = document.getElementById("inputEmail").value;
	var password = document.getElementById("inputPasswordId").value;
	addAccountCall(username, email, password);
}
function logout() {
	location.reload();
}

function getLogin(username, password){
	 
    $.ajax({
			url: "FetchAccount.jsp",
			type: 'POST',
			data: {userName: username, password: password, requestType: 'LOGIN'},
			success: function(data) {
				account = data;
				loggedIn = true;
				checkedOutBooks = account.checkedOutBooks.checkedOut;
				document.getElementById("mainContent").style.display = 'inline';
				document.getElementById("username").value = '';
				document.getElementById("password").value = '';	
			},
			dataType:"json",
			error: function (error) {
			console.log(error)}
	});
	
}
function addAccountCall(username, email, password){
	 
    $.ajax({
			url: "AddAccount.jsp",
			type: 'POST',
			data: {userName: username, password: password, email: email},
			success: function(data) {
				location.reload();
			},
			dataType:"text",
			error: function (error) {
			console.log(error)}
	});
}