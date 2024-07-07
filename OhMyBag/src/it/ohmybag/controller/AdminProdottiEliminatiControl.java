
package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.*;
import it.ohmybag.bean.*;

@WebServlet("/AdminProdottiEliminatiControl")
public class AdminProdottiEliminatiControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	static ImmagineModel immagineModel;
	static ProdottoModel prodottoModel;

	static {
		immagineModel = new ImmagineModel();
		prodottoModel = new ProdottoModel();
	}

	public AdminProdottiEliminatiControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pulsante = request.getParameter("pulsante");
		String productId = request.getParameter("ID");

		// Se il pulsante premuto è "Ripristina", ripristina il prodotto
		if ("Ripristina".equals(pulsante)) {
			prodottoModel.setProductAsRestored(productId);
		}

		try {
			// Recupera la lista dei prodotti eliminati e delle immagini
			Collection<Prodotto> deletedProducts = prodottoModel.adminTrueProduct();
			request.getSession().setAttribute("deletedProducts", deletedProducts);
			request.setAttribute("ImageList", immagineModel.doRetrieveAll());
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("404.jsp");
			return;
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/AdminProdottiEliminati.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
