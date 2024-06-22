<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.math.BigDecimal,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.bean.*,it.ohmybag.model.*"%>	

<%
Collection<Prodotto> prodottiOrdine = (Collection<Prodotto>) request.getSession().getAttribute("prodottiOrdine");
Collection<Immagine> immaginiCopertina = (Collection<Immagine>) request.getSession().getAttribute("copertinaProdotto");
Ordine ordine = (Ordine) request.getSession().getAttribute("ordineSingolo");
Collection<Composizione> composizione = (Collection<Composizione>) request.getSession().getAttribute("composizioneOrdine");
BigDecimal prezzo = BigDecimal.ZERO;
%>

<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dettagli Ordine</title>

<link href="css/DettagliOrdine.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="css/Modal.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div id="wrapper">
		<div class="container1">
			<div class="order">
				<h2>DETTAGLI ORDINE</h2>
				<%
				for (Composizione comp : composizione) {
					BigDecimal quantita = new BigDecimal(comp.getQuantita());
					BigDecimal prezzoProdotto = new BigDecimal(comp.getPrezzo());
					Prodotto prodotto = null;
					Immagine immagineProdotto = null;

					// Trova il prodotto corrispondente alla composizione
					for (Prodotto p : prodottiOrdine) {
						if (p.getId().equals(comp.getIdProdotto())) {
					prodotto = p;
					break;
						}
					}

					// Trova l'immagine corrispondente al prodotto
					for (Immagine img : immaginiCopertina) {
						if (img != null && img.getIdProdotto().equals(comp.getIdProdotto())) {
					immagineProdotto = img;
					break;
						}
					}

					if (prodotto != null) {
				%>
				<div class="item">
					<div class="image">
						<%
						if (immagineProdotto != null) {
						%>
						<img src="<%=immagineProdotto.getNome()%>"
							class="img-responsive thumbnail" alt="Product Image">
						<%
						}
						%>
					</div>
					<div class="info">
						<h4><%=prodotto.getNome()%></h4>
						<p class="brand"><%=prodotto.getMarca()%></p>
						<p class="quantity">
							Quantità:
							<%=quantita%>
						</p>
						<p class="price" id="prezzo">
							Prezzo:
							<%=String.format("%.2f", prezzoProdotto) + " €"%>
						</p>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>

		</div>
		<!-- .order -->

		<div class="container2">
			<div class="information">
				<div class="text-All-Recap">
					<p class="titol-recap">Numero Ordine:</p>
					<p class="text-recap">
						<%=ordine.getId()%></p>
				</div>
				<div class="text-All-Recap">
					<p class="titol-recap">Destinatario:</p>
					<p class="text-recap">
						<%=ordine.getDestinatario()%></p>
				</div>
				<div class="text-All-Recap">
					<p class="titol-recap">Indirizzo di Spedizione:</p>
					<p class="text-recap">
						<%=ordine.getIndirizzoSpedizione()%></p>
				</div>
				<div class="text-All-Recap">
					<p class="titol-recap">Data di Acquisto:</p>
					<%
					GregorianCalendar calendar = ordine.getData();
					LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
					String formattedDate = dateTime.format(formatter);
					%>
					<p class="text-recap">
					
						<%=formattedDate%></p>
				</div>
				<div class="text-All-Recap">
					<p class="titol-recap">Note Corriere:</p>
					<p class="text-recap">
						<%=ordine.getNoteCorriere()%></p>
				</div>
				<div class="text-All-Recap">
					<p class="titol-recap">Spedizione:</p>
					<p class="text-recap">
						<%=ordine.getMetodoDiSpedizione()%></p>
				</div>
				<div class="text-All-Recap">
					<p class="titol-recap">Numero Tracking:</p>
					<p class="text-recap">
						<%=ordine.getNumeroTracking()%></p>
				</div>
				<div class="text-All-Recap">
					<p class="titol-recap">Circuito:</p>
					<p class="text-recap">
						<%=ordine.getCircuito()%></p>
				</div>
				<div class="text-All-Recap">
					<p class="titol-recap">Numero Carta:</p>
					<p class="text-recap">
						<%=ordine.getNumeroCarta()%></p>
				</div>
				
				<hr>
				<%
				BigDecimal prezzoTotale = new BigDecimal(ordine.getPrezzoTotale());
				%>
				<h3 class="total">
					Totale:
					<%=String.format("%.2f", prezzoTotale) + " €"%>
				</h3>
			</div>
		</div>

		<!-- #wrapper -->
	</div>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.7.1.min.js"></script>
</body>
</html>
