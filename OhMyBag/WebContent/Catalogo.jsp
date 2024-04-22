<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>

<%
Collection<Prodotto> products = (Collection<Prodotto>) request.getSession().getAttribute("products");

Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("ImageList");
%>


<!DOCTYPE html>

<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Catalogo</title>
<link href="css/Catalogo.css" rel="stylesheet" type="text/css">
</head>

<body>

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

		<!-- <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Album example</h1>
        <p class="lead text-body-secondary">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
        <p>
          <a href="#" class="btn btn-primary my-2">Main call to action</a>
          <a href="#" class="btn btn-secondary my-2">Secondary action</a>
        </p>
      </div>
    </div>
  </section>-->

		<!--  <div class="album py-5 bg-body-tertiary">
			<div class="container">

				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg" role="img"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%"
									fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-body-secondary">9 mins</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>-->


		<div class="album py-5 bg-body-tertiary">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <% for (Prodotto prodotto : products) { %>
            <div class="col">
                <div class="card shadow-sm h-100">
                    <% for(Immagine immagine: images){
                        if(prodotto.getId().equals(immagine.getIdProdotto()) && immagine.isCopertina()){ %>
                            <img src="<%=immagine.getNome()%>" class="card-img-top img-fluid" style="height: 400px;">
                    <% } %>
                     <% } %>
                    <div class="card-body d-flex flex-column">
                        <div class="card-text mb-auto">
                            <h5><%=prodotto.getNome()%></h5>
                        </div>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <div class="text-start"><%=prodotto.getMarca()%></div>
                            <div class="text-end"><%=prodotto.getPrezzo() + " €"%></div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>



	</main>

</body>
</html>