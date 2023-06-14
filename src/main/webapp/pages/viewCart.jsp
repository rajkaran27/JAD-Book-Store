<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="header.jsp"%>
<%
if (userRole != null) {
	if (userRole.equals("member")) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
	



	<div class="container mt-5">
		<h1>Shopping Cart</h1>
		<div class="row">
			<div class="col-md-8">

				<%
				// Declare bookQuantities map outside the try block
				Map<Integer, Integer> bookQuantities = new HashMap<>();

				double totalCost = 0;
				String user = (String) session.getAttribute("sessUserRole");
				ArrayList<Integer> bookList = (ArrayList<Integer>) session.getAttribute("bookList");

				if (bookList != null && user != null && user.equals("member")) {
					try {
						// Step 1: Load JDBC Driver
						Class.forName("com.mysql.cj.jdbc.Driver");

						// Step 2: Define Connection URL
						String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

						// Step 3: Establish connection to URL
						Connection conn = DriverManager.getConnection(connURL);

						// Step 4: Create PreparedStatement object
						String sqlStr = "SELECT * FROM books WHERE book_id=?";
						PreparedStatement pstmt = conn.prepareStatement(sqlStr);

						// Step 5: Process each book in the list and update bookQuantities
						for (int i = 0; i < bookList.size(); i++) {
					int bookId = bookList.get(i);

					// Set parameter values for placeholders
					pstmt.setInt(1, bookId);

					// Step 6: Execute SQL query
					ResultSet rs = pstmt.executeQuery();

					// Step 7: Process Result
					if (rs.next()) {
						String title = rs.getString("title");
						String src = rs.getString("image");
						double price = rs.getDouble("price");
						totalCost += price;

						// Update book quantities
						if (bookQuantities.containsKey(bookId)) {
							int quantity = bookQuantities.get(bookId);
							bookQuantities.put(bookId, quantity + 1);
						} else {
							bookQuantities.put(bookId, 1);
						}
				%>
				<!-- Display the book information only if it's the first occurrence -->
				<div class="row mb-3">
					<div class="col-md-3">
						<img src="<%=src%>" class="img-fluid">
					</div>
					<div class="col-md-4">
						<h4><%=title%></h4>
					</div>
					<div class="col-md-2">
						<p>
							Price: $<%=price%></p>
					</div>
					<div class="col-md-3">
						<form action="RemoveFromCartServlet" method="POST">
							<input type="hidden" name="bookId" value="<%=bookId%>">
							<button type="submit" class="btn btn-danger">Delete</button>
						</form>
					</div>
				</div>
				<%
				}
				}

				// Close connection
				conn.close();
				} catch (Exception e) {
				e.printStackTrace();
				out.println("Error: " + e);
				}
				} else {
				response.sendRedirect("login.jsp");
				}

				// Calculate the total number of books
				int totalBooks = 0;
				for (int quantity : bookQuantities.values()) {
				totalBooks += quantity;
				}
				%>
			</div>
			<div class="col-md-4">
				<div class="text-right">
					<h3>Cart Summary</h3>
					<p>
						Total Books:
						<%=totalBooks%></p>
					<p>
						Total Cost: $<%=totalCost%></p>
					<button type="submit" class="btn btn-primary">Proceed to
						Payment</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>



</body>
</html>
<%
} else {
response.sendRedirect("login.jsp?errCode=accessDenied");
}
} else {
response.sendRedirect("login.jsp?errCode=accessDenied");
}
%>
