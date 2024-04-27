 package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.*;

/**
 * Servlet implementation class HomeControl
 */
@WebServlet("/AdminControl")
public class AdminControl extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottiModel;

	static {

		prodottiModel=new ProdottoModel();
	}

	public AdminControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String parametro = (String) request.getParameter("ID");

			try {
				prodottiModel.deleteProduct(parametro);
				System.out.println("Eliminato");

				request.getSession().setAttribute("products", prodottiModel.allProduct());

			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println("ci sono");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
			dispatcher.forward(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
