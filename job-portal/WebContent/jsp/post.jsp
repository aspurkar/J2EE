<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <li class="active"><a href="/HW/post.do">Post the Work Request</a></li>
  <li><a href="/HW/workrequest.do">Manage My Work Requests</a></li>
  <li><a href="/HW/profile.do">Manage My Profile</a></li>
  <li><a href="/HW/interest.do">People interested in my requests</a></li>
</ul>

</center>
<form action="/HW/processpost.do" method="get">

<div class="row">
<div class="col-xs-4"></div>
<div class="col-xs-4">
    <div class="form-group">
      <label for="type">Type of Job:</label>
      <div class="radio">
  <label><input type="radio" id="type" name="type" value="paint">Painting</label>
</div>
<div class="radio">
  <label><input type="radio" id="type" name="type" value="it">Computer Maintainance</label>
</div>
<div class="radio">
  <label><input type="radio" id="type" name="type" value="construction">Construction</label>
</div>
<div class="radio">
  <label><input type="radio" id="type" name="type" value="plumber">Plumber</label>
</div>
<div class="radio">
  <label><input type="radio" id="type" name="type" value="other" checked>other (Please decribe the role in discription section)</label>
</div>
      
    </div>
</div>
<div class="col-xs-4">
</div>
</div>


<div class="row">
<div class="col-xs-4">
</div>
<div class="col-xs-4">
    <div class="form-group">
      <label for="discription">Discription about work:</label>
      <input type="text" class="form-control" id="discription" name="disc" placeholder="Enter discription for the role">
    </div>
</div>
<div class="col-xs-4">
</div>
</div>







<div class="row">
<div class="col-xs-4">
</div>
<div class="col-xs-4">
    <div class="form-group">
      <label for="rate">Rate (per hr):</label>
      <input type="text" class="form-control" id="rate" name="rate" placeholder="Enter the Rate you wish to offer">
    </div>
</div>
<div class="col-xs-4">
</div>
</div>

<div class="row">
<div class="col-xs-4">
</div>
<div class="col-xs-4">
    <div class="form-group">
      <label for="neg">Rate is Negotiable or not:</label>
      <div class="radio">
  <label><input type="radio" id="neg" name="neg" value="yes">Yes</label>
  	 <label><input type="radio" id="neg" name="neg" value="no" checked>NO</label>
</div>
    </div>
</div>

<div class="col-xs-4">
</div>
</div>

<div class="row">
<div class="col-xs-4">
</div>
<div class="col-xs-4">
    <div class="form-group">
      <label for="hrs">Hours Required to complete the Job (Approximately):</label>
      <input type="text" class="form-control" id="hrs" name="hrs" placeholder="Enter the hours">
    </div>
</div>
<div class="col-xs-4">
</div>
</div>


<div class="row">
<div class="col-xs-4">
</div>
<div class="col-xs-4">
    <div class="form-group">
      <label for="fname">Location:</label>
      <input type="text" class="form-control" id="location" name="location" placeholder="Enter Work Location (City)">
    </div>
</div>
<div class="col-xs-4">
</div>
</div>














<div class="row">
<div class="col-xs-4">
</div>
<div class="col-xs-6">

    <button type="submit" class="btn btn-default">Post the Request!</button>
</div>
<div class="col-xs-4">
</div>
</div>  
  </form>

</body>
</html>