<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>


<%
        Collection<Prodotto> products = (Collection<Prodotto>) request.getAttribute("productPage");
        Collection<Immagine> images = (Collection<Immagine>) request.getAttribute("ImageList");
        Integer totalPages = (Integer) request.getAttribute("totalPages");
        Integer currentPage = (Integer) request.getSession().getAttribute("currentPage");
System.out.println("currentPage" +currentPage);
        if (totalPages == null) {
            totalPages = 1; // O un valore di default appropriato
        }
        if (currentPage == null) {
            currentPage = 1; // O un valore di default appropriato
        }
        
        // Check if there's a specific parameter in the request
        String searchParam = request.getParameter("searchField"); // Replace "paramName" with your actual parameter name
        String categoria = request.getParameter("categoria"); // Replace "paramName" with your actual parameter name
        String tipo = request.getParameter("tipo"); // Replace "paramName" with your actual parameter name

        // Determine which control to load
        String controlPage;
        if (searchParam != null && !searchParam.isEmpty()) {
            controlPage = "ProdottiRicercaControl?searchField=" +searchParam; // Load ricercaControl if parameter is present
        } else if (categoria!=null){
            controlPage = "CategorieProdottiControl?categoria=" + categoria + "&tipo=" + tipo;
        }
        else {
            controlPage = "CatalogoControl"; // Otherwise, load catalogoControl
        }
    %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Prodotti Catalogo</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <link href="css/Catalogo.css" rel="stylesheet" type="text/css"> -->
<link href="css/CatalogoModale.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

</head>
<body>

	<main>
		<div class="album">
			<div
				class="custom-row custom-row-cols-1 custom-row-cols-sm-2 custom-row-cols-md-3 g-3">
				<% for (Prodotto prodotto : products) { %>
				<div class="custom-col">
					<div class="card shadow-sm h-100">
						<a href="DettagliControl?ID=<%=prodotto.getId()%>"> <%
                            // Trova la copertina corretta per il prodotto
                            for (Immagine immagine : images) {
                                if (prodotto.getId().equals(immagine.getIdProdotto()) && immagine.isCopertina()) {
                            %>
							<div class="position-relative">

								<img src="<%=immagine.getNome().replaceAll("\\?", "'")%>"
									class="custom-card-img-top card-img-top-custom"> <a
									href="#" class="add-to-cart-btn"
									onclick="addToCart('<%= prodotto.getId() %>')"> <img
									src="img/website/cart-shopping-solid.svg" width="20px">
								</a>
							</div> <%
                                    break; // Esci dal ciclo dopo aver trovato la copertina
                                }
                            }
                            %>
						</a>
						<div class="card-body d-flex flex-column">
							<div class="card-text mb-auto">
								<h5><%= prodotto.getNome().replaceAll("\\?", "'") %></h5>
							</div>
							<div
								class="mt-auto d-flex justify-content-between align-items-center">
								<div class="text-start"><%=prodotto.getMarca()%></div>
								<div class="text-end"><%= String.format("%.2f", prodotto.getPrezzo()) + " &euro;" %></div>
							</div>
						</div>
					</div>
				</div>
				<% } %>
			</div>
		</div>
	</main>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
				<a class="page-link" href="#"
				onclick="loadPage(<%= currentPage - 1 %>)">Previous</a>
			</li>
			<%-- Genera i link per le pagine --%>
			<% for (int i = 1; i <= totalPages; i++) { %>
			<li class="page-item <%= currentPage == i ? "active" : "" %>"><a
				class="page-link" href="#" onclick="loadPage(<%= i %>)"><%= i %></a>
			</li>
			<% } %>

			<li
				class="page-item <%= currentPage == totalPages || totalPages == 0 ? "disabled" : "" %>">
				<a class="page-link" href="#"
				onclick="loadPage(<%= currentPage + 1 %>)">Next</a>
			</li>
		</ul>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="cartModal" tabindex="-1"
		aria-labelledby="cartModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-custom">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cartModalLabel">Il tuo carrello</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="cartModalContent">
					<!-- Il contenuto del carrello verrà inserito qui -->
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.7.1.min.js"></script>

	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>

	<script>



	function addToCart(idProdotto) {
	   
	    openCartModal(idProdotto);
	}


	function openCartModal(idProdotto) {
	    $.ajax({
	        url: 'CartControl',
	        type: 'GET',
	        data: { ID: idProdotto },
	        success: function(data) {
	            console.log('Dati ricevuti dal server:', data);
	            $('#cartModalContent').html(data); // Inserisce il contenuto della modale
	            $('#cartModal').modal('show'); // Mostra la modale
	        },
	        error: function(xhr, status, error) {
	            console.error('Errore durante il caricamento del carrello:', error);
	        }
	    });
	}

	function loadPage(page) {
	    $.ajax({
	        url: '<%= controlPage %>', // Assicurati che controlPage punti al tuo controller
	        type: 'GET',
	        data: { page: page },
	        success: function(data) {
	            $('#dynamic-content').html(data); // Aggiorna il contenuto dei prodotti nella pagina
	            attachAddToCartHandlers(); // Riassocia i gestori di eventi
	        },
	        error: function(xhr, status, error) {
	            console.error('Errore durante il caricamento della pagina:', error);
	        }
	    });
	}

</script>
</body>
</html>