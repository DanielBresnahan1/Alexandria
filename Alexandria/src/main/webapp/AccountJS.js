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
	document.cookie = 'loggedIn=';
	console.log(document.cookie);
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
				if (account.checkedOutBooks != null) {				
					checkedOutBooks = account.checkedOutBooks.checkedOut;
					var length = checkedOutBooks.length;
        
        		for(var i=0; i<length; i++){
            
            		var book = checkedOutBooks[i];
            
            		var div = document.createElement("div");
            		div.className = "card";
            		var image = "./images/books/" + book[0].split(' ').join("-") + ".jpg";
           			div.setAttribute("style", "background-image: url(" + image + ");");
           			div.id = book[0];
            
            		document.getElementsByClassName("main-content-entry")[0].appendChild(div);
				
				}
				document.getElementById("mainContent").style.display = 'inline';
				document.getElementById("username").value = '';
				document.getElementById("password").value = '';	
			}
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

