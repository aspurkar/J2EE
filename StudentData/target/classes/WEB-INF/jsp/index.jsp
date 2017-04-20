<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN LOGIN</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<body>
<body bgcolor="lightgray" class="w3-container">
	
		<div class="w3-container w3-center w3-teal">
		<h2> Login Form </h2><hr/>
		</div>
		<div class="w3-card-4">

<div class="w3-container w3-green"></div>
		<form class="w3-container"  action="loginServlet"   id="form_id" method="post" name="myform" class="w3-container">
		
		  <label>User Name :</label></br>
		  <input class="w3-input" type="text" name="username" id="username" required="required"/></br>
 
		  <label>Password :</label></br>
		  <input  class="w3-input" type="password" name="userpass" id="userpass" required="required"/></br>
 
		  <input type="submit" value="Login" id="submit" onclick="validate()"/>
		</form>
		</div>
</div>
<div class="w3-container w3-center w3-bottom w3-teal">
<h3>CS6320 Poject</h3>
</div>
</body>
</html>





