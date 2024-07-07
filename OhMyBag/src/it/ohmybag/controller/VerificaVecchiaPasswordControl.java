package it.ohmybag.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import it.ohmybag.bean.Utente;
import it.ohmybag.model.UtenteModel;
import it.ohmybag.utility.CriptoPassword;

@WebServlet("/VerificaVecchiaPasswordControl")
public class VerificaVecchiaPasswordControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtenteModel utenteModel;

	public VerificaVecchiaPasswordControl() {
		super();
		utenteModel = new UtenteModel();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utente utente = (Utente) request.getSession().getAttribute("utente");

		// Recupera la password inserita dall'utente e la converte in has
		String vecchiaPassword = request.getParameter("PasswordVecchia");
		String hashPassword = CriptoPassword.toHash(vecchiaPassword);

		// Controlla se l'utente è autenticato
		if (utente == null) {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401 Unauthorized
			return;
		}

		boolean matchAvvenuto = false;
		// Verifica se la password fornita corrisponde alla vecchia password dell'utente
		if (utente.getPassword().equals(hashPassword)) {
			matchAvvenuto = true;
		} else {
			matchAvvenuto = false;
		}

		// Restituisce la risposta in formato JSON
		response.setContentType("application/json");
		response.getWriter().write("{\"exists\": " + matchAvvenuto + "}");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
