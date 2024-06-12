<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Collection<Prodotto> products = (Collection<Prodotto>) request.getAttribute("products");

Collection<Immagine> images = (Collection<Immagine>) request.getAttribute("ImageList");
%>


<!DOCTYPE html>

<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Catalogo</title>
<link href="css/Catalogo.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

</head>

<body>
	<%

		Utente user = (Utente) request.getSession().getAttribute("utente");
		if (user != null && user.isAdmin()) {
	%>
	<jsp:include page="HeaderAdmin.jsp" />
	<%
		} else {
	%>
	<jsp:include page="Header.jsp" />
	<%
		}
	%>
	
	
	<!-- Immagini carousel -->
	<div id="carouselCatalogo" class="carousel slide w-100 mx-auto"
		data-bs-ride="carousel">
		<div class="carousel-inner justify-content-center">
			<!-- Prima immagine -->
			<div class="carousel-item active">
				<img src="img/website/Carousel/dior.jpg"
					class="responsive mx-auto d-block" alt="...">
			</div>
			<!-- Seconda immagine -->
			<div class="carousel-item">
				<img src="img/website/Carousel/louisVuitton.jpg"
					class="responsive mx-auto d-block" alt="...">
			</div>
			<!-- Terza immagine -->
			<div class="carousel-item">
				<img src="img/website/Carousel/versace.jpg"
					class="responsive mx-auto d-block" alt="...">
			</div>
		</div>
	</div>


	<main>


		<div class="album">
			<div class="container-fluid">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<%
					for (Prodotto prodotto : products) {
					%>
					<div class="col">
						<div class="card shadow-sm h-100">
							<a href="DettagliControl?ID=<%=prodotto.getId()%>"> <%
						 for (Immagine immagine : images) {
						 	if (prodotto.getId().equals(immagine.getIdProdotto()) && immagine.isCopertina()) {
						 %>
								<div class="position-relative">
									<img src="<%=immagine.getNome()%>"
										class="card-img-top card-img-top-custom"> <a
										href="CartControl?ID=<%=prodotto.getId()%>"
										class="add-to-cart-btn"> <img
										src="img/website/cart-shopping-solid.svg" width=20px>
									</a>
								</div> <%
							 }
							 %> <%
							 }
							 %>
							</a>
							<div class="card-body d-flex flex-column">
								<div class="card-text mb-auto">
									<h5><%=prodotto.getNome()%></h5>
								</div>
								<div
									class="mt-auto d-flex justify-content-between align-items-center">
									<div class="text-start"><%=prodotto.getMarca()%></div>
									<div class="text-end"><%=String.format("%.2f", prodotto.getPrezzo()) + " €"%></div>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>

	</main>
	<%@ include file="Footer.jsp"%>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>

</body>
</html>