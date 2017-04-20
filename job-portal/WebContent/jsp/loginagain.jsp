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
      <li><a href="/HW/loginentry.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="/HW/loginentry.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    
    </ul>
  </div>
</nav>

<div class="jumbotron">
  <center><h1>Welcome</h1></center>
</div>
<div class="container">
  <div class="container">
<center><div style="color:red;"><h3>Please try to re-attempt the log in. username or password was invalid</h3></div></center>  
  <div class = row>
  
  
  
   <div class="col-xs-5">
  <h2>Log In</h2>
  <form role="form" method="get" action="/HW/account.do">
<div class="row">

<div class="col-xs-10">
    <div class="form-group">
      <label for="username">User Name:</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="Enter User Name">
    </div>
</div>
<div class="col-xs-2">

</div>
</div>

<div class="row">
<div class="col-xs-10">
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="password" placeholder="Enter password">
    </div>
</div>
<div class="col-xs-2">
</div>
</div>

<div class ="row">
<div class="col-xs-10">  
<div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
</div>
<div class="col-xs-2">
</div>
</div>
<div class="row">
<div class="col-xs-10">

    <button type="submit" class="btn btn-default">Log In!</button>
</div>
<div class="col-xs-2">
</div>

</div>
  </form>
  
  </div>
  <div class = "col-xs-1"></div>
  
  <div class = "col-xs-6">
  
  <div class="span12" style="border: 2px solid black">
 <center><h2> Sign Up</h2></center>
  <form action="/HW/signup.do" method="get">

<div class="row">
<div class="col-xs-1"></div>
<div class="col-xs-10">
    <div class="form-group">
      <label for="usr">User Name:</label>
      <input type="text" class="form-control" id="usr" name="username" placeholder="Enter User Name">
    </div>
</div>
<div class="col-xs-1">
</div>
</div>


<div class="row">
<div class="col-xs-1">
</div>
<div class="col-xs-10">
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
    </div>
</div>
<div class="col-xs-1">
</div>
</div>







<div class="row">
<div class="col-xs-1">
</div>
<div class="col-xs-10">
    <div class="form-group">
      <label for="fname">First Name:</label>
      <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter First Name">
    </div>
</div>
<div class="col-xs-1">
</div>
</div>

<div class="row">
<div class="col-xs-1">
</div>
<div class="col-xs-10">
    <div class="form-group">
      <label for="lname">Last Name:</label>
      <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter Last Name">
    </div>
</div>
<div class="col-xs-1">
</div>
</div>

<div class="row">
<div class="col-xs-1">
</div>
<div class="col-xs-10">
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address">
    </div>
</div>
<div class="col-xs-1">
</div>
</div>


<div class="row">
<div class="col-xs-1">
</div>
<div class="col-xs-10">
    <div class="form-group">
      <label for="fname">Email:</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email">
    </div>
</div>
<div class="col-xs-1">
</div>
</div>







<div class="row">
<div class="col-xs-1">
</div>
<div class="col-xs-10">
    <div class="form-group">
      <label for="contact">Contact:</label>
      <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter Contact">
    </div>
</div>
<div class="col-xs-1">
</div>
</div>







<div class="row">
<div class="col-xs-1">
</div>
<div class="col-xs-10">

    <button type="submit" class="btn btn-default">Sign Up!</button>
</div>
<div class="col-xs-1">
</div>
</div>  
  </form>
  </div>
  </div>
  
  
  
  
</div>
</div>

</body>
</html>