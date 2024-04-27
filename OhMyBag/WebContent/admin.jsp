<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "java.util.*, it.ohmybag.bean.*, it.ohmybag.model.*" pageEncoding="UTF-8"%>

<%

Collection<Prodotto> products = (Collection<Prodotto>) request.getSession().getAttribute("products");

%>

<!DOCTYPE html>
<html lang="en">

<head>
        <title> Admin Page </title>
        <link rel="stylesheet" type="text/css" href="./css/stileAdmin.css">
</head>
<body>
	<div class="container">
		<div class="container-table">
			<h2>Prodotti</h2>
				<table border="1">
				<tr>
					<th>Code </th>
					<th>Name </th>
					<!--<th>Description <a href="product?sort=description">Sort</a></th> la aggiungioamo se viene cliccato su Details-->
					<th>Action</th>
				</tr>
				<%
					if (products != null && products.size() != 0) {
						Iterator<?> it = products.iterator();
						while (it.hasNext()) {
							Prodotto bean = (Prodotto) it.next();
				%>
				<tr>
					<td><%=bean.getId()%></td>
					<td><%=bean.getNome()%></td>
					<!--<td><%=bean.getDescrizione()%></td>-->
					<td><a href="AdminControl?ID=<%=bean.getId()%>">Delete</a><br>
						<a href="AdminControl?action=read&id=<%=bean.getId()%>">Details</a><br>
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
				<form action="product" method="post">
					<input type="hidden" name="action" value="insert"> 
					
					<label for="ID">ID:</label><br> 
					<input name="ID" type="text" maxlength="100" required placeholder="enter ID"><br>
					
					<label for="Marca">Marca:</label><br> 
					<input name="Marca" type="text" maxlength="100" required placeholder="enter Marca"><br>
					
					<label for="Nome">Nome:</label><br> 
					<input name="Nome" type="text" maxlength="100" required placeholder="enter Nome"><br> 
					
					<label for="Prezzo">Prezzo:</label><br> 
					<input name="Prezzo" type="number" min="0" required placeholder="enter Prezzo"><br>
					
					<label for="Tipologia">Tipologia:</label><br> 
					<input name="Tipologia" type="text" maxlength="100" required placeholder="enter Tipologia"><br>
					
					<label for="Categoria">Categoria:</label><br>
					Donna <input name="Categoria" type="radio" value="01"><br> 
					Uomo <input name="Categoria" type="radio" value="02"><br>
					Viaggi <input name="Categoria" type="radio" value="03"><br>

					<label for="Descrizione">Descrizione:</label><br> 
					<textarea name="Descrizione" type="text" maxlength="2000" rows="3" required placeholder="enter Descrizione"></textarea><br>
					
					<label for="AnnoCollezione">AnnoCollezione:</label><br> 
					<input name="AnnoCollezione" type="number" min="1900" required placeholder="enter Anno Collezione"><br>
					
					<label for="Sconto">Sconto:</label><br>
					<input name="Sconto" type="number" maxlength="100" default_value="0" min="0" max="100" required placeholder="enter Sconto"><br>
					
					<label for="Disponibilita">Disponibilità:</label><br>
					<input name="Disponibilita" type="number" min="0" required placeholder="enter Disponibilità"><br>

					<input type="submit" value="Add"><input type="reset" value="Reset">
				</form>
			</div>
			<div class="product-details">
				<h2>Dettagli del prodotto</h2>
			</div>
		</div>
	</div>
</body>
</html>
