<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/headerFooter.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/main.css">
<style>
.logo-img {
	max-width: 250px; /* Set the maximum width for the logo image */
}

/* category navbar */
.navbar-dropdown {
	display: none; /* Hide the dropdown by default */
	position: absolute; /* Position the dropdown absolutely */
	background-color: #e0e0e0; /* Add white background color */
	z-index: 1;
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
</style>
</head>
<body>

	<%
	String userRole = (String) session.getAttribute("sessUserRole");
	String loginStatus = (String) session.getAttribute("loginStatus");
	String genre = "";
	/* catID */
	int genre_id = 0;
	try {
		// Step 1: Load JDBC Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create PreparedStatement object

		String sqlStr = "SELECT * FROM bookstore.categories;";

		PreparedStatement pstmt = conn.prepareStatement(sqlStr);

		// Step 5: Execute SQL query
		ResultSet rs = pstmt.executeQuery();

		// Step 6: Process Result
		while (rs.next()) {
			String categoryName = rs.getString("category_name");
			String genreSqlStr = "SELECT category_id FROM categories WHERE category_name = ?;";
			PreparedStatement genrePstmt = conn.prepareStatement(genreSqlStr);
			genrePstmt.setString(1, categoryName.toUpperCase());
			ResultSet genreRs = genrePstmt.executeQuery();

			//  Retrieve genre name
			if (genreRs.next()) {
		genre_id = genreRs.getInt("category_id");
			}
			genre += "<a href=\"catDetails.jsp?catId=" + genre_id + "\">" + "<span>" + categoryName + "</span></a>";
		}

		// Close connection
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.println("Error: " + e);
	}
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

						<!-- Categories -->
						<li class="navbar-item has-dropdown is-hoverable"><a
							class="nav-link" href="category.jsp">Genre</a>
							<div class="navbar-dropdown">
								<div class="navbar-dropdown-list">
									<%=genre%>
								</div>
							</div></li>
					</ul>
				</div>
				<%
				if (userRole != null) {
					if (userRole.equals("member")) {
				%>
				<div class="d-flex">
					<a class="nav-link" href="viewCart.jsp" id="userCart">Cart</a>
					<form class="d-flex">
						<button class="btn btn-outline-primary me-2" type="button"
							onClick="window.location.href='logoutFunction.jsp'">Logout</button>
					</form>
				</div>
				<%
				} else if (userRole.equals("owner")) {
				%>

				<div class="d-flex">
					<a class="btn" href="#">Member Management</a> <a class="btn"
						href="adminActions.jsp">BookShelf</a>
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
