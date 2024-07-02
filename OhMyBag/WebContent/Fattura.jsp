<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.math.BigDecimal,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Collection<Prodotto> prodottiOrdine = (Collection<Prodotto>) request.getSession().getAttribute("prodottiOrdine");
Collection<Immagine> immaginiCopertina = (Collection<Immagine>) request.getSession().getAttribute("copertinaProdotto");
Ordine ordine = (Ordine) request.getSession().getAttribute("ordineSingolo");
Collection<Composizione> composizione = (Collection<Composizione>) request.getSession()
		.getAttribute("composizioneOrdine");
Utente utente = (Utente) request.getSession().getAttribute("utente");

if (ordine == null || utente == null) {
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/404.jsp");
	dispatcher.forward(request, response);
	return;
}

boolean authUser = ordine.getUsername().equals(utente.getUsername()); //controlla se l'ordine è dell'utente loggato

if (!authUser) {
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/404.jsp");
	dispatcher.forward(request, response);
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
		<h1>
			Fattura del
			<%=formattedDate%></h1>
		<div id="company" class="clearfix">
			<div>OhMyBag</div>
			<div>
				45 via Giovanni Paolo II,<br /> SA 84084, IT
			</div>
			<div>0975 251262</div>
			<div>ohmybag2024@gmail.com</div>
		</div>
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
					<th class="qty">QUANTITA'</th>
					<th class="total">TOTALE (Iva Comp.)</th>
				</tr>
			</thead>
			<tbody>
				<%
				float total = 0;
				int iva = 0;
				for (Composizione comp : composizione) {
					if (iva == 0)
						iva = 22;
					for (Prodotto prodotto : prodottiOrdine) {
						if (prodotto.getId().equals(comp.getIdProdotto())) {
					float prezzoUnitario = comp.getPrezzo() / comp.getQuantita();
					prezzoUnitario = (float) (Math.ceil(prezzoUnitario * Math.pow(10, 2)) / Math.pow(10, 2));
					total += comp.getPrezzo();
				%>
				<tr>
					<td class="service"><%=prodotto.getNome()%></td>
					<td class="desc"><%=prodotto.getTipologia()%></td>
					<td class="unit"><%=String.format("%.2f", prezzoUnitario)%> €</td>
					<td class="qty"><%=comp.getQuantita()%></td>
					<td class="total"><%=String.format("%.2f", comp.getPrezzo())%>
						€</td>
				</tr>
				<%
				}
				}
				}
				total = (float) (Math.ceil(total * Math.pow(10, 2)) / Math.pow(10, 2));
				%>
				<tr>
					<%
					float totIva = (total * iva) / 100;
					totIva = (float) (Math.ceil(totIva * Math.pow(10, 2)) / Math.pow(10, 2));
					%>
					<td class="imp" colspan="4">IMPONIBILE</td>
					<td class="total2"><%=String.format("%.2f", total - totIva)%> €</td>
				</tr>
				<tr>
					<td colspan="4">SPEDIZIONE</td>
					<%
					float costoSpedizione = 0.00f;
					if (ordine.getMetodoDiSpedizione().equals("Premium")) {
						costoSpedizione = 6.90f;
					}
					%>
					<td class="total"><%=String.format("%.2f", costoSpedizione)%>
						€</td>
				</tr>
				<tr>
					<td colspan="4">IVA <%=iva%> %
					</td>

					<td class="total"><%=String.format("%.2f", totIva)%> €</td>
				</tr>
				<tr>
					<td colspan="4" class="grand total">TOTALE FINALE</td>
					<td class="TOTALE"><%=String.format("%.2f", ordine.getPrezzoTotale())%>
						€</td>
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
		function stampaFattura() {
			window.print();
		}
	</script>
	<!--     <footer> La fattura è stata creata da un computer ed è valida senza firma e sigillo. </footer> -->
</body>

<!-- Rimuove sia ordine che listaComposizione dalla sessione (usati per creare la fattura) -->
<%
request.getSession().removeAttribute("ordineSingolo");
request.getSession().removeAttribute("composizioneOrdine");
%>

</html>
