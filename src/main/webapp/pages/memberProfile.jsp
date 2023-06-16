<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String userRole = (String)session.getAttribute("sessUserRole");

String strmemberId = request.getParameter("memberId");
int memberId = Integer.parseInt(strmemberId);
String email = "";
String username = "";
String password = "";
if (userRole != null) {
	if (userRole.equals("member")) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member Information</title>
</head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/adminBook.css">
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
<body>
<%@ include file="header.jsp"%>

	<div class="container">
		<div>
			<h2>My Profile</h2>
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

						// Step 4: Create PreparedStatement object
						String sqlStr = "SELECT email, username, password FROM members WHERE members.member_id=?";
						PreparedStatement pstmt = conn.prepareStatement(sqlStr);

						// Set parameter values for placeholders
						pstmt.setInt(1, memberId);

						// Step 5: Execute SQL query
						ResultSet rs = pstmt.executeQuery();

						// Step 6: Process Result
						while (rs.next()) {
							email = rs.getString("email");
							username = rs.getString("username");
							password = rs.getString("password");
					%>
					<tr>
						<td><%=email%></td>
						<td><%=username%></td>
						<td><%=password%></td>
						<td><a class="btn btn-primary btn-sm update-button"
							href="updateMember.jsp?memberId=<%=memberId%>">Update</a> <a
							class="btn btn-danger btn-sm delete-button"
							onclick="confirmDelete(<%=memberId%>)">Delete</a></td>
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

	<script>
		function confirmDelete(memberId) {
		  if (confirm("Are you sure you want to delete this member?")) {
		    window.location.href = "<%=request.getContextPath()%>/DeleteMemberServlet?memberId=" + memberId;
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