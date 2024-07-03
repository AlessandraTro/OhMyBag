package it.ohmybag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import it.ohmybag.bean.Carta;
import it.ohmybag.bean.Prodotto;

public class CartaModel {
	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
	}
	/*permette di creare una nuova carta di credito*/
	public synchronized void saveCreditCard(Carta carta)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		/*Sringa con Query*/
		String insertSQL="INSERT INTO Carta (Id, Username, CVV, Circuito, DataScadenza, NumeroCarta) VALUES (?,?,?,?,?,?)";
		
		try {
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(insertSQL);/*creo lo statement per poter comunicare con il database*/
			
			statement.setInt(1,carta.getId());
			statement.setString(2,carta.getUsername());
			statement.setInt(3,carta.getCvv());
			statement.setString(4, carta.getCircuito());
			java.sql.Date data= new java.sql.Date(carta.getDataScadenza().getTimeInMillis());
			statement.setDate(5, data);
			
			statement.setString(6, carta.getNumeroCarta());
			
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
	/*ritorna tutti i prodotti di una determinata categoria es. uomo, donna, viaggi*/
	public boolean checkCardExists(String numeroCarta, String username) throws Exception {
		Connection conn=null;
		PreparedStatement statement=null;
		
		boolean exists=false;
		
		String QuerySQL="SELECT 1 FROM Carta WHERE NumeroCarta=? and Username=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setString(1,numeroCarta);
			statement.setString(2,username);
			
			ResultSet rs= statement.executeQuery();
			
			exists = rs.next();
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
		return exists;
	}
	

	// Metodo per ottenere la carta attraverso l'username
	public Carta getCard(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Carta carta = null;

        String query = "SELECT Id, Username, CVV, Circuito, DataScadenza, NumeroCarta FROM Carta WHERE Username=?";

        try {
            conn = getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, username);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                carta = new Carta();
                carta.setId(resultSet.getInt("Id"));
                carta.setUsername(resultSet.getString("Username"));
                carta.setCvv(resultSet.getInt("CVV"));
                carta.setCircuito(resultSet.getString("Circuito"));
                java.sql.Date data = resultSet.getDate("DataScadenza");
                GregorianCalendar dataScadenza = new GregorianCalendar();
                dataScadenza.setTimeInMillis(data.getTime());
                carta.setDataScadenza(dataScadenza);
                carta.setNumeroCarta(resultSet.getString("NumeroCarta"));
            }
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } finally {
                if (conn != null) {
                    conn.close();
                }
            }
        }

        return carta;
    }
	
	// Metodo per ottenere tutte le carte di un utente
	public List<Carta> getCarte(String username) throws SQLException {
	    List<Carta> carte = new ArrayList<>();
	    String query = "SELECT Id, Username, CVV, Circuito, DataScadenza, NumeroCarta FROM carta WHERE username = ?";

	    try (Connection conn = getConnection();
	         PreparedStatement statement = conn.prepareStatement(query)) {

	        statement.setString(1, username);
	        try (ResultSet rs = statement.executeQuery()) {
	            while (rs.next()) {
	                Carta carta = new Carta();
	                carta.setId(rs.getInt("Id"));
	                carta.setUsername(rs.getString("Username"));
	                carta.setCvv(rs.getInt("CVV"));
	                carta.setCircuito(rs.getString("Circuito"));
	                java.sql.Date data = rs.getDate("DataScadenza");
	                GregorianCalendar dataScadenza = new GregorianCalendar();
	                dataScadenza.setTimeInMillis(data.getTime());
	                carta.setDataScadenza(dataScadenza);
	                carta.setNumeroCarta(rs.getString("NumeroCarta"));

	                carte.add(carta);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider logging this instead
	        throw e;
	    }

	    return carte;
	}
	
	// Metodo per ottenere la carta attraverso il numero della carta
	public Carta getCartaByNumero(String numeroCarta) throws SQLException {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        Carta carta = null;
        
        String query = "SELECT Id, Username, CVV, Circuito, DataScadenza, NumeroCarta FROM carta WHERE NumeroCarta = ?";
        
        try {
        	conn = getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, numeroCarta);
            rs = statement.executeQuery();
            
            if (rs.next()) {
                carta = new Carta();
                carta.setId(rs.getInt("Id"));
                carta.setUsername(rs.getString("Username"));
                carta.setCvv(rs.getInt("CVV"));
                carta.setCircuito(rs.getString("Circuito"));
                java.sql.Date data = rs.getDate("DataScadenza");
                GregorianCalendar dataScadenza = new GregorianCalendar();
                dataScadenza.setTimeInMillis(data.getTime());
                carta.setDataScadenza(dataScadenza);
                carta.setNumeroCarta(rs.getString("NumeroCarta"));
            }
            
        } finally {
        	  if (conn != null) {
                  conn.close();
        }
        }
        return carta;
    }

}

	

