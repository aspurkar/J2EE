<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Message View</title>
<link rel="stylesheet" href="/cs6320/resources/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="/cs6320/resources/css/design.css" type="text/css" />
<script src="/cs6320/resources/js/jquery-3.1.1.min.js"></script>
<script src="/cs6320/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container-fluid">
		<h3>From: ${message.sender }</h3><br>
		<h3>To: ${message.receiver }</h3><br>
		<h3>Title: ${message.title }</h3><br>
		<h3>Message: ${message.message }</h3><br>
		
		<form action="inbox" method="POST">
			<input type="hidden" name="sender" value=${sessionScope.user.email }> 
				<button type="submit" class="btn btn-link" >Back to inbox</button>
		</form>
	</div>
</body>
</html>
