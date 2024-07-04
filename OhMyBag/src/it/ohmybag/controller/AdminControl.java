package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.*;
import it.ohmybag.bean.*;

/**
 * Servlet implementation class HomeControl
 */
@WebServlet("/AdminControl")
public class AdminControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	static UtenteModel utenteModel;
	static OrdineModel ordineModel;

	static {
		utenteModel = new UtenteModel();
		ordineModel = new OrdineModel();
	}

	public AdminControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pulsante = (String) request.getParameter("pulsante");

		if (pulsante.equals("Add")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/AdminAddProdotto.jsp");
			dispatcher.forward(request, response);
			return; // Termina qui per evitare ulteriori forward

		} else if (pulsante.equals("Ordini")) {
			try {
				Collection<Utente> utenti = utenteModel.getAllUtentiNoAdmin();
				Collection<Ordine> ordini = ordineModel.getAllOrdini();
				request.getSession().setAttribute("utenti", utenti);
				request.getSession().setAttribute("ordini", ordini);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/OrdiniAdmin.jsp");
			dispatcher.forward(request, response);
			return; // Termina qui per evitare ulteriori forward
		} else if (pulsante.equals("Utenti")) {
			try {
				Collection<Utente> utenti = utenteModel.getAllUtentiNoAdmin();
				request.getSession().setAttribute("utenti", utenti);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/UtentiAdmin.jsp");
			dispatcher.forward(request, response);
			return; // Termina qui per evitare ulteriori forward
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
