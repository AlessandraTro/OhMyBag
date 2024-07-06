package it.ohmybag.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import it.ohmybag.model.*;
import it.ohmybag.bean.*;

@WebServlet("/AdminAddProdottoControl")
@MultipartConfig
public class AdminAddProdottoControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static ProdottoModel prodottoModel;
	static CategoriaModel categoriaModel;
	static ImmagineModel immagineModel;
	static Prodotto prodotto;
	static {
		prodottoModel=new ProdottoModel();
		categoriaModel=new CategoriaModel();
		immagineModel=new ImmagineModel();
	}
	
	public AdminAddProdottoControl() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		String id=request.getParameter("ID");
		String nome=request.getParameter("Nome");
		float prezzo=Float.parseFloat(request.getParameter("Prezzo"));
		int iva=Integer.parseInt(request.getParameter("Iva"));
		int sconto=Integer.parseInt(request.getParameter("Sconto"));
		String marca=request.getParameter("Marca");
		int categoria=Integer.parseInt(request.getParameter("Categoria"));
		String tipologia=request.getParameter("tipologie");
		String descrizione=request.getParameter("Descrizione");
		int annoCollezione=Integer.parseInt(request.getParameter("AnnoCollezione"));
		int disponibilita=Integer.parseInt(request.getParameter("Disponibilita"));
		
		System.out.println("immagine= "+request.getParameter("imgCopertina"));
		
		System.out.println("ID: "+id);
		
		prodotto= new Prodotto(id,marca,nome,prezzo,tipologia, categoria, descrizione, annoCollezione, iva);
		prodotto.setDisponibilita(disponibilita);
		prodotto.setSconto(sconto);
		
		try {
			prodottoModel.saveProduct(prodotto);
			aggiuntaImmagine(request, response);
		}catch(Exception e) {
			System.out.println("Errore: "+e.getMessage());
		}
		
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/AdminAddProdotto.jsp");
        dispatcher.forward(request, response);
	}
	

	private void aggiuntaImmagine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NumberFormatException, SQLException {
	    String applicationPath = request.getServletContext().getRealPath("");
	    String savePath = applicationPath + File.separator + "img" + File.separator + "prodotti";
	    String categoria = categoriaModel.getCategoria(Integer.parseInt(request.getParameter("Categoria"))).getNome();
	    Immagine immagine;
	    String fileName = null;
	    String fileNameCop = null;

	    // Gestione dell'immagine di copertina
	    Part imgCopertinaPart = request.getPart("imgCopertina");
	    if (imgCopertinaPart != null) {
	        fileNameCop = imgCopertinaPart.getSubmittedFileName();
	        if (fileNameCop != null && !fileNameCop.isEmpty()) {
	            String imageSavePath = savePath + File.separator + categoria + File.separator + request.getParameter("tipologie") + File.separator +
	                    request.getParameter("Marca") + File.separator + request.getParameter("Nome") + File.separator + fileNameCop;

	            saveImageToFileSystem(imgCopertinaPart, imageSavePath);

	            immagine = new Immagine("img/prodotti" + "/" + categoria + "/" + request.getParameter("tipologie") + "/" +
	                    request.getParameter("Marca") + "/" + request.getParameter("Nome") + "/" + fileNameCop, true, request.getParameter("ID"));
	            immagineModel.saveImage(immagine);
	        }
	    }

	    // Gestione delle altre immagini
	    for (Part part : request.getParts()) {
	        fileName = part.getSubmittedFileName();
	        if (fileName != null && !fileName.isEmpty() && !fileName.equals(fileNameCop)) {
	            String imageSavePath = savePath + File.separator + categoria + File.separator + request.getParameter("tipologie") + File.separator +
	                    request.getParameter("Marca") + File.separator + request.getParameter("Nome") + File.separator + fileName;

	            saveImageToFileSystem(part, imageSavePath);

	            immagine = new Immagine("img/prodotti" + "/" + categoria + "/" + request.getParameter("tipologie") + "/" +
	                    request.getParameter("Marca") + "/" + request.getParameter("Nome") + "/" + fileName, false, request.getParameter("ID"));
	            immagineModel.saveImage(immagine);
	        }
	    }

	    response.getWriter().println("Upload completato con successo!");
	}

	private void saveImageToFileSystem(Part part, String imageSavePath) throws IOException {
	    File file = new File(imageSavePath);
	    file.getParentFile().mkdirs();
	    part.write(imageSavePath);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		doGet(request,response);
	}
}
