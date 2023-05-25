<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kitty Reads Category</title>
<link rel="stylesheet" type="text/css" href="../styles/index.css">
<style>
.category-box {
	width: 200px;
	height: 200px;
	border: 1px solid black;
	margin: 10px;
	padding: 20px;
	text-align: center;
	display: inline-block;
}

.category-title {
	font-weight: bold;
	margin-bottom: 10px;
}
</style>
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

	<!--	<div class="container mt-4">
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
	</div> -->

	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="category-box">
					<a href="searchcat.jsp?category=romance">
						<div class="category-title">Romance</div> <img
						src="../assets/romance.jpg" alt="Romance" width="150" height="150">
					</a>
				</div>
				<div class="category-box">
					<a href="searchcat.jsp?category=fantasy">
						<div class="category-title">Fantasy</div> <img
						src="../assets/fantasy.jpg" alt="Fantasy" width="150" height="150">
					</a>
				</div>
				<div class="category-box">
					<a href="searchcat.jsp?category=mystery">
						<div class="category-title">Mystery</div> <img
						src="../assets/mystery.jpg" alt="Mystery" width="150" height="150">
					</a>
				</div>
				<!-- Add more category boxes as needed -->
			</div>
		</div>
	</div>
</body>
</html>