package it.ohmybag.bean;

import java.util.GregorianCalendar;

public class Carta {

	private String id;
	private String numeroCarta;
	private int cvv;
	private GregorianCalendar dataScadenza;
	private String circuito;
	private String username;
	
	
	//costruttore
	public Carta(String id, String numeroCarta, String circuito, String username, int cvv, GregorianCalendar dataScadenza) {
		this.numeroCarta = numeroCarta;
		this.cvv = cvv;
		this.circuito = circuito;
		this.id = id;
		this.dataScadenza = dataScadenza;
		this.username = username;
	}
	
	//costruttore
	public Carta() {
		
	}
	
	
	public String getNumeroCarta() {
		return numeroCarta;
	}
	
	public void setNumeroCarta(String numeroCarta) {
		this.numeroCarta = numeroCarta;
	}
	
	public int getCvv() {
		return cvv;
	}
	
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	
	public String getCircuito() {
		return circuito;
	}
	
	public void setCircuito(String circuito) {
		this.circuito = circuito;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public GregorianCalendar getDataScadenza() {
		return dataScadenza;
	}

	public void setDataScadenza(GregorianCalendar dataScadenza) {
		this.dataScadenza = dataScadenza;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Carta [id=" + id + ", numeroCarta=" + numeroCarta + ", cvv=" + cvv + ", dataScadenza=" + dataScadenza
				+ ", circuito=" + circuito + ", username=" + username + "]";
	}

}
