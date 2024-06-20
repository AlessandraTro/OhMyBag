package it.ohmybag.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;

@WebServlet("/AddCreditCardControl")
public class AddCreditCardControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static CartaModel cartaModel;
    static Utente utente;

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

        Carta carta = new Carta();
        carta.setCircuito(circuito);
        carta.setCvv(cvv);
        carta.setDataScadenza(dataScadenza);
        carta.setNumeroCarta(numerocarta);
        carta.setUsername(utente.getUsername());

        try {
            cartaModel.saveCreditCard(carta);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error saving credit card");
            return;
        }

        response.sendRedirect("PaginaUtente.jsp");
    }

    private void checkCardExists(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numerocarta = request.getParameter("NumeroCarta");
        Utente utente = (Utente) request.getSession().getAttribute("utente");

        if (utente == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }

        boolean cardExists = false;
        try {
            cardExists = cartaModel.checkCardExists(numerocarta, utente.getUsername());
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error checking credit card");
            return;
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"exists\": " + cardExists + "}");
    }
}
