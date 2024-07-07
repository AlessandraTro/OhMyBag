package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;

@WebServlet("/RemoveProductControl")
public class RemoveProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemoveProductControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idProdotto = request.getParameter("ID");
		Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
		String cartStr = request.getParameter("carts");
		// Verifica se il parametro cart è presente e convertibile in intero
		int cart = 0;
		if (cartStr != null) {
			cart = Integer.parseInt(cartStr);
		}

		HashMap<Prodotto, Integer> prodotti = carrello.getProdotti();
		ArrayList<Immagine> images = carrello.getImmagini();

		// Itera sui prodotti nel carrello
		if (!prodotti.isEmpty()) {
			Iterator<Map.Entry<Prodotto, Integer>> iterator = prodotti.entrySet().iterator();
			while (iterator.hasNext()) {
				Map.Entry<Prodotto, Integer> entry = iterator.next();
				Prodotto prodotto = entry.getKey();
				// Controlla se l'id del prodotto corrisponde a quello passato come parametro
				if (prodotto.getId().equals(idProdotto)) {
					int quantita = entry.getValue();
					// Se la quantità è 1, rimuove completamente il prodotto
					if (quantita == 1) {
						iterator.remove(); // Rimuovi l'elemento utilizzando l'iteratore
						// Rimuove l'immagine corrispondente al prodotto
						Iterator<Immagine> iteratorImage = images.iterator();
						while (iteratorImage.hasNext()) {
							Immagine immagine = iteratorImage.next();
							if (immagine.getIdProdotto().equals(idProdotto)) {
								iteratorImage.remove();
							}
						}

					} else {
						entry.setValue(quantita - 1); // Decrementa la quantità del prodotto nel carrello
					}
				}
			}
		}

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
