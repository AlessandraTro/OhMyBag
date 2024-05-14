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
	    	try {
	    		utenteModel.UpdatePassword(email, password);
	    		request.setAttribute("newPassword", true);
	    	}catch(Exception e){
	    		System.out.println("Error: "+e.getMessage());
	    	}
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
            dispatcher.forward(request, response);
	    }else {
	    	response.sendRedirect("ForgotPassword.jsp");
	    }
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		doGet(request,response);
	}
}
