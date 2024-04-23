package it.ohmybag.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import it.ohmybag.bean.Immagine;

public class ImmagineModel {

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/OhMyBag?useSSL=false", "root", "root");
	}

	/**
	 * Inserisce un'immagine
	 * 
	 * @param Immagine image L'oggetto Immagine da aggiungere
	 */

	// Salva una immagine nel database
	public void saveImage(Immagine image) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO Immagine (Nome,Copertina, IDProdotto) VALUES (?, ?, ?)";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, image.getNome());
			preparedStatement.setBoolean(2, image.isCopertina());
			preparedStatement.setString(3, image.getIdProdotto());

			preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	/**
	 * Elimina immagine
	 * 
	 * @param String path Il percorso dell'immagine da eliminare
	 * 
	 * @return boolean True se l'immagine è stata eliminata False altrimenti
	 */
	public boolean deleteImage(String path) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM Immagine WHERE Nome = ? ";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, path);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	/**
	 * Restituisce un'immagine
	 * 
	 * @param String path Il percorso dell'immagine da prelevare
	 * 
	 * @return Immagine L'immagine prelevata
	 */
	public Immagine getImage(String path) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Immagine bean = new Immagine();

		String selectSQL = "SELECT * FROM Immagine WHERE Nome = ? ";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, path);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setNome(rs.getString("Nome"));
				bean.setCopertina(rs.getBoolean("Copertina"));
				bean.setIdProdotto(rs.getString("IDProdotto"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return bean;

	}

	/**
	 * Preleva tutte le immagini salvate
	 * 
	 * @return Collection<Immagine> Tutte le immagini salvate
	 */
	public Collection<Immagine> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Immagine> images = new LinkedList<Immagine>();

		String selectSQL = "SELECT *  FROM Immagine";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Immagine bean = new Immagine();

				bean.setNome(rs.getString("Nome"));
				bean.setCopertina(rs.getBoolean("Copertina"));
				bean.setIdProdotto(rs.getString("IDProdotto"));

				images.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return images;

	}

    /* Recupera le immagini di copertina dal database */
	public Collection<Immagine> retrieveCatalogImages() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        Collection<Immagine> catalogImages = new LinkedList<Immagine>();
        
        // Query per recuperare le immagini di copertina dal database
        String selectSQL = "SELECT * FROM Immagine WHERE copertina = true";

        try {
        	connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

            // Iterazione sui risultati per creare oggetti Immagine e aggiungerli alla lista
            while (rs.next()) {
                Immagine bean = new Immagine();
                bean.setIdProdotto(rs.getString("id"));
                bean.setNome(rs.getString("nome"));
                bean.setCopertina(rs.getBoolean("copertina"));

                catalogImages.add(bean);
            }
        } finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

        return catalogImages;
    }
	
	/* Recupera le immagini di un prodotto dal database */
	public Collection<Immagine> doRetrieveByProductId(String idProdotto) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        Collection<Immagine> images = new LinkedList<Immagine>();
        
        // Query per recuperare le immagini di un prodotto dal database
        String selectSQL = "SELECT * FROM Immagine WHERE IdProdotto = ?";

        try {
        	connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, idProdotto);

			ResultSet rs = preparedStatement.executeQuery();

            // Iterazione sui risultati per creare oggetti Immagine e aggiungerli alla lista
            while (rs.next()) {
                Immagine bean = new Immagine();
                bean.setIdProdotto(rs.getString("id"));
                bean.setNome(rs.getString("nome"));
                bean.setCopertina(rs.getBoolean("copertina"));

                images.add(bean);
            }
        } finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

        return images;
    }
}
