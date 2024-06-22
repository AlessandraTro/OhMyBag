package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Ordine;
import it.ohmybag.bean.Utente;
import it.ohmybag.model.OrdineModel;
import it.ohmybag.model.UtenteModel;

@WebServlet("/OrdiniAdminControl")
public class OrdiniAdminControl extends HttpServlet {

    private static final long serialVersionUID = 1L;

    static UtenteModel utenteModel;
    static OrdineModel ordineModel;

    static {
        utenteModel = new UtenteModel();
        ordineModel = new OrdineModel();
    }

    public OrdiniAdminControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        Collection<Ordine> ordini = null;
        Collection<Utente> utenti = null;

        try {
            utenti = utenteModel.getAllUtentiNoAdmin();

            if (username != null && !username.isEmpty()) {
                if (startDateStr != null && !startDateStr.isEmpty() && endDateStr != null && !endDateStr.isEmpty()) {
                    java.util.Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
                    java.util.Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
                    ordini = ordineModel.getOrdiniByUsernameAndDateRange(username, startDate, endDate);
                } else {
                    ordini = ordineModel.getOrdiniByUsername(username);
                }
            } else if (startDateStr != null && !startDateStr.isEmpty() && endDateStr != null && !endDateStr.isEmpty()) {
                java.util.Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
                java.util.Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
                ordini = ordineModel.getOrdiniByDateRange(startDate, endDate);
            } else {
                ordini = ordineModel.getAllOrdini();
            }

            request.getSession().setAttribute("utenti", utenti);
            request.getSession().setAttribute("ordini", ordini);
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        response.sendRedirect("OrdiniAdmin.jsp");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
