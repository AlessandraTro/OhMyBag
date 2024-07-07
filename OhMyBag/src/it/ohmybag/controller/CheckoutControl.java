package it.ohmybag.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckoutControl")
public class CheckoutControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");

        if (isLoggedIn != null && isLoggedIn) {
            // Se l'utente è loggato, reindirizza alla pagina di pagamento
        	 RequestDispatcher dispatcher = request.getRequestDispatcher("Pagamento.jsp");
        	    dispatcher.forward(request, response);
        } else {
            // Se l'utente non loggato, reindirizza alla pagina di login
            response.sendRedirect("LoginControl");
        }
    } 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}