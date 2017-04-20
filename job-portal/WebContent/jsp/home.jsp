<!DOCTYPE html>
  <%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
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
      <a class="navbar-brand" href="#">Job portal</a>
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


  
  <center>
   <h2><div style="color:red;">Work availability</h2></div>
 <h3></center>
 <div class=row>
 
 <div class="col-xs-4"></div>
 
 <div class="col-xs-4">
 
  <table class="table table-striped">
  
    
    	
      <tr>
      <c:forEach items="${jobs}" var="current">
        <tr>
        
       <td><c:out value=" Job-ID:${current.getId()}" /></td>
       <td> <c:out value="Type: ${current.getType()}" /></td>
         <td> <c:out value="Posted By:${current.getUsername()}" /> </td>
         
         
         <td> <c:out value="Rate: ${current.getRate()}" /></td>
        
          <td><c:out value="Hrs: ${current.getHrs()}" /></td>
			<td><c:out value="Location: ${current.getLocation()}" /></td>
        
        
        
        
        
        
        
        
        
        
          <!-- Job-ID:<div style="color:red;"><c:out value="${current.getId()}" /></div> <c:out value="Type: ${current.getType()}" /><br/>
         Posted By: <c:out value="${current.getUsername()}" /> <br/>
         
         
         <div style="color:blue;"> <c:out value="${current.getRate()}" /></div><br/>
        
          Hours (Approx) :<c:out value="${current.getHrs()}" /></br>
			<div style="color:green;"><c:out value="${current.getLocation()}" /></div> -->
        </tr>
      </c:forEach>
       </tr>
    </tbody>
  </table> </div></div>
  </h3>
</body>
</html>

