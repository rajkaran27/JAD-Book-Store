package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.io.PrintWriter;
import java.net.*;
import java.net.URLEncoder;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveFromCartServlet
 */
@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveFromCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getContextPath() + "/pages";
		// Retrieve the bookId parameter from the request
		String bookIdStr = request.getParameter("bookId");

		/*if (bookIdStr != null && !bookIdStr.isEmpty()) {

			ArrayList<Integer> cartItems = new ArrayList<>();
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("shoppingCart")) {
						String cartValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
						String[] cartItemsStr = cartValue.split(",");
						for (String itemId : cartItemsStr) {
							cartItems.add(Integer.parseInt(itemId));
						}
						break;
					}
				}
			}

			String cartValue = "";
			for (int itemId : cartItems) {
			    cartValue += itemId + ",";
			}
			if (!cartValue.isEmpty()) {
			    cartValue = cartValue.substring(0, cartValue.length() - 1);
			}
			cartValue = URLEncoder.encode(cartValue, "UTF-8");
			Cookie cartCookie = new Cookie("shoppingCart", cartValue);
			response.addCookie(cartCookie);
			response.sendRedirect(path + "//viewCart.jsp");
		}else {
			*/
		}
	
		// Redirect back to the view cart page
		
		/*
		 * try { int bookId = Integer.parseInt(bookIdStr);
		 * 
		 * // Get the bookList from the session HttpSession session =
		 * request.getSession(); ArrayList<Integer> bookList = (ArrayList<Integer>)
		 * session.getAttribute("bookList");
		 * 
		 * // Check if the bookList exists if (bookList != null) { // Remove the bookId
		 * from the list bookList.remove(Integer.valueOf(bookId));
		 * 
		 * // Update the bookList in the session session.setAttribute("bookList",
		 * bookList); } } catch (NumberFormatException e) { // Handle invalid bookId
		 * format e.printStackTrace(); } }
		 */

	

}
