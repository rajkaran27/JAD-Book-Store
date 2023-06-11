package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getContextPath() + "/pages";

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();


		try {

			// Step 1: Load JDBC Driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=pjraj12!&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();

			// Step 5: Execute SQL Command
			String sqlStr = "SELECT * FROM admin WHERE username=? AND password=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			// Set parameter values for placeholders
			pstmt.setString(1, user);
			pstmt.setString(2, pwd);

			// Execute SQL query
			ResultSet rs = pstmt.executeQuery();

			// Step 6: Process Result
			while (rs.next()) {

				id = rs.getInt("admin_id");
				password = rs.getString("password");
				name = rs.getString("username");

			}

			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}

		if (name.equalsIgnoreCase(user) && password.equals(pwd)) { // Create Role
			session.setAttribute("sessUserRole", "owner");
			session.setAttribute("sessUserID", id);
			session.setAttribute("loginStatus", "success");
			session.setMaxInactiveInterval(10); // Redirect to
			// displayMember.jsp with parameters
			response.sendRedirect(path + "//index.jsp");
		} else {

			// for invalid credentials
			response.sendRedirect(path + "//adminLogin.jsp?errCode=invalidLogin");

		}
	}

}
