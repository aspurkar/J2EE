<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Management</title>
</head>
<body class="w3-container">
<div class="w3-container w3-center w3-teal">
<h1>Students Data</h1>
</div>

<form:form action="student.do" method="POST" commandName="student">
	<table class="w3-table w3-striped">
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
			<td>Year Level</td>
			<td><form:input path="yearLevel" /></td>
		</tr>
		<tr class="w3-hover-teal">
		
			<td>Fee Detail</td>
			<td><form:input path="fee_detail" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>Displine</td>
			<td><form:input path="displine" /></td>
		</tr>
		
	
		<tr class="w3-hover-teal">
			<td>GPA</td>
			<td><form:input path="gpa" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>GYM</td>
			<td><form:input path="gym" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>Library</td>
			<td><form:input path="library" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>Parking</td>
			<td><form:input path="parking" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>datastructure</td>
			<td><form:input path="datastructure" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>networking</td>
			<td><form:input path="distributed" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>networking</td>
			<td><form:input path="networking" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>SoftwareWEB</td>
			<td><form:input path="softwareweb" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>Hadoop</td>
			<td><form:input path="hadoop" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>feeduedate</td>
			<td><form:input path="feeduedate" /></td>
		</tr>
		<tr class="w3-hover-teal">
			<td>receipt</td>
			<td><form:input path="receipt" /></td>
		</tr>
		
		<tr class="w3-hover-teal">
			<td colspan="2">
				<input type="submit" name="action" value="Add" />
				<input type="submit" name="action" value="Edit" />
				<input type="submit" name="action" value="Delete" />
				<input type="submit" name="action" value="Search" />
				<input type="submit" name="action" value="contact" />
				<input type="submit" name="action" value="academic" />
				<input type="submit" name="action" value="fee" />
			</td>
		</tr>
	</table>
</form:form>
<br>
<div class="w3-container w3-teal">
<table class="w3-table" border="1">
	<th>ID</th>
	<th>First name</th>
	<th>Last name</th>
	<th>Year level</th>
	<th>fee_detaill</th>
	<th>displine</th>
	<th>gpa</th>
	<th>gym</th>
	<th>library</th>
	<th>parking</th>
	<th>datastructure</th>
	<th>distributed</th>
	<th>networking</th>
	<th>softwareweb</th>
	<th>hadoop</th>
	<th>feeduedate</th>
	<th>receipt</th><tr>
	<c:forEach items="${studentList}" var="student">
		
			<td>${student.studentId}</td>
			<td>${student.firstname}</td>
			<td>${student.lastname}</td>
			<td>${student.yearLevel}</td>
			<td>${student.fee_detail}</td>
			<td>${student.displine}</td>
			<td>${student.gpa}</td>
			<td>${student.gym}</td>
			<td>${student.library}</td>
			<td>${student.parking}</td>
			<td>${student.datastructure}</td>
			<td>${student.distributed}</td>
			<td>${student.networking}</td>
			<td>${student.softwareweb}</td>
			<td>${student.hadoop}</td>
			<td>${student.feeduedate}</td>
			<td>${student.receipt}</td>
			
		</tr>
	</c:forEach>
</table>
</div>
</body>
</html>