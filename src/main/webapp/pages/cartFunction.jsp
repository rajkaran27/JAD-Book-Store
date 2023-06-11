<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
String userRole = (String) session.getAttribute("sessUserRole");
ArrayList<Integer> bookIdList = (ArrayList<Integer>) session.getAttribute("book");

String strbookId = request.getParameter("bookId");

int book_id = Integer.parseInt(strbookId);

if (userRole != null) {
	
	if (bookIdList == null) {
		bookIdList = new ArrayList<>();
		session.setAttribute("book", bookIdList);
	}
	
	bookIdList.add(book_id);
	
	for(int i=0;i<bookIdList.size();i++){
		System.out.print(bookIdList.get(i));
	}
	
	response.sendRedirect("bookDetails.jsp?statusCode=success");
	
	
} else {
	response.sendRedirect("login.jsp");
}
%>