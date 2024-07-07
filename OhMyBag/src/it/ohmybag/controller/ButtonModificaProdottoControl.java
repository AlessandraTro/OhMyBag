package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.CategoriaModel;
import it.ohmybag.model.ImmagineModel;
import it.ohmybag.model.ProdottoModel;



@WebServlet("/ButtonModificaProdottoControl")
public class ButtonModificaProdottoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottoModel;
	static ImmagineModel immagineModel;
	static CategoriaModel categoriaModel;


	static {
		immagineModel = new ImmagineModel();
		prodottoModel = new ProdottoModel();
		categoriaModel = new CategoriaModel();
	}

	public ButtonModificaProdottoControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		   String productId = (String)request.getParameter("ID");
		try {
			// Imposta il prodotto, le immagini e la categoria nella sessione
			Prodotto prodotto = prodottoModel.doRetrieveById(productId);
			request.getSession().setAttribute("ProdottoDaModificare",prodotto); // Carica solo il prodotto richiesto tramite l'ID
            request.getSession().setAttribute("productImages", immagineModel.doRetrieveByProductId(productId)); // Carica solo le immagini del prodotto richiesto
            request.getSession().setAttribute("categoria", categoriaModel.getCategoria(prodotto.getIdCategoria()));// Carica solo la categoria del prodotto richiesto

            } catch (SQLException e) {
			e.printStackTrace();
		}
		// Inoltra la richiesta alla pagina di modifica del prodotto
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/AdminModificaProdotto.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}