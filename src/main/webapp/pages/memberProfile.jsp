<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String userRole = (String) session.getAttribute("sessUserRole");

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
.card {
	margin: 0;
	width: 700px;
	box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
	-webkit-box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
	-moz-box-shadow: -1px 4px 40px 10px rgba(0, 0, 0, 0.54);
}
</style>
<body>
	<%@ include file="header.jsp"%>

	<div class="container d-flex justify-content-center align-items-center">
		<div>
			<!-- <h2>Account Settings</h2> -->
			<!-- 			<table class="table">
				<thead>
					<tr>
						<th>Email</th>
						<th>Username</th>
						<th>Password</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody> -->
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
			<%-- 					<tr>
						<td><%=email%></td>
						<td><%=username%></td>
						<td><%=password%></td>
						<td><a class="btn btn-primary btn-sm update-button"
							href="updateMember.jsp?memberId=<%=memberId%>">Update</a> <a
							class="btn btn-danger btn-sm delete-button"
							onclick="confirmDelete(<%=memberId%>)">Delete</a></td>
					</tr> --%>
			<section class="h-100" style="background-color: #0C243C;">
				<div class="container h-100">
					<div class="row justify-content-sm-center h-100">
						<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
							<div class="text-center my-5">
								<img src="${pageContext.request.contextPath}/assets/logo.png"
									alt="logo" width="100">
							</div>
							<div
								class="card shadow-lg text-center justify-content-center align-items-center"
								style="background-color: #3188D5">
								<div class="card-body p-5">
									<h1 class="fs-4 card-title fw-bold mb-4" style="color: #0C243C">Account
										Settings</h1>
									<div class="mb-3">
										<div class="mb-2 w-100">
											<label class="mb-2 text-dark fs-5" for="email">Email</label>
										</div>
										<%=email%>
									</div>
									<div class="mb-3">
										<div class="mb-2 w-100">
											<label class="mb-2 text-dark fs-5" for="email">Username</label>
										</div>
										<%=username%>
									</div>

									<div class="mb-3">
										<div class="mb-2 w-100">
											<label class="mb-2 text-dark fs-5" for="password">Password</label>
										</div>
										<%=password%>
									</div>

									<!-- <div class="d-flex align-items-center"> -->
									<div class="text-center" style="color: #0C243C">
										<a class="btn btn-primary btn-sm update-button"
											href="updateMember.jsp?memberId=<%=memberId%>">Update
											Info</a>
									</div>
									<!-- </div> -->
								</div>
								<div class="card-footer py-3 border-0">
									<div class="text-center" style="color: #0C243C">
										Delete Account? <a class="btn btn-danger btn-sm delete-button"
											onclick="confirmDelete(<%=memberId%>)">Click Here</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<%
			}
			// Step 7: Close connection
			conn.close();
			} catch (Exception e) {
			out.println("Error :" + e);
			}
			%>
			<!-- 				</tbody>
			</table> -->
		</div>
	</div>

	<script>
		function confirmDelete(memberId) {
		  if (confirm("Are you sure you want to delete this member?")) {
		    window.location.href = "<%=request.getContextPath()%>
		/DeleteMemberServlet?memberId="
						+ memberId;
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