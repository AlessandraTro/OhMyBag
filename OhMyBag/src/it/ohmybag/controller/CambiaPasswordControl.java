package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;
import it.ohmybag.utility.CriptoPassword;

@WebServlet("/CambiaPasswordControl")
public class CambiaPasswordControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static UtenteModel utenteModel;
	static Utente utente;

	static {
		utenteModel = new UtenteModel();
	}

	public CambiaPasswordControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String passwordNuova=request.getParameter("password");
		utente=(Utente) request.getSession().getAttribute("utente");
		String hashPassword=CriptoPassword.toHash(passwordNuova); // Crea l'hash della nuova password
		
		try {
			utenteModel.UpdatePassword(utente.getEmail(), hashPassword); // Aggiorna la password dell'utente nel database
			utente.setPassword(hashPassword);  // Imposta la nuova password nell'oggetto utente
			request.getSession().invalidate(); // Invalida la sessione corrente
			request.getSession().setAttribute("utente", utente);
			request.getSession().setAttribute("Alert", "Password cambiata con successo");
		}catch(Exception e) {
			System.out.println("Errore:"+e.getMessage());
		}
		// Inoltra la richiesta al controllo degli ordini utente
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrdiniUtenteControl");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

