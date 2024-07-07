package it.ohmybag.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.ohmybag.bean.Immagine;
import it.ohmybag.bean.Prodotto;
import it.ohmybag.model.ImmagineModel;

@WebServlet("/ButtonDeleteImage")
public class ButtonDeleteImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ImmagineModel immagineModel;

	static {
		immagineModel = new ImmagineModel();
	}

	public ButtonDeleteImage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Prodotto product = (Prodotto) request.getSession().getAttribute("ProdottoDaModificare");
		// Recupera i percorsi delle immagini da eliminare
		String[] imagePaths = request.getParameterValues("imagePath"); // Nella JSP, deleteImage prende un array di
																		// stringhe che sono i path delle immagini

		try {
			// Elimina ogni immagine specificata
			for (String imagePath : imagePaths) {;

				String realImagePath = getServletContext().getRealPath(imagePath);

				File imageFile = new File(realImagePath);

				// Verifica se il file esiste ed è un file, quindi lo elimina
				if (imageFile.exists() && imageFile.isFile()) {
					boolean fileDeleted = imageFile.delete();
					if (fileDeleted) {
						System.out.println("Immagine eliminata con successo: " + imagePath);
					} else {
						System.out.println("Errore durante l'eliminazione dell'immagine: " + imagePath);
					}
				} else {
					System.out.println("Immagine non trovata: " + imagePath);
				}

				// Elimina il riferimento dal database
				boolean risultatoEliminazioneImg = immagineModel.deleteImage(imagePath);
				System.out.println("Risultato eliminazione immagine dal database: " + risultatoEliminazioneImg);
			}

			// Recupera l'elenco aggiornato delle immagini del prodotto
			Collection<Immagine> updatedImages = immagineModel.doRetrieveByProductId(product.getId());
			request.getSession().setAttribute("productImages", updatedImages);// Carica solo le immagini del prodotto
																				// richiesto

		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("admin/AdminModificaProdotto.jsp"); // Redirigi alla pagina di modifica del prodotto
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
