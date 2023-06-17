<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*" %>

<%-- <%
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
%> --%>

<%
int book_id = Integer.parseInt(request.getParameter("bookId"));
ArrayList<Integer> cartItems = new ArrayList<>();
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("shoppingCart")) {
	String cartValue = cookie.getValue();
	String[] cartItemsStr = cartValue.split(",");
	for (String itemId : cartItemsStr) {
		cartItems.add(Integer.parseInt(itemId));
	}
	break;
		}
	}
}

//Add the book ID to the shopping cart
cartItems.add(book_id);

//Update the cookie with the new shopping cart value
String cartValue = "";
for (int itemId : cartItems) {
cartValue += itemId + ",";
}
cartValue = cartValue.substring(0, cartValue.length() - 1);
cartValue = URLEncoder.encode(cartValue, "UTF-8");
Cookie cartCookie = new Cookie("shoppingCart", cartValue);
response.addCookie(cartCookie);

//Redirect to the shopping cart page
response.sendRedirect("viewCart.jsp");
%>