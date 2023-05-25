<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kitty Reads Category</title>
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
		<img src="../assets/fulllogo.png" alt="Logo" class="img-fluid">
	</div>

	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6">
				<form action="searchcat.jsp" method="GET" class="input-group">
					<select class="form-control form-control-lg"
						placeholder="Search by author or title" name="search">
						<option value="" selected disabled>Search by author or
							title</option>
						<option value="author">Search by author</option>
						<option value="title">Search by title</option>
					</select>
					<div class="input-group-append">
						<button class="btn btn-primary btn-lg" type="submit">Search</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>