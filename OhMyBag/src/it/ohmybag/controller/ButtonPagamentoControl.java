package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Carrello;
import it.ohmybag.bean.Carta;
import it.ohmybag.bean.Composizione;
import it.ohmybag.bean.Ordine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.bean.Utente;
import it.ohmybag.model.*;
import it.ohmybag.utility.CriptoCard;

@WebServlet("/ButtonPagamentoControl")
public class ButtonPagamentoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static ComposizioneModel composizioneModel = new ComposizioneModel();
	static OrdineModel ordineModel = new OrdineModel();
	static ProdottoModel prodottoModel = new ProdottoModel();
	static UtenteModel utenteModel = new UtenteModel();
	static CartaModel cartaModel = new CartaModel();

	// Metodo per controllare se una stringa è nulla o vuota
	private boolean isNullOrEmpty(String param) {
		return param == null || param.trim().isEmpty();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try {
			// Recupera il carrello e l'utente dalla sessione
			Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
			Utente utente = (Utente) request.getSession().getAttribute("utente");
			Carta carta = null;
			String indirizzo = null;
			
			// Ottieni il parametro action dalla richiesta
			String action = request.getParameter("action");

			if (isNullOrEmpty(action)) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Pagamento.jsp");
				dispatcher.forward(request, response);

			}

			// Ottieni l'indirizzo dal OttieniIndirizzoControl
			try {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/OttieniIndirizzoControl");
				dispatcher.include(request, response);

				// Ottieni l'indirizzo dall'attributo della richiesta
				indirizzo = (String) request.getAttribute("indirizzo");

				if (indirizzo == null) {
					throw new ServletException("Errore nel recupero dell'indirizzo.");
				}

			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}

			// Recupera la carta da OttieniCartaControl
			try {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/OttieniCartaControl");
				dispatcher.include(request, response);

				// Ottieni la carta dall'attributo della richiesta
				carta = (Carta) request.getAttribute("carta");

				if (carta == null) {
					throw new ServletException("Errore nel recupero della carta.");
				}

			} catch (ServletException | IOException e) {
				// Gestione dell'eccezione nel dispatch
				e.printStackTrace();
			}

			 // Calcola il prezzo totale del carrello
			HashMap<Prodotto, Integer> prodotti = carrello.getProdotti();
			float prezzoTotale = 0;

			if (!prodotti.isEmpty()) {
				 // Itera sui prodotti nel carrello
				for (Map.Entry<Prodotto, Integer> entry : prodotti.entrySet()) {
					Prodotto prodotto = entry.getKey();
					int quantita = entry.getValue();
					float Iva = prodotto.getIva();
					float prezzoScontato = (prodotto.getPrezzo() / 100 * (100 - prodotto.getSconto()));
					if (prodotto.getSconto() > 0) {
						prezzoTotale += (prezzoScontato + (prezzoScontato / 100 * Iva)) * quantita;
					} else {
						prezzoTotale += (prodotto.getPrezzo() + (prodotto.getPrezzo() / 100 * Iva)) * quantita;
					}
				}

				// Aggiungi il costo di spedizione se viene selezionata la spedizione premium
				String shippingOption = request.getParameter("shippingOption");
				if ("premium".equals(shippingOption)) {
					prezzoTotale += 6.90;
				}

				// Recupera altri parametri della richiesta
				String giftPackaging = request.getParameter("giftPackaging");
				boolean isGiftPackagingSelected = Boolean.parseBoolean(giftPackaging);
				String courierNotes = request.getParameter("courierNotes");
				String destinatario = utente.getNome() + " " + utente.getCognome();
				GregorianCalendar dataOrdine = new GregorianCalendar();
				dataOrdine.setTimeInMillis(System.currentTimeMillis());

				// Crea un nuovo ordine
				Ordine ordineFit = new Ordine(prezzoTotale, destinatario, indirizzo, courierNotes, shippingOption,
						dataOrdine, carta.getCircuito(), isGiftPackagingSelected, carta.getNumeroCarta(),
						utente.getUsername());

				ordineModel.saveOrdine(ordineFit);
				ordineFit.setId(ordineModel.maxIdUser(utente.getUsername()).getId());

				// Itera di nuovo sui prodotti per salvare i dettagli dell'ordine
				for (Map.Entry<Prodotto, Integer> entry : prodotti.entrySet()) {
					Prodotto prodotto = entry.getKey();
					String idProdotto = prodotto.getId();
					int quantita = entry.getValue();
					float Iva = prodotto.getIva();
					float prezzoScontato = (prodotto.getPrezzo() / 100 * (100 - prodotto.getSconto()));
					float prezzo = (prodotto.getSconto() > 0)
							? (prezzoScontato + (prezzoScontato / 100 * Iva)) * quantita
							: (prodotto.getPrezzo() + (prodotto.getPrezzo() / 100 * Iva)) * quantita;
					;
					
					// Salva la composizione dell'ordine
					Composizione comp = new Composizione(ordineFit.getId(), idProdotto, prezzo, quantita, Iva, prodotto.getSconto());
					composizioneModel.saveComposizione(comp);
					
					// Aggiorna la quantità del prodotto nel database
					prodottoModel.updateQuantity(prodotto.getDisponibilita() - quantita, idProdotto);
				}

				carrello.svuotaCarrello();

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AcquistoCompletato.jsp");
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			System.out.println("Errore SQL: " + e.getMessage());
			response.sendRedirect("404.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
}
