package it.ohmybag.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.*;
import it.ohmybag.bean.*;

@WebServlet("/AdminAddProdottoControl")
public class AdminAddProdottoControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottoModel;
	static Prodotto prodotto;
	static {
		prodottoModel=new ProdottoModel();
	}
	
	public AdminAddProdottoControl() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		String id=request.getParameter("ID");
		String nome=request.getParameter("Nome");
		float prezzo=Float.parseFloat(request.getParameter("Prezzo"));
		int iva=Integer.parseInt(request.getParameter("Iva"));
		int sconto=Integer.parseInt(request.getParameter("Sconto"));
		String marca=request.getParameter("Marca");
		int categoria=Integer.parseInt(request.getParameter("Categoria"));
		String tipologia=request.getParameter("tipologie");
		String descrizione=request.getParameter("Descrizione");
		int annoCollezione=Integer.parseInt(request.getParameter("AnnoCollezione"));
		int disponibilita=Integer.parseInt(request.getParameter("Disponibilita"));
		
		System.out.println("immagine= "+request.getParameter("imgCopertina"));
		
		System.out.println("ID: "+id);
		
		prodotto= new Prodotto(id,marca,nome,prezzo,tipologia, categoria, descrizione, annoCollezione, iva);
		prodotto.setDisponibilita(disponibilita);
		prodotto.setSconto(sconto);
		
		try {
			prodottoModel.saveProduct(prodotto);
		}catch(Exception e) {
			System.out.println("Errore: "+e.getMessage());
		}
		
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminAddProdotto.jsp");
        dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		doGet(request,response);
	}
}
