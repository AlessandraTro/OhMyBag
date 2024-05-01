package it.ohmybag.bean;

import java.io.Serializable;
import java.util.*;

public class Prodotto implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String marca;
	private String nome;
	private float prezzo;
	private String tipologia;
	private int idCategoria;
	private String descrizione;
	private int annoCollezione;
	private GregorianCalendar dataInserimento;
	private int sconto;
	private int disponibilita;

	public Prodotto(String id, String marca, String nome, float prezzo, String tipologia, int idcategoria, String descrizione, int annoCollezione){
		this.id=id;
		this.marca=marca;
		this.nome=nome;
		this.prezzo=prezzo;
		this.tipologia=tipologia;
		this.idCategoria=idcategoria;
		this.descrizione=descrizione;
		this.annoCollezione=annoCollezione;
		this.dataInserimento=new GregorianCalendar();
		this.sconto=0;
		this.disponibilita=0;
	}
	public Prodotto() {
		
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}

	public float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}

	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getAnnoCollezione() {
		return annoCollezione;
	}

	public void setAnnoCollezione(int annoCollezione) {
		this.annoCollezione = annoCollezione;
	}

	public GregorianCalendar getDataInserimento() {
		return dataInserimento;
	}

	public void setDataInserimento(GregorianCalendar dataInserimento) {
		this.dataInserimento = dataInserimento;
	}

	public int getSconto() {
		return sconto;
	}

	public void setSconto(int sconto) {
		this.sconto = sconto;
	}

	public int getDisponibilita() {
		return disponibilita;
	}

	public void setDisponibilita(int disponibilita) {
		this.disponibilita = disponibilita;
	}

	@Override
	public String toString() {
		return "Prodotto [id=" + id + ", marca=" + marca + ", nome=" + nome + ", prezzo=" + prezzo + ", tipologia="
				+ tipologia + ", idCategoria=" + idCategoria + ", descrizione=" + descrizione + ", annoCollezione="
				+ annoCollezione + ", dataInserimento=" + dataInserimento + ", sconto=" + sconto + ", disponibilita="
				+ disponibilita + "]";
	}
	@Override
	public boolean equals(Object o) {
	    if (this == o) return true;
	    if (o == null || getClass() != o.getClass()) return false;
	    Prodotto prodotto = (Prodotto) o;
	    return id.equals(prodotto.id);
	}

	@Override
	public int hashCode() {
	    return Objects.hash(id);
	}
}
