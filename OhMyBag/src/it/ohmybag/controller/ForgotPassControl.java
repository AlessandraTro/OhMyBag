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

@WebServlet("/ForgotPassControl")
public class ForgotPassControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static UtenteModel utenteModel;
	
	static {
		utenteModel=new UtenteModel();
	}
	
	public ForgotPassControl() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String newPassword=request.getParameter("action");
	    
	    if(newPassword!=null && newPassword!="") {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String hashPassword=CriptoPassword.toHash(password);
	        
	    	try {
	    		
                // Verifica se la password recuperata corrisponde alla password hashata nel database
	    		if(utenteModel.RetrievePassword(email).equals(hashPassword)) {
	    			// Imposta l'attributo per indicare che la vecchia password corrisponde
	    			request.setAttribute("oldPassword", true);
	    			
		            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ForgotPassword.jsp");
		            dispatcher.forward(request, response);
		            return;
	    		}else {
		    		utenteModel.UpdatePassword(email, hashPassword); // Aggiorna la password nel database con quella nuova
		    		request.setAttribute("newPassword", true);
	    		}
	    		
	    		// Reindirizza a Login.jsp dopo l'aggiornamento della password
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
	            dispatcher.forward(request, response);
	    	}catch(Exception e){
	    		System.out.println("Error: "+e.getMessage());
	    	}

	    }else {
	    	response.sendRedirect("ForgotPassword.jsp");
	    }
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		doGet(request,response);
	}
}
