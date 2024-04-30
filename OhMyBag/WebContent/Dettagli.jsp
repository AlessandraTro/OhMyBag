<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>

<%
Prodotto product = (Prodotto) request.getAttribute("products");
Collection<Immagine> images = (Collection<Immagine>) request.getAttribute("images");
%>

<!DOCTYPE html>
<html lang="en">
<head>

<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prodotto</title>
<link href="css/Dettagli.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">


</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="container">
		<div class="product-images">
			<div id="carouselExampleIndicators" class="carousel slide">
				<div class="carousel-indicators">
					<% for (int i = 0; i < images.size(); i++) { %>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="<%= i %>" <% if (i == 0) { %> class="active"
						<% } %> aria-label="Slide <%= i + 1 %>"></button>
					<% } %>
				</div>
				<div class="carousel-inner">
					<% int index = 0; %>
					<% for (Immagine immagine : images) { %>
					<div class="carousel-item <% if (index == 0) { %>active<% } %>">
						<img src="<%= immagine.getNome() %>" class="d-block" alt="...">
					</div>
					<% index++; %>
					<% } %>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>


			<div class="product-info">
				<div class="product-name"><%= product.getNome() %></div>
				<div class="product-price">
					Prezzo: €<%= product.getPrezzo() %></div>
					<a href="CartControl?ID=<%= product.getId()%>">
						<button class="add-to-cart">AGGIUNGI AL CARRELLO</button>
					</a>
				<input type="checkbox" id="toggle-description">

				<!-- Label per il checkbox (il link toggle) -->
				<label for="toggle-description" class="toggle-button">Descrizione
					Prodotto</label>

				<div class="shipping-returns" id="description-content">
					<!-- Contenuto del dropdown-menu -->
					<p><%= product.getDescrizione()%></p>
				</div>


				<input type="checkbox" id="toggle-shipping">
				<!-- Label per il checkbox (il link toggle) -->
				<label for="toggle-shipping" class="toggle-button">Spedizione
					e Resi</label>

				<!-- Contenuto del menu -->
				<div class="shipping-returns" id="shipping-content">
					<!-- Informazioni sulla spedizione e resi -->
					<strong>Spedizione Standard</strong>
					<p>Consegna entro 3-4 giorni lavorativi (Gratis)</p>

					<strong>Spedizione Premium</strong>
					<p>Consegna entro 1-2 giorni lavorativi (+6,90)</p>

					<p>Gli articoli personalizzati sono spediti entro 30 giorni
						dalla conferma dell'ordine. Per suddetti prodotti non è prevista
						possibilità di reso, fatta eccezione per quelli non conformi al
						modello selezionato in fase di personalizzazione.</p>

					<strong>Reso facile</strong>
					<p>Forniamo un servizio gratuito di ritiro dei resi o dei
						cambi: puoi richiederlo entro 14 giorni dalla consegna.</p>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>

