
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>College online magazine: Admin</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link rel="stylesheet"
	href="<c:url value="/external/bootstrap/css/bootstrap.min.css" />">

<!-- Animation library for notifications   -->
<link rel="stylesheet"
	href="<c:url value="/external/assets/css/animate.min.css" />">

<!--  Light Bootstrap Table core CSS    -->
<link rel="stylesheet"
	href="<c:url value="/external/assets/css/light-bootstrap-dashboard.css"/>">


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link rel="stylesheet"
	href="<c:url value="/external/assets/css/demo.css"/>">


<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="<c:url value="/external/assets/css/pe-icon-7-stroke.css" />">
<script type="text/javascript">
function myProfile(){
	var studentId = document.getElementById("studentId").value;
	$('#studentId').val(studentId);
	$('#studProfileForm').attr('action', "/ocm/student/getMyProfile").submit();
}
function studentDashboard(){
	var studentId = document.getElementById("studentId").value;
	$('#studentId').val(studentId);
	$('#studProfileForm').attr('action', "/ocm/getDashboard").submit();
}
function postArticle(){
	var studentId = document.getElementById("studentId").value;
	$('#studentId').val(studentId);
	$('#studProfileForm').attr('action', "/ocm/student/getPostArticle").submit();
}
function findArticles(){
	$('#studProfileForm').attr('action', "/ocm/student/findArticles").submit();
}
</script>
</head>
<body>
	<form id="studProfileForm" class="form-horizontal" role="form" action="/ocm/admin/updteUser">
		<div class="wrapper">
<div class="sidebar" data-color="black" data-image="<c:url value="/external/assets/img/sidebar-5.jpg" />">

				<!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->

				<div class="sidebar-wrapper">
					<div class="logo">
						<a href="http://localhost:8080/ocm/" class="simple-text"> OCM
						</a>
					</div>

					<ul class="nav">
						<li><a href="#" onclick="studentDashboard();"> <i
								class="pe-7s-graph"></i>
								<p>Dashboard</p>
						</a></li>
						<!-- <li class="active"><a id="mngUsersLink" href="#"
							onclick="manageUsers();"> <i class="pe-7s-news-paper"></i>
								<p>Manage Users</p>
						</a></li> -->
						<li><a href="#" onclick="postArticle();"> <i class="pe-7s-note2"></i>
								<p>Post Article</p>
						</a></li>
						<li><a href="#" onclick="findArticles();"> <i class="pe-7s-note2"></i>
								<p>Find Articles</p>
						</a></li>
						<li class="active"><a href="#" onclick="myProfile();"> <i
								class="pe-7s-user"></i>
								<p>My Profile</p>
						</a></li>
					</ul>
				</div>
			</div>

			<div class="main-panel">
				<nav class="navbar navbar-default navbar-fixed">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target="#navigation-example-2">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
<!-- 							<a class="navbar-brand" href="#">Manage Users</a> -->
						</div>
						<div class="collapse navbar-collapse">


							<ul class="nav navbar-nav navbar-right">
								<li><a href="/logout"> Welcome, ${user.fname } &nbsp;
										${user.lname }</a></li>

								<li><a href="/ocm/logout"> Log out </a></li>
							</ul>
						</div>
					</div>
				</nav>


				<div class="content">
					<div class="container-fluid">
						<div class="row">

							<div class="col-md-12">
								<div class="card">
									<div class="header">
										<h4 class="title">Edit Profile</h4>
									</div>
									<div class="content">
											<div class="row">
												<div class="col-md-8">
													<div class="form-group">
														<label>User Type (disabled)</label> <input id="userType" name="userType" type="text"
															class="form-control" disabled placeholder="User Type"
															value="${profUser.userType}">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Username</label> <input type="text" id="uname" name="uname" 
															class="form-control" placeholder="Username"
															value="${profUser.uname}">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label for="exampleInputEmail1">Email address</label> <input id="email" name="email" 
															type="email" class="form-control" placeholder="Email" value="${profUser.email}">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>First Name</label> <input type="text" id="fname" name="fname" 
															class="form-control" placeholder="Company" value="${profUser.fname}">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Last Name</label> <input type="text" id="lname" name="lname" 
															class="form-control" placeholder="Last Name"
															value="${profUser.lname}">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Address</label> <input type="text" id="address1" name="address1" 
															class="form-control" placeholder="Home Address"
															value="${profUser.address1}">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>City</label> <input type="text" id="city" name="city"
															class="form-control" placeholder="City" value="${profUser.city}">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>State</label> <input type="text" id="state" name="state"
															class="form-control" placeholder="State" value="${profUser.state}">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Country</label> <input type="text" id="country" name="country"
															class="form-control" placeholder="Country" value="${profUser.country}">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Postal Code</label> <input type="number" id="pincode" name="pincode"
															class="form-control" placeholder="ZIP Code" value="${profUser.pincode}">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>About Me</label>
														<textarea rows="5" class="form-control" id="aboutme" name="aboutme"
															placeholder="Here can be your description" value="${profUser.aboutme}">${profUser.aboutme}</textarea>
													</div>
												</div>
											</div>

											<button type="submit"
												class="btn btn-info btn-fill pull-right">Update
												Profile</button>
											<div class="clearfix"></div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>


				<footer class="footer">
					<div class="container-fluid">
						<nav class="pull-left">
							<ul>
								<li><a href="#"> Home </a></li>
								<li><a href="#"> College </a></li>
							</ul>
						</nav>
						<p class="copyright pull-right">
							&copy; 2016 <a href="http://www.creative-tim.com">College
								Online Magazine</a>
						</p>
					</div>
				</footer>

			</div>
		</div>
		<input type="hidden" id="userId" name="userId" value="${profUser.userId }" />
		<input type="hidden" id="mesg" name="mesg" value="${mesg}"/>
<input type="hidden" id="errmesg" name="errmesg" value="${errmesg}"/>
<input type="hidden" name="studentId" id="studentId" value="${user.userId}">
	</form>
</body>

<!--   Core JS Files   -->
<script src="<c:url value="/external/assets/js/jquery-1.10.2.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/external/assets/js/bootstrap.min.js"/>"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script
	src="<c:url value="/external/assets/js/bootstrap-checkbox-radio-switch.js"/>"></script>

<!--  Charts Plugin -->
<script src="<c:url value="/external/assets/js/chartist.min.js"/>"></script>

<!--  Notifications Plugin    -->
<script src="<c:url value="/external/assets/js/bootstrap-notify.js"/>"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script
	src="<c:url value="/external/assets/js/light-bootstrap-dashboard.js"/>"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="<c:url value="/external/assets/js/demo.js"/>"></script>
<script type="text/javascript">
    	$(document).ready(function(){
			
    		var msg = $('#mesg').val();
    		var ermsg = $('#errmesg').val();
        	demo.initChartist();
			if(msg != null && msg !=''){
				$.notify({
	            	icon: 'pe-7s-info',
	            	message: msg

	            },{
	                type: 'info',
	                timer: 4000
	            });
			}else if(ermsg != null && ermsg !=''){
				$.notify({
	            	icon: 'pe-7s-info',
	            	message: ermsg

	            },{
	                type: 'danger',
	                timer: 4000
	            });
			}
        	

    	});
	</script>

</html>
