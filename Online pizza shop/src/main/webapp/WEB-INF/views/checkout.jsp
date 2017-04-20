<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Checkout</title>
</head>
<body>
	<form action="thanku" method="post" class="form-inline" align="center">
		<div align="center" class="form-group">
			<h3>Address</h3>
			<lable>Address1:</lable>
			<br> <input type="text" class="form-inline"
				placeholder="enter address" required><br>
			<lable>Address2:</lable>
			<br> <input type="text" class="form-inline"
				placeholder="enter address" required><br>
			<lable>City:</lable>
			<br> <input type="text" class="form-inline" placeholder="city"
				required><br>
			<lable>Postel code:</lable>
			<br> <input type="text" class="form-inline"
				placeholder="postel code" required><br> <br>
			<input type="submit" value="place your order">
		</div>
	</form>
	<div align="center"></div>
	<img src="resources/images/address.png" style="width: 1200px; height: 500px;" >
	<</div>
</body>
</html>