<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>
<link rel="stylesheet" href="/cs6320/resources/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="/cs6320/resources/css/design.css" type="text/css" />
<script src="/cs6320/resources/js/jquery-3.1.1.min.js"></script>
<script src="/cs6320/resources/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("button.edit").click(function() {
			var row = $(this).parent().parent().children("td");
			var firstname = row.eq(0).text();
			var lastname = row.eq(1).text();
			var email = row.eq(2).text();
			$("#firstname").val(firstname);
			$("#lastname").val(lastname);
			$("#email").val(email);
			var userID = $(this).data('id');
			$("#userID").val(userID);
		});

		/*
		$("#action_button").click(
				function() {
					$.get("/cs6320/admin/user",
							function(data, status) {
								alert("Data: " + data.firstname + " "
										+ data.lastname + "\nStatus: "
										+ status);
								var firstname = data.firstname;
								$("#stuff").text(firstname);
							});
				});

		
		$("button[id^='delete_user']").click(
				function() {
					//alert($(this).closest('tr').attr('id'));
					var email = $(this).closest('tr').attr('id');
					alert(email);
					$.get("/cs6320/admin/delete/" + email, function(
							data, status) {
						$(this).closest('tr').remove();
					});

				});
		*/		

	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container-fluid">
		<h1>Admin Page</h1>
		<table class="table">
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Action(s)</th>
			</tr>
			<c:forEach var="user" items="${users}">
				<tr id="${user.email}">
					<td>${user.firstname}</td>
					<td>${user.lastname}</td>
					<td>${user.email}</td>
					<td>
						<form action="delete" method="POST">
							<input type="hidden" name="email" value=${user.email } > <input
								type="submit" value="Delete" />
						</form>
					<td><button type="button" class="btn btn-link edit" data-id=${user.id }
							data-toggle="modal" data-target="#myModal">Edit</button></td>
				</tr>
			</c:forEach>
		</table>


		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit User</h4>
					</div>
					<div class="modal-body">
						<form action="update" method="POST" class="form-horizontal">

							<div class="form-group">
								<label class="control-label col-sm-2">ID:</label> <input
									id="userID" type="text" name="id">
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">First Name:</label> <input
									id="firstname" type="text" name="firstName">
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">Last Name:</label> <input
									id="lastname" type="text" name="lastName">
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">Email:</label> <input
									id="email" type="email" name="email">
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"></label> <input
									type="submit" class="btn btn-sm btn-primary" value="Update">
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
