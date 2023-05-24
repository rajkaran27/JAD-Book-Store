<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Kitty Reads</title>
<link rel="stylesheet" type="text/css" href="../styles/index.css">

</head>

<body>
	<%@ include file="header.jsp"%>
	<%@page import="java.sql.*"%>

	<%
	// Retrieve search results from session
	String searchResults = (String) session.getAttribute("searchResults");

	// Clear the search results from the session
	session.removeAttribute("searchResults");
	%>

	<div class="container text-center mt-3">
		<img src="../assets/fulllogo.png" alt="Logo" class="img-fluid">
	</div>

	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6">
				<form action="search.jsp" method="GET" class="input-group">
					<input type="text" class="form-control form-control-lg"
						placeholder="Search by author or title" name="search">
					<div class="input-group-append">
						<button class="btn btn-primary btn-lg" type="submit">Search</button>
					</div>
				</form>
				<%-- <form action="<%=request.getContextPath()%>/SearchServlet"
					method="GET" class="input-group">
					<input type="text" class="form-control form-control-lg"
						placeholder="Search by author or title" name="search">
					<div class="input-group-append">
						<button class="btn btn-primary btn-lg" type="submit">Search</button>
					</div>
				</form> --%>
			</div>
		</div>
	</div>

	<%
	if (searchResults != null) {
	%>
	<div class="container mt-5" id="bookDisplay">
		<div class="row">
			<%=searchResults%>
		</div>
	</div>
	<%
	}
	%>

	<%-- 	<div class="container" id="searchResults">
		<ul>${searchResults}
		</ul>

	</div> --%>


	<%-- <!-- <div class="container">
		<div class="row">
			<%
			try {
				// Step1: Load JDBC Driver – TO BE OMITTED for newer drivers
				Class.forName("com.mysql.jdbc.Driver");
				// Step 2: Define Connection URL
				String connURL = "jdbc:mysql://localhost/bk1?user=root&password=Rajkaran27!&serverTimezone=UTC";
				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);

				// Step 4: Create Statement object
				Statement stmt = conn.createStatement();

				//Step 5: Execute SQL Command
				String sqlStr = "SELECT * FROM books";
				ResultSet rs = stmt.executeQuery(sqlStr);

				// Step 6: Process Result
				while (rs.next()) {
					String title = rs.getString("title");
					String href = rs.getString("image");
					double price = rs.getDouble("price");
			%>
			<div class="col-md-4">
				<div class="card">
					<img src=<%=href%> class="card-img-top" alt="Book Image">
					<div class="card-body">
						<h5 class="card-title"><%=title%></h5>
						<p class="card-text"><%=price%></p>
					</div>
				</div>
			</div>
	}

// Step 7: Close connection
conn.close();
} catch (Exception e) {
out.println("Error :" + e);
}
			%>
		</div>

	</div> --> --%>

	<%@ include file="footer.jsp"%>
</body>

</html>