package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getContextPath() + "/pages";
		
		String bookId = request.getParameter("bookId");
		int book_id = Integer.parseInt(bookId);
		
		PrintWriter out = response.getWriter();

		
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
			String sqlStr = "INSERT INTO members(email,username,password) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			// Set parameter values for placeholders
			pstmt.setInt(1, book_id);
			

			// Execute SQL
            int rowsAffected = pstmt.executeUpdate();


			/*
			 * // Step 6: Process Result while (rs.next()) {
			 * 
			 * 
			 * }
			 */
			
			response.sendRedirect(path + "//login.jsp?errCode=registered");
			
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}

		
		
		
	}

}
