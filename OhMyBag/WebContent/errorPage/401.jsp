<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="${pageContext.request.contextPath}/css/ErrorPage.css" rel="stylesheet" type="text/css">
<title>Error 401</title>
</head>
<body>
	<div class="container">
		<div class="image">
			<img src="${pageContext.request.contextPath}/img/website/mascotteCarrelloVuoto.jpg" alt="immagine non disponibile">
		</div>
		<div class="error-info">
			<h1> Errore: 401</h1>
			<h2>Non sei autorizzato ad entrare in questa pagina</h2>
		</div>
		<div class="homepage">
			<a href="${pageContext.request.contextPath}/home"> --Torna alla home page--</a>
		</div>
	</div>
</body>
</html>