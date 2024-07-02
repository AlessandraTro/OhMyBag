package it.ohmybag.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;
import it.ohmybag.utility.CriptoCard;

@WebServlet("/AddCreditCardControl")
public class AddCreditCardControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static CartaModel cartaModel;
    static Utente utente;
    static LinkedList<Carta> carte;

    public AddCreditCardControl() {
        cartaModel = new CartaModel();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("checkCard".equals(action)) {
            checkCardExists(request, response);
        }else if("addCard".equals(action)){
            addCreditCard(request, response);
            
        }
    }

    private void addCreditCard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numerocarta = request.getParameter("NumeroCarta");
        String cvvParam = request.getParameter("CVV");
        String dataScadenzaParam = request.getParameter("DataScadenza");
        String circuito = request.getParameter("circuito");

        if (numerocarta == null || cvvParam == null || dataScadenzaParam == null || circuito == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
            return;
        }

        int cvv = Integer.parseInt(cvvParam);
        GregorianCalendar dataScadenza = new GregorianCalendar();
        SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM");

        Utente utente = (Utente) request.getSession().getAttribute("utente");

        if (utente == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }

        try {
            dataScadenza.setTime(formatoData.parse(dataScadenzaParam));
        } catch (ParseException e) {
            System.out.println("Error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format");
            return;
        }

     // Crittografa solo le prime 12 cifre del numero di carta usando la nuova classe CriptoCard
        String numeroCartaCriptato = CriptoCard.encryptFirstNDigits(numerocarta, 15);
        
        Carta carta = new Carta();
        carta.setCircuito(circuito);
        carta.setCvv(cvv);
        carta.setDataScadenza(dataScadenza);
        //carta.setNumeroCarta(numerocarta);
        carta.setNumeroCarta(numeroCartaCriptato + numerocarta.substring(15)); // Salva le prime 12 cifre crittografate + ultime 4 in chiaro
        carta.setUsername(utente.getUsername());

        try {
            cartaModel.saveCreditCard(carta);
            carte=(LinkedList<Carta>)cartaModel.retriveCardByUsername(utente.getUsername());
            request.getSession().setAttribute("Carte", carte);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error saving credit card");
            return;
        }

        response.sendRedirect("PaginaUtente.jsp#aggiungi-carta");
    }

    private void checkCardExists(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numerocarta = request.getParameter("NumeroCarta");
        Utente utente = (Utente) request.getSession().getAttribute("utente");
        

        if (utente == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }
     // Crittografa solo le prime 12 cifre del numero di carta usando la nuova classe CriptoCard
        String numeroCartaCriptato = CriptoCard.encryptFirstNDigits(numerocarta, 15);
        boolean cardExists = false;
        try {
            cardExists = cartaModel.checkCardExists(numeroCartaCriptato+ numerocarta.substring(15), utente.getUsername());
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error checking credit card");
            return;
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"exists\": " + cardExists + "}");
    }
}
