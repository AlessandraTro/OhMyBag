 package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.model.*;
import it.ohmybag.bean.*;

/**
 * Servlet implementation class HomeControl
 */
@WebServlet("/AdminControl")
public class AdminControl extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottiModel;

	static {

		prodottiModel=new ProdottoModel();
	}

	public AdminControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action= request.getParameter("action");
		String parametro = (String) request.getParameter("ID");
		
		try {
			if(action != null) {
				switch(action.toLowerCase()){
					case ("delete"):
						prodottiModel.deleteProduct(parametro);
						System.out.println("Eliminato");
						request.getSession().setAttribute("products", prodottiModel.allProduct());
						break;
					case ("detail"):
						Prodotto prodotto=prodottiModel.doRetrieveById(parametro);
						String descrizione=prodotto.getDescrizione();
						request.setAttribute("descrizione",descrizione);
						break;
					case ("moddesc"):
						prodottiModel.updateDescription(parametro,request.getParameter("modDescrizione"));
						request.getSession().setAttribute("products", prodottiModel.allProduct());
						System.out.println("Aggiornato");
						break;
				}
			}
				

		} catch (SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
