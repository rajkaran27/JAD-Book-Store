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
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getContextPath() + "/pages";

		
		String src = request.getParameter("src");
		String title = request.getParameter("title").toUpperCase();
		String desc = request.getParameter("desc");
		String price = request.getParameter("price");
		String rating = request.getParameter("rating");
		String quantity = request.getParameter("quantity");
		String book_id = request.getParameter("bookId");
		
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
			String sqlStr = "UPDATE books SET title=?,quantity=?,price=?,src=?,desc=?,rating=? WHERE book_id=?";
			//String sqlStr = "INSERT INTO books(category_id,isbn,title,quantity,price,author_id,publisher_id,image,description,rating,publication_date) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			// Set parameter values for placeholders
	
			pstmt.setString(1, title);
			pstmt.setString(2, quantity);
			pstmt.setString(3, price);
			pstmt.setString(4, src);
			pstmt.setString(5, desc);
			pstmt.setString(6, rating);
			pstmt.setString(7, book_id);
			
			// Execute SQL query
            int rowsAffected = pstmt.executeUpdate();
            
            response.sendRedirect(path+"//adminActions.jsp");
            
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
		
	}

}
