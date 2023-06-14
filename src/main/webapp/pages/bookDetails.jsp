<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>

</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	String bookId = request.getParameter("bookId");
	int book_id = 0;
	if (bookId != null) {
		book_id = Integer.parseInt(bookId);
	} else {
		out.print("error");
	}

	String title = "";
	String src = "";
	String desc = "";
	String ISBN = "";
	String pubDate = "";
	String author = "";
	String publisher = "";
	String category = "";
	double price = 0;

	try {
		// Step 1: Load JDBC Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create PreparedStatement object

		String sqlStr = "SELECT books.*, categories.category_name AS category, publishers.publisher_name AS publisher, authors.author_name AS author FROM books JOIN categories ON categories.category_id=books.category_id JOIN publishers ON publishers.publisher_id = books.publisher_id JOIN authors ON authors.author_id = books.author_id WHERE books.book_id = ?";

		PreparedStatement pstmt = conn.prepareStatement(sqlStr);

		// Set parameter values for placeholders
		pstmt.setInt(1, book_id);

		// Step 5: Execute SQL query
		ResultSet rs = pstmt.executeQuery();

		// Step 6: Process Result
		while (rs.next()) {
			title = rs.getString("title");
			src = rs.getString("image");
			desc = rs.getString("description");
			ISBN = rs.getString("isbn");
			author = rs.getString("author");
			publisher = rs.getString("publisher");
			category = rs.getString("category");
			pubDate = rs.getString("publication_date");
			price = rs.getDouble("price");

		}

		// Close connection
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		out.println("Error: " + e);
	}
	%>


	<div class="container mt-4">
		<div class="row">
			<div class="col-md-3">
				<img src=<%=src%> class="img-fluid" alt="Book Image">
			</div>
			<div class="col-md-9">
				<div class="card" style="background-color:#0C243C;">
					<div class="card-body">
						<h1><%=title%></h1>
						<p>
							By:
							<%=author%></p>
						<p>
							<%=desc%></p>
						<div class="container">

							<h4>Book Details:</h4>
							<p>
								ISBN:
								<%=ISBN%></p>
							<p>
								Publisher:
								<%=publisher%></p>
							<p>
								Publication Date:
								<%=pubDate%></p>
							<p>
								Category:
								<%=category%></p>

						</div>
						<div class="d-flex justify-content-between">
							<p class="h3">
								Price(SGD):
								<%=price%></p>
							<form action="cartFunction.jsp" method="POST">
								<input type="hidden" name="bookId" value="<%=book_id%>">
								<button type="submit" class="btn btn-primary btn-sm">Add
									to Cart</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>


	<div class="container">
		<!-- <h1>You may like:</h1>
 -->
	</div>



	<%@ include file="footer.jsp"%>
</body>
</html>