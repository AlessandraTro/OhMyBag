package it.ohmybag.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import it.ohmybag.model.GiocoModel;
import it.ohmybag.model.ImmagineModel;
import it.ohmybag.model.OrdineModel;*/

/**
 * Servlet implementation class HomeControl
 */
@WebServlet("/HomeControl")
public class HomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*static ProductModel giocoModel;
	static ImmagineModel immagineModel;

	static {
		immagineModel = new ImmagineModel();
		giocoModel = new GiocoModel();
		}*/

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//try {
			/* setta l'attributo products che conterrà tutti i giochi contenuti nel DB */
			//request.getSession().setAttribute("products", prodottoModel.doRetrieveAll());
			
			 /*setta l'attributo ImageList che conterrà tutte le immagini dei giochi contenuti nel DB*/
			//request.getSession().setAttribute("ImageList", immagineModel.doRetrieveAll());
			
			
		/*} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());

		}*/

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
