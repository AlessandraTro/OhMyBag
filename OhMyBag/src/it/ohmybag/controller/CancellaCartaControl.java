package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Composizione;
import it.ohmybag.bean.Immagine;
import it.ohmybag.bean.Ordine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.bean.Utente;
import it.ohmybag.model.CartaModel;
import it.ohmybag.model.ComposizioneModel;
import it.ohmybag.model.ImmagineModel;
import it.ohmybag.model.OrdineModel;
import it.ohmybag.model.ProdottoModel;

@WebServlet("/CancellaCartaControl")
public class CancellaCartaControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static CartaModel cartaModel;

	static {
		cartaModel=new CartaModel();
	}

	public CancellaCartaControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("carta"));
		Utente utente=(Utente) request.getSession().getAttribute("utente");

		try {
			cartaModel.cancellaCarta(utente.getUsername(), id);
			request.getSession().setAttribute("Carte", cartaModel.retriveCardByUsername(utente.getUsername()));
			request.getSession().setAttribute("Alert", "Carta cancellata con successo");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    // Inoltra la richiesta alla pagina JSP corretta
		response.sendRedirect("PaginaUtente.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
