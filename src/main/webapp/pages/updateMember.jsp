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

		<div class="container mt-4">
			<h1>Update Member</h1>
			<form method="POST"
				action="<%=request.getContextPath()%>/UpdateMemberServlet">

				<div class="mb-3">
					<label for="title" class="form-label">Title of Book</label> <input
						type="text" class="form-control" id="title"
						placeholder="Enter title" value="<%=title%>">
				</div>

				<div class="d-flex justify-content-end">
					<input type="hidden" name="memberId" value="<%=memberId%>">
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