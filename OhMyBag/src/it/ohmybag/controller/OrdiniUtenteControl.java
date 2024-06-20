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

@WebServlet("/OrdiniUtenteControl")
public class OrdiniUtenteControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static OrdineModel ordineModel;
	static Ordine ordine;
	static Utente utente;

	static {
		ordineModel = new OrdineModel();
	}

	public OrdiniUtenteControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		utente=(Utente)request.getSession().getAttribute("utente");
		try {
			request.getSession().setAttribute("OrdiniUtente", ordineModel.getOrdiniByUsername(utente.getUsername()));
		}catch(Exception e) {
			System.out.println("Error:"+e.getMessage());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PaginaUtente.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
