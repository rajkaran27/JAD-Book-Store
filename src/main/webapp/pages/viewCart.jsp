<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<%
				double totalCost = 0;
				String title = "";
				String src = "";
				double price = 0;

				String user = (String) session.getAttribute("sessUserRole");
				ArrayList<Integer> bookList = (ArrayList<Integer>) session.getAttribute("bookList");
				if (bookList != null) {

					if (user != null) {
						if (user.equals("member")) {
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

						// Step 5: Process each book in the list
						for (int i = 0; i < bookList.size(); i++) {
							int bookId = bookList.get(i);

							// Set parameter values for placeholders
							pstmt.setInt(1, bookId);

							// Step 6: Execute SQL query
							ResultSet rs = pstmt.executeQuery();

							// Step 7: Process Result
							while (rs.next()) {

								title = rs.getString("title");
								src = rs.getString("image");
								price = rs.getDouble("price");
								totalCost += rs.getDouble("price");
				%>
				<div class="row">
					<div class="m-2">
						<div class="row">
							<div class="col-md-3">
								<img src=<%=src%> class="img-fluid">
							</div>
							<div class="col-md-4"><%=title%></div>
							<div class="col-md-2"><%=price%></div>
							<div class="col-md-3">
								<form action="RemoveFromCartServlet" method="POST">
									<input type="hidden" name="bookId" value="<%=bookId%>">
									<button type="submit" class="btn btn-danger">Delete</button>
								</form>
							</div>
						</div>
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
				}
				} else {
				response.sendRedirect("login.jsp");
				}
				} else {
				out.print("<h1>Keep Shopping</h1>");
				}
				%>
			</div>
			<div class="col-md-4">
				S$
				<%=totalCost%>


			</div>
		</div>
	</div>



	<%@ include file="footer.jsp"%>
</body>
</html>