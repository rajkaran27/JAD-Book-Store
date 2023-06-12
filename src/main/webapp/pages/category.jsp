<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kitty Reads Category</title>
<link rel="stylesheet" type="text/css" href="../styles/index.css">
<style>
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
			String src = rs.getString("image");
			int catId = rs.getInt("category_id");

			htmlBuilder.append("<div class='col-md-4'>");
			htmlBuilder.append("<div class='card' style='border-radius: 15px;'>");
			htmlBuilder.append(
			"<div class='bg-image hover-overlay ripple ripple-surface ripple-surface-light' data-mdb-ripple-color='light'>");
			htmlBuilder.append("<img src='").append(src).append(
			"' style='border-top-left-radius: 15px; border-top-right-radius: 15px;' class='img-fluid' alt='Book Image' />");
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
			htmlBuilder.append("<a href='bookDetails.jsp?bookId=").append(catId)
			.append("' class='btn btn-primary'>Details</a>");
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

</body>
</html>