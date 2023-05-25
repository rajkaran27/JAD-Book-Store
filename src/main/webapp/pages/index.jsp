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

	<%
	// Retrieve search results from session
	String searchResults = (String) session.getAttribute("searchResults");

	// Clear the search results from the session
	session.removeAttribute("searchResults");
	%>

	<div class="container text-center mt-3">
		<img src="${pageContext.request.contextPath}/assets/fulllogo.png"
			alt="Kitty Reads" class="img-fluid">

	</div>

	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6">
				<form action="searchFunction.jsp" method="GET" class="input-group">
					<input type="text" class="form-control form-control-lg"
						placeholder="Search by author or title" name="search">
					<div class="input-group-append">
						<button class="btn btn-primary btn-lg" type="submit">Search</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%
	if (searchResults != null) {
	%>
	<div class="container mt-5" id="bookDisplay">
		<div class="row">
			<%=searchResults%>
		</div>
	</div>
	<%
	}
	%>


	<%@ include file="footer.jsp"%>
</body>

</html>