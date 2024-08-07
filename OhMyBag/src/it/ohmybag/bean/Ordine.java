package it.ohmybag.bean;

import java.io.Serializable;
import java.util.GregorianCalendar;
import java.util.Random;

public class Ordine implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private float prezzoTotale;
	private String destinatario;

	private String indirizzoSpedizione;
	private String noteCorriere;
	private String metodoDiSpedizione;
	private String numeroTracking;
	private GregorianCalendar data;
	private String circuito;
	private boolean confezioneRegalo;
	private String numeroCarta;
	private String username;
	
	public Ordine(float prezzoTotale,String destinatario,
			String indirizzoSpedizione,String noteCorriere,String metodoDiSpedizione,GregorianCalendar data,String circuito,boolean confezioneRegalo,
			String numeroCarta,String username) {
			super();
			setId(id);
			this.destinatario=destinatario;
			this.prezzoTotale = prezzoTotale;
			this.indirizzoSpedizione = indirizzoSpedizione;
			this.noteCorriere = noteCorriere;
			this.metodoDiSpedizione = metodoDiSpedizione;
			setNumeroTracking();
			this.data = new GregorianCalendar();
			this.circuito = circuito; 
			this.confezioneRegalo = confezioneRegalo;
			this.numeroCarta = numeroCarta;
			this.username = username; 
		
	}
	public Ordine() {
		
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getPrezzoTotale() {
		return prezzoTotale;
	}
	public void setPrezzoTotale(float prezzoTotale) {
		this.prezzoTotale = prezzoTotale;
	}
	public String getDestinatario() {
		return destinatario;
	}
	public void setDestinatario(String destinatario) {
		this.destinatario = destinatario;
	}
	public String getIndirizzoSpedizione() {
		return indirizzoSpedizione;
	}
	public void setIndirizzoSpedizione(String indirizzoSpedizione) {
		this.indirizzoSpedizione = indirizzoSpedizione;
	}
	public String getNoteCorriere() {
		return noteCorriere;
	}
	public void setNoteCorriere(String noteCorriere) {
		this.noteCorriere = noteCorriere;
	}
	public String getMetodoDiSpedizione() {
		return metodoDiSpedizione;
	}
	public void setMetodoDiSpedizione(String metodoDiSpedizione) {
		this.metodoDiSpedizione = metodoDiSpedizione;
	}
	public String getNumeroTracking() {
		return numeroTracking;
	}
	public void setNumeroTracking() {
		Random rand= new Random();
		int random =rand.nextInt((999999-10000)+1)+10000;
		this.numeroTracking=String.valueOf(random);
	}
	public void setNumeroTracking(String numeroTracking) {
		this.numeroTracking=numeroTracking;
	}
	public GregorianCalendar getData() {
		return data;
	}
	public void setData(GregorianCalendar data) {
		this.data = data;
	}
	public String getCircuito() {
		return circuito;
	}
	public void setCircuito(String circuito) {
		this.circuito = circuito;
	}
	public boolean isConfezioneRegalo() {
		return confezioneRegalo;
	}
	public void setConfezioneRegalo(boolean confezioneRegalo) {
		this.confezioneRegalo = confezioneRegalo;
	}
	public String getNumeroCarta() {
		return numeroCarta;
	}
	public void setNumeroCarta(String numeroCarta) {
		this.numeroCarta = numeroCarta;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Ordine [id=" + id + ", prezzoTotale=" + prezzoTotale + ", destinatario=" + destinatario
				+ ", indirizzoSpedizione=" + indirizzoSpedizione
				+ ", noteCorriere=" + noteCorriere + ", metodoDiSpedizione=" + metodoDiSpedizione + ", numeroTracking="
				+ numeroTracking + ", data=" + data + ", circuito=" + circuito + ", confezioneRegalo="
				+ confezioneRegalo + ", numeroCarta=" + numeroCarta + ", username=" + username + "]";
	}
	
	
}