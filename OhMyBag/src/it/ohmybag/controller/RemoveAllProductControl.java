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
	    String idProdotto = request.getParameter("ID");
	    Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
	    HashMap<Prodotto,Integer> prodotti = carrello.getProdotti();
	    ArrayList<Immagine> images = carrello.getImmagini();
	    
	    if(!prodotti.isEmpty()) {
	        Iterator<Map.Entry<Prodotto,Integer>> iterator = prodotti.entrySet().iterator();
	        while(iterator.hasNext()) {
	            Map.Entry<Prodotto,Integer> entry = iterator.next();
	            Prodotto prodotto = entry.getKey();
	            if(prodotto.getId().equals(idProdotto)) {
	            	System.out.println("tolgo tutto");
	            	iterator.remove(); // Rimuovi l'elemento utilizzando l'iteratore
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
	    
	    request.getSession().setAttribute("Carrello", carrello);
	    response.sendRedirect("CartControl");
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
