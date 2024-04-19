package it.ohmybag.bean;

import java.io.Serializable;
import java.util.GregorianCalendar;

public class Utente implements Serializable {
	private static final long serialVersionUID = 1L;

	private String username, password, nome, cognome, cf, email, indirizzoSpedizione; 
	private int telefono;
	private boolean admin;
	private GregorianCalendar dataNascita;

	
	
	//costruttore
	public Utente() {
		this.setAdmin(false);

	}
	
	
	//costruttore
	public Utente(String username, String password, String nome, String cognome, String cf, String email,
			String indirizzoSpedizione, int telefono,GregorianCalendar dataNascita, boolean admin) {
		super();
		this.setUsername(username);
		this.setPassword(password);
		this.nome = nome;
		this.cognome = cognome;
		this.cf = cf;
		this.email = email;
		this.indirizzoSpedizione = indirizzoSpedizione;
		this.telefono = telefono;
		this.dataNascita = dataNascita;
	}


	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getCodiceFiscale() {
		return cf;
	}

	public void setCodiceFiscale(String cf) {
		this.cf = cf;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIndirizzoSpedizione() {
		return indirizzoSpedizione;
	}

	public void setIndirizzoSpedizione(String indirizzoSpedizione) {
		this.indirizzoSpedizione = indirizzoSpedizione;
	}

	public int getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public GregorianCalendar getDataDiNascita() {
		return dataNascita;
	}

	public void setDataDiNascita(GregorianCalendar dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "Utente [username=" + username + ", password=" + password + ", nome=" + nome + ", cognome=" + cognome
				+ ", cf=" + cf + ", email=" + email + ", indirizzoSpedizione=" + indirizzoSpedizione + ", telefono="
				+ telefono + ", admin=" + admin + ", dataNascita=" + dataNascita + "]";
	}

}
