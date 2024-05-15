/*package it.ohmybag.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;

@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static UtenteModel utenteModel;
	
	static {
		utenteModel=new UtenteModel();
	}
	
	public LoginControl() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    
	    String action = request.getParameter("action");
	    
	    if (action == null || action.equals("")) {
	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
	        dispatcher.forward(request, response);
	        
	    } else if (action.equalsIgnoreCase("login")) {
	        Utente utente = null;
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        try {
	            utente = utenteModel.RetriveByEmailPassword(email, password);
	            
	        } catch (Exception e) {
	            System.out.println("Errore= " + e.getMessage());
	            utente = null;
	        }
	        
	        if (utente.getUsername() == null) { // se si inseriscono le credenziali sbagliate, si mostra il messaggio di errore nella pagina
	        	
	            request.setAttribute("loginError", true);
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
	            dispatcher.forward(request, response);
	            return;
	        } else {
	            request.getSession().setAttribute("utente", utente); // set dell'attributo utente nella sessione 
	            response.sendRedirect("Homepage.jsp");
	        }
	    }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		doGet(request,response);
	}
}*/
package it.ohmybag.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;
import it.ohmybag.utility.CriptoPassword;

@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static UtenteModel utenteModel;
	
	static {
		utenteModel=new UtenteModel();
	}
	
	public LoginControl() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    
	    String action = request.getParameter("action");
	    
	    if (action == null || action.equals("")) {
	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
	        dispatcher.forward(request, response);
	        
	    } else if (action.equalsIgnoreCase("login")) {
	        Utente utente = null;
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        try {
	            utente = utenteModel.RetriveByEmailPassword(email);
	            
	        } catch (Exception e) {
	            System.out.println("Errore= " + e.getMessage());
	            utente = null;
	        }
	        
	        if (utente.getUsername() == null) { // se si inseriscono le credenziali sbagliate, si mostra il messaggio di errore nella pagina
	        	
	            request.setAttribute("loginError", true);
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
	            dispatcher.forward(request, response);
	            return;
	        } else {
	        	
	        	System.out.println("password data base: " + utente.getPassword());
	        	
	        	String hashPassword=CriptoPassword.toHash(password);
	        	System.out.println("password inviata criptografata: " + hashPassword);

	        	
	        	System.out.println(utente.getPassword().equals(hashPassword));
	        	if (utente.getPassword().equals(hashPassword)) {
                    // Le password corrispondono, l'utente può accedere
                    request.getSession().setAttribute("utente", utente);
                    response.sendRedirect("Homepage.jsp");
                } else {
                    // Le password non corrispondono, mostra un messaggio di errore
                    request.setAttribute("loginError", true);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
                    dispatcher.forward(request, response);
                }
	           
	        }
	    }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		doGet(request,response);
	}
}
