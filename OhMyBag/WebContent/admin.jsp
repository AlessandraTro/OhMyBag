<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, it.ohmybag.bean.*, it.ohmybag.model.*"
	pageEncoding="UTF-8"%>

<%
Collection<Prodotto> products = (Collection<Prodotto>) request.getSession().getAttribute("products");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Admin Page</title>
<link rel="stylesheet" type="text/css" href="./css/adminStyle.css">
</head>
<body>
	<div class="container">
		<div class="container-table">
			<h2>Prodotti</h2>
			<table border="1">
				<tr>
					<th>Code</th>
					<th>Name</th>
					<!--<th>Description <a href="product?sort=description">Sort</a></th> la aggiungioamo se viene cliccato su Details-->
					<th>Action</th>
				</tr>
				<%
				if (products != null && products.size() != 0) {
					for (Prodotto bean : products) {
				%>
				<tr>
					<td><%=bean.getId()%></td>
					<td><%=bean.getNome()%></td>
					<!--<td><%=bean.getDescrizione()%></td>-->
					<td><a href="AdminControl?action=delete&ID=<%=bean.getId()%>">Delete</a><br>
					<!-- aggiungere Alert per conferma di eliminazione --> <a
						href="AdminControl?action=detail&ID=<%=bean.getId()%>">Details</a><br>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6">No products available</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>

		<div class="container-insert">
			<div class="insert-form">
				<h2>Insert</h2>
				<form action="AdminControl" method="post">
					<input type="hidden" name="action" value="insert"> <label
						for="ID">ID:</label><br> <input name="ID" type="text"
						maxlength="100" required placeholder="enter ID"><br>

					<label for="Marca">Marca:</label><br> <input name="Marca"
						type="text" maxlength="100" required placeholder="enter Marca"><br>

					<label for="Nome">Nome:</label><br> <input name="Nome"
						type="text" maxlength="100" required placeholder="enter Nome"><br>

					<label for="Prezzo">Prezzo:</label><br> <input name="Prezzo"
						type="number" min="0" required placeholder="enter Prezzo"><br>

					<label for="Tipologia">Tipologia:</label><br> <input
						name="Tipologia" type="text" maxlength="100" required
						placeholder="enter Tipologia"><br> <label
						for="Categoria">Categoria:</label><br> Donna <input
						name="Categoria" type="radio" value="01"><br> Uomo <input
						name="Categoria" type="radio" value="02"><br> Viaggi
					<input name="Categoria" type="radio" value="03"><br> <label
						for="Descrizione">Descrizione:</label><br>
					<textarea name="Descrizione" type="text" maxlength="3000" rows="3"
						required placeholder="enter Descrizione"></textarea>
					<br> <label for="AnnoCollezione">AnnoCollezione:</label><br>
					<input name="AnnoCollezione" type="number" min="1900" required
						placeholder="enter Anno Collezione"><br> <label
						for="Sconto">Sconto:</label><br> <input name="Sconto"
						type="number" maxlength="100" default_value="0" min="0" max="100"
						required placeholder="enter Sconto"><br> <label
						for="Disponibilita">Disponibilità:</label><br> <input
						name="Disponibilita" type="number" min="0" required
						placeholder="enter Disponibilità"><br> <input
						type="submit" value="Add"><input type="reset"
						value="Reset">
				</form>
			</div>
		</div>
		<div class="product-details">
			<%
			if (request.getAttribute("descrizione") != null) {
			%>
			<h2>Dettagli del prodotto</h2>
			<form action="AdminControl" method="POST">
				<input type="hidden" name="action" value="modDesc"> <input
					type="hidden" name="ID" value="<%=request.getParameter("ID")%>">

				<label for="modDescrizione">Modifica Descrizione:</label><br>
				<textarea name="modDescrizione" type="text" maxlength="3000"
					rows="3" required placeholder="enter Descrizione"
					style="height: 400px;">
					<%=request.getAttribute("descrizione")%>
					</textarea>
				<br> <input type="submit" value="apply"><input
					type="reset" value="Reset">
			</form>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>
