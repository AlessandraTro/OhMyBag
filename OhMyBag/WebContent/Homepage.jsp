<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="css/Homepage.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>OhMyBag</title>
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
	<!-- include dell'Header -->

	<main>
		<!-- CAROUSEL
  ================================================== -->
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

		<!-- HEADINGS
  ================================================== -->

		<div class="container-custom">

			<div class="container-heading">
				<div class="row">
					<div class="col-lg-3 ">
						<h1 class="d-none d-lg-block">NUOVI ARRIVI</h1>
					</div>
					<div class="col-lg-9">
						<div class="d-lg-none d-flex align-items-center">
							<!-- Mostra la scritta e il carousel sulla stessa riga su dispositivi di piccole dimensioni -->
							<!-- DISPOSITIVI PICCOLI -->
							<h1 class="flex-grow-1">NUOVI ARRIVI</h1>
							<div id="carouselExampleControls" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">

										<!-- AGGIUNGERE PAGINA IN ORDINE DI ARRIVO -->
										<a href="CategorieProdottiControl?categoria=Donna&tipo=">
											<img class="bd-placeholder-img rounded-circle" width="200"
											height="200" src="img/website/headings/dior.jpg"
											alt="Immagine">
										</a>
										<h2 class="text-costum">Donna</h2>
									</div>

									<div class="carousel-item">
										<!-- AGGIUNGERE PAGINA IN ORDINE DI ARRIVO -->
										<a href="CategorieProdottiControl?categoria=Uomo&tipo="> <img
											class="bd-placeholder-img rounded-circle" width="200"
											height="200" src="img/website/headings/gucci.jpg"
											alt="Immagine">
										</a>
										<h2 class="text-costum">Uomo</h2>
									</div>

									<div class="carousel-item">
										<!-- AGGIUNGERE PAGINA IN ORDINE DI ARRIVO -->
										<a href="CategorieProdottiControl?categoria=Viaggi&tipo=">
											<img class="bd-placeholder-img rounded-circle" width="200"
											height="200" src="img/website/headings/prada.jpg"
											alt="Immagine">
										</a>
										<h2 class="text-costum">Viaggi</h2>
									</div>
								</div>

								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleControls" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleControls" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>

						<div class="d-none d-lg-block">
							<!-- Nasconde il carousel su dispositivi di grandi dimensioni -->
							<!-- DISPOSITIVI GRANDI -->
							<div class="row">
								<div class="col-lg-4 d-flex flex-column"
									style="align-items: center;">

									<!-- AGGIUNGERE PAGINA IN ORDINE DI ARRIVO -->
									<a href="CategorieProdottiControl?categoria=Donna&tipo="> <img
										class="bd-placeholder-img rounded-circle" width="160"
										height="160" src="img/website/headings/dior.jpg"
										alt="Immagine">
									</a>
									<h2 class="text-costum">Donna</h2>
								</div>
								<div class="col-lg-4 d-flex flex-column"
									style="align-items: center;">

									<!-- AGGIUNGERE PAGINA IN ORDINE DI ARRIVO -->
									<a href="CategorieProdottiControl?categoria=Uomo&tipo="> <img
										class="bd-placeholder-img rounded-circle" width="160"
										height="160" src="img/website/headings/gucci.jpg"
										alt="Immagine">
									</a>

									<h2 class="text-costum">Uomo</h2>
								</div>
								<div class="col-lg-4 d-flex flex-column"
									style="align-items: center;">

									<!-- AGGIUNGERE PAGINA IN ORDINE DI ARRIVO -->
									<a href="CategorieProdottiControl?categoria=Viaggi&tipo=">
										<img class="bd-placeholder-img rounded-circle" width="160"
										height="160" src="img/website/headings/prada.jpg"
										alt="Immagine">
									</a>

									<h2 class="text-costum">Viaggi</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">

			<div class="container">
				<div id="sezione-donna" class="row">
					<div class="col">
						<a href="CategorieProdottiControl?categoria=Donna&tipo=">
							<h2 class="featurette">DONNA</h2>
							<p class="lead">Vieni a scoprire tutto il catalogo donna!</p>
						</a>
					</div>
					<div class="col">
						<a href="CategorieProdottiControl?categoria=Donna&tipo="> <img
							src="img/website/featurettes/versace.jpg"
							class="card-img-top-custom">
						</a>
					</div>
				</div>
			</div>


			<hr class="featurette-divider">

			<div id="sezione-uomo" class="container">
				<div class="row">
					<div class="col">
						<a href="CategorieProdottiControl?categoria=Uomo&tipo="> <img
							src="img/website/featurettes/prada.jpg"
							class="card-img-top-custom">
						</a>
					</div>
					<div class="col">
						<a href="CategorieProdottiControl?categoria=Uomo&tipo=">
							<h2 class="featurette">UOMO</h2>
							<p class="lead">Vieni a scoprire tutto il catalogo uomo!</p>
						</a>
					</div>
				</div>
			</div>



			<hr class="featurette-divider">

			<div id="sezione-viaggi" class="container">
				<div class="row">
					<div class="col">
						<a href="CategorieProdottiControl?categoria=Viaggi&tipo=">

							<h2 class="featurette">VIAGGI</h2>
							<p class="lead">Vieni a scoprire tutto il mondo che riguarda
								i viaggi. Affidati a OhMyBag per colorare la tua vacanza!</p>
						</a>
					</div>
					<div class="col">
						<a href="CategorieProdottiControl?categoria=Viaggi&tipo="> <img
							src="img/website/featurettes/gucciValigia.jpg"
							class="card-img-top-custom">
						</a>
					</div>
				</div>
			</div>

		</div>
	</main>

	<!-- include del footer -->
	<jsp:include page="Footer.jsp" />

	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>