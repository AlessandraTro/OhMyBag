package it.ohmybag.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ImmagineModel;

import java.sql.SQLException;

@WebServlet("/ButtonSetCover")
public class ButtonSetCover extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static ImmagineModel immagineModel;

    static {
        immagineModel = new ImmagineModel();
    }

    public ButtonSetCover() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String coverImage = request.getParameter("coverImage");
        Prodotto product = (Prodotto) request.getSession().getAttribute("ProdottoDaModificare");

        try {
            immagineModel.setCoverImage(product.getId(), coverImage);
            request.getSession().setAttribute("productImages", immagineModel.doRetrieveByProductId(product.getId())); // Carica solo le immagini del prodotto richiesto
            request.setAttribute("updateStatus", "success"); // Imposta lo stato dell'aggiornamento

        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
            response.sendRedirect("404.jsp"); // Va alla pagina di errore 
            return;
        }

        // Usa forward invece di sendRedirect per mantenere gli attributi
        request.getRequestDispatcher("AdminModificaProdotto.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
