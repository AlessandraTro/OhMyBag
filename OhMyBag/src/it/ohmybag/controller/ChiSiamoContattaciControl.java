package it.ohmybag.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChiSiamoContattaciControl")
public class ChiSiamoContattaciControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static {
	}

	public ChiSiamoContattaciControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page=request.getParameter("page");
		if(page.equals("ChiSiamo")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ChiSiamo.jsp");
			dispatcher.forward(request, response);
		}else if(page.equals("Contattaci")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Contattaci.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendError(404);
		}

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
