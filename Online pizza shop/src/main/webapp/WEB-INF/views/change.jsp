<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.button 
{
background-color: #00cc44;
border:none;
}
</style>

<body>

<div align="center">
	<h3> Change Password</h3>
	<form action="update" method="POST">
	old password: <br> <input type="password" name="oldpassword"><br>
	new password: <br> 
	<input type="password" name="newpassword"><br>
	<br>
	<input class=button type="submit" value="Save Changes">
	</form></div>
</body>
</html>