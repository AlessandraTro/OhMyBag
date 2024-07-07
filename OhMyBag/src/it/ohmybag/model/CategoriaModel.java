package it.ohmybag.model;

import java.sql.*;
import java.util.*;

import it.ohmybag.bean.Categoria;

public class CategoriaModel {
	
	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
	}
	
	/*inserisce una categoria*/
	public synchronized void saveCategoria(Categoria categoria)throws SQLException{
		Connection connection =null;
		PreparedStatement preparedStatement=null;
		
		String insertSQL="INSERT INTO Categoria (ID,Nome) VALUES (?,?)";
		
		try {
			connection=getConnection();
			preparedStatement= connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, categoria.getId());
			preparedStatement.setString(2, categoria.getNome());
			
			preparedStatement.executeUpdate();
		}finally {
			try {
				if(preparedStatement!= null) {
					preparedStatement.close();
				}
			}finally {
				if(connection!=null) {
					connection.close();
				}
			}
		}
	}
	/*elimina una categoria*/
	public synchronized boolean deleteCategoria(int idCategoria) throws SQLException{
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		int result=0;
		
		String deleteSQL="DELETE FROM Categoria WHERE ID=?";
		
		try {
			connection=getConnection();
			preparedStatement=connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, idCategoria);
			
			result = preparedStatement.executeUpdate();
			
		}finally {
			try {
				if(preparedStatement!= null) {
					preparedStatement.close();
				}
			}finally {
				if(connection!=null) {
					connection.close();
				}
			}
		}
		return result!=0;
	}
	/*restituisce una categoria*/
	public Categoria getCategoria(int idCategoria) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Categoria bean = new Categoria();

		String selectSQL = "SELECT * FROM Categoria WHERE ID = ? ";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idCategoria);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("ID"));
				bean.setNome(rs.getString("Nome"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return bean;

	}
	/*preleva tutte le categorie*/
	public synchronized Collection<Categoria> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Categoria> categorie = new LinkedList<Categoria>();

		String selectSQL = "SELECT *  FROM Categoria";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Categoria bean = new Categoria();

				bean.setId(rs.getInt("ID"));
				bean.setNome(rs.getString("Nome"));
				categorie.add(bean);
			}

		}finally {
			try {
				if(preparedStatement!= null) {
					preparedStatement.close();
				}
			}finally {
				if(connection!=null) {
					connection.close();
				}
			}
		}
		return categorie;
	}
}


