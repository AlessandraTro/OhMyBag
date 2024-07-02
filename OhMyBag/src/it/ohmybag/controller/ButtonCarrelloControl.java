package it.ohmybag.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Carrello;


@WebServlet("/ButtonCarrelloControl")
public class ButtonCarrelloControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ButtonCarrelloControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Carrello cart = (Carrello) request.getSession().getAttribute("Carrello");
		if (cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("Carrello", cart);
//			request.getSession().setAttribute("pagina", 1);
			request.getSession().setAttribute("carts", 1);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
