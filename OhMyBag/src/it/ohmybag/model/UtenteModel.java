package it.ohmybag.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.GregorianCalendar;

import it.ohmybag.bean.Utente;

public class UtenteModel {
	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
	}
	
	/*permette di creare un nuovo utente*/
	public synchronized void saveUtente(Utente utente)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		/*Sringa con Query*/
		String insertSQL="INSERT INTO Utente (Username, Cf, Email, Password, Telefono, Nome, Cognome, Admin, DataNascita, IndirizzoSpedizione) VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(insertSQL);/*creo lo statement per poter comunicare con il database*/
			
			statement.setString(1,utente.getUsername());
			statement.setString(2,utente.getCodiceFiscale());
			statement.setString(3,utente.getEmail());
			statement.setString(4, utente.getPassword());
			statement.setString(5, utente.getTelefono());
			statement.setString(6, utente.getNome());
			statement.setString(7, utente.getCognome());
			statement.setBoolean(8, utente.isAdmin());
			
			java.sql.Date data= new java.sql.Date(utente.getDataDiNascita().getTimeInMillis());
			statement.setDate(9, data);
			
			statement.setString(10, utente.getIndirizzoSpedizione());
			
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
	
	public synchronized Utente RetriveByEmailPassword(String email, String password)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Utente bean=new Utente();
		
		String query= "SELECT * FROM Utente WHERE Email=? && Password=?";
		
		try{
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(query);/*creo lo statement per poter comunicare con il database*/
			
			statement.setString(1, email);
			statement.setString(2, password);
			
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				bean.setUsername(rs.getString("Username"));
				bean.setAdmin(rs.getBoolean("Admin"));
				bean.setCodiceFiscale(rs.getString("Cf"));
				bean.setCognome(rs.getString("Cognome"));
				
		        java.sql.Date dataInserimentoSQL = rs.getDate("DataNascita");
		        GregorianCalendar dataInserimento = new GregorianCalendar();
		        dataInserimento.setTime(dataInserimentoSQL);
				bean.setDataDiNascita(dataInserimento);
				
				bean.setEmail(rs.getString("Email"));
				bean.setIndirizzoSpedizione(rs.getString("IndirizzoSpedizione"));
				bean.setNome(rs.getString("Nome"));
				bean.setPassword(rs.getString("Password"));
				bean.setTelefono(rs.getString("Telefono"));
			}
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
		return bean;
	}
}
