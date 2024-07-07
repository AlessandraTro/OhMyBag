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
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
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

	/*permette di eliminare un'immagine*/
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

	/*permette di prendere un'immagine dal database*/
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

	/*salva in una collection tutte le immagini nel database*/
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
                bean.setIdProdotto(rs.getString("idProdotto"));
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
	
	 /* Recupera le immagini di copertina dal database in base all'id del prodotto */
	public Immagine retrieveCatalogImagesById(String idProdotto) throws SQLException {
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        
	        Immagine catalogImages = new Immagine();
	        
	        // Query per recuperare le immagini di copertina dal database
	        String selectSQL = "SELECT * FROM Immagine WHERE copertina = true && IdProdotto = ?";

	        try {
	        	connection = getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setString(1, idProdotto);
				ResultSet rs = preparedStatement.executeQuery();

	            // Iterazione sui risultati per creare oggetti Immagine e aggiungerli alla lista
	            if (rs.next()) {
	            	catalogImages.setIdProdotto(rs.getString("idProdotto"));
	            	catalogImages.setNome(rs.getString("nome"));
	            	catalogImages.setCopertina(rs.getBoolean("copertina"));
	                
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
                bean.setIdProdotto(rs.getString("idProdotto"));
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
	
	/*imposta un'immagine come immagine di copertina*/
    public void setCoverImage(String idProdotto, String nomeImmagine) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String updateSQL = "UPDATE Immagine SET Copertina = ? WHERE IDProdotto = ?";

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(updateSQL);
            preparedStatement.setBoolean(1, false); // Imposta tutte le immagini come non copertina
            preparedStatement.setString(2, idProdotto);
            preparedStatement.executeUpdate();

            // Imposta l'immagine selezionata come copertina
            updateSQL = "UPDATE Immagine SET Copertina = ? WHERE IDProdotto = ? AND Nome = ?";
            preparedStatement = connection.prepareStatement(updateSQL);
            preparedStatement.setBoolean(1, true);
            preparedStatement.setString(2, idProdotto);
            preparedStatement.setString(3, nomeImmagine);
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
    
    /*permette di eliminare le immagini di un prodotto*/
    public void deleteImmaginiByProdottoId(String productId) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = getConnection();
            
            // Query SQL per eliminare le immagini
            String sql = "DELETE FROM immagine WHERE id_prodotto = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, productId);
            
            // Esegui la query di eliminazione
            stmt.executeUpdate();
            
        } finally {
            // Chiudi le risorse (statement e connessione)
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }


}


