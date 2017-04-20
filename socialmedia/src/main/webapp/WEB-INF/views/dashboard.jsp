<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard Page</title>
<link rel="stylesheet" href="/cs6320/resources/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet" href="/cs6320/resources/css/design.css" type="text/css" />
<script src="/cs6320/resources/js/jquery-3.1.1.min.js"></script>
<script src="/cs6320/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="page">
		<div id="maincontent">
			<h1>Welcome ${user.firstname}</h1>

			<p>
				First Name: ${user.firstname}<br> Last Name: ${user.lastname}<br>
				Email: ${user.email}
			</p>
		</div>

		<div id="menuleftcontent">
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading">
						<form action="inbox" method="POST">
							<input type="hidden" name="sender"
								value=${sessionScope.user.email }> 
								<button type="submit" class="btn btn-link" >Mail</button>
						</form>
						
					</div>
					<c:if test="${sessionScope.user.role == 1}">
					<div class="panel-body">
						<a href="/cs6320/admin/list" class="btn btn-link" type="submit">Admin Page</a>
						
					</div>
					</c:if>
					<div class="panel-body">
						<form action="chat" id="chat" method="POST">
							<input type="hidden" name="email"
								value=${sessionScope.user.email } > 
								<button type="submit" class="btn btn-link" >Chat</button>
						</form>
						
					</div>
				</div>
				
			</div>




		</div>

	</div>

</body>
</html>
