package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;

/*import it.ohmybag.model.GiocoModel;
import it.ohmybag.model.ImmagineModel;
import it.ohmybag.model.OrdineModel;*/

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
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("ID");

		try {
			prodottiModel.deleteProduct(id);
			request.getSession().setAttribute("produtcs", prodottiModel.allProduct());

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
