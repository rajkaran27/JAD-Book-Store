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

	if (userRole.equals("member")) {

		Cookie[] cookies = request.getCookies();
		
		if (bookIdList == null) {
			bookIdList = new ArrayList<>();
			session.setAttribute("book", bookIdList);
		}
		
		bookIdList.add(book_id);

		session.setAttribute("bookList", bookIdList);
		response.sendRedirect("viewCart.jsp");
	} else {
		response.sendRedirect("login.jsp");

	}

} else {
	response.sendRedirect("login.jsp");
}
%>