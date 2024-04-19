package it.ohmybag.bean;

import java.io.Serializable;

public class Immagine implements Serializable{
	
	private String nome;
	private boolean copertina;
	private String idProdotto;
	
	public Immagine(String nome, boolean copertina, String idProdotto) {
		this.nome=nome;
		this.copertina=copertina;
		this.idProdotto=idProdotto;
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
}