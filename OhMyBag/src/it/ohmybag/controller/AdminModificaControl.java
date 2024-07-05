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
import it.ohmybag.model.ProdottoModel;

@WebServlet("/AdminModificaControl")
public class AdminModificaControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottoModel;

	static {

		prodottoModel = new ProdottoModel();

	}

	public AdminModificaControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");
		Prodotto product = (Prodotto) request.getSession().getAttribute("ProdottoDaModificare");
		
		//se uno qualsiasi dei campi non viene aggiornato allora viene reinserito il dato già presente
		String inputDescrizione = request.getParameter("inputDescrizione");
		if (inputDescrizione != null && !inputDescrizione.equals("")) {
			product.setDescrizione(inputDescrizione);
		}
		String prezzo = request.getParameter("inputPrezzo");
		float inputPrezzo = 0;
		if (prezzo != null && !prezzo.equals("")) {
			inputPrezzo = Float.parseFloat(prezzo);
			product.setPrezzo(inputPrezzo);
		}

		String quantity = request.getParameter("inputQuantity");
		int inputQuantity = 0;
		if (quantity != null && !quantity.equals("")) {
			inputQuantity = Integer.parseInt(quantity);
			product.setDisponibilita(inputQuantity);
		}
		
		String iva = request.getParameter("inputIva");
		int inputIva = 0;
		if (iva != null && !iva.equals("")) {
			inputIva = Integer.parseInt(iva);
			product.setIva(inputIva);
		}

		String sconto = request.getParameter("inputSconto");
		int inputSconto = 0;
		if (sconto != null && !sconto.equals("")) {
			inputSconto = Integer.parseInt(sconto);
			product.setSconto(inputSconto);
		}
		
		try {
			prodottoModel.updateProduct(product.getId(), product.getDescrizione(), product.getDisponibilita(), product.getSconto(), product.getPrezzo(), product.getIva());
			request.getSession().setAttribute("products", prodottoModel.allProduct()); //aggiorna i prodotti nella sessione
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// A modifica completata elimino il prodotto dalla sessione e ritorno al catalogo dell'admin
		request.getSession().removeAttribute("ProdottoDaModificare");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/AdminProdotti.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
