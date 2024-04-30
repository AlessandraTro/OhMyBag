package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;

@WebServlet("/CartControl")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottomodel;
	static Prodotto prodotto;
	static Immagine immagine;
	static ImmagineModel immagineModel;

	static {
		prodotto = new Prodotto();
		prodottomodel = new ProdottoModel();
		immagineModel = new ImmagineModel();

	}

	public CartControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idProdotto = request.getParameter("ID");
		try {
			prodotto = prodottomodel.doRetrieveById(idProdotto);
			immagine = (Immagine) immagineModel.retrieveCatalogImagesById(idProdotto);

			Collection<Prodotto> product = (Collection<Prodotto>) request.getSession().getAttribute("Carrello");
			Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("images");

			product.add(prodotto);
			images.add(immagine);

			request.getSession().setAttribute("Carrello", product);
			request.getSession().setAttribute("images", images);

			System.out.println("PRODOTTI CARRELLO" + product.size());

		} catch (SQLException e) {
			System.out.println("Errore" + e.getMessage());
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
