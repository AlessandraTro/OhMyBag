package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


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
		immagine=new Immagine();
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
	    try {
	        prodotto = prodottomodel.doRetrieveById(idProdotto);
	        immagine = (Immagine) immagineModel.retrieveCatalogImagesById(idProdotto);

	        if (prodotto != null && immagine != null) {
	        	Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
	        	if (carrello == null) {
	        	    carrello = new Carrello();
	        	    request.getSession().setAttribute("Carrello", carrello);
	        	}

	        	
	        	HashMap<Prodotto,Integer> product = carrello.getProdotti();
	        	ArrayList<Immagine> images = carrello.getImmagini();

	            if(product.containsKey(prodotto)) {
	            	
	    			System.out.println("sono un doppione");
	    			int quantita=(int)product.get(prodotto);
	    			System.out.println("quantita="+quantita+"disponibilita= "+prodotto.getDisponibilita());
	    			if(prodotto.getDisponibilita()>=quantita+1) {
	    				
		    			product.remove(prodotto);
		    			product.put(prodotto,quantita+1);
	    			}else {
	    				
	    				System.out.println("Quantità non disponibile"); /*da aggiornare con allert*/
	    			}
	            }else {
	            	
	            	if(prodotto.getDisponibilita()>=1) {
	            		
	            		product.put(prodotto, 1);
	            		images.add(immagine);
	            		carrello.setImmagini(images);
	            	}
	            }
	            carrello.setProdotti(product);

	            request.getSession().setAttribute("Carrello", carrello);
	        }

	    } catch (SQLException e) {
	        System.out.println("Errore SQL: " + e.getMessage());
	        // Puoi gestire l'eccezione SQL, ad esempio reindirizzando l'utente a una pagina di errore
	        response.sendRedirect("pagina_errore.jsp");
	        return; // Esce dal metodo dopo aver reindirizzato l'utente
	    }
	    // Reindirizza l'utente a un nuovo URL dopo aver gestito la richiesta con successo
	    response.sendRedirect("Carrello.jsp");
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
