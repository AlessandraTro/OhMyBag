package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Composizione;
import it.ohmybag.bean.Immagine;
import it.ohmybag.bean.Ordine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ComposizioneModel;
import it.ohmybag.model.ImmagineModel;
import it.ohmybag.model.OrdineModel;
import it.ohmybag.model.ProdottoModel;

@WebServlet("/DettagliOrdiniAdmin")
public class DettagliOrdini extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static OrdineModel ordineModel;
	static ComposizioneModel composizioneModel;
	static ProdottoModel prodottoModel;
	static ImmagineModel immagineModel;

	static {
		ordineModel = new OrdineModel();
		composizioneModel = new ComposizioneModel();
		prodottoModel = new ProdottoModel();
		immagineModel = new ImmagineModel();
	}

	public DettagliOrdini() {
		super();

	}

	// Funzione per ottenere le ultime 4 cifre del numero di carta
	public static String mascheraNumeroCarta(String numeroCartaDecodificato) {
		// Verifica che il numero di carta abbia almeno 4 cifre
		if (numeroCartaDecodificato != null && numeroCartaDecodificato.length() >= 4) {
			return "************" + numeroCartaDecodificato.substring(numeroCartaDecodificato.length() - 4);
		} else {
			return "Numero carta non valido";
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int codice = Integer.parseInt(request.getParameter("Codice"));
		String fattura = request.getParameter("Fattura");

		try {
			// Recupera l'ordine, la composizione dell'ordine, i prodotti e le immagini associate
			Ordine ordine = ordineModel.getOrdineById(codice);
			Collection<Composizione> composizione = composizioneModel.doRetrieveById(codice);
			Collection<Immagine> immaginiCopertina = new ArrayList();
			Collection<Prodotto> prodottiOrdine = new ArrayList();

			// Recupera ciascun prodotto e la rispettiva immagine di copertina per ogni composizione
			for (Composizione comp : composizione) {

				Prodotto prodotto = prodottoModel.doRetrieveById(comp.getIdProdotto());
				prodottiOrdine.add(prodotto);
				Immagine immagine = immagineModel.retrieveCatalogImagesById(comp.getIdProdotto());
				immaginiCopertina.add(immagine);
			}

			// Maschera il numero di carta
			String numeroCartaMascherato = mascheraNumeroCarta(ordine.getNumeroCarta());
			ordine.setNumeroCarta(numeroCartaMascherato); // Aggiorna l'ordine con il numero mascherato

			request.getSession().setAttribute("prodottiOrdine", prodottiOrdine);
			request.getSession().setAttribute("copertinaProdotto", immaginiCopertina);
			request.getSession().setAttribute("ordineSingolo", ordine);
			request.getSession().setAttribute("composizioneOrdine", composizione);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if ("Si".equals(fattura)) {
			// Se richiesta la fattura, reindirizza alla pagina Fattura.jsp
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Fattura.jsp");
			dispatcher.forward(request, response);
		} else {
			// Altrimenti, reindirizza alla pagina DettagliOrdine.jsp
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DettagliOrdine.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
