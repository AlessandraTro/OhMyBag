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

@WebServlet("/ModificaDatiControl")
public class ModificaDatiControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static UtenteModel utenteModel;
	static Utente utente;

	static {
		utenteModel = new UtenteModel();
	}

	public ModificaDatiControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		utente=(Utente)request.getSession().getAttribute("utente");
		try {
			utente.setNome(request.getParameter("Nome"));
			utente.setCognome(request.getParameter("Cognome"));
			utente.setTelefono(request.getParameter("Telefono"));
			utente.setEmail(request.getParameter("Email"));
			utente.setUsername(request.getParameter("Email"));
			
			utenteModel.UpdateUtente(utente);
			request.getSession().invalidate();
			request.getSession().setAttribute("utente", utente);
			request.getSession().setAttribute("Alert", "Dati modificati con successo");
		}catch(Exception e) {
			System.out.println("Error:"+e.getMessage());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrdiniUtenteControl");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

