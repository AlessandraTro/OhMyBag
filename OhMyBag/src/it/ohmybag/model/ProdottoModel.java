package it.ohmybag.model;

import java.sql.*;
import java.util.*;

import it.ohmybag.bean.*;
import it.ohmybag.model.*;

public class ProdottoModel {
	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
	}

	/* permette di salvare un nuovo Prodotto all'interno del database */
	public synchronized void saveProduct(Prodotto prodotto) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		/* Sringa con Query */
		String insertSQL = "INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			conn = getConnection();/* creo la connessione con il database */
			statement = conn.prepareStatement(insertSQL);/* creo lo statement per poter comunicare con il database */

			statement.setString(1, prodotto.getId());
			statement.setString(2, prodotto.getMarca());
			statement.setString(3, prodotto.getNome());
			statement.setFloat(4, prodotto.getPrezzo());
			statement.setString(5, prodotto.getTipologia());
			statement.setInt(6, prodotto.getIdCategoria());
			statement.setString(7, prodotto.getDescrizione());
			statement.setInt(8, prodotto.getAnnoCollezione());

			java.sql.Date data = new java.sql.Date(prodotto.getDataInserimento().getTimeInMillis());
			statement.setDate(9, data);

			statement.setInt(10, prodotto.getSconto());
			statement.setInt(11, prodotto.getDisponibilita());
			statement.setInt(12, prodotto.getIva());

			statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/* Permette di eliminare dal database il prodotto con un determinato ID */
	public synchronized boolean deleteProduct(String idProdotto) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		int result = 0;

		String deleteSQL = "DELETE FROM Prodotto WHERE ID=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(deleteSQL);

			statement.setString(1, idProdotto);

			result = statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
		return result != 0;
	}

	/*
	 * permette di applicare lo sconto ai prodotti di una determinata categoria es.
	 * uomo donna o viaggio
	 */
	public synchronized void updateDiscountCategory(int sconto, int categoria) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		String updateSQL = "update Prodotto set Sconto=? where IDCategoria=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(updateSQL);

			statement.setInt(1, sconto);
			statement.setInt(2, categoria);

			statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/*
	 * permette di applicare lo sconto ai prodotti di un determinato AnnoCollezione
	 */
	public synchronized void updateDiscountYearCollection(int sconto, int AnnoCollezione) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		String updateSQL = "update Prodotto set Sconto=? where AnnoCollezione=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(updateSQL);

			statement.setInt(1, sconto);
			statement.setInt(2, AnnoCollezione);

			statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/*
	 * permette di applicare lo scnto ai prodotti di una determinata tipologia es.
	 * Zaini, accessori, ecc.
	 */
	public synchronized void updateDiscountTipology(int sconto, String tipologia) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		String updateSQL = "update Prodotto set Sconto=? where Tipologia=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(updateSQL);

			statement.setInt(1, sconto);
			statement.setString(2, tipologia);

			statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/*
	 * permette di applicare lo sconto ai prodotti di una determinata tipologia in
	 * una determinata categoria es. Borse in Donna, Accessori in uomo, ecc.
	 */
	public synchronized void updateDiscountTOC(int sconto, int categoria, String tipologia) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		String updateSQL = "update Prodotto set Sconto=? where Tipologia=? && IDCategoria=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(updateSQL);

			statement.setInt(1, sconto);
			statement.setString(2, tipologia);
			statement.setInt(3, categoria);

			statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/* permette di aggiornare il prezzo di un determinato prodotto */
	public synchronized void updateChangePrice(String id, float prezzo) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		String updateSQL = "update Prodotto set Prezzo=? where ID=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(updateSQL);

			statement.setFloat(1, prezzo);
			statement.setString(2, id);

			statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/* permette di aggiornare la quantità di un determinato prodotto */
	public synchronized void updateQuantity(int disponibilita, String id) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		String updateSQL = "update Prodotto set Disponibilita=? where ID=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(updateSQL);

			statement.setInt(1, disponibilita);
			statement.setString(2, id);

			statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/* permette di aggiornare la descrizione di un determinato prodotto */
	public synchronized void updateDescription(String id, String descrizione) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		String updateSQL = "update Prodotto set Descrizione=? where ID=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(updateSQL);

			statement.setString(1, descrizione);
			statement.setString(2, id);

			statement.executeUpdate();
			System.out.println("sono nella query id:" + id + "descrizione: " + descrizione);
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/*
	 * permette di aggiornare i prezzo, lo sconto, la quantità, iva e la descrizione
	 * di un determinato prodotto
	 */
	public synchronized void updateProduct(String id, String descrizione, int disponibilita, int sconto, float prezzo,
			int iva) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		String updateSQL = "update Prodotto set Descrizione=?, Prezzo=?, Disponibilita=?, Iva=?, Sconto=? where ID=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(updateSQL);

			statement.setString(1, descrizione);
			statement.setFloat(2, prezzo);
			statement.setInt(3, disponibilita);
			statement.setInt(4, iva);
			statement.setInt(5, sconto);
			statement.setString(6, id);

			statement.executeUpdate();
			// System.out.println("sono nella query id:"+id+"descrizione: "+descrizione);
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
	}

	/*
	 * ritorna tutti i prodotti che si trovano all'interno del database
	 * indipendentemente dalla quantita
	 */
	public synchronized Collection<Prodotto> adminAllProduct() throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		Collection<Prodotto> prodotti = new LinkedList<Prodotto>();

		String QuerySQL = "SELECT * FROM Prodotto";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(QuerySQL);

			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Prodotto bean = new Prodotto();

				bean.setId(rs.getString("ID"));
				bean.setMarca(rs.getString("Marca"));
				bean.setNome(rs.getString("Nome"));
				bean.setPrezzo(rs.getFloat("Prezzo"));
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setIdCategoria(rs.getInt("IDCategoria"));
				bean.setDescrizione(rs.getString("Descrizione"));
				bean.setAnnoCollezione(rs.getInt("AnnoCollezione"));

				java.sql.Date dataInserimentoSQL = rs.getDate("DataInserimento");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				bean.setDataInserimento(dataInserimento);

				bean.setSconto(rs.getInt("Sconto"));
				bean.setDisponibilita(rs.getInt("Disponibilita"));
				bean.setIva(rs.getInt("Iva"));

				prodotti.add(bean);
			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
		return prodotti;
	}

	/*
	 * ritorna tutti i prodotti che si trovano all'interno del database che non sono
	 * stati eliminati
	 */
	public synchronized Collection<Prodotto> allProduct() throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		Collection<Prodotto> prodotti = new LinkedList<Prodotto>();

		String QuerySQL = "SELECT * FROM Prodotto";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(QuerySQL);

			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Prodotto bean = new Prodotto();
				bean.setEliminato(rs.getBoolean("Eliminato"));
				if (!bean.isEliminato()) {// se il prodotto non è stato impostato come eliminato dall'admin
					bean.setId(rs.getString("ID"));
					bean.setMarca(rs.getString("Marca"));
					bean.setNome(rs.getString("Nome"));
					bean.setPrezzo(rs.getFloat("Prezzo"));
					bean.setTipologia(rs.getString("Tipologia"));
					bean.setIdCategoria(rs.getInt("IDCategoria"));
					bean.setDescrizione(rs.getString("Descrizione"));
					bean.setAnnoCollezione(rs.getInt("AnnoCollezione"));

					java.sql.Date dataInserimentoSQL = rs.getDate("DataInserimento");
					GregorianCalendar dataInserimento = new GregorianCalendar();
					dataInserimento.setTime(dataInserimentoSQL);
					bean.setDataInserimento(dataInserimento);

					bean.setSconto(rs.getInt("Sconto"));
					bean.setDisponibilita(rs.getInt("Disponibilita"));
					bean.setIva(rs.getInt("Iva"));

					prodotti.add(bean); // lo aggiungo alla lista
				}
			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
		return prodotti;
	}

	/*
	 * ritorna tutti i prodotti di una determinata categoria es. uomo, donna, viaggi
	 */
	public synchronized Collection<Prodotto> allCategoryProduct(int categoria) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		Collection<Prodotto> prodotti = new LinkedList<Prodotto>();

		String QuerySQL = "SELECT * FROM Prodotto WHERE IDCategoria=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(QuerySQL);
			statement.setInt(1, categoria);

			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Prodotto bean = new Prodotto();

				bean.setEliminato(rs.getBoolean("Eliminato"));
				if (!bean.isEliminato()) {// se il prodotto non è stato impostato come eliminato dall'admin
					bean.setId(rs.getString("ID"));
					bean.setMarca(rs.getString("Marca"));
					bean.setNome(rs.getString("Nome"));
					bean.setPrezzo(rs.getFloat("Prezzo"));
					bean.setTipologia(rs.getString("Tipologia"));
					bean.setIdCategoria(rs.getInt("IDCategoria"));
					bean.setDescrizione(rs.getString("Descrizione"));
					bean.setAnnoCollezione(rs.getInt("AnnoCollezione"));

					java.sql.Date dataInserimentoSQL = rs.getDate("DataInserimento");
					GregorianCalendar dataInserimento = new GregorianCalendar();
					dataInserimento.setTime(dataInserimentoSQL);
					bean.setDataInserimento(dataInserimento);

					bean.setSconto(rs.getInt("Sconto"));
					bean.setDisponibilita(rs.getInt("Disponibilita"));
					bean.setIva(rs.getInt("Iva"));

					prodotti.add(bean);
				}
			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
		return prodotti;
	}

	/*
	 * ritorna tutti i prodotti di una determinata tipologia in una determinata
	 * categoria es. Zaini in donna, cinture in uomo, ecc.
	 */
	public synchronized Collection<Prodotto> allTypologyProduct(int categoria, String tipologia) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		Collection<Prodotto> prodotti = new LinkedList<>();

		String querySQL = "SELECT * FROM Prodotto WHERE Tipologia = ? AND IDCategoria = ?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			statement.setString(1, tipologia);
			statement.setInt(2, categoria);

			rs = statement.executeQuery();
			while (rs.next()) {
				Prodotto bean = new Prodotto();

				bean.setEliminato(rs.getBoolean("Eliminato"));
				if (!bean.isEliminato()) {// se il prodotto non è stato impostato come eliminato dall'admin
					bean.setId(rs.getString("ID"));
					bean.setMarca(rs.getString("Marca"));
					bean.setNome(rs.getString("Nome"));
					bean.setPrezzo(rs.getFloat("Prezzo"));
					bean.setTipologia(rs.getString("Tipologia"));
					bean.setIdCategoria(rs.getInt("IDCategoria"));
					bean.setDescrizione(rs.getString("Descrizione"));
					bean.setAnnoCollezione(rs.getInt("AnnoCollezione"));

					java.sql.Date dataInserimentoSQL = rs.getDate("DataInserimento");
					GregorianCalendar dataInserimento = new GregorianCalendar();
					dataInserimento.setTime(dataInserimentoSQL);
					bean.setDataInserimento(dataInserimento);

					bean.setSconto(rs.getInt("Sconto"));
					bean.setDisponibilita(rs.getInt("Disponibilita"));
					bean.setIva(rs.getInt("Iva"));

					prodotti.add(bean);
				}
			}
		} finally {
			// Chiusura delle risorse in ordine inverso di apertura
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return prodotti;
	}

	/* ritorna il prodotto con un determinato id */
	public synchronized Prodotto doRetrieveById(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		Prodotto bean = null; // Inizializzo il bean come null inizialmente

		String querySQL = "SELECT * FROM Prodotto WHERE ID=?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			statement.setString(1, id);

			ResultSet rs = statement.executeQuery();

			if (rs.next()) { // Controlla se ci sono risultati nel ResultSet
				bean = new Prodotto(); // Se ci sono risultati, inizializzo il bean
				bean.setId(rs.getString("ID"));
				bean.setMarca(rs.getString("Marca"));
				bean.setNome(rs.getString("Nome"));
				bean.setPrezzo(rs.getFloat("Prezzo"));
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setIdCategoria(rs.getInt("IDCategoria"));
				bean.setDescrizione(rs.getString("Descrizione"));
				bean.setAnnoCollezione(rs.getInt("AnnoCollezione"));

				java.sql.Date dataInserimentoSQL = rs.getDate("DataInserimento");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				bean.setDataInserimento(dataInserimento);

				bean.setSconto(rs.getInt("Sconto"));
				bean.setDisponibilita(rs.getInt("Disponibilita"));
				bean.setIva(rs.getInt("Iva"));

			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
		return bean; // Restituisce il bean, che potrebbe essere null se non ci sono risultati nel
						// ResultSet
	}
	//setta il valore 'eliminato' a true
	public void setProductAsDeleted(String id) {
		Connection conn = null;
		PreparedStatement statement = null;
		// Esegui l'update per impostare il campo "eliminato" a true
		String query = "UPDATE prodotto SET Eliminato = true WHERE id = ?";
		try {

			conn = getConnection();
			statement = conn.prepareStatement(query);

			statement.setString(1, id);
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//setta il valore 'eliminato' a false
	public void setProductAsRestored(String id) {
		Connection conn = null;
		PreparedStatement statement = null;
		// Esegui l'update per impostare il campo "eliminato" a true
		String query = "UPDATE prodotto SET Eliminato = false WHERE id = ?";
		try {

			conn = getConnection();
			statement = conn.prepareStatement(query);

			statement.setString(1, id);
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ritorna tutti i prodotti che non sono eliminati
	public synchronized Collection<Prodotto> adminFalseProduct() throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		Collection<Prodotto> prodotti = new LinkedList<Prodotto>();

		String QuerySQL = "SELECT * FROM prodotto WHERE Eliminato = false";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(QuerySQL);

			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Prodotto bean = new Prodotto();

				bean.setId(rs.getString("ID"));
				bean.setMarca(rs.getString("Marca"));
				bean.setNome(rs.getString("Nome"));
				bean.setPrezzo(rs.getFloat("Prezzo"));
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setIdCategoria(rs.getInt("IDCategoria"));
				bean.setDescrizione(rs.getString("Descrizione"));
				bean.setAnnoCollezione(rs.getInt("AnnoCollezione"));

				java.sql.Date dataInserimentoSQL = rs.getDate("DataInserimento");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				bean.setDataInserimento(dataInserimento);

				bean.setSconto(rs.getInt("Sconto"));
				bean.setDisponibilita(rs.getInt("Disponibilita"));
				bean.setIva(rs.getInt("Iva"));

				prodotti.add(bean);
			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
		return prodotti;
	}
	
	// ritorna tutti i prodotti che sono eliminati
	public synchronized Collection<Prodotto> adminTrueProduct() throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		Collection<Prodotto> prodotti = new LinkedList<>();

		String querySQL = "SELECT * FROM prodotto WHERE Eliminato = true";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				Prodotto bean = new Prodotto();
				bean.setId(rs.getString("ID"));
				bean.setMarca(rs.getString("Marca"));
				bean.setNome(rs.getString("Nome"));
				bean.setPrezzo(rs.getFloat("Prezzo"));
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setIdCategoria(rs.getInt("IDCategoria"));
				bean.setDescrizione(rs.getString("Descrizione"));
				bean.setAnnoCollezione(rs.getInt("AnnoCollezione"));

				java.sql.Date dataInserimentoSQL = rs.getDate("DataInserimento");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				bean.setDataInserimento(dataInserimento);

				bean.setSconto(rs.getInt("Sconto"));
				bean.setDisponibilita(rs.getInt("Disponibilita"));
				bean.setIva(rs.getInt("Iva"));

				prodotti.add(bean);
			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		}
		return prodotti;
	}

}