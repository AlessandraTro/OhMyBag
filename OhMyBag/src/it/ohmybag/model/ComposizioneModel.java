package it.ohmybag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import it.ohmybag.bean.Composizione;

public class ComposizioneModel {
	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
	}
	
	/*permette di creare una nuova composizione tra Ordine e Prodotto*/
	public synchronized void saveComposizione(Composizione composizione)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		/*Sringa con Query*/
		String insertSQL="INSERT INTO Composizione (IDOrdine, IDProdotto, Prezzo, Quantita, IVA) VALUES (?,?,?,?,?)";
		
		try {
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(insertSQL);/*creo lo statement per poter comunicare con il database*/
			
			statement.setInt(1,composizione.getIdOrdine());
			statement.setString(2,composizione.getIdProdotto());
			statement.setFloat(3,composizione.getPrezzo());
			statement.setInt(4, composizione.getQuantita());
			statement.setFloat(5, composizione.getIva());
			
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
