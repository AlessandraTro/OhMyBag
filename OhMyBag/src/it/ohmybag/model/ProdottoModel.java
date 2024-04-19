package it.ohmybag.model;

import java.sql.*;
import java.util.*;

import it.ohmybag.bean.*;

public class ProdottoModel{

	private Connection getConnection() throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
	}
	
	public synchronized void saveProduct(Prodotto prodotto)throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		
		String insertSQL="INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();
			statement= conn.prepareStatement(insertSQL);
			
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
	
	public synchronized boolean deleteProduct(int idProdotto) throws SQLException{
		Connection conn=null;
		PreparedStatement statement=null;
		int result=0;
		
		String deleteSQL="DELETE FROM Prodotto WHERE ID=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(deleteSQL);
			
			statement.setInt(1, idProdotto);
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
	
	public synchronized void scontoCategoria(int sconto,int categoria) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Sconto=? where IDCategoria=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, sconto);
			statement.setInt(2, categoria);
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
	
	public synchronized void scontoAnnoCollezione(int sconto,int AnnoCollezione) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Sconto=? where AnnoCollezione=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, sconto);
			statement.setInt(2, AnnoCollezione);
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
	
	public synchronized void scontoTipologia(int sconto,String tipologia) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Sconto=? where Tipologia=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, sconto);
			statement.setString(2, tipologia);
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
	
	public synchronized void scontoCatTip(int sconto,int categoria,String tipologia) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Sconto=? where Tipologia=? && IDCategoria=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, sconto);
			statement.setString(2, tipologia);
			statement.setInt(3, categoria);
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

	public synchronized void cambioPrezzo(int id) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Prezzo=? where ID=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, id);
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

	public synchronized void cambioDisponibilita(int disponibilita) throws SQLException {
		Connection conn=null;
		PreparedStatement statement=null;
		
		String updateSQL="update Prodotto set Disponibilita=? where ID=?";
		
		try {
			conn=getConnection();
			statement=conn.prepareStatement(updateSQL);
			
			statement.setInt(1, disponibilita);
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

}