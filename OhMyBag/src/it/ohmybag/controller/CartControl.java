package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

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
public class CartControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottomodel;
	static Prodotto prodotto;
	static CartModel carrellomodel;
	static Carrello carrello;
	
	static {
		carrello=new Carrello();
		prodotto=new Prodotto();
		prodottomodel=new ProdottoModel();
		carrellomodel=new CartModel();
	}
	
	public CartControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String prodottoCart=request.getParameter("ID");
		try {
			prodotto=prodottomodel.doRetrieveById(prodottoCart);
			
			request.getSession().setAttribute("Carrello", prodotto);
			
		}catch(SQLException e){
			System.out.println("Errore"+ e.getMessage());
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
