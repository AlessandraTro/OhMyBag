<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, it.ohmybag.bean.*, it.ohmybag.model.*"
	pageEncoding="UTF-8"%>

<%
Collection<Prodotto> deletedProducts = (Collection<Prodotto>) request.getSession().getAttribute("deletedProducts");
Collection<Immagine> images = (Collection<Immagine>) request.getAttribute("ImageList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Lista Prodotti eliminati</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="./css/adminStyle.css">
<link href="css/AdminProdottiEliminati.css" rel="stylesheet"
	type="text/css">
</head>
<body>
    <!-- Fragment per includere l'header dell'admin -->
	<%@ include file="HeaderAdmin.jsp"%>
	<div class="container-table">
		<h1>
			<strong>Prodotti eliminati</strong>
		</h1>
		
        <!-- Form per la ricerca dei prodotti eliminati -->
		<form class="formOrdini" id="filterForm" method="post">
			<div class="Sel-prodotto">
				<label class="text-inputs" for="usernameSearch">Prodotto:</label> <input
					class="barraRicerca" type="text" role="search" id="prodottoSearch"
					name="prodottoSearch" placeholder="Cerca prodotto...">
			</div>
			<div class="div-bottoni">
				<button class="buttonsFilter" type="button" onclick="resetFilters()">Reset</button>
			</div>
		</form>
		
        <!-- Tabella per visualizzare i prodotti eliminati -->
		<table border="1">
			<tr>
				<th>Immagine</th>
				<th>Codice</th>
				<th>Nome</th>
				<th>Action</th>
			</tr>
			<%
            // Controlla se ci sono prodotti eliminati disponibili
            if (deletedProducts != null && deletedProducts.size() != 0) {
                // Itera sui prodotti eliminati disponibili
                for (Prodotto bean : deletedProducts) {
            %>
			<tr id="product-<%=bean.getId()%>">
				<%
                // Itera sulle immagini per trovare quella di copertina
                for (Immagine immagine : images) {
                    if (bean.getId().equals(immagine.getIdProdotto()) && immagine.isCopertina()) {
                %>
				<td><img src="<%=immagine.getNome()%>" class="image"
					alt="Product Image"></td>
				<%
                    }
                }
                %>
				<td><%=bean.getId()%></td>
				<td><%=bean.getNome()%></td>
				<td>
                    <!-- Bottone per ripristinare il prodotto -->
					<button onclick="restoreProduct('<%=bean.getId()%>')"
						class="restore-link">Ripristina</button> 
                    <!-- Link per modificare il prodotto -->
					<a
					href="ButtonModificaProdottoControl?ID=<%=bean.getId()%>"
					class="details-link">Modifica</a><br>
				</td>
			</tr>
			<%
                }
            } else {
            %>
			<tr>
				<td colspan="4">No products available</td>
			</tr>
			<%
            }
            %>
		</table>
		
        <!-- Link per ritornare al catalogo -->
		<a href="AdminControl?pulsante=Catalogo" class="details-link">Ritorna al catalogo</a>
	</div>
	
    <!-- Fragment per includere il modal di conferma -->
	<%@ include file="/ConfirmationModal.jsp" %>
	<script src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/adminProdotti.js"></script>
	<script>
	
	 function restoreProduct(productId) {
         // Apri la modale di conferma
          $('#confirmModalMessage').text("Sei sicuro di voler ripristinare il prodotto?");
         $('#confirmModal').modal('show');

         // Quando viene cliccato il pulsante di conferma
         $('#confirmActionBtn').off('click').on('click', function() {
             var xhr = new XMLHttpRequest();
             xhr.open('POST', 'AdminProdottiEliminatiControl', true);
             xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
             xhr.onreadystatechange = function () {
                 if (xhr.readyState == 4 && xhr.status == 200) {
                     location.reload(); // Ricarica la pagina dopo il ripristino
                 }
             };
             xhr.send('pulsante=Ripristina&ID=' + productId);
             
         });
         
         // Quando viene cliccato il pulsante di annullamento
         $('#confirmModal .btn-secondary').off('click').on('click', function() {
             $('#confirmModal').modal('hide');
             // Esegui altre azioni di annullamento se necessario
         });
     }
    </script>
</body>
</html>