<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%
String userRole = (String) session.getAttribute("sessUserRole");

if (userRole != null) {
	if (userRole.equals("member")) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
</head>
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

table tbody td, table thead th {
	color: white;
}

.card-body p, .card-body h4, .card-footer p {
	color: #0C243C;
}
</style>
<body>
	<%@ include file="header.jsp"%>

	<%
	double totalCost = 0;
	ArrayList<Integer> cartItems = new ArrayList<>();
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("shoppingCart")) {
		String cartValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
		String[] cartItemsStr = cartValue.split(",");
		for (String bookId : cartItemsStr) {
			cartItems.add(Integer.parseInt(bookId));
		}
		break;
			}
		}
	}
	if (cartItems != null) {
	%>
	<div class="container h-100 py-5">
		<h1 class="mb-5">Shopping Cart</h1>
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-lg-8 col-xl-9">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col" class="h5">Books</th>
								<th scope="col">Category</th>
								<th scope="col">Price</th>
								<th scope="col">Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							try {
								// Step 1: Load JDBC Driver
								Class.forName("com.mysql.cj.jdbc.Driver");

								// Step 2: Define Connection URL
								String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

								// Step 3: Establish connection to URL
								Connection conn = DriverManager.getConnection(connURL);

								// Step 4: Create PreparedStatement object
								String sqlStr = "SELECT books.*, authors.author_name,categories.category_name FROM books JOIN authors ON books.author_id=authors.author_id JOIN categories ON books.category_id=categories.category_id WHERE book_id=?;";
								PreparedStatement pstmt = conn.prepareStatement(sqlStr);

								for (Integer bookId : cartItems) {
									pstmt.setInt(1, bookId);

									// Step 6: Execute SQL query
									ResultSet rs = pstmt.executeQuery();

									// Step 7: Process Result
									while (rs.next()) {
								String title = rs.getString("title");
								String src = rs.getString("image");
								String author = rs.getString("author_name");
								String category = rs.getString("category_name");
								double price = rs.getDouble("price");
								totalCost += price;
							%>
							<tr>

								<th scope="row">
									<div class="d-flex align-items-center">
										<img src="<%=src%>" class="img-fluid rounded-3"
											style="width: 120px;" alt="Book">
										<div class="flex-column ms-4">
											<p class="mb-2" style="color: #FDF4E3;"><%=title%></p>
											<p class="mb-0" style="color: #FDF4E3;"><%=author%></p>
										</div>
									</div>
								</th>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500;"><%=category%></p>
								</td>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500;">
										$<%=price%></p>
								</td>
								<td class="align-middle"><a
									class="btn btn-danger btn-sm delete-button"
									onclick="confirmDelete(<%=bookId%>)">Delete</a></td>
							</tr>
							<%
							} //end of rs.next()

							} //end of for loop
							conn.close();
							} catch (Exception e) {
							e.printStackTrace();
							out.println("Error: " + e);
							}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-lg-4 col-xl-3">
				<%
				//get total number of books
				int totalBooks = cartItems.size();
				%>
				<div class="card">
					<div class="card-body">
						<div class="d-flex justify-content-between"
							style="font-weight: 500;">
							<p class="mb-2">Total Books:</p>
							<p class="mb-2"><%=totalBooks %></p>
						</div>
						<hr class="my-4">
						<div class="d-flex justify-content-between mb-4"
							style="font-weight: 500;">
							<p class="mb-2">Total Cost:</p>
							<p class="mb-2">$<%=totalCost %></p>
						</div>
						<button type="button" class="btn btn-primary btn-block btn-lg ">
							<div class="d-flex justify-content-end">
								<span>Checkout</span>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	} //if statement if booklist is null
	/* else {
	out.println("empty");
	} */
	%>

	<%-- <div class="container h-100 py-5">
		<h1 class="mb-5">Shopping Cart</h1>
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-lg-8 col-xl-9">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col" class="h5">Books</th>
								<th scope="col">Category</th>
								<th scope="col">Price</th>
								<th scope="col">Status</th>
							</tr>
						</thead>
						<tbody>
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
							<tr>

								<th scope="row">
									<div class="d-flex align-items-center">
										<img src="<%=src%>" class="img-fluid rounded-3"
											style="width: 120px;" alt="Book">
										<div class="flex-column ms-4">
											<p class="mb-2"><%=title%></p>
											<p class="mb-0">Daniel Kahneman</p>
										</div>
									</div>
								</th>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500;">Digital</p>
								</td>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500;">
										$<%=price%></p>
								</td>
								<td class="align-middle"><a
									class="btn btn-danger btn-sm delete-button"
									onclick="confirmDelete(<%=bookId%>)">Delete</a></td>
							</tr>
							<%
							}
							}

							// Close connection
							conn.close();
							} catch (Exception e) {
							e.printStackTrace();
							out.println("Error: " + e);
							}
							} else if (bookList == null) {
							%>

							<%
							} else {
							response.sendRedirect("login.jsp");
							}
							%>

						</tbody>
					</table>
				</div>
			</div>

			<div class="col-lg-4 col-xl-3">
				<%
				// Calculate the total number of books
				int totalBooks = 0;
				for (int quantity : bookQuantities.values()) {
					totalBooks += quantity;
				}
				%>
				<div class="card">
					<div class="card-body">
						<div class="d-flex justify-content-between"
							style="font-weight: 500;">
							<p class="mb-2">Total Books:</p>
							<p class="mb-2"><%=totalBooks%></p>
						</div>
						<hr class="my-4">
						<div class="d-flex justify-content-between mb-4"
							style="font-weight: 500;">
							<p class="mb-2">Total Cost:</p>
							<p class="mb-2">
								$<%=totalCost%></p>
						</div>
						<button type="button" class="btn btn-primary btn-block btn-lg ">
							<div class="d-flex justify-content-end">
								<span>Checkout</span>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
 --%>
	<script>
		function confirmDelete(bookId) {
		  if (confirm("Are you sure you want to delete this item?")) {
		    window.location.href = "<%=request.getContextPath()%>/RemoveFromCartServlet?bookId=" + bookId;
		  }
		}
	</script>
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
