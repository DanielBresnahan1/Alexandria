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
				document.getElementById('pleaseLoginId').style.display = 'none';
				document.getElementById('loginDiv').style.display = 'none';
				document.getElementById('logoutButtonDiv').style.display = 'inline';
				document.getElementById('logoutButton').style.display = 'inline';
				document.getElementById('pleaseLoginId').style.display = 'none';
				document.getElementById('checkedOutBooksDiv').style.display = 'inline';
				document.getElementById('CheckedOutBooksHeading').style.display = 'inline';
				document.getElementById('checkedOutList').style.display = 'inline';				
				$(document).ready(function() {
				for (let i = 0; i < checkedOutBooks.length; i++) {
    			$("ul").append('<li style=\'color: white; margin-left:700px;\'>' + checkedOutBooks[i] + '</li>');
				}
    			});
			},
			dataType:"json",
			error: function (error) {
			console.log(error)}
	});
}