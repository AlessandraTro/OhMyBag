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
    
    private boolean isNullOrEmpty(String param) {
        return param == null || param.trim().isEmpty();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("Inizio doGet");

            Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");
            Utente utente = (Utente) request.getSession().getAttribute("utente");
            Carta carta = null;
            String indirizzo = null;
            System.out.println("Carrello: " + carrello);
            System.out.println("Utente: " + utente);
      
      
   String action = request.getParameter("action");
    	    
    	    if (isNullOrEmpty(action)) {
    	    	System.out.println("cioooooooo ");
    	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Pagamento.jsp");
    	        dispatcher.forward(request, response);
    	        
    	       }
                
    	    // Ottieni l'indirizzo dal OttieniIndirizzoController
            try {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/OttieniIndirizzoControl");
                dispatcher.include(request, response);

                // Ottieni l'indirizzo dall'attributo della richiesta
                indirizzo = (String) request.getAttribute("indirizzo");
                System.out.println("Indirizzo: " + indirizzo);
                
                if (indirizzo == null) {
                    System.out.println("Errore: indirizzo è null");
                    throw new ServletException("Errore nel recupero dell'indirizzo.");
                }
                
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }


                try {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/OttieniCartaControl");
                    dispatcher.include(request, response);

                    // Ottieni la carta dall'attributo della richiesta
                    carta = (Carta) request.getAttribute("carta");
                    System.out.println("carta: " + carta);
                    
                    if (carta == null) {
                        System.out.println("Errore: carta è null");
                        throw new ServletException("Errore nel recupero della carta.");
                    }
                 
                } catch (ServletException | IOException e) {
                    // Gestione dell'eccezione nel dispatch
                    e.printStackTrace();
                }
                
                
                
              
                HashMap<Prodotto, Integer> prodotti = carrello.getProdotti();
                float prezzoTotale = 0;
                System.out.println("Prodotti nel carrello: " + prodotti);

                if (!prodotti.isEmpty()) {
                    System.out.println("Calcolo prezzo totale");

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
                    System.out.println("Prezzo totale: " + prezzoTotale);
                    	
                    String shippingOption = request.getParameter("shippingOption");
                    if ("premium".equals(shippingOption)) {
                        prezzoTotale += 6.90;
                    }
                    System.out.println("Tipo di spedizione selezionato: " + shippingOption);
         
                    String giftPackaging = request.getParameter("giftPackaging");
                    boolean isGiftPackagingSelected = Boolean.parseBoolean(giftPackaging);
                    
                    String courierNotes = request.getParameter("courierNotes");

                   


                    String destinatario = utente.getNome() + " " + utente.getCognome();
                    GregorianCalendar dataOrdine = new GregorianCalendar();
                    dataOrdine.setTimeInMillis(System.currentTimeMillis());
                    
                    
                  
                    System.out.println("Tipo di spedizione selezionato: " + shippingOption);

                    Ordine ordineFit = new Ordine(prezzoTotale, destinatario, indirizzo,
                    		courierNotes, shippingOption,  dataOrdine, carta.getCircuito(), isGiftPackagingSelected, carta.getNumeroCarta(), utente.getUsername());

                    System.out.println("Ordine da salvare: " + ordineFit);
                    ordineModel.saveOrdine(ordineFit);
                    ordineFit.setId(ordineModel.maxIdUser(utente.getUsername()).getId());
                    System.out.println("Ordine salvato con ID: " + ordineFit.getId());

                    for (Map.Entry<Prodotto, Integer> entry : prodotti.entrySet()) {
                        Prodotto prodotto = entry.getKey();
                        String idProdotto = prodotto.getId();
                        int quantita = entry.getValue();
                        float Iva = prodotto.getIva();
                        float prezzoScontato = (prodotto.getPrezzo() / 100 * (100 - prodotto.getSconto()));
                        float prezzo = (prodotto.getSconto() > 0)
                                ? (prezzoScontato + (prezzoScontato / 100 * Iva)) * quantita
                                : (prodotto.getPrezzo() + (prodotto.getPrezzo() / 100 * Iva)) * quantita;

                        Composizione comp = new Composizione(ordineFit.getId(), idProdotto, prezzo, quantita, Iva);
                        composizioneModel.saveComposizione(comp);
                        prodottoModel.updateQuantity(prodotto.getDisponibilita() - quantita, idProdotto);
                        System.out.println("Composizione salvata e quantità prodotto aggiornata");
                    }

                    carrello.svuotaCarrello();
                    System.out.println("Carrello svuotato");
                 
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AcquistoCompletato.jsp");
                    dispatcher.forward(request, response);
                    System.out.println("Richiesta inoltrata a AcquistoCompletato.jsp");
                }
                
                
               

            
        } catch (Exception e) {
            System.out.println("Errore SQL: " + e.getMessage());
            response.sendRedirect("404.jsp");
        } 

     
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
        System.out.println("doPost chiamato doGet");
    }
}
