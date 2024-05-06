package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Carrello;
import it.ohmybag.bean.Composizione;
import it.ohmybag.bean.Ordine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ComposizioneModel;
import it.ohmybag.model.OrdineModel;

@WebServlet("/ButtonPagamentoControl")
public class ButtonPagamentoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static ComposizioneModel composizioneModel;
	static OrdineModel ordineModel;
	static {
		composizioneModel=new ComposizioneModel();
		ordineModel = new OrdineModel();
	}

	/*protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
			Ordine ordine = ordineModel.maxIdUser("otineb");
			int idOrdine= ordine.getId();
			HashMap<Prodotto, Integer> prodotti = carrello.getProdotti();
			float prezzo=0;

			if (!prodotti.isEmpty()) {
				Iterator<Map.Entry<Prodotto, Integer>> iterator = prodotti.entrySet().iterator();
				while (iterator.hasNext()) {
					Map.Entry<Prodotto, Integer> entry = iterator.next();
					Prodotto prodotto = entry.getKey();
					String idProdotto = prodotto.getId();
					int quantita = (int) prodotti.get(prodotto);
					float Iva = prodotto.getIva();
					if (prodotto.getSconto() > 0) {
						prezzo = ((prodotto.getPrezzo() - (prodotto.getPrezzo() * (prodotto.getSconto() / 100)))
								* quantita) * (Iva / 100); // prezzo a cui applico sconto e iva e moltiplico per la
															// quantità
					}
					prezzo = (prodotto.getPrezzo() * quantita) * (Iva / 100); // prezzo a cui applico solo l'iva e moltiplico per la quantità
					Composizione comp=new Composizione(idOrdine, idProdotto, prezzo, quantita, Iva);
					composizioneModel.saveComposizione(comp);	
					carrello.svuotaCarrello();
				}
			}

		} catch (SQLException e) {
			System.out.println("Errore SQL: " + e.getMessage());
			response.sendRedirect("pagina_errore.jsp");
			return; // Esce dal metodo dopo aver reindirizzato l'utente
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
		dispatcher.forward(request, response);
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
