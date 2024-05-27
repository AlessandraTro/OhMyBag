package it.ohmybag.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import it.ohmybag.bean.Categoria;
import it.ohmybag.bean.Immagine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ImmagineModel;

@WebServlet("/ButtonAddImage")
@MultipartConfig
public class ButtonAddImage extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static ImmagineModel immagineModel;

	static {
		immagineModel = new ImmagineModel();
	}

	public ButtonAddImage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String applicationPath = request.getServletContext().getRealPath("");
		String savePath = applicationPath + File.separator + "img" + File.separator + "prodotti";

		Prodotto product = (Prodotto) request.getSession().getAttribute("ProdottoDaModificare");
		Categoria categoria = (Categoria) request.getSession().getAttribute("categoria");
		
		
		String productId = product.getId();

		try {
			Collection<Immagine> images = (Collection<Immagine>) immagineModel.doRetrieveByProductId(productId);
			for (Part part : request.getParts()) {
				String fileName = extractFileName(part);
				if (fileName != null && !fileName.isEmpty()) {
					String filePath = savePath + File.separator + categoria.getNome() + File.separator
							+ product.getTipologia() + File.separator + product.getMarca() + File.separator
							+ product.getNome() + File.separator + fileName;

					// Create directories if they do not exist
					File file = new File(filePath);
					file.getParentFile().mkdirs();

					part.write(filePath);

					// Save the image information in the database
					Immagine newImage = new Immagine();
					newImage.setNome("img/prodotti" + "/" + categoria.getNome() + "/" + product.getTipologia() + "/"
							+ product.getMarca() + "/" + product.getNome() + "/" + fileName);

					newImage.setIdProdotto(productId);
					
					boolean trovato = false;
					for (Immagine img : images) {
						if (img.getNome().equals(newImage.getNome())) {
							trovato = true;
							System.out.println("Immagine già presente nel database");
						}
					}
					if (!trovato) {
						immagineModel.saveImage(newImage);
						System.out.println("Percorso immagine salvato: " + newImage.getNome());
					}

				}
			}

			request.getSession().setAttribute("images", immagineModel.doRetrieveByProductId(product.getId())); 

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
					"Errore nell'aggiunta delle immagini: " + e.getMessage());
			return;
		} catch (IOException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
					"Errore nella scrittura del file: " + e.getMessage());
			return;
		}

		response.sendRedirect("AdminModificaProdotto.jsp"); // Redirect to the product modification page
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
