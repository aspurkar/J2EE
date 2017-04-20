<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="HW">Job portal</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/HW/home.do">Home</a></li>
    
    </ul>
    <ul class="nav navbar-nav navbar-right">

    	<li><a href="/HW/logout.do"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
    </ul>
  </div>
</nav>
<div class="jumbotron">
  <center><h1>Welcome</h1></center>
</div>
<center>
<ul class="pagination">
  <li><a href="/HW/account1.do">See All the Work Listenings</a></li>
  <li><a href="/HW/post.do">Post the Work Request</a></li>
  <li><a href="/HW/workrequest.do">Manage My Work Requests</a></li>
  <li><a href="/HW/profile.do">Manage My Profile</a></li>
  <li class="active"><a href="/HW/interest.do">People interested in my requests</a></li>
</ul>
<h2> Following are the people who are interested in work provided by you</h2>
</center>

<form action="/HW/accInterest.do" method=get>
	<div class="row">
	<div class="col-xs-4"></div>
	<div class="col-xs-4">
    	<div class="form-group">
      		<label for="id">Accept with Job-ID:</label>
      		<input type="text" class="form-control" id="iid" name="iid" placeholder="Enter Request-ID from follwing table to accept interest">
			<input type="submit"/>    
    	</div>

<table class="table table-striped">
   
    <tbody>
      <c:forEach items="${interests}" var="current">
        <tr>
           <td><c:out value="Request-ID :${current.getIid()}" /><td>
          <td><c:out value="Applicant:${current.getUsername()}" /><td>
          <td><c:out value="Job-ID: ${current.getId()}" /><td>
          <td><c:out value="First Name of Appliant: ${current.getFname()}" /><td>
          <td><c:out value="Last Name :${current.getLname()}" /><td>
          <td><c:out value="Contact Number :${current.getContact()}" /><td>
          <td><c:out value="Email: ${current.getEmail()}" /><td>
			<td><c:out value="Address of Applicant: ${current.getAddress()}" /><td>
			
			
			
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>