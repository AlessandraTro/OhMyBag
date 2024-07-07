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

import it.ohmybag.bean.Immagine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ImmagineModel;
import it.ohmybag.model.ProdottoModel;

/**
 * Servlet implementation class HomeControl
 */
@WebServlet("/HomeControl")
public class HomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottoModel;
	static ImmagineModel immagineModel;

	static {
		 immagineModel = new ImmagineModel();
		 prodottoModel = new ProdottoModel();
		}
	
    public HomeControl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			/* setta l'attributo products che conterrà tutti i prodotti contenuti nel DB */
			request.getSession().setAttribute("products", prodottoModel.allProduct()); // Ottiene tutti i prodotti dal database
			
			/*setta l'attributo ImageList che conterrà tutte le immagini dei prodotti contenuti nel DB*/
			request.getSession().setAttribute("ImageList", immagineModel.doRetrieveAll()); // Ottiene tutte le immagini dal database
		  
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
