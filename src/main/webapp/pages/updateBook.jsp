<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Book</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	String strbookId = request.getParameter("bookId");
	int book_id = Integer.parseInt(strbookId);

	String title = "";
	String src = "";
	String desc = "";
	double price = 0;
	int bookId = 0;
	int rating = 0;
	int quantity = 0;

	if (userRole != null) {
		if (userRole.equals("owner")) {
			try {

		// Step 1: Load JDBC Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create PreparedStatement object
		String sqlStr = "SELECT books.*, authors.author_name FROM books INNER JOIN authors ON books.author_id = authors.author_id WHERE books.book_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);

		// Set parameter values for placeholders
		pstmt.setInt(1, book_id);

		// Step 5: Execute SQL query
		ResultSet rs = pstmt.executeQuery();

		// Step 6: Process Result
		while (rs.next()) {
			title = rs.getString("title");
			desc = rs.getString("description");
			src = rs.getString("image");
			price = rs.getDouble("price");
			bookId = rs.getInt("book_id");
			rating = rs.getInt("rating");
			quantity = rs.getInt("quantity");

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
			<div class="col-md-4">
				<div class="card">
					<img src="<%=src%>" class="card-img-top" alt="Book Image">
				</div>
			</div>
			<div class="col-md-8">
				<h2><%=title%></h2>
				<p>
					Rating:
					<%=rating%>/5
				</p>
				<p><%=desc%></p>
				<p>
					Price: S$<%=price%></p>
			</div>
		</div>

		<div class="container mt-4">
			<h1>Update Book</h1>
			<form method="POST"
				action="<%=request.getContextPath()%>/UpdateBookServlet">
				<div class="mb-3">
					<label for="imageLink" class="form-label">Image Link</label> <input
						type="text" class="form-control" id="imageLink"
						placeholder="Enter image link" value="<%=src%>">
				</div>

				<div class="mb-3">
					<label for="title" class="form-label">Title of Book</label> <input
						type="text" class="form-control" id="title"
						placeholder="Enter title" value="<%=title%>">
				</div>

				<div class="row mb-3">
					<div class="col">
						<label for="quantity" class="form-label">Quantity</label> <input
							type="number" class="form-control" id="quantity"
							placeholder="Enter quantity" value="<%=quantity%>">
					</div>
					<div class="col">
						<label for="price" class="form-label">Price</label> <input
							type="number" step="0.01" class="form-control" id="price"
							placeholder="Enter price" value="<%=price%>">
					</div>
				</div>

				<div class="mb-3">
					<label for="rating" class="form-label">Rating</label> <input
						type="number" class="form-control" id="rating"
						placeholder="Enter rating" value="<%=rating%>">
				</div>

				<div class="mb-3">
					<label for="description" class="form-label">Description</label>
					<textarea class="form-control" id="description" rows="3"
						placeholder="Enter description" value="<%=desc%>"></textarea>
				</div>

				<div class="d-flex justify-content-end">
					<input type="hidden" name="bookId" value="<%=bookId%>">
					<button type="submit" class="btn btn-primary">Update Book</button>
				</div>
			</form>
		</div>
		<%
		} else {
		response.sendRedirect("login.jsp?errCode=accessDenied");
		}
		} else {
		response.sendRedirect("login.jsp?errCode=accessDenied");
		}
		%>

		<%@ include file="footer.jsp"%>
</body>
</html>