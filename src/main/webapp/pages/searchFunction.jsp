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
	
	
	String sqlCall = "{CALL SearchBookIndex(?,?)}";
	
	CallableStatement cs = conn.prepareCall(sqlCall);
	cs.setString(1,searchQuery);
	cs.setString(2,searchQuery);
	
	// Step 5: Execute SQL query
	ResultSet rs = cs.executeQuery();

	// Step 6: Process Result
	while (rs.next()) {	
		String title = rs.getString("title");
		String src = rs.getString("image");
		double price = rs.getDouble("price");
		int bookId = rs.getInt("book_id");
		
		htmlBuilder.append("<div class='col-md-4'>");
		htmlBuilder.append("<div class='card' style='border-radius: 15px; background-color:#144367;'>");
		htmlBuilder.append("<div class='bg-image'>");
		htmlBuilder.append("<img src='").append(src).append("' style='border-top-left-radius: 15px; border-top-right-radius: 15px;' class='img-fluid' alt='Book Image' />");
		htmlBuilder.append("</div>");
		htmlBuilder.append("<div class='card-body pb-0'>");
		htmlBuilder.append("<div class='d-flex justify-content-between align-items-end pb-2 mb-1'>");
		htmlBuilder.append("<h5 class='card-title'>").append(title).append("</h5>");
		htmlBuilder.append("<div>");
		htmlBuilder.append("<a href='bookDetails.jsp?bookId=").append(bookId).append("' class='btn btn-primary'>Details</a>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");
		htmlBuilder.append("</div>");	
	}

		
	session.setAttribute("searchResults", htmlBuilder.toString());
	response.sendRedirect("index.jsp?searchResults=true");


	// Close connection
	conn.close();
} catch (Exception e) {
	e.printStackTrace();
	out.println("Error: " + e);
}

%>
