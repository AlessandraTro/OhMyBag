package it.ohmybag.model;

import java.sql.*;
import java.util.*;

import it.ohmybag.bean.*;

public class ProdottoModel{
	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/OhMyBag?useSSL=false", "root", "root");
	}
	
	
	/*permette di salvare un nuovo Prodotto all'interno del database*/
	public synchronized void saveProduct(Prodotto prodotto)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		/*Sringa con Query*/
		String insertSQL="INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();/*creo la connessione con il database*/
			statement= conn.prepareStatement(insertSQL);/*creo lo statement per poter comunicare con il database*/
			
			statement.setString(1, prodotto.getId());
			statement.setString(2, prodotto.getMarca());
			statement.setString(3, prodotto.getNome());
			statement.setFloat(4, prodotto.getPrezzo());
			statement.setString(5, prodotto.getTipologia());
			statement.setInt(6, prodotto.getIdCategoria());
			statement.setString(7, prodotto.getDescrizione());
			statement.setInt(8, prodotto.getAnnoCollezione());
			
			java.sql.Date data= new java.sql.Date(prodotto.getDataInserimento().getTimeInMillis());
			statement.setDate(9, data);
			
			statement.setInt(10, prodotto.getSconto());
			statement.setInt(2, prodotto.getDisponibilita());
			
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
	
	/*Permette di eliminare dal database il prodotto con un determinato ID*/
	public synchronized boolean deleteProduct(String idProdotto) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		int result=0;
		
		String deleteSQL="DELETE FROM Prodotto WHERE ID=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(deleteSQL);
			
			statement.setString(1, idProdotto);
			
			result=statement.executeUpdate();
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
		return result!=0;
	}
	
	/*permette di applicare lo sconto ai prodotti di una determinata categoria es. uomo donna o viaggio*/
	public synchronized void updateDiscountCategory(int sconto,int categoria) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Sconto=? where IDCategoria=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, sconto);
			statement.setInt(2, categoria);
			
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
	
	/*permette di applicare lo sconto ai prodotti di un determinato AnnoCollezione*/
	public synchronized void updateDiscountYearCollection(int sconto,int AnnoCollezione) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Sconto=? where AnnoCollezione=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, sconto);
			statement.setInt(2, AnnoCollezione);
			
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
	
	/*permette di applicare lo scnto ai prodotti di una determinata tipologia es. Zaini, accessori, ecc.*/
	public synchronized void updateDiscountTipology(int sconto,String tipologia) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Sconto=? where Tipologia=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, sconto);
			statement.setString(2, tipologia);
			
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
	
	/*permette di applicare lo sconto ai prodotti di una determinata tipologia in una determinata categoria es. Borse in Donna, Accessori in uomo, ecc.*/
	public synchronized void updateDiscountTOC(int sconto, int categoria, String tipologia) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Sconto=? where Tipologia=? && IDCategoria=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, sconto);
			statement.setString(2, tipologia);
			statement.setInt(3, categoria);
			
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

	/*permette di aggiornare il prezzo di un determinato prodotto*/
	public synchronized void updateChangePrice(int id) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Prezzo=? where ID=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, id);
			
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

	/*permette di aggiornare la quantità di un determinato prodotto*/
	public synchronized void updateQuantity(int disponibilita, String id) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Disponibilita=? where ID=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, disponibilita);
			statement.setString(2, id);
			
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

	/*ritorna tutti i prodotti che si trovano all'interno del database*/
	public synchronized Collection<Prodotto> allProduct() throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}

	/*ritorna tutti i prodotti di una determinata categoria es. uomo, donna, viaggi*/
	public synchronized Collection<Prodotto> allCategoryProduct(int categoria) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto WHERE IDCategoria=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setInt(1,categoria);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}

	/*ritorna tutti i prodotti di una determinata marca in una determinata categoria*/
	public synchronized Collection<Prodotto> allBrandProduct(int categoria, String marca) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto WHERE Marca=? && IDCategoria=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setString(1, marca);
			statement.setInt(2,categoria);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}

	/*ritorna tutti i prodotti di un determinato anno di collezione in una determinata categoria in modo crescente in base al prezzo*/
	public synchronized Collection<Prodotto> allYearCollectionProductASC(int categoria, int annocollezione) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto WHERE AnnoCollezione=? && IDCategoria=? ORDER BY Prezzo";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setInt(1, annocollezione);
			statement.setInt(2, categoria);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}

	/*ritorna tutti i prodotti di un determinato anno di collezione in una determinata categoria in modo decrescente in base al prezzo*/
	public synchronized Collection<Prodotto> allYearCollectionProductDESC(int categoria, int annocollezione) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto WHERE AnnoCollezione=? && IDCategoria=? ORDER BY Prezzo DESC";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setInt(1, annocollezione);
			statement.setInt(2, categoria);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}

	/*ritorna il numero di prodotti di una determinata categoria in un determinato range di prezzo in modo crescente in base al prezzo*/
	public synchronized Collection<Prodotto> allRangePriceProductASC(int categoria, float min, float max) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto WHERE Prezzo>=? && Prezzo<=? && IDCategoria=? ORDER BY Prezzo";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setFloat(1, min);
			statement.setFloat(2, max);
			statement.setInt(3,categoria);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}

	/*ritorna il numero di prodotti di una determinata categoria in un determinato range di prezzo in modo decrescente in base al prezzo*/
	public synchronized Collection<Prodotto> allRangePriceProductDESC(int categoria, float min, float max) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto WHERE Prezzo>=? && Prezzo<=? && IDCategoria=? ORDER BY Prezzo DESC";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setFloat(1, min);
			statement.setFloat(2, max);
			statement.setInt(3,categoria);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}

	/*ritorna tutti i prodotti di una determinata tipologia in una determinata categoria es. Zaini in donna, cinture in uomo, ecc.*/
	public synchronized Collection<Prodotto> allTypologyProduct(int categoria, String tipologia) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto WHERE Tipologia=? && IDCategoria=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setString(1, tipologia);
			statement.setInt(2,categoria);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}

	/*ritorna tutti i prodotti che si trovano in sconto*/
	public synchronized Collection<Prodotto> allDiscountProduct(int sconto) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		Collection <Prodotto> prodotti =new LinkedList<Prodotto>();
		
		String QuerySQL="SELECT * FROM Prodotto WHERE Sconto>=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(QuerySQL);
			statement.setInt(1,sconto);
			
			ResultSet rs= statement.executeQuery();
			while(rs.next()){
				Prodotto bean=new Prodotto();
				
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
				
				prodotti.add(bean);
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
		return prodotti;
	}
	
	/*ritorna il prodotto con un determinato id*/
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
	    return bean; // Restituisce il bean, che potrebbe essere null se non ci sono risultati nel ResultSet
	}

}