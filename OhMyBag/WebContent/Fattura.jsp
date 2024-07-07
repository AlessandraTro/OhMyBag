<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.math.BigDecimal,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Collection<Prodotto> prodottiOrdine = (Collection<Prodotto>) request.getSession().getAttribute("prodottiOrdine");
Collection<Immagine> immaginiCopertina = (Collection<Immagine>) request.getSession().getAttribute("copertinaProdotto");
Ordine ordine = (Ordine) request.getSession().getAttribute("ordineSingolo");
Collection<Composizione> composizione = (Collection<Composizione>) request.getSession().getAttribute("composizioneOrdine");
Utente utente = (Utente) request.getSession().getAttribute("utente");

if (ordine == null || utente == null) {
	response.sendError(404);
	return;
}

boolean authUser = ordine.getUsername().equals(utente.getUsername()); //controlla se l'ordine è dell'utente loggato

if (!authUser) {
	response.sendError(404);
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fattura</title>
<link href="css/Fattura.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FDF5E6">

	<header class="clearfix">
		<hr class="hr hr-blurry" />

		<div id="logo">
			<img src="img/website/logo.png">
		</div>
		<%
		GregorianCalendar calendar = ordine.getData();
		LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String formattedDate = dateTime.format(formatter);
		%>
		<h1> Fattura del <%=formattedDate%></h1>
		
		<!-- dati a destra della fattura -->
		<div id="company" class="clearfix">
			<div>OhMyBag</div>
			<div>
				45 via Giovanni Paolo II,<br /> SA 84084, IT
			</div>
			<div>0975 251262</div>
			<div>ohmybag2024@gmail.com</div>
		</div>
		
		<!-- dati a sinistra della fattura -->
		<div id="project">
			<div>
				<span>CLIENTE</span>
				<%=utente.getNome()%>
				<%=utente.getCognome()%></div>
			<div>
				<span>INDIRIZZO</span>
				<%=ordine.getIndirizzoSpedizione()%></div>
			<div>
				<span>EMAIL</span> <a href="mailto:<%=utente.getEmail()%>"><%=utente.getEmail()%></a>
			</div>
			<div>
				<span>TELEFONO</span>
				<%=utente.getTelefono()%></div>
			<div>
				<span>C.F</span>
				<%=utente.getCodiceFiscale()%></div>
		</div>
	</header>

	<main>

		<div style="margin-top: 100px;"></div>
		<hr class="hr hr-blurry" />
		<table>
			<thead>
				<tr>
					<th class="service">PRODOTTO</th>
					<th class="desc">DESCRIZIONE</th>
					<th class="unit">PREZZO (Iva Comp.)</th>
					<th class="scont">SCONTO</th>
					<th class="qty">QUANTITA'</th>
					<th class="total">TOTALE (Iva Comp.)</th>
				</tr>
			</thead>
			<tbody>
				<%
				float total = 0;
				int sconto = 0;
				int iva = 0;
				for (Composizione comp : composizione) {
					if (iva == 0)
						iva = 22;
					for (Prodotto prodotto : prodottiOrdine) {
						if (prodotto.getId().equals(comp.getIdProdotto())) {
							System.out.println("prezzo unitario: " + comp.getPrezzo());
							System.out.println("quantità: " + comp.getQuantita());
					sconto= comp.getSconto();	//prende lo sconto dalla composizione
					System.out.println("sconto: " + sconto);

					float prezzoUnitario = ((comp.getPrezzo() / comp.getQuantita())/(100-sconto))*100; // calcolo del prezzo del prodotto incluso di iva
					total += (comp.getPrezzo()/(100-sconto))*100;
				%>
				<tr>
					<td class="service"><%=prodotto.getNome()%></td>
					<td class="desc"><%=prodotto.getTipologia()%></td>
					<td class="unit"><%=String.format("%.2f", prezzoUnitario)%> €</td>
					<td class="scont"><%=sconto%> %</td>
					<td class="qty"><%=comp.getQuantita()%></td>
					<td class="total"><%=String.format("%.2f", comp.getPrezzo())%> €</td>
				</tr>
				<%
				}
				}
				}
				%>
				<tr>
					<%
					float imponibile = (total*100)/(100+iva);
					%>
					<td class="imp" colspan="5">IMPONIBILE</td>
					<td class="total2"><%=String.format("%.2f", imponibile)%> €</td>
				</tr>
				<tr>
					<td colspan="5">SPEDIZIONE</td>
					<%
					float costoSpedizione = 0.00f;
					if (ordine.getMetodoDiSpedizione().equals("premium")) {
						costoSpedizione = 6.90f;
					}
					%>
					<td class="total"><%=String.format("%.2f", costoSpedizione)%> €</td>
				</tr>
				<tr>
					<td colspan="5">IVA <%=iva%> %
					</td>

					<td class="total"><%=String.format("%.2f", total-imponibile)%> €</td>
				</tr>
				<tr>
					<td colspan="5" class="grand total">TOTALE FINALE</td>
					<td class="TOTALE"><%=String.format("%.2f", ordine.getPrezzoTotale())%> €</td>
				</tr>
			</tbody>
		</table>
				<hr class="hr hr-blurry" />
		
		<div class="base" id="notices">
			<div>NOTICE:</div>
			<div class="notice">Grazie per aver acquistato su OhMyBag</div>
			<div class="boo">
				<button class="print-hide" onclick="stampaFattura()">Stampa
					Fattura</button>
			</div>
		</div>
	</main>


	<script>
	//funzione che permette la stampa della fattura
		function stampaFattura() {
			window.print();
		}
	</script>
</body>
<!-- Rimuove sia ordine che listaComposizione dalla sessione (usati per creare la fattura) -->
<%
request.getSession().removeAttribute("ordineSingolo");
request.getSession().removeAttribute("composizioneOrdine");
%>
</html>
