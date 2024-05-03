package it.ohmybag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.GregorianCalendar;
import java.util.LinkedList;

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
	/*ritorna il prodotto con un determinato id*/
	public synchronized Collection<Composizione> doRetrieveById(String id) throws SQLException {
	    Connection conn = null;
	    PreparedStatement statement = null;
	    Collection<Composizione> elementi = new LinkedList<Composizione>();; // Inizializzo il bean come null inizialmente
	    Composizione bean=null;
	    String querySQL = "SELECT * FROM Composizione WHERE IDOrdine=?";

	    try {
	        conn = getConnection();
	        statement = conn.prepareStatement(querySQL);
	        statement.setString(1, id);

	        ResultSet rs = statement.executeQuery();

	        while(rs.next()) { // Controlla se ci sono risultati nel ResultSet
	        	bean=new Composizione();
	            bean.setIdProdotto(rs.getString("IDOrdine"));
	            bean.setIdOrdine(rs.getInt("IDProdotto"));
	            bean.setIva(rs.getInt("IVA"));
	            bean.setPrezzo(rs.getFloat("Prezzo"));
	            bean.setQuantita(rs.getInt("Quantita"));
	            
	            elementi.add(bean);
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
	    return elementi; // Restituisce il bean, che potrebbe essere null se non ci sono risultati nel ResultSet
	}
}
