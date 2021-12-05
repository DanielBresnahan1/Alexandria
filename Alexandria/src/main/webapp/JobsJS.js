function createSearch(){
	
	var title = document.getElementById("title").value;
	var genre = document.getElementById("genre").value;
	var isbn = document.getElementById("isbn").value;
	var author = document.getElementById("author").value;
	
	searchBooks(function(books_list){
		
		var length = books_list.length;
		
		for(var i=0; i<length; i++){
			
			var book = books_list[i];
			
			var div = document.createElement("div");
			div.className = "card";
			var image = "./images/books/" + book[0].split(' ').join("-") + ".jpg";
			//div.style.backgroundImage = image;
			div.addEventListener('click', function(){
				checkOutBook(book[0], book[1], book[2], book[3]);
			});
			div.setAttribute("style", "background-image: url(" + image + ");");
			div.id = book[0];
			
			let info = "";
			
			for(var j=1; j<4; j++){
				info += book[j] + "\n";
			}
			
			div.title = info;
			
			document.getElementsByClassName("main-content-entry")[0].appendChild(div);
			
		}
		
	}, title, genre, isbn, author);
}

function checkOutBook(title, genre, isbn, author){
	
	selectText(function(bookText){
		
		checkoutBook(function(AccountName){
			return AccountName;
		}, title, genre, isbn, author);
		
		console.log('books/' + bookText[0]);
		
		location.href = 'books/' + bookText[0];
	}, isbn);
	
	console.log(location);
	
}



function checkoutBook(callback, title, genre, isbn, author){
	
	$.ajax({
			url: "AccountHandler.jsp",
			method: 'GET',
			data: {title, genre, isbn, author},
			success: function(data) {
				AccountName = data;
				callback(AccountName);
				return false;
			},
			dataType:"json",
			error: function (data) {
				console.log("Account Lookup Failed");
			}
	});
	
}

function selectText(callback, isbn){
	
	console.log("Begin Text Selection");
	
	var isbn = isbn;
	
	$.ajax({
			url: "Text.jsp",
			method: 'GET',
			data: {ISBN: isbn},
			success: function(data) {
				bookText = data;
				callback(bookText);
				return false;
			},
			dataType:"json",
			error: function (data) {
				console.log(data);
				console.log("text lookup Failed");
			}
	});
	
}

function searchBooks(callback, title, genre, isbn, author){
	var books_list = new Array();
	
	var title = title;
	var genre = genre;
	var isbn = isbn;
	
	console.log(isbn);
	
	var author = author;
	
	console.log("Begin query");
	
	$.ajax({
			url: "Search.jsp",
			method: 'GET',
			data: {Title: title, Genre: genre, ISBN: isbn, Author: author},
			success: function(data) {
				books_list = data;
				callback(books_list);
				return false;
			},
			dataType:"json",
			error: function () {}
	});
	
}

function createJobSlides(job_name){
	
	requestData(function(jobs_list){
		
		console.log(jobs_list);
		
		var length = jobs_list.length;
		
		for(var i=0; i<length; i++){
			var job = jobs_list[i];
			var title = job[0];
			
			var div = document.createElement("div");
			div.className = "mySlides fade";
			div.id = title;
	
			var numLabel = document.createElement("div");
			numLabel.className = "numbertext"
			numLabel.innerHTML = i.toString() + " / " + length.toString();
			div.appendChild(numLabel);
			
			var jobDiv = document.createElement("div");
			jobDiv.id = "rcorners1"
			jobDiv.innerHTML = title;
			
			for(var j=1; j<job.length; j++){
				jobDiv.innerHTML += "<li>" + job[j] + "</li>";
			}
			
			div.appendChild(jobDiv);
			document.getElementsByClassName("slideshow-container")[0].appendChild(div);
			
		}
	}, job_name);
}

