<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<title>Student Management</title>
</head>
<body bgcolor="lightgray">
<div class="w3-container w3-center w3-teal">
<h1>Students Fee Data</h1>
</div>

<form:form action="index2" method="POST" commandName="student" class="w3-container">
	<table class="w3-table w3-striped w3-bordered w3-border">
		<tr class="w3-hover-teal">
			<td>Student ID</td>
			<td><form:input path="studentId" /></td>
		</tr>
		<tr class="w3-hover-teal">	
			<td>First name</td>
			<td><form:input path="firstname" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>Last name</td>
			<td><form:input path="lastname" /></td>
		</tr>
	
		<tr class="w3-hover-teal">
		
			<td>Fee Detail</td>
			<td><form:input path="fee_detail" /></td>
		</tr>
	
		
			<td>feeduedate</td>
			<td><form:input path="feeduedate" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>receipt</td>
			<td><form:input path="receipt" /></td>
		</tr>
		
		<tr class="w3-hover-teal">
			<td colspan="2">
				
				<input type="submit" name="action" value="fee" />
				<input type="submit" name="action" value="home" />
				
			</td>
		</tr>
	</table>
</form:form>
<br>
<div class="w3-container w3-center w3-bottom w3-teal">
<h3>CS6320 Poject</h3>
</div>
</body>
</html>