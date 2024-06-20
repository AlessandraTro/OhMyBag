package it.ohmybag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.GregorianCalendar;
import java.util.LinkedList;

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
	
}
