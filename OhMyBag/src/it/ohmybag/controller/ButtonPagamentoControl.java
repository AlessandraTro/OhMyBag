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
import it.ohmybag.bean.Carta;
import it.ohmybag.bean.Composizione;
import it.ohmybag.bean.Ordine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.bean.Utente;
import it.ohmybag.model.*;

@WebServlet("/ButtonPagamentoControl")
public class ButtonPagamentoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static ComposizioneModel composizioneModel;
	static OrdineModel ordineModel;
	static ProdottoModel prodottoModel;
	static {
		composizioneModel=new ComposizioneModel();
		ordineModel = new OrdineModel();
		prodottoModel=new ProdottoModel();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("sono fuori1");
		try {
			Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
			Utente utente = (Utente) request.getSession().getAttribute("utente");
			//Ordine ordine = (Ordine) request.getSession().getAttribute("ordine");
			//Carta carta = (Carta) request.getSession().getAttribute("carta");
			
			
			//Ordine ordine = ordineModel.maxIdUser(utente.getUsername());
			/*if (ordine != null) {
			    System.out.println("Id ordine= " + ordine.getId());
			    int idOrdine = ordine.getId();*/
			    HashMap<Prodotto, Integer> prodotti = carrello.getProdotti();
				float prezzo=0;
				System.out.println("sono fuori");
				if (!prodotti.isEmpty()) {
					System.out.println("sono dentro");
					Iterator<Map.Entry<Prodotto, Integer>> iterator = prodotti.entrySet().iterator();
					while (iterator.hasNext()) {
						Map.Entry<Prodotto, Integer> entry = iterator.next();
						Prodotto prodotto = entry.getKey();
						String idProdotto = prodotto.getId();
						int quantita = (int) prodotti.get(prodotto);
						float Iva = prodotto.getIva();
						float prezzoScontato=(prodotto.getPrezzo()/100*(100-prodotto.getSconto()));
						if (prodotto.getSconto() > 0) {
							prezzo = (prezzoScontato+(prezzoScontato/100*Iva))*quantita; // prezzo a cui applico sconto e iva e moltiplico per la
																						// quantità
						}else {
							prezzo = (prodotto.getPrezzo()+(prodotto.getPrezzo()/100*Iva))*quantita; // prezzo a cui applico solo l'iva e moltiplico per la quantità
						}
						System.out.println(utente.getNome()); //prova
						Ordine ordineFit= new Ordine(prezzo,utente.getNome(), "Mastercad", utente.getIndirizzoSpedizione(),"dd","Standard", utente.getDataDiNascita(),"Mastercad",false,"dadada",utente.getUsername());
						ordineModel.saveOrdine(ordineFit);
						ordineFit.setId(ordineModel.maxIdUser(utente.getUsername()).getId());
						Composizione comp=new Composizione(ordineFit.getId(), idProdotto, prezzo, quantita, Iva);
						System.out.println(ordineFit.getId());  //prova
						composizioneModel.saveComposizione(comp);
						prodottoModel.updateQuantity(prodotto.getDisponibilita()-quantita, idProdotto);
					}
					carrello.svuotaCarrello();
				}

			/*} else {
			    // Gestisci il caso in cui ordine è null
			    System.out.println("Nessun ordine trovato per l'utente 'otineb'");
			}*/
			
			
		} catch (SQLException e) {
			System.out.println("Errore SQL: " + e.getMessage());
			response.sendRedirect("pagina_errore.jsp");
			return; // Esce dal metodo dopo aver reindirizzato l'utente
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AcquistoCompletato.jsp");
		dispatcher.forward(request, response);
	}

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
