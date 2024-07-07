<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, it.ohmybag.bean.*, it.ohmybag.model.*"
	pageEncoding="UTF-8"%>

<%
Collection<Prodotto> products = (Collection<Prodotto>) request.getSession().getAttribute("products");
Collection<Immagine> images = (Collection<Immagine>) request.getAttribute("ImageList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Lista Prodotti</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="./css/adminStyle.css">
<link href="css/AdminProdotti.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

</head>

<body>
	<%@ include file="HeaderAdmin.jsp"%>
	<div class="container-table">
		<h1>
			<strong>Prodotti</strong>
		</h1>

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
		<table border="1">
			<tr>
				<th>Immagine</th>
				<th>Codice</th>
				<th>Nome</th>
				<th>Action</th>
			</tr>
			<%
            if (products != null && products.size() != 0) {
            	for (Prodotto bean : products) {
            %>
			<tr id="product-<%=bean.getId()%>">
				<%
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

					<button class="delete-button"
						onclick="deleteProduct('<%=bean.getId()%>')">Elimina</button>
					<br> <a
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
		<a href="AdminProdottiEliminatiControl" class="details-link">Visualizza
			Prodotti Eliminati</a>
	</div>
	<%@ include file="/ConfirmationModal.jsp" %>
	<script src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/adminProdotti.js"></script>
	
</body>
</html>
