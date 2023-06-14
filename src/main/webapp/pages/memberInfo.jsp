<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<style>
table.table {
	color: #FDF4E3; /* Set the text color */
	width: 100%;
	border-collapse: collapse;
}

table.table th {
	background-color: #212529;
	color: #FDF4E3;
	padding: 10px;
}

table.table td {
	background-color: #343A40;
	color: #FDF4E3;
	padding: 10px;
}

table.table a.btn {
	color: #FDF4E3;
}

table.table a.btn:hover {
	color: #FDF4E3;
}

h2 {
	color: #FDF4E3;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<%
	if (userRole != null) {
		if (userRole.equals("owner")) {
	%>


	<div class="container">
		<h1>Registered Member's Information</h1>

		<div class="card my-4" style="background-color: #0C243C;">
			<div class="card-header">Add Member</div>
			<div class="card-body">
				<form action="<%=request.getContextPath()%>/AddBookServlet"
					method="POST">

					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							class="form-control" id="email" name="email"
							placeholder="Enter email" type="email"></input>
					</div>

					<div class="mb-3">
						<label for="username" class="form-label">Username</label> <input
							class="form-control" id="username" name="username"
							placeholder="Enter username" type="text"></input>
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							class="form-control" id="password" name="password"
							placeholder="Enter password" type="password"></input>
					</div>

					<button type="submit" class="btn btn-primary">Add Member</button>
				</form>
			</div>
		</div>


		<div>
			<h2>Modify Existing Members</h2>
			<table class="table">
				<thead>
					<tr>
						<th>Email</th>
						<th>Username</th>
						<th>Password</th>
						<th>Options</th>
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

						// Step 4: Create Statement object
						Statement stmt = conn.createStatement();

						// Step 5: Execute SQL Command
						String sqlStr = "SELECT member_id, email, username, password FROM members;";
						ResultSet rs = stmt.executeQuery(sqlStr);

						// Step 6: Process Result
						while (rs.next()) {
							String email = rs.getString("email");
							String username = rs.getString("username");
							String password = rs.getString("password");
							int memberId = rs.getInt("member_id");
					%>
					<tr>
						<td><%=email%></td>
						<td><%=username%></td>
						<td><%=password%></td>
						<td><a class="btn btn-primary btn-sm update-button"
							href="updateMember.jsp?memberId=<%=memberId%>">Update</a> <a
							class="btn btn-danger btn-sm delete-button">Delete</a></td>
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