<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kitty Reads</title>
<link rel="stylesheet" type="text/css" href="../styles/index.css">

</head>
<body>
	<%@ include file="header.jsp"%>
	<%@page import="java.sql.*"%>

	<div class="container">
		<div class="row">
			<%
			try {
				// Step1: Load JDBC Driver – TO BE OMITTED for newer drivers
				Class.forName("com.mysql.jdbc.Driver");
				// Step 2: Define Connection URL
				String connURL = "jdbc:mysql://localhost/db1?user=root&password=Rajkaran27!&serverTimezone=UTC";
				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);

				// Step 4: Create Statement object
				Statement stmt = conn.createStatement();

				//Step 5: Execute SQL Command
				String sqlStr = "SELECT * FROM categories";
				ResultSet rs = stmt.executeQuery(sqlStr);

				// Step 6: Process Result
				while (rs.next()) {
					String category = rs.getString("name");
			%>




			<%
			}

			// Step 7: Close connection
			conn.close();
			} catch (Exception e) {
			out.println("Error :" + e);
			}
			%>
		</div>

	</div>



	<div class="container">
		<div class="row">
			<%
			try {
				// Step1: Load JDBC Driver – TO BE OMITTED for newer drivers
				Class.forName("com.mysql.jdbc.Driver");
				// Step 2: Define Connection URL
				String connURL = "jdbc:mysql://localhost/bk1?user=root&password=Rajkaran27!&serverTimezone=UTC";
				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);

				// Step 4: Create Statement object
				Statement stmt = conn.createStatement();

				//Step 5: Execute SQL Command
				String sqlStr = "SELECT * FROM books";
				ResultSet rs = stmt.executeQuery(sqlStr);

				// Step 6: Process Result
				while (rs.next()) {
					String title = rs.getString("title");
					String href = rs.getString("image");
					double price = rs.getDouble("price");
			%>
			<div class="col-md-4">
				<div class="card">
					<img src=<%=href%> class="card-img-top" alt="Book Image">
					<div class="card-body">
						<h5 class="card-title"><%=title%></h5>
						<p class="card-text"><%=price%></p>
					</div>
				</div>
			</div>
			<%
			}

			// Step 7: Close connection
			conn.close();
			} catch (Exception e) {
			out.println("Error :" + e);
			}
			%>
		</div>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>