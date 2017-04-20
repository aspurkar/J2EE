<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>List of all Customers</h2>

		<table class="table table-bordered">
			<th>CustID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<c:forEach items="${allUsers}" var="user">
				<form action="deleteUser" method="POST">
				<tr>
					<td><input type="hidden" name="custid" value="${user.custID}">${user.custID}</td>
					<td>${user.firstname}</td>
					<td>${user.lastname}</td>
					<td>${user.email}</td>
					<td><input type="submit" value='Delete'></td>
				</tr>
				</form>
			</c:forEach>

		</table>
	</div>
	<form action="back" method="GET" >
			<input type="submit" value="Back">
	</form>
</body>
</html>