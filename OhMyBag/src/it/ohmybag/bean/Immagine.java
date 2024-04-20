package it.ohmybag.bean;

import java.io.Serializable;

public class Immagine implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String nome;
	private boolean copertina;
	private String idProdotto;
	
	//Costruttore
	public Immagine(String nome, boolean copertina, String idProdotto) {
		this.nome=nome;
		this.copertina=copertina;
		this.idProdotto=idProdotto;
	}
	
	//Costruttore vuoto
	public Immagine() {
		
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public boolean isCopertina() {
		return copertina;
	}

	public void setCopertina(boolean copertina) {
		this.copertina = copertina;
	}

	public String getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(String idProdotto) {
		this.idProdotto = idProdotto;
	}

	@Override
	public String toString() {
		return "Immagine [nome=" + nome + ", copertina=" + copertina + ", idProdotto=" + idProdotto + "]";
	}
}