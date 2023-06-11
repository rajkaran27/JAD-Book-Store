<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<h1>Admin Page</h1>

		<div class="card my-4">
			<div class="card-header">Add Book</div>
			<div class="card-body">
				<form action="AddBookServlet" method="POST">
					<div class="mb-3">
						<label for="imageLink" class="form-label">Image Link</label> <input
							type="text" class="form-control" id="imageLink" name="imageLink"
							placeholder="Enter image link">
					</div>

					<div class="mb-3">
						<label for="description" class="form-label">Description</label>
						<textarea class="form-control" id="description" name="description"
							rows="3" placeholder="Enter description"></textarea>
					</div>

					<div class="row mb-3">
						<div class="col">
							<label for="price" class="form-label">Price</label> <input
								type="number" class="form-control" id="price" name="price"
								placeholder="Enter price">
						</div>
						<div class="col">
							<label for="isbn" class="form-label">ISBN</label> <input
								type="text" class="form-control" id="isbn" name="isbn"
								placeholder="Enter ISBN">
						</div>
					</div>

					<div class="row mb-3">
						<div class="col">
							<label for="quantity" class="form-label">Quantity</label> <input
								type="number" class="form-control" id="quantity" name="quantity"
								placeholder="Enter quantity">
						</div>
						<div class="col">
							<label for="rating" class="form-label">Rating</label> <input
								type="number" class="form-control" id="rating" name="rating"
								placeholder="Enter rating">
						</div>
					</div>

					<div class="mb-3">
						<label for="publicationDate" class="form-label">Publication
							Date</label> <input type="date" class="form-control" id="publicationDate"
							name="publicationDate">
					</div>

					<div class="mb-3">
						<label for="category" class="form-label">Category</label> <select
							class="form-select" id="category" name="category">
							<option value="" selected disabled>Select category</option>
							<!-- Add dynamically generated category options here -->
						</select>
					</div>

					<div class="mb-3">
						<label for="author" class="form-label">Author</label> <select
							class="form-select" id="author" name="author">
							<option value="" selected disabled>Select author</option>
							<!-- Add dynamically generated author options here -->
						</select>
					</div>

					<div class="mb-3">
						<label for="publisher" class="form-label">Publisher</label> <select
							class="form-select" id="publisher" name="publisher">
							<option value="" selected disabled>Select publisher</option>
							<!-- Add dynamically generated publisher options here -->
						</select>
					</div>

					<button type="submit" class="btn btn-primary">Add Book</button>
				</form>
			</div>
		</div>

		<!-- Book List -->
		<div>
			<h2>Book List</h2>
			<table class="table">
				<thead>
					<tr>
						<th>Title</th>
						<th>Author</th>
						<th>Price</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<!-- Loop through each book record from the database and display them in rows -->
					<!-- Each row should include the book details and buttons for updating and deleting -->
					<!-- Example row (replace with dynamic data from the database): -->
					<%
					try {
						// Step 1: Load JDBC Driver
						Class.forName("com.mysql.cj.jdbc.Driver");

						// Step 2: Define Connection URL
						String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

						// Step 3: Establish connection to URL
						Connection conn = DriverManager.getConnection(connURL);

						// Step 4: Create Statement object
						Statement stmt = conn.createStatement();

						// Step 5: Execute SQL Command
						String sqlStr = "SELECT * FROM books;";
						ResultSet rs = stmt.executeQuery(sqlStr);

						// Step 6: Process Result
						while (rs.next()) {
							String title = rs.getString("title");
							double price = rs.getDouble("price");
					%>
					<tr>
						<!-- <td><img src="book-image.jpg" alt="Book Image" width="50"></td> -->
						<td><%=title %></td>
						<td>Author Name</td>
						<td><%=price %></td>
						<td>
							<!-- Button for updating the book -->
							<button class="btn btn-primary btn-sm update-button">Update</button>
							<!-- Button for deleting the book -->
							<button class="btn btn-danger btn-sm delete-button">Delete</button>
						</td>
					</tr>
					<%
					}

					// Step 7: Close connection
					conn.close();
					} catch (Exception e) {
					out.println("Error :" + e);
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	</div>
	<%-- <%@ include file="footer.jsp"%> --%>
</body>
</html>