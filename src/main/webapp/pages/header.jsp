<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
.logo-img {
	max-width: 250px; /* Set the maximum width for the logo image */
}
</style>
</head>
<body>
	<%
	String userRole = (String) session.getAttribute("sessUserRole");
	%>

	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
					aria-controls="navbarExample01" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarExample01">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link"
							aria-current="page" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="category.jsp">Category</a></li>
					</ul>
				</div>
				<%
				if (userRole != null) {
					if (userRole.equals("member")) {
				%>
				<div class="d-flex">
					<a class="nav-link" href="#" id="userCart">Cart</a>
					<form class="d-flex">
						<button class="btn btn-outline-primary me-2" type="button"
							onClick="window.location.href='logout.jsp'">Logout</button>
					</form>
				</div>
				<%
				} else if (userRole.equals("admin")) {
				%>
				<div class="d-flex">
					<a class="nav-link" href="#">edit</a>
					<form class="d-flex">
						<button class="btn btn-outline-primary me-2" type="button"
							onClick="window.location.href='logout.jsp'">Logout</button>
					</form>
				</div>
				<%
				} else if (userRole.equals("owner")) {
				%>
				<div class="d-flex">
					<a class="nav-link" href="#">edit</a>
					<form class="d-flex">
						<button class="btn btn-outline-primary me-2" type="button"
							onClick="window.location.href='logout.jsp'">Logout</button>
					</form>
				</div>
				<%
				}
				} else {
				%>
				<div class="d-flex">
					<form class="d-flex">
						<button class="btn btn-outline-primary me-2" type="button"
							onClick="window.location.href='login.jsp'">Login</button>
					</form>
				</div>
				<%
				}
				%>

			</div>
		</nav>

	</header>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
