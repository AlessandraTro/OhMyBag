package it.ohmybag.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ButtonRegistrazioneControl")
public class ButtonRegistrazioneControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ButtonRegistrazioneControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PaginaRegistrazione.jsp");
		dispatcher.forward(request, response);

	}

	// Nel caso si utilizza post la servelt funzionerà ugualmente
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response); // Richiama la doGet
	}

}