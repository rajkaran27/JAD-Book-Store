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
		htmlBuilder.append("<div class='card' style='border-radius: 15px;'>");
		htmlBuilder.append("<div class='bg-image hover-overlay ripple ripple-surface ripple-surface-light' data-mdb-ripple-color='light'>");
		htmlBuilder.append("<img src='").append(src).append("' style='border-top-left-radius: 15px; border-top-right-radius: 15px;' class='img-fluid' alt='Book Image' />");
		htmlBuilder.append("<a href='#!'>");
		htmlBuilder.append("<div class='mask'></div>");
		htmlBuilder.append("</a>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("<div class='card-body pb-0'>");
		htmlBuilder.append("<div class='d-flex justify-content-between'>");
		htmlBuilder.append("<div>");
		htmlBuilder.append("<h5 class='card-title'>").append(title).append("</h5>");
		htmlBuilder.append("<p class='small text-muted'>").append(price).append("</p>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("<div class='card-body'>");
		htmlBuilder.append("<div class='d-flex justify-content-between align-items-end pb-2 mb-1'>");
		htmlBuilder.append("<a href='#!' class='text-dark fw-bold'></a>");
		htmlBuilder.append("<a href='bookDetails.jsp?bookId=").append(bookId).append("' class='btn btn-primary'>Details</a>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");




		
	}
	
	System.out.print(request.getContextPath());
	
	session.setAttribute("searchResults", htmlBuilder.toString());
	response.sendRedirect("index.jsp?searchResults=true");


	// Close connection
	conn.close();
} catch (Exception e) {
	e.printStackTrace();
	out.println("Error: " + e);
}

%>
