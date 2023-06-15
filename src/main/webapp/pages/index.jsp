<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<%@ include file="header.jsp"%>

<head>
<meta charset="ISO-8859-1">
<title>Paws & Paperback</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/main.css">

</head>

<body>
	<%
	// Retrieve search results from session
	String searchResults = (String) session.getAttribute("searchResults");

	// Clear the search results from the session
	session.removeAttribute("searchResults");
	%>

	<div class="container text-center mt-3">
		<img src="${pageContext.request.contextPath}/assets/brandLogo.png"
			alt="Paws" class="img-fluid">
	</div>

	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6">
				<form action="<%=request.getContextPath()%>/SearchBookServlet" method="GET" class="input-group">
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