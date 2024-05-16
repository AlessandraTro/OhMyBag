<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Dettagli Prodotto</title>
<link rel="stylesheet" type="text/css" href="./css/adminStyle.css">
</head>
<body>
	<h2>Dettagli del prodotto</h2>
	<form action="AdminControl" method="POST">
		<input type="hidden" name="action" value="modDesc"> 
		<input type="hidden" name="ID" value="<%=request.getParameter("ID")%>">

		<label for="modDescrizione">Modifica Descrizione:</label><br>
		<textarea name="modDescrizione" type="text" maxlength="3000" rows="3" required placeholder="enter Descrizione" style="height: 400px;">
		<%=request.getAttribute("descrizione")%>
		</textarea><br>
		<input type="submit" value="apply">
		<input type="reset" value="Reset">
	</form>
</body>
</html>