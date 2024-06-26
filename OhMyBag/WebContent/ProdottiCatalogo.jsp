<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>


<% Collection<Prodotto> products = (Collection<Prodotto>) request.getAttribute("products");

Collection<Immagine> images = (Collection<Immagine>) request.getAttribute("ImageList");
int totalPages = (Integer) request.getAttribute("totalPages");
int currentPage = (Integer) request.getAttribute("currentPage");



System.out.println("Total pages: " + totalPages);
System.out.println("Current page: " + currentPage);
for (Prodotto prodotto : products) {
    System.out.println("Prodotto nome: " + prodotto.getNome());
    for (Immagine immagine : images) {
        System.out.println("Immagine nome: " + immagine.getNome());
    }
}

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/Catalogo.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

</head>
<body>

	<main>
		<div class="album">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<% for (Prodotto prodotto : products) { %>
				<div class="col">
					<div class="card shadow-sm h-100">
						<a href="DettagliControl?ID=<%=prodotto.getId()%>"> <%
                            // Trova la copertina corretta per il prodotto
                            for (Immagine immagine : images) {
                                if (prodotto.getId().equals(immagine.getIdProdotto()) && immagine.isCopertina()) {
                            %>
							<div class="position-relative">
							
								<img src="<%=immagine.getNome().replaceAll("\\?", "'")%>"
									class="card-img-top card-img-top-custom"> <a
									href="CartControl?ID=<%=prodotto.getId()%>"
									class="add-to-cart-btn"> <img
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

	<script>
    function loadPage(page) {
        $.ajax({
            url: 'CatalogoControl',
            type: 'GET',
            data: { page: encodeURIComponent(page) },
            success: function(data) {
                console.log(data); // Verifica cosa viene ritornato

                $('#dynamic-content').html(data); // Aggiorna solo la lista dei prodotti
            },
            error: function(xhr, status, error) {
                console.error('Error loading page:', error);
            }
        });
    }
</script>
</body>
</html>