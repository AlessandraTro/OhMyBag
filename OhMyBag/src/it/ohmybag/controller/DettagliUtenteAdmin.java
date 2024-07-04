package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.UtenteModel;

@WebServlet("/DettagliUtenteAdmin")
public class DettagliUtenteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UtenteModel utente;

	static {
		utente = new UtenteModel();
	}

	public DettagliUtenteAdmin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("Username");
		
		try {
			
			request.getSession().setAttribute("UtenteSingolo", utente.getUserByUsername(username));
			
		} catch (SQLException e) {
            e.printStackTrace();
        }
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/InformazioniUtentiAdmin.jsp");
		dispatcher.forward(request, response);

	}

	// Nel caso si utilizza post la servelt funzionerà ugualmente
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response); // Richiama la doGet
	}

}