<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
/* ===========================================================
Author: Rajkaran (2109039)
Date: 9/6/2023
Description: JAD CA1
============================================================= */
%>
<%@page import="bookPackage.*"%>
<%@page import="java.util.*"%>
<%@page import="org.jose4j.json.internal.json_simple.JSONArray"%>
<%@page import="javax.json.JsonArray"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Paws &amp; Paperback</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/main.css">
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
</style>
<body>
	<%@ include file="header.jsp"%>
	<%
	// Retrieve search results from session
	//String searchResults = (String) session.getAttribute("searchResults");

	// Clear the search results from the session
	//session.removeAttribute("books");
	%>

	<div class="container text-center mt-3">
		<img src="${pageContext.request.contextPath}/assets/brandLogo.png"
			alt="Paws" class="img-fluid">
	</div>

	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6">
				<form action="<%=request.getContextPath()%>/SearchBookServlet"
					method="GET" class="input-group">
					<input type="text" class="form-control form-control-lg"
						placeholder="Search by author or title" name="search">
					<div class="input-group-append">
						<button class="btn btn-primary btn-lg" type="submit">Search</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container mt-5" id="bookDisplay">
		<!-- <p class='text-center'>Click on a book to find out more!</p> -->
		<div class="row">
			<%
			String error = (String) request.getAttribute("err");
			if (error != null && error.equals("NotFound")) {
				out.print("Not found");
			}

			@SuppressWarnings("unchecked")
			ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");

			if (books != null) {

				for (Book b : books) {
					StringBuilder htmlBuilder = new StringBuilder();
					htmlBuilder.append("<div class='col-md-4 mb-4'>").append("<div class='card' style='border-radius:10px;'>")
					.append("<a href='bookDetails.jsp?bookId=").append(b.getBook_id()).append("'>").append("<img src='")
					.append(b.getImage()).append("' class='card-img-top' alt='Book Image' style='height:600px;' />")
					.append("</a>").append("<div class='card-body'>").append("<div class='text-center'>")
					.append("<a href='bookDetails.jsp?bookId=").append(b.getBook_id())
					.append("' style='text-decoration: none; color:#0C243C;'>").append("<h4 class='card-title fw-bold'>")
					.append(b.getTitle()).append("</h4>").append("</a>").append("</div>")
					.append("<p class='text-center mb-2' style='text-decoration: none; color:#0C243C;'>")
					.append(b.getCategoryName()).append(" | S$").append(b.getPrice()).append("</p>").append("</div>")
					.append("</div>").append("</div>");

					out.print(htmlBuilder.toString());

				}
			} else {
			%>

			<%
			}
			%>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>