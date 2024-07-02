package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

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
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		try {
	        Collection<Prodotto> products = prodottoModel.allProduct();
	        Collection<Immagine> images = immagineModel.doRetrieveAll();

	        int productsPerPage = 8; // Numero di prodotti per pagina
	        int totalProducts = products.size(); // Numero totale di prodotti
	        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage); // Calcolo delle pagine

	        int currentPage = 1; // Pagina di default
	        String pageParam = request.getParameter("page");
		    System.out.println("PAGE catalog" +pageParam);

	        if (pageParam != null) {
	            try {
	                currentPage = Integer.parseInt(pageParam);
	                if (currentPage < 1 || currentPage > totalPages) {
	                    currentPage = 1; // Gestione del parametro pagina non valido
	                }
	            } catch (NumberFormatException e) {
	                currentPage = 1; // Gestione errore nel parametro della pagina
	            }
	        }

	        int startIndex = (currentPage - 1) * productsPerPage; // Indice iniziale dei prodotti per la pagina corrente
	        List<Prodotto> productsForPage = products.stream()
	                .skip(startIndex)
	                .limit(productsPerPage)
	                .collect(Collectors.toList());

	        request.setAttribute("productPage", productsForPage);
	        request.setAttribute("ImageList", images);
	        request.setAttribute("totalPages", totalPages);
	        request.getSession().setAttribute("currentPage", currentPage);

	        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProdottiCatalogo.jsp");
	            dispatcher.include(request, response);
	        } else {
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Catalogo.jsp");
	            dispatcher.forward(request, response);
	        }

	    } catch (SQLException e) {
	        System.out.println("Error:" + e.getMessage());
	    }
	}



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
