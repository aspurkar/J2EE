<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
<body>
	<div class="container">
	<form action="change" method="POST">
		<h1 class="peach">Welcome ${email}</h1>
<!--         <input type="submit" value="change password"> -->
	<a href="http://localhost:8080/controller/change">change password</a>
        </form>
		<h3>Select the pizza of your choice</h3>
		<table class="table table-bordered"
>
			<form action="cart" method="POST">

				<th>Pizza Name</th>
				<th>Price</th>
				<th>Add to Cart</th>
				<tr>
					<td>Supreme <img
						src="resources/images/supreme.png"
						style="width: 100px; height: 128px;"></td>
					<td>$20</td>
					<td><input type="hidden" name="name" value="Supreme">
						<input type="hidden" name="price" value="20"> 
						<input type="submit" value="Add to cart"></td>
				</tr>
			</form>
			<form action="cart" method="POST">
				<tr>
					<td>Meat Eater
					<img src="resources/images/meateater.png"
					style= "width: 100px; height: 128px;">
					</td>
					<td>$30</td>
					<td><input type="hidden" name="name" value="Meat Eater">
						<input type="hidden" name="price" value="30"><input
						type="submit" value="Add to cart"></td>
				</tr>
			</form>
			<form action="cart" method="POST">
				<tr>
					<td>Buffalo Chicken
					<img src="resources/images/buffalochicken.png"
					style= "width: 100px; height: 128px;">
					</td>
					<td>$50</td>
					<td><input type="hidden" name="name" value="Buffalo Chicken">
						<input type="hidden" name="price" value="50"><input
						type="submit" value="Add to cart"></td>
				</tr>
			</form>
			<form action="cart" method="POST">
				<tr>
					<td>Ultimate Pepperoni
					<img src="resources/images/pepperoni.png"
					style= "width: 100px; height: 128px;">
					</td>
					<td>$45</td>
					<td><input type="hidden" name="name" value="Ultimate Pepperoni">
						<input type="hidden" name="price" value="45"><input
						type="submit" value="Add to cart"></td>
				</tr>
			</form>
			<form action="cart" method="POST">
				<tr>
					<td>Honolulu Hawaiian
					<img src="resources/images/hampineapple.png"
					style= "width: 100px; height: 128px;">
					</td>
					<td>$55</td>
					<td><input type="hidden" name="name" value="Honolulu Hawaiian">
						<input type="hidden" name="price" value="55"><input
						type="submit" value="Add to cart"></td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>