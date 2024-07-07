package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Collection;

import it.ohmybag.bean.Utente;
import it.ohmybag.model.CartaModel;
import it.ohmybag.model.OrdineModel;
import it.ohmybag.model.ProdottoModel;
import it.ohmybag.model.UtenteModel;

@WebServlet("/OttieniIndirizzoControl")
public class OttieniIndirizzoControl extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static OrdineModel ordineModel = new OrdineModel();
    private static UtenteModel utenteModel = new UtenteModel();
  
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Utente utente = (Utente) request.getSession().getAttribute("utente");
           
            
            if (utente != null) {
                // Recupera gli indirizzi salvati per l'utente
            List<String> indirizzi  =  ordineModel.getIndirizziSpedizioneByUsername(utente.getUsername());
                request.setAttribute("indirizzi", indirizzi);
            } else {
                throw new ServletException("Utente non valido, impossibile recuperare gli indirizzi.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Errore nel recupero degli indirizzi di spedizione dell'utente", e);
        }
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Utente utente = (Utente) request.getSession().getAttribute("utente");
            
            if (utente != null) {
                // Leggi l'indirizzo scelto dall'utente
                String indirizzo;
                
                String indirizzoSelezionato = request.getParameter("savedAddress");
                
                
                if (indirizzoSelezionato != null && !indirizzoSelezionato.isEmpty()) {
                    // Imposta l'indirizzo selezionato dall'utente
                    utente.setIndirizzoSpedizione(indirizzoSelezionato);
                    request.setAttribute("indirizzo", indirizzoSelezionato);
                
                
                } else {
                    indirizzo = request.getParameter("address") + ", " +
                                request.getParameter("city") + ", " +
                                request.getParameter("country") + ", " +
                                request.getParameter("zip");

                    // Aggiorna l'indirizzo dell'utente
                    request.setAttribute("indirizzo", indirizzo);
                  
                }
            } else {
                throw new ServletException("Utente non valido, impossibile salvare l'indirizzo.");
            }
       
        
} finally {
    // Chiudi eventuali risorse aperte, se necessario
    // Esegui pulizie o rilascia risorse
}
        }
    
    
    
    
    
    
    
    
    
    
    }
