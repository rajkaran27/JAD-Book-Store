<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kitty Reads Category</title>
<style>
.card {
	width: 400px; /* Set the desired width */
	margin-bottom: 2rem; /* Adjust the margin between cards */
	background-color: #144367;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@page import="java.sql.*"%>

	<%
	try {
		StringBuilder htmlBuilder = new StringBuilder();

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
			String category = rs.getString("category_name");
			int catId = rs.getInt("category_id");

			htmlBuilder.append("<div class='col-md-4'>");
			htmlBuilder.append("<div class='card' style='border-radius: 15px;background-color: #144367;'>");
			htmlBuilder.append(
			"<div class='bg-image hover-overlay ripple ripple-surface ripple-surface-light' data-mdb-ripple-color='light'>");
			htmlBuilder.append("<a href='#!'>");
			htmlBuilder.append("<div class='mask'></div>");
			htmlBuilder.append("</a>");
			htmlBuilder.append("</div>");
			htmlBuilder.append("<div class='card-body pb-0'>");
			htmlBuilder.append("<div class='d-flex justify-content-between'>");
			htmlBuilder.append("<div>");
			htmlBuilder.append("<h5 class='card-title'>").append(category).append("</h5>");
			htmlBuilder.append("</div>");
			htmlBuilder.append("</div>");
			htmlBuilder.append("</div>");
			htmlBuilder.append("<div class='card-body'>");
			htmlBuilder.append("<div class='d-flex justify-content-between align-items-end pb-2 mb-1'>");
			htmlBuilder.append("<a href='#!' class='text-dark fw-bold'></a>");
			htmlBuilder.append("<a href='catDetails.jsp?catId=").append(catId).append("' class='btn btn-primary'>")
			.append(category).append("</a>");
			htmlBuilder.append("</div>");
			htmlBuilder.append("</div>");
			htmlBuilder.append("</div>");
			htmlBuilder.append("</div>");
		}

		session.setAttribute("searchResults", htmlBuilder.toString());

		// Close connection
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.println("Error: " + e);
	}
	%>

	<div class="container text-center mt-3">
		<img src="${pageContext.request.contextPath}/assets/brandLogo.png"
			alt="Paws" class="img-fluid">
	</div>
	<%
	// Retrieve search results from session
	String searchResults = (String) session.getAttribute("searchResults");

	// Clear the search results from the session
	session.removeAttribute("searchResults");
	%>
	<div class="container mt-5" id="bookDisplay">
		<div class="row">
			<%=searchResults%>
		</div>
	</div>
</body>
</html>