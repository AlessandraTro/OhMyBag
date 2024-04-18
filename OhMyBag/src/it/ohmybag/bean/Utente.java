package it.ohmybag.bean;

import java.io.Serializable;
import java.sql.Date;

public class Utente implements Serializable {
	private static final long serialVersionUID = 1L;

	private String Username, pin, nome, cognome, codiceFiscale, email, indirizzoSpedizione, telefono, sesso, tipo;
	private String myHash;
	private boolean verificato;

	// private int amministratore;
	private Date dataDiNascita;

	public Utente() {

		tipo = "cliente";

	}
	
	

	public Utente(String username, String pin, String nome, String cognome, String codiceFiscale, String email,
			String indirizzoSpedizione, String telefono, String sesso, String tipo, String myHash, boolean verificato,
			Date dataDiNascita) {
		super();
		this.Username = username;
		this.pin = pin;
		this.nome = nome;
		this.cognome = cognome;
		this.codiceFiscale = codiceFiscale;
		this.email = email;
		this.indirizzoSpedizione = indirizzoSpedizione;
		this.telefono = telefono;
		this.sesso = sesso;
		this.tipo = tipo;
		this.myHash = myHash;
		this.verificato = verificato;
		this.dataDiNascita = dataDiNascita;
	}



	public boolean isVerificato() {
		return verificato;
	}

	public void setVerificato(boolean verificato) {
		this.verificato = verificato;
	}

	public String getMyHash() {
		return myHash;
	}

	public void setMyHash(String myHash) {
		this.myHash = myHash;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
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
		return codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
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

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Date getDataDiNascita() {
		return dataDiNascita;
	}

	public void setDataDiNascita(Date dataDiNascita) {
		this.dataDiNascita = dataDiNascita;
	}

	public String getSesso() {
		return sesso;
	}

	public void setSesso(String sesso) {
		this.sesso = sesso;
	}

}
