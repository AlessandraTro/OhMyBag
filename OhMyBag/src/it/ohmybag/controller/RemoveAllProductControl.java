package it.ohmybag.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Carrello;
import it.ohmybag.bean.Immagine;
import it.ohmybag.bean.Prodotto;

@WebServlet("/RemoveAllProductControl")
public class RemoveAllProductControl extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public RemoveAllProductControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		// Ottiene l'id del prodotto da rimuovere dal parametro della richiesta
	    String idProdotto = request.getParameter("ID");
	    Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello"); // Ottiene il carrello dalla sessione utente
	    String cartStr = request.getParameter("carts");
		// Verifica se il parametro cart è presente e convertibile in intero
		int cart = 0;
		if (cartStr != null) {
			cart = Integer.parseInt(cartStr);
		}
		
		// Ottiene la mappa dei prodotti e l'arrayList delle immagini dal carrello
	    HashMap<Prodotto,Integer> prodotti = carrello.getProdotti();
	    ArrayList<Immagine> images = carrello.getImmagini();
	    
	    // Itera sui prodotti nel carrello
	    if(!prodotti.isEmpty()) {
	        Iterator<Map.Entry<Prodotto,Integer>> iterator = prodotti.entrySet().iterator();
	        while(iterator.hasNext()) {
	            Map.Entry<Prodotto,Integer> entry = iterator.next();
	            Prodotto prodotto = entry.getKey();
	            // Se trova il prodotto da rimuovere, rimuove anche le immagini associate
	            if(prodotto.getId().equals(idProdotto)) {
	            	iterator.remove(); // Rimuovi l'elemento utilizzando l'iteratore
	                // Rimuove le immagini corrispondenti al prodotto
	            	Iterator<Immagine> iteratorImage = images.iterator();
	                while(iteratorImage.hasNext()) {
	                	Immagine immagine = iteratorImage.next();
	                    if(immagine.getIdProdotto().equals(idProdotto)) {
	                        iteratorImage.remove();
	                    }
	                }
	            }
	        }
	    }
	    // Aggiorna il carrello nella sessione utente
	    request.getSession().setAttribute("Carrello", carrello);
	    
	    // Redireziona l'utente in base al parametro cart
	    if (cart == 1) {
			response.sendRedirect("CartControl?carts=1");
			return;
		}
	    response.sendRedirect("CartControl");
	    return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
