<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
String searchQuery = request.getParameter("search");

try {
	StringBuilder htmlBuilder = new StringBuilder();

	// Step 1: Load JDBC Driver
	Class.forName("com.mysql.cj.jdbc.Driver");

	// Step 2: Define Connection URL
	String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

	// Step 3: Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);

	// Step 4: Create PreparedStatement object
	String sqlStr = "SELECT books.*, authors.author_name FROM books INNER JOIN authors ON books.author_id = authors.author_id WHERE books.title LIKE CONCAT('%', ?, '%') OR authors.author_name LIKE CONCAT('%', ?, '%')";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);

	// Set parameter values for placeholders
	pstmt.setString(1, searchQuery);
	pstmt.setString(2, searchQuery);

	// Step 5: Execute SQL query
	ResultSet rs = pstmt.executeQuery();

	// Step 6: Process Result
	while (rs.next()) {	
		String title = rs.getString("title");
		String src = rs.getString("image");
		double price = rs.getDouble("price");
		int bookId = rs.getInt("book_id");
		
		htmlBuilder.append("<div class='col-md-4'>");
		htmlBuilder.append("<div class='card'>");
		htmlBuilder.append("<img src='").append(src).append("' class='card-img-top' alt='Book Image'>");
		htmlBuilder.append("<div class='card-body'>");
		htmlBuilder.append("<h5 class='card-title'>").append(title).append("</h5>");
		htmlBuilder.append("<p class='card-text'>").append(price).append("</p>");
		htmlBuilder.append("<a href='bookDetails.jsp?bookId=").append(bookId).append("' class='btn btn-primary btn-sm float-end'>Details</a>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");	
		htmlBuilder.append("</div>");
	}

	session.setAttribute("searchResults", htmlBuilder.toString());

	// Close connection
	conn.close();
} catch (Exception e) {
	e.printStackTrace();
	out.println("Error: " + e);
}

// Redirect to index.jsp with search results as query parameter
response.sendRedirect("index.jsp?searchResults=true");
%>
