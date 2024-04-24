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
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	margin-top: 20px;
}

.product-images {
	flex: 1;
	overflow-x: hidden;
	display: flex;
	justify-content: space-between;
}

img {
	width: 400px;
}

.product-info {
	flex: 1;
	margin-left: 20px;
	align-items: flex-start;
}

.product-name {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 15px;
}

.product-price {
	font-size: 20px;
	margin-bottom: 70px;
}

.add-to-cart {
	background-color: #007bff;
	color: #fff;
	padding: 10px 100px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 10px;
}

.description, .shipping-returns {
	display: none;
	margin-top: 20px;
}

.toggle-button {
	background: none;
	border: none;
	cursor: pointer;
	text-decoration: underline;
	color: #007bff;
	margin-bottom: 10px;
	display: block;
}

.description:target, .shipping-returns:target {
	display: block;
}

.carousel-control-prev, .carousel-control-next {
	font-size: 24px; /* Imposta la dimensione desiderata */
	width: 50px;
	height: 500px;
}

.carousel {
	max-width: 400px;
}

.slider {
	display: flex;
	width: calc(100% * <%= images.size ()%>);
}
</style>
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
				<button class="add-to-cart">AGGIUNGI AL CARRELLO</button>
				<a href="#description" class="toggle-button" style="color: black;">Descrizione
					Prodotto</a>
				<div id="description" class="description">
					<p><%= product.getDescrizione() %></p>
				</div>
				<a href="#shipping-returns" class="toggle-button"
					style="color: black;">Spedizione e Resi</a>
				<div id="shipping-returns" class="shipping-returns">
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

