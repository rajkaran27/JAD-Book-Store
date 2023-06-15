<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/main.css">
<style>
body {
	/* added */
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.container {
	flex: 1;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	String genreName = "";
	String catId = request.getParameter("catId");
	int cat_id = 0;
	if (catId != null) {
		cat_id = Integer.parseInt(catId);
	} else {
		out.print("error");
	}
	try {
		StringBuilder htmlBuilder = new StringBuilder();

		// Step 1: Load JDBC Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		String genreSqlStr = "SELECT category_name FROM categories WHERE category_id = ?;";
		PreparedStatement genrePstmt = conn.prepareStatement(genreSqlStr);
		genrePstmt.setInt(1, cat_id);
		ResultSet genreRs = genrePstmt.executeQuery();

		//  Retrieve genre name
		if (genreRs.next()) {
			genreName = genreRs.getString("category_name");
		}

		// Step 4: Create PreparedStatement object
		String sqlStr = "SELECT books.*, categories.category_id FROM books JOIN categories ON books.category_id = categories.category_id WHERE categories.category_id = ?;";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		// Set parameter values for placeholders
		pstmt.setInt(1, cat_id);
		// Step 5: Execute SQL query
		ResultSet rs = pstmt.executeQuery();

		// Step 6: Process Result
		while (rs.next()) {
			String title = rs.getString("title");
			String src = rs.getString("image");
			double price = rs.getDouble("price");
			int bookId = rs.getInt("book_id");

			/* 			htmlBuilder.append("<div class='col-md-4'>");
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
				htmlBuilder.append("<h5 class='card-title'>").append(title).append("</h5>");
				htmlBuilder.append("<p class='small text-muted'>").append(price).append("</p>");
				htmlBuilder.append("</div>");
				htmlBuilder.append("</div>");
				htmlBuilder.append("</div>");
				htmlBuilder.append("<div class='card-body'>");
				htmlBuilder.append("<div class='d-flex justify-content-between align-items-end pb-2 mb-1'>");
				htmlBuilder.append("<a href='#!' class='text-dark fw-bold'></a>");
				htmlBuilder.append("<a href='bookDetails.jsp?bookId=").append(bookId)
				.append("' class='btn btn-primary'>Details</a>");
				htmlBuilder.append("</div>");
				htmlBuilder.append("</div>");
				htmlBuilder.append("</div>");
				htmlBuilder.append("</div>"); */

			htmlBuilder.append("<div class='col-md-4'>");
			htmlBuilder.append("<div class='card' style='border-radius: 15px; background-color:#144367;'>");
			htmlBuilder.append("<div class='bg-image'>");
			htmlBuilder.append("<img src='").append(src).append(
			"' style='border-top-left-radius: 15px; border-top-right-radius: 15px;' class='img-fluid' alt='Book Image' />");
			htmlBuilder.append("</div>");
			htmlBuilder.append("<div class='card-body pb-0'>");
			htmlBuilder.append("<div class='d-flex justify-content-between align-items-end pb-2 mb-1'>");
			htmlBuilder.append("<h5 class='card-title'>").append(title).append("</h5>");
			htmlBuilder.append("<div>");
			htmlBuilder.append("<a href='bookDetails.jsp?bookId=").append(bookId)
			.append("' class='btn btn-primary'>Details</a>");
			htmlBuilder.append("</div>");
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
	<%
	// Retrieve search results from session
	String searchResults = (String) session.getAttribute("searchResults");

	// Clear the search results from the session
	session.removeAttribute("searchResults");
	%>
	<div class="container mt-5" id="bookDisplay">
		<div class="container text-center mt-3">
			<h1><%=genreName%></h1>
		</div>
		<div class="row">
			<%=searchResults%>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>