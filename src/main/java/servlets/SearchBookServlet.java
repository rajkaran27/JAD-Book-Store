package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import bookPackage.Book;

@WebServlet("/SearchBookServlet")
public class SearchBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchBookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		/*
		 * =========================================================== Author: Rajkaran
		 * (2109039) Date: 9/6/2023 Description: JAD CA1
		 * =============================================================
		 */


		Client client = ClientBuilder.newClient();
		String searchQuery = request.getParameter("search");

		String restUrl = "http://localhost:8081/bookstore/getBooks/" +searchQuery;

		WebTarget target = client.target(restUrl);
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.get();
		System.out.println("status: " + resp.getStatus());
		if (resp.getStatus() == Response.Status.OK.getStatusCode()) {
			System.out.print("success");
			ArrayList<Book> list = resp.readEntity(new GenericType<ArrayList<Book>>() {
			});
			request.setAttribute("books", list);
			String url = "pages/index.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} else {
			System.out.print("failed");
			String url = "pages/index.jsp";
			request.setAttribute("err", "NotFound");
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}

}
