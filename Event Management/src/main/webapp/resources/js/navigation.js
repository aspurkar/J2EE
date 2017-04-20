/**
 * @author siddhi
 */
function openNav() {
	document.getElementById("main").style.marginLeft = "0%";
	document.getElementById("mySidenav").style.width = "25%";
	document.getElementById("mySidenav").style.display = "block";
	document.getElementById("openNav").style.display = 'none';
}
function closeNav() {
	document.getElementById("main").style.marginLeft = "0%";
	document.getElementById("mySidenav").style.display = "none";
	document.getElementById("openNav").style.display = "inline-block";
}

function inputFocus(i) {
	if (i.value == i.defaultValue) {
		i.value = "";
		i.style.color = "#000";
	}
}
function inputBlur(i) {
	if (i.value == "") {
		i.value = i.defaultValue;
		i.style.color = "#888";
	}
}
function redirectSearch() {
	document.getElementById('action').value = 'Search';
	document.getElementById('opForm').submit();
}

function update() {
	document.getElementById('action').value = 'Edit';
	document.getElementById('opForm').submit();
}