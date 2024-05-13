package it.ohmybag.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Utente;
import it.ohmybag.model.UtenteModel;

@WebServlet("/RegistrazioneControl")
public class RegistrazioneControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static UtenteModel utenteModel;

	static {

		utenteModel = new UtenteModel();

	}

	public RegistrazioneControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("email");
		String password = request.getParameter("password");
		String nome = request.getParameter("inputNome");
		String cognome = request.getParameter("inputCognome");
		String cf = request.getParameter("cf");
		String email = request.getParameter("email");
		String indirizzoSpedizione = request.getParameter("indirizzo");
		String telefono = request.getParameter("phone");
		GregorianCalendar dataNascita = new GregorianCalendar();
		SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM-dd");

		//controllo sul formato della data
		try {
			dataNascita.setTime(formatoData.parse(request.getParameter("data")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			Utente utente = new Utente(username, password, nome, cognome, cf, email, indirizzoSpedizione, telefono,
					dataNascita, false);

			utenteModel.saveUtente(utente);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("Homepage.jsp");  //nuova pagina con avviso registrazione avvenuta con successo
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}


