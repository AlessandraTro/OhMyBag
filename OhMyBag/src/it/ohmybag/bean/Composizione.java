package it.ohmybag.bean;

public class Composizione {
	private int idOrdine;
	private String idProdotto;
	private float prezzo;
	private int quantita;
	private float iva;
	private int sconto;
	
	public Composizione(int idOrdine, String idProdotto, float prezzo, int quantita, float iva, int sconto) {
		this.idOrdine=idOrdine;
		this.idProdotto=idProdotto;
		this.prezzo=prezzo;
		this.quantita=quantita;
		this.iva=iva;
		this.sconto=sconto;
	}
	public Composizione() {
		
	}
	
	public int getIdOrdine() {
		return idOrdine;
	}

	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}

	public String getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(String idProdotto) {
		this.idProdotto = idProdotto;
	}

	public float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public float getIva() {
		return iva;
	}

	public void setIva(float iva) {
		this.iva = iva;
	}
	public int getSconto() {
		return sconto;
	}
	public void setSconto(int sconto) {
		this.sconto = sconto;
	}
	
}
