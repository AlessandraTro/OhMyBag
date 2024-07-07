
package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Carta;
import it.ohmybag.bean.Utente;
import it.ohmybag.model.CartaModel;
import it.ohmybag.utility.CriptoCard;

@WebServlet("/OttieniCartaControl")
public class OttieniCartaControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CartaModel cartaModel = new CartaModel();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utente utente = (Utente) request.getSession().getAttribute("utente");

		if (utente != null) {
			try {
				// Ottiene le carte salvate dell'utente
				List<Carta> carteSalvate = cartaModel.getCarte(utente.getUsername());
				if (!carteSalvate.isEmpty()) {
					request.setAttribute("carteSalvate", carteSalvate);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("Errore nel recupero della carta dell'utente", e);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utente utente = (Utente) request.getSession().getAttribute("utente");

		if (utente != null) {
			String action = request.getParameter("action");
			if ("checkCard".equals(action)) {
				// Gestisce la verifica della carta
				String cardNumber = request.getParameter("NumeroCarta");
				String encryptedCardNumber = CriptoCard.encryptFirstNDigits(cardNumber, 15);

				try {
					boolean cartaEsiste = cartaModel.checkCardExists(encryptedCardNumber + cardNumber.substring(15),
							utente.getUsername());
					String jsonResponse = "{\"exists\": " + cartaEsiste + "}";
					response.setContentType("application/json");
					response.getWriter().write(jsonResponse);
				} catch (SQLException e) {
					e.printStackTrace();
					response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
							"Errore durante la verifica della carta.");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}

			// Gestisce il salvataggio della carta
			try {
				String selectedCardNumber = request.getParameter("savedCard");
				if (selectedCardNumber != null && !selectedCardNumber.isEmpty()) {

					// Se è stata selezionata una carta salvata
					Carta selectedCarta = cartaModel.getCartaByNumero(selectedCardNumber);
					request.setAttribute("carta", selectedCarta);
				} else {

					// Se si sta aggiungendo una nuova carta
					String circuito = request.getParameter("circuito");
					String cardNumber = request.getParameter("card-number");
					String expiryMonth = request.getParameter("expiry-month");
					String expiryYear = "20" + request.getParameter("expiry-year");
					String cvc = request.getParameter("cvc");

					if (circuito != null && cardNumber != null && expiryMonth != null && expiryYear != null
							&& cvc != null) {
						String encryptedCardNumber = CriptoCard.encryptFirstNDigits(cardNumber, 15);

						// Verifica se la carta esiste già
						boolean cartaEsiste = cartaModel.checkCardExists(encryptedCardNumber + cardNumber.substring(15),
								utente.getUsername());
						if (cartaEsiste) {
							throw new ServletException("La carta di credito è già associata al tuo account.");
						}

						// Crea un nuovo oggetto Carta
						Carta carta = new Carta();
						carta.setCircuito(circuito);
						carta.setNumeroCarta(encryptedCardNumber + cardNumber.substring(15));

						try {
							int cvv = Integer.parseInt(cvc);
							carta.setCvv(cvv);
						} catch (NumberFormatException e) {
							throw new ServletException("Il CVV deve essere un numero intero.", e);
						}
						int month = Integer.parseInt(expiryMonth) - 1;
						int year = Integer.parseInt(expiryYear);
						GregorianCalendar expiryDate = new GregorianCalendar(year, month, 1);
						carta.setDataScadenza(expiryDate);
						carta.setUsername(utente.getUsername());

						// Salva la nuova carta nel database
						cartaModel.saveCreditCard(carta);

						request.setAttribute("carta", carta);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("Errore durante il salvataggio o l'aggiornamento della carta", e);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}
