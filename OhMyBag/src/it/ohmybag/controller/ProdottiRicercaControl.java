package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ImmagineModel;

@WebServlet("/ProdottiRicercaControl")
public class ProdottiRicercaControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ImmagineModel immagineModel;

	static {
		immagineModel = new ImmagineModel();
	}

	public ProdottiRicercaControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");

	    // Retrieve search field parameter
	    String searchField = request.getParameter("searchField");
	    System.out.println("searchField" + searchField);
	    Collection<Prodotto> prodotti = (Collection<Prodotto>) request.getSession().getAttribute("products");
	    ArrayList<Prodotto> filteredProducts = new ArrayList<>();

	    // Filter products based on searchField
	    if (searchField != null && !searchField.trim().isEmpty()) {
	        for (Prodotto prodotto : prodotti) {
	            if (prodotto.getNome().toLowerCase().startsWith(searchField.toLowerCase())) {
	                filteredProducts.add(prodotto);
	    	    	System.out.println("Nome Prodotto"+prodotto.getNome());

	            }
	        }
	    } else {
	        filteredProducts.addAll(prodotti);
	    }

	    // Retrieve images for products
	    try {
	        request.setAttribute("ImageList", immagineModel.doRetrieveAll());
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider handling this exception more gracefully
	    }

	    // Pagination setup
	    int productsPerPage = 8; // Number of products per page
	    int totalProducts = filteredProducts.size(); // Total number of products after filtering
	    int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage); // Calculate total pages

	    int currentPage = 1; // Default page
	    String pageParam = request.getParameter("page");
	    System.out.println("PAGE PRODOTTI" +pageParam);
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

	    // Calcola quali prodotti mostrare sulla pagina corrente
	    int startIndex = (currentPage - 1) * productsPerPage;
	    List<Prodotto> productsForPage = filteredProducts.stream()
	            .skip(startIndex)
	            .limit(productsPerPage)
	            .collect(Collectors.toList());

	    System.out.println("currentPage2" +currentPage);

	    // Set attributes for JSP rendering
	    request.setAttribute("productPage", productsForPage);
	    request.setAttribute("totalPages", totalPages);
	    request.getSession().setAttribute("currentPage", currentPage);
	    request.getSession().setAttribute("searchField", searchField);


	    // Check if request is AJAX or not
	    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProdottiCatalogo.jsp");
	        dispatcher.include(request, response);
	    } else {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/Catalogo.jsp");
	        dispatcher.forward(request, response);
	    }

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
