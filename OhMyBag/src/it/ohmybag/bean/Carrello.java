package it.ohmybag.bean;

import java.util.ArrayList;
import java.util.HashMap;



public class Carrello {
	private ArrayList<Immagine> immagini;
	private HashMap<Prodotto, Integer> prodotti;
	
	public Carrello(){
		setImmagini(new ArrayList<Immagine>());
		setProdotti(new HashMap<Prodotto, Integer> ());

	}
	
	public Carrello(ArrayList<Immagine> immagini, HashMap<Prodotto, Integer> prodotti){
		this.immagini=immagini;
		this.prodotti=prodotti;

	}

	public ArrayList<Immagine> getImmagini() {
		return immagini;
	}

	public void setImmagini(ArrayList<Immagine> immagini) {
		this.immagini = immagini;
	}

	public HashMap<Prodotto, Integer> getProdotti() {
		return prodotti;
	}

	public void setProdotti(HashMap<Prodotto, Integer> prodotti) {
		this.prodotti = prodotti;
	}

	public void svuotaCarrello() {
		prodotti = new HashMap<Prodotto, Integer>();
	}
	

}
