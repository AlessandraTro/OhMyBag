package it.ohmybag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import it.ohmybag.bean.Ordine;

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
		String insertSQL="INSERT INTO Ordine (Id, PrezzoTotale, Destinatario, MetodoDiPagamento, IndirizzoDiSpedizione, NoteCorriere, MetodoDiSpedizione, NumeroTracking, Data, Circuito, ConfezioneRegalo, NumeroCarta, Username) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(insertSQL);/*creo lo statement per poter comunicare con il database*/
			
			statement.setInt(1, ordine.getId());
			statement.setFloat(2, ordine.getPrezzoTotale());
			statement.setString(3,ordine.getDestinatario());
			statement.setString(4,ordine.getMetodoDiPagamento());
			statement.setString(5,ordine.getIndirizzoSpedizione());
			statement.setString(6, ordine.getNoteCorriere());
			statement.setString(7,ordine.getMetodoDiSpedizione());
			statement.setString(8,ordine.getNumeroTracking());
			
			java.sql.Date data= new java.sql.Date(ordine.getData().getTimeInMillis());
			statement.setDate(9, data);
			
			statement.setString(10, ordine.getCircuito());
			statement.setBoolean(11, ordine.isConfezioneRegalo());
			statement.setString(12, ordine.getNumeroCarta());
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
}
