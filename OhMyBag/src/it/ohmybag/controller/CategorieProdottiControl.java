package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

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
        // Ottenere i parametri dalla richiesta che indicano la categoria e il tipo di prodotto
        String categoria = request.getParameter("categoria");
        String tipo = request.getParameter("tipo");
        int idCategoria=0;

        // Se la categoria e il tipo sono nulli, reindirizza alla pagina di errore
        if (categoria == null || tipo == null) {
            response.sendRedirect("404.jsp");
            return;
        }
        if(categoria.equals("Donna")) {
        	idCategoria=01;
        }else if(categoria.equals("Uomo")) {
        	idCategoria=02;
        }else {
        	idCategoria=03;
        }

        // Passare i prodotti selezionati alla pagina JSP per la visualizzazione
        try {
        	if(categoria!=null && tipo.equals("")) {
        		request.setAttribute("products", prodottoModel.allCategoryProduct(idCategoria));
        	}else {
    			request.setAttribute("products", prodottoModel.allTypologyProduct(idCategoria, tipo));
        	}
			request.setAttribute("ImageList", immagineModel.doRetrieveAll());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.getRequestDispatcher("Catalogo.jsp").forward(request, response);
    }
}
