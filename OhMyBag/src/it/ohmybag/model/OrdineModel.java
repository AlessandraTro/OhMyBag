package it.ohmybag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	/*permette di creare un nuovo ordine*/
	public synchronized void saveOrdine(Ordine ordine)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		/*Sringa con Query*/
		String insertSQL="INSERT INTO Ordine (PrezzoTotale, Destinatario, MetodoDiPagamento, IndirizzoDiSpedizione, NoteCorriere, MetodoDiSpedizione, NumeroTracking, Data, Circuito, ConfezioneRegalo, NumeroCarta, Username) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(insertSQL);/*creo lo statement per poter comunicare con il database*/
			
			statement.setFloat(1, ordine.getPrezzoTotale());
			statement.setString(2,ordine.getDestinatario());
			statement.setString(3,ordine.getMetodoDiPagamento());
			statement.setString(4,ordine.getIndirizzoSpedizione());
			statement.setString(5, ordine.getNoteCorriere());
			statement.setString(6,ordine.getMetodoDiSpedizione());
			statement.setString(7,ordine.getNumeroTracking());
			
			java.sql.Date data= new java.sql.Date(ordine.getData().getTimeInMillis());
			statement.setDate(8, data);
			
			statement.setString(9, ordine.getCircuito());
			statement.setBoolean(10, ordine.isConfezioneRegalo());
			statement.setString(11, ordine.getNumeroCarta());
			statement.setString(12,ordine.getUsername());
			
			statement.executeUpdate();
		}finally {
			try {
				if(statement!= null) {
					statement.close();
				}
			}finally {
				if(conn!=null) {
					conn.close();
				}
			}
		}
	}
	/*permette di creare un nuovo ordine da modificare successivamente*/
	public synchronized void saveOrdineEmpty(String username)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		/*Sringa con Query*/
		String insertSQL="INSERT INTO Ordine (PrezzoTotale, Destinatario, MetodoDiPagamento, IndirizzoDiSpedizione, NoteCorriere, MetodoDiSpedizione, NumeroTracking, Data, Circuito, ConfezioneRegalo, NumeroCarta, Username) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(insertSQL);/*creo lo statement per poter comunicare con il database*/
			
			statement.setFloat(1, 0);
			statement.setString(2,"");
			statement.setString(3,"");
			statement.setString(4,"");
			statement.setString(5,"");
			statement.setString(6,"");
			statement.setString(7,"");
			
			java.sql.Date data= new java.sql.Date(0);
			statement.setDate(8, data);
			
			statement.setString(9, "");
			statement.setBoolean(10, false);
			statement.setString(11, "");
			statement.setString(12,username);
			
			statement.executeUpdate();
		}finally {
			try {
				if(statement!= null) {
					statement.close();
				}
			}finally {
				if(conn!=null) {
					conn.close();
				}
			}
		}
	}
	
	/*permette di modificare gli attributi di un determinato ordine*/
	public synchronized void UpdateOrdine(int Id, Ordine ordine)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		/*Sringa con Query*/
		String insertSQL="update Ordine set PrezzoTotale=?, Destinatario=?, MetodoDiPagamento=?, IndirizzoDiSpedizione=?, NoteCorriere=?, MetodoDiSpedizione=?, NumeroTracking=?, Data=?, Circuito=?, ConfezioneRegalo=?, NumeroCarta=? where Id=? && Username=?";
		
		try {
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(insertSQL);/*creo lo statement per poter comunicare con il database*/
			
			statement.setFloat(1, ordine.getPrezzoTotale());
			statement.setString(2,ordine.getDestinatario());
			statement.setString(3,ordine.getMetodoDiPagamento());
			statement.setString(4,ordine.getIndirizzoSpedizione());
			statement.setString(5, ordine.getNoteCorriere());
			statement.setString(6,ordine.getMetodoDiSpedizione());
			statement.setString(7,ordine.getNumeroTracking());
			
			java.sql.Date data= new java.sql.Date(ordine.getData().getTimeInMillis());
			statement.setDate(8, data);
			
			statement.setString(9, ordine.getCircuito());
			statement.setBoolean(10, ordine.isConfezioneRegalo());
			statement.setString(11, ordine.getNumeroCarta());
			statement.setInt(12, ordine.getId());
			statement.setString(13,ordine.getUsername());
			
			statement.executeUpdate();
		}finally {
			try {
				if(statement!= null) {
					statement.close();
				}
			}finally {
				if(conn!=null) {
					conn.close();
				}
			}
		}
	}
	/*ritorna l'ID con valore massimo in ordine*/
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
	            bean.setMetodoDiPagamento(rs.getString("MetodoDiPagamento"));
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
	
}
