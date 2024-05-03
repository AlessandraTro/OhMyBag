package it.ohmybag.model;

import java.sql.Connection;
import java.sql.SQLException;

public class CarrelloModel {
	private Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ConnesioneDatabase.getConnection();
	}
	
	
}
