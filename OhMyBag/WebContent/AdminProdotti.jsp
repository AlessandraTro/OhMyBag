<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, it.ohmybag.bean.*, it.ohmybag.model.*"
	pageEncoding="UTF-8"%>

<%
Collection<Prodotto> products = (Collection<Prodotto>) request.getSession().getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
<title>Lista Prodotti</title>
<link rel="stylesheet" type="text/css" href="./css/adminStyle.css">
</head>
<body>
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
					href="ButtonModificaProdottoControl?ID=<%=bean.getId()%>">Details</a><br>
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
</body>
</html>