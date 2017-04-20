<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
.button 
{
background-color: #99ffff;
border:none;
}
.button2 
{
background-color: #ffbf80;
border:none;
}
</style>
<body>
	<div class="container">
		<h2>Pizzaa Successfully added to cart</h2>
		
		<div >
		<form action="success">
			Add more pizza &nbsp;<input class=button type="submit" value="Continue Shopping"><br>
			<br>
		</form>
		</div>

		<table class="table table-bordered">
			<th>Pizza name</th>
			<th>quantity</th>
			<th>Cost</th>
			<th>Remove</th>
			<c:set var="subTotal" value="0" />
			<c:forEach items="${cart.cartItems}" var="entry">
				<form action="delete">
				<tr>
						
					<td><input readonly="readonly" value="${entry.key}"
						name="name" /></td>
					<td>${entry.value.quantity}</td>
					<c:set var="subTotal"
						value="${subTotal + entry.value.quantity * entry.value.price}" />
					<td>${entry.value.quantity * entry.value.price}</td>
					<td><input type="submit" value='delete'></td>
				</tr>
				</form>
			</c:forEach>

		</table>
		Sub Total:
		<c:out value="${subTotal}" />
		<br> Cart Size: ${cart.cartItems.size()}<br>
		

	</div>
	<div align="middle">
	<form action="payment" method="POST" >
	
			<input class=button2 type="submit" value="proceed to checkout">
			
	</form>
	</div>
	
</body>
</html>