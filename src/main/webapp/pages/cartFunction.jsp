<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>

<%
// get book id
int book_id = Integer.parseInt(request.getParameter("bookId"));

// create new arraylist for items in shopping cart
ArrayList<Integer> cartItems = new ArrayList<>();

//get cookies
Cookie[] cookies = request.getCookies();

//check if cookies are empty		
if (cookies != null) {

	// for each loop to loop over every cookie in cookie array
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