package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.UtenteModel;

@WebServlet("/EmailControl")
public class EmailControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static UtenteModel utenteModel;
	
	static {

		utenteModel = new UtenteModel();

	}

	public EmailControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");

		try {
			boolean emailCheck = (boolean) utenteModel.checkIfEmailExists(email);
			response.getWriter().print(emailCheck);
			
		} catch (SQLException e) {
			// Gestisci l'eccezione SQL
	        e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    doGet(request, response);
	}

}
