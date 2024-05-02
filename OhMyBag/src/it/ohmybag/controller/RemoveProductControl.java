package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Immagine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ImmagineModel;
import it.ohmybag.model.ProdottoModel;

@WebServlet("/RemoveProductControl")
public class RemoveProductControl extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public RemoveProductControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    Collection<Prodotto> product = (Collection<Prodotto>) request.getSession().getAttribute("Carrello");
	    String idProdotto = request.getParameter("ID");
	    
	    if (product != null) {
	        Iterator<Prodotto> iterator = product.iterator();
	        while (iterator.hasNext()) {
	            Prodotto prodotto = iterator.next();
	            if (prodotto.getId().equals(idProdotto)) {
	                iterator.remove();
	                break; // Esci dal ciclo dopo aver rimosso l'elemento
	            }
	        }
	    }
	    
	    request.getSession().setAttribute("Carrello", product);
	    response.sendRedirect("Carrello.jsp");
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
