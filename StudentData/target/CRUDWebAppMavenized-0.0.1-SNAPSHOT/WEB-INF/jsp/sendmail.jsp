<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<title>Contact Student</title>
<script>
function validate(){
			alert ("Email Has Been Send To Student");
		
		
	}
	

</script>
</head>
<body bgcolor="lightgray" class="w3-container">

	<div >
		<div class="main">
		<form   action="contact"   id="form_id" method="post" name="myform" class="w3-container">
		<h2> Contact Form </h2><hr/>
		  <label>Email Address :</label></br>
		  <input type="text" name="Email" id="Email" required="required"/></br>
 
		  <label>Subject Message:</label></br>
		  <input type="text" name="Subject" id="Subject" required="required"/></br>
 
		  
		 <label> Message:</label></br>
		  <input type="text" name="Message" id="Message" required="required"/></br>
 
		  <input type="submit" value="SEND" id="submit" onclick="validate()"/>
		
		</form>
		</div>
</div>
</body>
</html>