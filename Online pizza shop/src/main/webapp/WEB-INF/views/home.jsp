<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html lang="en">
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.center {
	margin: auto;
	border: 3px;
}

input {
	width: 50%;
}

body {
	background-image:
		url('http://troppa-nl.com/wp-content/uploads/2015/08/pizza-stock.jpg');
	
	style=color:white;
	float:center;
}

.button {
	background-color: #80ffff;
	color: black;
}
</style>
</head>
<body>
	<div class="container">
	<div align="center"><img src="resources/images/header.jpeg"
	style= "width: 800px; height: 150px;" >
</div>
		<form class="form-inline" action="login" method="POST">
			<div class="page-header">
				<h3 style="color:white">Login</h3>
			</div>
			
			<div class="form-group">
				<c:if test="${error != null}"> <p>Error string is ${error}</p> </c:if>
				<div style="cplor:red">${error}</div>
			    <label for="email"> Email: </label> <br>
				<input type="email" class="form-control" placeholder="Enter email" name="email" required>
				
			</div><br><br>
			<div class="form-group">
				<label for="pwd">Password:</label><br>
				 <input type="password" class="form-control" name="password" placeholder="Enter password" required>
			</div><br><br>
			<button type="submit" class="btn btn-default">Login</button>
		</form>
		<form class="form-inline" action="create" method="POST">
			<div class="page-header">
				<h3 style=color:white>Create Profile</h3>
			</div>
			<div class="form-group">
				<label for="firstname">First Name:</label><br> 
				<input type="text" class="form-control" placeholder="Enter firstname" name="firstname" required><br>
				<label for="lastname">Last Name: </label> <br>
				<input type="text" class="form-control" placeholder="Enter lastname" name="lastname" required><br>
				<label for="email"> Email: </label><br> 
				<input type="email" class="form-control" placeholder="Enter email" name="email" required><br>
				<label for="pwd">Password:</label> <br>
				<input type="password" class="form-control" placeholder="Enter password" name="password" required minlength="5"><br>
			</div><br><br>
			<button type="submit" class="btn btn-default">create</button>

		</form>
	</div>

</body>
</html>
