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
		System.out.println("-----------------------------------------") ;
    	System.out.println("INIZIO CART CONTROL") ;
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


		
		System.out.println("CARRELLO2= " +cart);

		try {
			prodotto = prodottomodel.doRetrieveById(idProdotto);
			immagine = (Immagine) immagineModel.retrieveCatalogImagesById(idProdotto);

			if (prodotto != null && immagine != null) {
				Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
				if (carrello == null) {
					carrello = new Carrello();
					request.getSession().setAttribute("Carrello", carrello);
//			        System.out.println("PROVA CARRELLO VUOTO: " + carrello.getProdotti().size());

					
				}
				
				
		        System.out.println("CARELLO NUMERO PRODOTTI TOTALI: " + carrello.getProdotti().size());
		     // Stampa i nomi e le quantità dei prodotti nel carrello
                HashMap<Prodotto, Integer> product = carrello.getProdotti();
                for (Entry<Prodotto, Integer> entry : product.entrySet()) {
                    Prodotto p = entry.getKey();
                    Integer quantita = entry.getValue();
                    System.out.println("Nome prodotto: " + p.getNome() + ", Quantità: " + quantita);
                }


//				HashMap<Prodotto, Integer> product = carrello.getProdotti();
				ArrayList<Immagine> images = carrello.getImmagini();

				if (product.containsKey(prodotto)) {
//					System.out.println("sono un doppione");
					int quantita = (int) product.get(prodotto);
//			        System.out.println("Nuova QUANTTTT: " + (quantita));

					System.out.println("quantita=" + quantita + "disponibilita= " + prodotto.getDisponibilita());
					if (prodotto.getDisponibilita() >= quantita + 1) {
						product.remove(prodotto);
						product.put(prodotto, quantita + 1);
						
				        System.out.println("Nuova quantità: " + (quantita + 1));
					} else {
						System.out.println("Quantità non disponibile"); /* da aggiornare con allert */
					}
				} else {
					if (prodotto.getDisponibilita() >= 1) {
						
						System.out.println("AGGIUNTO PRODOTTO PRIMA VOLTA NOME: " + prodotto.getNome());
						product.put(prodotto, 1);
						images.add(immagine);
						carrello.setImmagini(images);
					}
				}
				
				carrello.setProdotti(product);
				request.getSession().setAttribute("Carrello", carrello);
				System.out.println("FINE");
			}

		} catch (SQLException e) {
			System.out.println("Errore SQL: " + e.getMessage());
			response.sendRedirect("pagina_errore.jsp");
			return;
		}

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
