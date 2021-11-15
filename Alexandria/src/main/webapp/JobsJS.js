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

