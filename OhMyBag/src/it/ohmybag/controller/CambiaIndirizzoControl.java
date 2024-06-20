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

@WebServlet("/CambiaIndirizzoControl")
public class CambiaIndirizzoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static UtenteModel utenteModel;
	static Utente utente;

	static {
		utenteModel = new UtenteModel();
	}

	public CambiaIndirizzoControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String provincia=request.getParameter("Provincia");
		String citta=request.getParameter("Citta");
		String via=request.getParameter("Via");
		String cap=request.getParameter("CAP");
		
		String Indirizzo=via+","+citta+","+provincia+","+cap;
		utente=(Utente) request.getSession().getAttribute("utente");
		utente.setIndirizzoSpedizione(Indirizzo);
		try {
			utenteModel.UpdateUtente(utente);
			request.getSession().invalidate();
			request.getSession().setAttribute("utente", utente);
		}catch(Exception e) {
			System.out.println("Errore:"+e.getMessage());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PaginaUtente.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

