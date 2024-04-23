package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
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

@WebServlet("/DettagliControl")
public class DettagliControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottoModel;
	static ImmagineModel immagineModel;

	static {
		 immagineModel = new ImmagineModel();
		 prodottoModel = new ProdottoModel();
		}

      
   /**
    * @see HttpServlet#HttpServlet()
    */
   public DettagliControl() {
       super();
       // TODO Auto-generated constructor stub
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String productId = request.getParameter("id");
	    try {
	        // Carica solo il prodotto richiesto tramite l'ID
	        Prodotto product = prodottoModel.doRetrieveById(productId);  // Da vedere come si chiama la funzione
	        // Carica solo le immagini del prodotto richiesto
	        Collection<Immagine> images = immagineModel.doRetrieveByProductId(productId);
	        
	        if (product != null) {
	            // Se il prodotto viene trovato, inoltra la richiesta alla pagina di dettaglio del prodotto
	            request.setAttribute("product", product);
	            request.setAttribute("images", images);
	            // Inoltra la richiesta alla pagina JSP dei dettagli del prodotto
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Dettagli.jsp");
	            dispatcher.forward(request, response);
	        } else {
	            // Se il prodotto non viene trovato, reindirizza alla homepage
	            response.sendRedirect(request.getContextPath() + "/Homepage.jsp");
	        }
	    } catch (SQLException e) {
	        // Gestisci l'eccezione SQL
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "Errore durante il recupero del prodotto");
	        // Reindirizza alla homepage in caso di errore
	        response.sendRedirect(request.getContextPath() + "/Homepage.jsp");
	    }
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
