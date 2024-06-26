package it.ohmybag.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Prodotto;

@WebServlet("/BarraDiRicerca")
public class BarraDiRicerca extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BarraDiRicerca() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String searchField = request.getParameter("searchField");
        if (searchField != null && !searchField.trim().isEmpty()) {
            Collection<Prodotto> prodotti = (Collection<Prodotto>) request.getSession().getAttribute("products");
            ArrayList<Prodotto> matchProduct = new ArrayList<Prodotto>();

            if (prodotti != null) {
                for (Prodotto prodotto : prodotti) {
                    if (prodotto.getNome().toLowerCase().startsWith(searchField.toLowerCase())) {
                        matchProduct.add(prodotto);
                    }
                }
            }

            StringBuilder json = new StringBuilder();
            json.append("[");
            for (Prodotto prodotto : matchProduct) {
                json.append("{")
                    .append("\"nome\":\"").append(prodotto.getNome()).append("\",")
                    .append("\"id\":\"").append(prodotto.getId()).append("\"")
                    .append("},");
            }
            if (!matchProduct.isEmpty()) {
                json.deleteCharAt(json.length() - 1);
            }
            json.append("]");

            response.getWriter().print(json.toString());
        } else {
            response.getWriter().print("[]");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
