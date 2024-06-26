package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ImmagineModel;

@WebServlet("/ProdottiRicercaControl")
public class ProdottiRicercaControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ImmagineModel immagineModel;

	static {
		immagineModel = new ImmagineModel();
	}

	public ProdottiRicercaControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchField = request.getParameter("searchField");
		Collection<Prodotto> prodotti = (Collection<Prodotto>) request.getSession().getAttribute("products");
		ArrayList<Prodotto> filteredProducts = new ArrayList<Prodotto>();

		if (searchField != null && !searchField.trim().isEmpty()) {
			for (Prodotto prodotto : prodotti) {
				if (prodotto.getNome().toLowerCase().startsWith(searchField.toLowerCase())) {
					filteredProducts.add(prodotto);
				}
			}
			
		} else {
			filteredProducts.addAll(prodotti);
		}
		/*
		 * setta l'attributo ImageList che conterrà tutte le immagini dei prodotti
		 * contenuti nel DB
		 */
		try {
			request.setAttribute("ImageList", immagineModel.doRetrieveAll());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("products", filteredProducts);
		
		request.getRequestDispatcher("Catalogo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
