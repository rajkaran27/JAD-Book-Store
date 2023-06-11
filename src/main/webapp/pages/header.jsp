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

/* category navbar */
.navbar-dropdown {
	display: none; /* Hide the dropdown by default */
}

.navbar-item:hover .navbar-dropdown {
	display: block; /* Show the dropdown on hover */
}

.navbar-dropdown-list {
	list-style-type: none; /* Remove the bullet points */
	padding: 0; /* Remove default padding */
}

.navbar-dropdown-list a {
	display: block; /* Make each option a block element */
	padding: 8px 16px; /* Add padding for better spacing */
	text-decoration: none; /* Remove underline */
	color: #333; /* Set the text color */
}

.navbar-dropdown-list a:hover {
	background-color: #f5f5f5; /* Add background color on hover */
}

/* space out the headings */
.navbar-nav .nav-item {
	margin-right: 10px;
	/* Adjust the margin value to create spacing between options */
}

.navbar-item.has-dropdown .navbar-dropdown {
	position: absolute;
	display: none; /* Hide the dropdown by default */
}

.navbar-item.has-dropdown:hover .navbar-dropdown {
	display: block; /* Show the dropdown on hover */
}

/* change navbar dropdown color */
.navbar-dropdown {
	display: none;
	background-color: #e0e0e0; /* Add white background color */
}
</style>
</head>
<body>

	<%
	String userRole = (String) session.getAttribute("sessUserRole");
	String loginStatus = (String) session.getAttribute("loginStatus");
	%>

	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-white">
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

						<!-- Fiction -->
						<li class="navbar-item has-dropdown is-hoverable"><a
							class="nav-link" href="/categories/m/fiction">Fiction</a>
							<div class="navbar-dropdown">
								<div class="navbar-dropdown-list">
									<a href="/categories/m/fiction/romance"><span>Romance</span></a>
									<a href="/categories/m/fiction/comics-graphic-novels"><span>Comics
											&amp; Graphic Novels</span></a> <a
										href="/categories/m/fiction/historical-fiction"><span>Historical
											Fiction</span></a> <a href="/categories/m/fiction/horror"><span>Horror</span></a>
									<a href="/categories/m/fiction/literature-fiction"><span>Literature
											&amp; Fiction</span></a> <a href="/categories/m/fiction/manga"><span>Manga</span></a>
									<a href="/categories/m/fiction/mystery-thrillers-true-crime"><span>Mystery,
											Thrillers, &amp; Crime</span></a> <a href="/categories/m/fiction/poetry"><span>Poetry</span></a>
									<a href="/categories/m/fiction/science-fiction"><span>Science
											Fiction</span></a> <a href="/categories/m/fiction/fantasy"><span>Fantasy</span></a>
									<a href="/categories/m/fiction/lgbtq-fiction"><span>LGBTQ+
											Fiction</span></a> <a href="/categories/m/fiction/spanish-language"><span>En
											Español</span></a>
								</div>
							</div></li>

						<!-- Non Fiction -->
						<li class="navbar-item has-dropdown is-hoverable"><a class="nav-link"
							href="/categories/m/nonfiction">Nonfiction</a>
							<div class="navbar-dropdown">
								<div class="navbar-dropdown-list">
									<a href="/categories/m/nonfiction/arts-photography"><span>Arts
											&amp; Photography</span></a> <a
										href="/categories/m/nonfiction/biography-memoir"><span>Biography
											&amp; Memoir</span></a> <a
										href="/categories/m/nonfiction/business-investing"><span>Business
											&amp; Investing </span></a> <a
										href="/categories/m/nonfiction/cooking-wine"><span>Cooking
											&amp; Wine</span></a> <a href="/categories/m/nonfiction/history"><span>History</span></a>

									<a href="/categories/m/nonfiction/humor-games"><span>Humor
											&amp; Games</span></a> <a
										href="/categories/m/nonfiction/science-technology"><span>Science
											&amp; Technology</span></a> <a
										href="/categories/m/nonfiction/self-development-hobbies"><span>Self
											Development &amp; Hobbies</span></a> <a
										href="/categories/m/nonfiction/spirituality-and-religion"><span>Spirituality
											&amp; Religion</span></a> <a href="/categories/m/nonfiction/travel"><span>Travel</span></a>
									<a href="/categories/m/nonfiction/lgbtq-nonfiction"><span>LGBTQ+
											Nonfiction</span></a>
								</div>
							</div></li>
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
							onClick="window.location.href='logoutFunction.jsp'">Logout</button>
					</form>
				</div>
				<%
				} else if (userRole.equals("admin")) {
				%>
				<div class="d-flex">
					<a class="nav-link" href="#">edit</a>
					<form class="d-flex">
						<button class="btn btn-outline-primary me-2" type="button"
							onClick="window.location.href='logoutFunction.jsp'">Logout</button>
					</form>
				</div>
				<%
				} else if (userRole.equals("owner")) {
				%>
				<div class="d-flex">
					<a class="nav-link" href="#">edit</a>
					<form class="d-flex">
						<button class="btn btn-outline-primary me-2" type="button"
							onClick="window.location.href='logoutFunction.jsp'">Logout</button>
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
