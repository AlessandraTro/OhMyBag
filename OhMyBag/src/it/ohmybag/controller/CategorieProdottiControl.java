package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
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

@WebServlet("/CategorieProdottiControl")
public class CategorieProdottiControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static ProdottoModel prodottoModel;
    static ImmagineModel immagineModel;

    static {
        prodottoModel = new ProdottoModel();
        immagineModel = new ImmagineModel();
    }

    public CategorieProdottiControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String categoria = request.getParameter("categoria");
        System.out.println("CATEGORIA"+categoria);
        String tipo = request.getParameter("tipo");
        int idCategoria = 0;

        if (categoria == null || tipo == null) {
            response.sendRedirect("404.jsp");
            return;
        }

        switch (categoria) {
            case "Donna":
                idCategoria = 1;
                break;
            case "Uomo":
                idCategoria = 2;
                break;
            default:
                idCategoria = 3;
                break;
        }

        try {
            Collection<Prodotto> products;
            if (!categoria.isEmpty() && tipo.isEmpty()) {
                products = prodottoModel.allCategoryProduct(idCategoria);
            } else {
                products = prodottoModel.allTypologyProduct(idCategoria, tipo);
            }

            Collection<Immagine> images = immagineModel.doRetrieveAll();

            int productsPerPage = 8; // Numero di prodotti per pagina
	        int totalProducts = products.size(); // Numero totale di prodotti
	        System.out.println("numero"+totalProducts);

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
            e.printStackTrace();
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
