package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.ImmagineModel;
import it.ohmybag.model.ProdottoModel;

@WebServlet("/CatalogoControl")
public class CatalogoControl extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	static ProdottoModel prodottoModel;
	static ImmagineModel immagineModel;

	static {
		 immagineModel = new ImmagineModel();
		 prodottoModel = new ProdottoModel();
		}
	
	public CatalogoControl() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
			/* setta l'attributo products che conterrà tutti i prodotti contenuti nel DB */
			request.setAttribute("products", prodottoModel.allProduct());
		    // Ottieni tutti i prodotti dal database
			
			/*setta l'attributo ImageList che conterrà tutte le immagini dei prodotti contenuti nel DB*/
			request.setAttribute("ImageList", immagineModel.doRetrieveAll());
		  
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

	
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Catalogo.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
