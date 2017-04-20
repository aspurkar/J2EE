<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/cs6320/dashboard">Supercell</a>
		</div>
		<c:if test="${sessionScope.user != null}">
		<!--  
			<ul class="nav navbar-nav">
				<li class="active"><a href="/cs6320/dashboard">Home</a></li>
				<li><form action="inbox" method="POST">
						<input type="hidden" name="sender" value=${sessionScope.user.email }> 
							<input type="submit" value="Mail">
					</form></li>
				<li><a href="#">Page 2</a></li>
				<li><a href="#">Page 3</a></li>
			</ul>
			-->
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/cs6320/logout">Logout</a></li>


			</ul>

		</c:if>
	</div>
</nav>