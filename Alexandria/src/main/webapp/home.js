// modal box tutorial content adapted from https://www.w3schools.com/howto/howto_css_modals.asp
// Get the modal
var modal = document.getElementById("modal-box");

// Get the <span> element that closes the modal
var closer = document.getElementById("modal-closer");

// When the user clicks on <span> (x), close the modal
closer.onclick = function() {
  modal.style.display = "none";
}
// end of modal box tutorial content 

var sea_bears = document.getElementById("sea-bears");
sea_bears.onclick = function() {
	document.getElementById("modal-box-header").innerHTML = "Sea Bear News!";
	document.getElementById("modal-box-text").innerHTML = "Draw a circle!";
	modal.style.display = "block";
}

var sexy_trump = document.getElementById("sexy-trump");
sexy_trump.onclick = function() {
	document.getElementById("modal-box-header").innerHTML = "Sexy Trump News!";
	document.getElementById("modal-box-text").innerHTML = "La Naranha";
	modal.style.display = "block";
}

var smothering = document.getElementById("smothering");
smothering.onclick = function() {
	document.getElementById("modal-box-header").innerHTML = "Smothering News!";
	document.getElementById("modal-box-text").innerHTML = "Use extra pillows.";
	modal.style.display = "block";
}

var saxton_hale = document.getElementById("saxton-hale");
saxton_hale.onclick = function() {
	document.getElementById("modal-box-header").innerHTML = "Saxton Hale News!";
	document.getElementById("modal-box-text").innerHTML = "Australia Australia Australia Australia Australia";
	modal.style.display = "block";
}

