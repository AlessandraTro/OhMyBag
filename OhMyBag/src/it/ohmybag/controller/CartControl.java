package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;

@WebServlet("/CartControl")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottomodel;
	static Prodotto prodotto;
	static Immagine immagine;
	static ImmagineModel immagineModel;

	static {
		immagine = new Immagine();
		prodotto = new Prodotto();
		prodottomodel = new ProdottoModel();
		immagineModel = new ImmagineModel();

	}

	public CartControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idProdotto = request.getParameter("ID");
		String cartStr = request.getParameter("carts");
		
		//se cartStr è null il control è richiamato dalla modale del carrello (ProdottiCatalogo.jsp), altrimenti da Carrello.jsp
		int cart = 0;
		if (cartStr != null) {
	        try {
	            cart = Integer.parseInt(cartStr);
	        } catch (NumberFormatException e) {
	            System.out.println("Errore nel parsing del parametro carts: " + e.getMessage());
	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametro carts non valido");
	            return;
	        }
	    }

		try {
			//carica tutti i prodotti e le immagini
			prodotto = prodottomodel.doRetrieveById(idProdotto);
			immagine = (Immagine) immagineModel.retrieveCatalogImagesById(idProdotto);

			// Ottiene o crea il carrello dalla sessione utente
			if (prodotto != null && immagine != null) {
				Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
				if (carrello == null) {
					carrello = new Carrello();
					request.getSession().setAttribute("Carrello", carrello);
					
				}
				
				// Ottiene i prodotti e le immagini attualmente nel carrello
				HashMap<Prodotto, Integer> product = carrello.getProdotti();
				ArrayList<Immagine> images = carrello.getImmagini();

				// Aggiorna la quantità del prodotto nel carrello
				if (product.containsKey(prodotto)) {
					int quantita = (int) product.get(prodotto);

					if (prodotto.getDisponibilita() >= quantita + 1) {
						product.remove(prodotto);
						product.put(prodotto, quantita + 1);
					} else {
						System.out.println("Quantità non disponibile"); 
					}
				} else {
					// Aggiunge il prodotto al carrello se non è già presente
					if (prodotto.getDisponibilita() >= 1) {
						product.put(prodotto, 1);
						images.add(immagine);
						carrello.setImmagini(images);
					}
				}
				// Aggiorna i dati del carrello nella sessione utente
				carrello.setProdotti(product);
				request.getSession().setAttribute("Carrello", carrello);
			}

		} catch (SQLException e) {
			System.out.println("Errore SQL: " + e.getMessage());
			response.sendError(500);
			return;
		}

		// Redireziona l'utente in base al valore di cart
		if (!response.isCommitted()) {
			if (cart == 1) {
				response.sendRedirect("Carrello.jsp");
			} else {
				response.sendRedirect("CatalogoModale.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
