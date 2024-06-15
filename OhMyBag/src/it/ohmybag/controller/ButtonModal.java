package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.ImmagineModel;

@WebServlet("/ButtonModal")
public class ButtonModal extends HttpServlet{

	private static final long serialVersionUID = 1L;
	static ImmagineModel immagineModel;

	static {
		immagineModel = new ImmagineModel();
	}

	public ButtonModal() {
		super();

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		        String pulsante = request.getParameter("Pulsante");
		        String page;

		        switch (pulsante) {
		            case "Delete":
		                page = "DeleteImage.jsp";
		                break;
		            case "Add":
		                page = "AddImage.jsp";
		                break;
		            case "Copertina":
		                page = "Copertina.jsp";
		                break;
		            default:
		                page = "404.jsp";
		                break;
		        }

		        request.getRequestDispatcher(page).forward(request, response);
		    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
