package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import memberPackage.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * =========================================================== Author: Rajkaran
		 * (2109039) Date: 9/6/2023 Description: JAD CA1
		 * =============================================================
		 */

		String path = request.getContextPath() + "/pages";

		Client client = ClientBuilder.newClient();

		String user = request.getParameter("loginId");
		String pwd = request.getParameter("password");

		if (!user.isEmpty() && !pwd.isEmpty()) {

			String restUrl = "http://localhost:8081/bookstore/loginUser";

			WebTarget target = client.target(restUrl);
			Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);

			// PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();

			Member member = new Member();
			member.setUsername(user);
			member.setPassword(pwd);
			Response resp = invocationBuilder.post(Entity.entity(member, MediaType.APPLICATION_JSON));

			if (resp.getStatus() == 200) {
				String responseMessage = resp.readEntity(String.class);
				String[] parts = responseMessage.split(": ");
				String userId = parts[1].trim(); 

				session.setAttribute("sessUserRole", "member");
				session.setAttribute("userid", userId);
				session.setMaxInactiveInterval(900);
				

				String url = "pages/index.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
			} else {
				response.sendRedirect(path + "//login.jsp?errCode=invalidLogin");
			}
		}else {
			response.sendRedirect(path + "//login.jsp?errCode=invalidLogin");
		}
	}
}
