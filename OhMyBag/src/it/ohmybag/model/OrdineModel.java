package it.ohmybag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.GregorianCalendar;

import it.ohmybag.bean.Ordine;
import it.ohmybag.bean.Prodotto;

public class OrdineModel {
	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
	}

	/* permette di creare un nuovo ordine */
	public synchronized void saveOrdine(Ordine ordine) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		/* Sringa con Query */
		String insertSQL = "INSERT INTO Ordine (PrezzoTotale, Destinatario,  IndirizzoDiSpedizione, NoteCorriere, MetodoDiSpedizione, NumeroTracking, Data, Circuito, ConfezioneRegalo, NumeroCarta, Username) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

		try {
			conn = getConnection();/* creo la connessione con il database */
			statement = conn.prepareStatement(insertSQL);/* creo lo statement per poter comunicare con il database */

			statement.setFloat(1, ordine.getPrezzoTotale());
			statement.setString(2, ordine.getDestinatario());
			statement.setString(3, ordine.getIndirizzoSpedizione());
			statement.setString(4, ordine.getNoteCorriere());
			statement.setString(5, ordine.getMetodoDiSpedizione());
			statement.setString(6, ordine.getNumeroTracking());

			java.sql.Date data = new java.sql.Date(ordine.getData().getTimeInMillis());
			statement.setDate(7, data);

			statement.setString(8, ordine.getCircuito());
			statement.setBoolean(9, ordine.isConfezioneRegalo());
			statement.setString(10, ordine.getNumeroCarta());
			statement.setString(11, ordine.getUsername());

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

	/* permette di creare un nuovo ordine da modificare successivamente */
	public synchronized void saveOrdineEmpty(String username) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		/* Sringa con Query */
		String insertSQL = "INSERT INTO Ordine (PrezzoTotale, Destinatario, IndirizzoDiSpedizione, NoteCorriere, NumeroTracking, Data, Circuito, ConfezioneRegalo, NumeroCarta, Username) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			conn = getConnection();/* creo la connessione con il database */
			statement = conn.prepareStatement(insertSQL);/* creo lo statement per poter comunicare con il database */

			statement.setFloat(1, 0);
			statement.setString(2, "");
			statement.setString(3, "");
			statement.setString(4, "");
			statement.setString(5, "");
			statement.setString(6, "");

			java.sql.Date data = new java.sql.Date(0);
			statement.setDate(7, data);

			statement.setString(8, "");
			statement.setBoolean(9, false);
			statement.setString(10, "");
			statement.setString(11, username);

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

	/* permette di modificare gli attributi di un determinato ordine */
	public synchronized void UpdateOrdine(int Id, Ordine ordine) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;

		/* Sringa con Query */
		String insertSQL = "update Ordine set PrezzoTotale=?, Destinatario=?, IndirizzoDiSpedizione=?, NoteCorriere=?, MetodoDiSpedizione=?, NumeroTracking=?, Data=?, Circuito=?, ConfezioneRegalo=?, NumeroCarta=? where Id=? && Username=?";

		try {
			conn = getConnection();/* creo la connessione con il database */
			statement = conn.prepareStatement(insertSQL);/* creo lo statement per poter comunicare con il database */

			statement.setFloat(1, ordine.getPrezzoTotale());
			statement.setString(2, ordine.getDestinatario());
			statement.setString(3, ordine.getIndirizzoSpedizione());
			statement.setString(4, ordine.getNoteCorriere());
			statement.setString(5, ordine.getMetodoDiSpedizione());
			statement.setString(6, ordine.getNumeroTracking());

			java.sql.Date data = new java.sql.Date(ordine.getData().getTimeInMillis());
			statement.setDate(8, data);

			statement.setString(9, ordine.getCircuito());
			statement.setBoolean(10, ordine.isConfezioneRegalo());
			statement.setString(11, ordine.getNumeroCarta());
			statement.setInt(12, ordine.getId());
			statement.setString(13, ordine.getUsername());

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

	/* ritorna l'ID con valore massimo in ordine */
	public Ordine maxIdUser(String username) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		Ordine bean = null;

		String querySQL = "SELECT * FROM Ordine WHERE Username=? AND id=(SELECT MAX(Id) AS MaxId FROM Ordine WHERE Username=?)";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			statement.setString(1, username);
			statement.setString(2, username);

			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				bean = new Ordine(); // Crea un nuovo oggetto solo se ci sono risultati nel ResultSet
				bean.setId(rs.getInt("Id"));
				bean.setPrezzoTotale(rs.getFloat("PrezzoTotale"));
				bean.setDestinatario(rs.getString("Destinatario"));
				bean.setIndirizzoSpedizione(rs.getString("IndirizzoDiSpedizione"));
				bean.setNoteCorriere(rs.getString("NoteCorriere"));
				bean.setNumeroTracking(rs.getString("NumeroTracking"));

				java.sql.Date dataInserimentoSQL = rs.getDate("Data");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				bean.setData(dataInserimento);

				bean.setCircuito(rs.getString("Circuito"));
				bean.setConfezioneRegalo(rs.getBoolean("ConfezioneRegalo"));
				bean.setNumeroCarta(rs.getString("NumeroCarta"));
				bean.setUsername(rs.getString("Username"));
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
		return bean;
	}

	// prende tutti gli ordini
	public Collection<Ordine> getAllOrdini() throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		Collection<Ordine> ordini = new ArrayList<>();

		String querySQL = "SELECT * FROM Ordine";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			rs = statement.executeQuery();

			while (rs.next()) {
				Ordine ordine = new Ordine();
				ordine.setId(rs.getInt("Id"));
				ordine.setPrezzoTotale(rs.getFloat("PrezzoTotale"));
				ordine.setDestinatario(rs.getString("Destinatario"));
				ordine.setIndirizzoSpedizione(rs.getString("IndirizzoDiSpedizione"));
				ordine.setNoteCorriere(rs.getString("NoteCorriere"));
				ordine.setMetodoDiSpedizione(rs.getString("MetodoDiSpedizione"));
				ordine.setNumeroTracking(rs.getString("NumeroTracking"));

				java.sql.Date dataInserimentoSQL = rs.getDate("Data");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				ordine.setData(dataInserimento);

				ordine.setCircuito(rs.getString("Circuito"));
				ordine.setConfezioneRegalo(rs.getBoolean("ConfezioneRegalo"));
				ordine.setNumeroCarta(rs.getString("NumeroCarta"));
				ordine.setUsername(rs.getString("Username"));

				ordini.add(ordine);
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (statement != null)
					statement.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return ordini;
	}

	// prende tutti gli ordini in base a due date
	public Collection<Ordine> getOrdiniByDateRange(java.util.Date startDate, java.util.Date endDate)
			throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		Collection<Ordine> ordini = new ArrayList<>();

		String querySQL = "SELECT * FROM Ordine WHERE Data BETWEEN ? AND ?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			statement.setDate(1, new java.sql.Date(startDate.getTime()));
			statement.setDate(2, new java.sql.Date(endDate.getTime()));
			rs = statement.executeQuery();

			while (rs.next()) {
				Ordine ordine = new Ordine();
				ordine.setId(rs.getInt("Id"));
				ordine.setPrezzoTotale(rs.getFloat("PrezzoTotale"));
				ordine.setDestinatario(rs.getString("Destinatario"));
				ordine.setIndirizzoSpedizione(rs.getString("IndirizzoDiSpedizione"));
				ordine.setNoteCorriere(rs.getString("NoteCorriere"));
				ordine.setMetodoDiSpedizione(rs.getString("MetodoDiSpedizione"));
				ordine.setNumeroTracking(rs.getString("NumeroTracking"));

				java.sql.Date dataInserimentoSQL = rs.getDate("Data");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				ordine.setData(dataInserimento);

				ordine.setCircuito(rs.getString("Circuito"));
				ordine.setConfezioneRegalo(rs.getBoolean("ConfezioneRegalo"));
				ordine.setNumeroCarta(rs.getString("NumeroCarta"));
				ordine.setUsername(rs.getString("Username"));

				ordini.add(ordine);
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (statement != null)
					statement.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return ordini;
	}

	// prende tutti gli ordini in base all'username
	public Collection<Ordine> getOrdiniByUsername(String username) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		Collection<Ordine> ordini = new ArrayList<>();

		String querySQL = "SELECT * FROM Ordine WHERE Username = ?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			statement.setString(1, username);
			rs = statement.executeQuery();

			while (rs.next()) {
				Ordine ordine = new Ordine();
				ordine.setId(rs.getInt("Id"));
				ordine.setPrezzoTotale(rs.getFloat("PrezzoTotale"));
				ordine.setDestinatario(rs.getString("Destinatario"));
				ordine.setIndirizzoSpedizione(rs.getString("IndirizzoDiSpedizione"));
				ordine.setNoteCorriere(rs.getString("NoteCorriere"));
				ordine.setMetodoDiSpedizione(rs.getString("MetodoDiSpedizione"));
				ordine.setNumeroTracking(rs.getString("NumeroTracking"));

				java.sql.Date dataInserimentoSQL = rs.getDate("Data");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				ordine.setData(dataInserimento);

				ordine.setCircuito(rs.getString("Circuito"));
				ordine.setConfezioneRegalo(rs.getBoolean("ConfezioneRegalo"));
				ordine.setNumeroCarta(rs.getString("NumeroCarta"));
				ordine.setUsername(rs.getString("Username"));

				ordini.add(ordine);
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (statement != null)
					statement.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return ordini;
	}

	// Prende tutti gli ordini in base all'username e a due date
	public Collection<Ordine> getOrdiniByUsernameAndDateRange(String username, java.util.Date startDate,
			java.util.Date endDate) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		Collection<Ordine> ordini = new ArrayList<>();

		String querySQL = "SELECT * FROM Ordine WHERE Username = ? AND Data BETWEEN ? AND ?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			statement.setString(1, username);
			statement.setDate(2, new java.sql.Date(startDate.getTime()));
			statement.setDate(3, new java.sql.Date(endDate.getTime()));
			rs = statement.executeQuery();

			while (rs.next()) {
				Ordine ordine = new Ordine();
				ordine.setId(rs.getInt("Id"));
				ordine.setPrezzoTotale(rs.getFloat("PrezzoTotale"));
				ordine.setDestinatario(rs.getString("Destinatario"));
				ordine.setIndirizzoSpedizione(rs.getString("IndirizzoDiSpedizione"));
				ordine.setNoteCorriere(rs.getString("NoteCorriere"));
				ordine.setMetodoDiSpedizione(rs.getString("MetodoDiSpedizione"));
				ordine.setNumeroTracking(rs.getString("NumeroTracking"));

				java.sql.Date dataInserimentoSQL = rs.getDate("Data");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				ordine.setData(dataInserimento);

				ordine.setCircuito(rs.getString("Circuito"));
				ordine.setConfezioneRegalo(rs.getBoolean("ConfezioneRegalo"));
				ordine.setNumeroCarta(rs.getString("NumeroCarta"));
				ordine.setUsername(rs.getString("Username"));

				ordini.add(ordine);
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (statement != null)
					statement.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return ordini;
	}

	/* Permette di recuperare un ordine in base all'ID */
	public synchronized Ordine getOrdineById(int id) throws SQLException {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		Ordine ordine = null;

		String querySQL = "SELECT * FROM Ordine WHERE Id = ?";

		try {
			conn = getConnection();
			statement = conn.prepareStatement(querySQL);
			statement.setInt(1, id);
			rs = statement.executeQuery();

			if (rs.next()) {
				ordine = new Ordine();
				ordine.setId(rs.getInt("Id"));
				ordine.setPrezzoTotale(rs.getFloat("PrezzoTotale"));
				ordine.setDestinatario(rs.getString("Destinatario"));
				ordine.setIndirizzoSpedizione(rs.getString("IndirizzoDiSpedizione"));
				ordine.setNoteCorriere(rs.getString("NoteCorriere"));
				ordine.setMetodoDiSpedizione(rs.getString("MetodoDiSpedizione"));
				ordine.setNumeroTracking(rs.getString("NumeroTracking"));

				java.sql.Date dataInserimentoSQL = rs.getDate("Data");
				GregorianCalendar dataInserimento = new GregorianCalendar();
				dataInserimento.setTime(dataInserimentoSQL);
				ordine.setData(dataInserimento);

				ordine.setCircuito(rs.getString("Circuito"));
				ordine.setConfezioneRegalo(rs.getBoolean("ConfezioneRegalo"));
				ordine.setNumeroCarta(rs.getString("NumeroCarta"));
				ordine.setUsername(rs.getString("Username"));
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (statement != null)
					statement.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return ordine;
	}
}