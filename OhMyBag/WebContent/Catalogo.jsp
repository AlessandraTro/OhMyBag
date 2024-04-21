<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>



<!DOCTYPE html>


<% //ottengo tutti i prodotti nel db

ProdottoModel prodottoModel = new ProdottoModel();
ArrayList<Prodotto> arrayProdotti = new ArrayList<>();


try {
    // Ottieni tutti i prodotti dal database
    Collection<Prodotto> prodotti = prodottoModel.allProduct();
    
    // Converti la collezione di prodotti in un array
    arrayProdotti = new ArrayList<>(prodotti);
  
} catch (SQLException e) {
    e.printStackTrace();
}
%>


<% //ottengo tutte le immagini nel db

	ImmagineModel immagineModel = new ImmagineModel();
	
	try {
	    // Recupera tutte le immagini dal database
	    Collection<Immagine> immagini = immagineModel.doRetrieveAll();
	    
	    // Converte la collezione in un array
	    Immagine[] immaginiArray = immagini.toArray(new Immagine[0]);
	    
	    // Stampa le informazioni sulle immagini
	    for (Immagine immagine : immaginiArray) {
	        System.out.println("Nome: " + immagine.getNome());
	        System.out.println("Copertina: " + immagine.isCopertina());
	        System.out.println("ID Prodotto: " + immagine.getIdProdotto());
	        System.out.println();
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Catalogo</title>
</head>
<body>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carousel Example</title>


<style>
@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

/* rende responsive le immagini*/
.responsive {
	width: 100%;
	max-width: 600px;
	height: auto;
}

/*Nelle card */
.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

/*croller per la navigazione*/
.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

/*stilizzare una barra di navigazione orizzontale*/
.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

/*Stile pulsante*/
.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8;
}
</style>


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
		
		<% 
// Stampiamo la dimensione dell'array per debug
out.println("Numero di prodotti: " + arrayProdotti.size());
%>
		

<% 
// Itera attraverso tutti i prodotti e stampa le informazioni per debug
for (Prodotto prodotto : arrayProdotti) {
%>
    <!-- Stampiamo i dettagli del prodotto -->
    <div>
        <!-- Stampiamo il nome del prodotto -->
        Nome: <%= prodotto.getNome() %><br>
        <!-- Stampiamo la marca del prodotto -->
        Marca: <%= prodotto.getMarca() %><br>
        <!-- Stampiamo il prezzo del prodotto -->
        Prezzo: <%= prodotto.getPrezzo() %><br>
        <hr> <!-- Linea di separazione tra un prodotto e l'altro -->
    </div>
<% 
}
%>



<div class="album py-5 bg-body-tertiary">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <% 
            for (Prodotto prodotto : arrayProdotti) {
            %>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c" />
                        </svg>
                        <div class="card-body">
                            <p class="card-text">
                                <h1><%= prodotto.getNome() %></h1> <br>
                            </p>
                            <div style="display: flex; justify-content: space-between;">
                                <div><%= prodotto.getMarca() %></div>
                                <div><%= prodotto.getPrezzo() %></div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</div>




	</main>
	<!-- Link al foglio di stile Bootstrap -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
		rel="stylesheet">
</body>
</html>