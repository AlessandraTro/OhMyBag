<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException, java.util.*, java.time.*, java.time.format.DateTimeFormatter, it.ohmybag.bean.*, it.ohmybag.model.*"%>

<%
//Controlla se l'utente è autenticato e se è un amministratore
Utente admin = (Utente) request.getSession().getAttribute("utente");
if (admin == null || !admin.isAdmin()) {
	//Reindirizza l'utente alla pagina di errore
	response.sendRedirect("404.jsp");
	return; // Esce dalla pagina corrente
}

Utente utenteSingolo = (Utente) request.getSession().getAttribute("UtenteSingolo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dettagli Utente</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="css/DettagliUtenteAdmin.css" rel="stylesheet"
	type="text/css">
<link href="css/ModalDettagliUtente.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<div class="information">
		<div class="text-All-Recap">
			<p class="titol-recap">Nome:</p>
			<p class="text-recap">
				<%=utenteSingolo.getNome()%></p>
		</div>
		<div class="text-All-Recap">
			<p class="titol-recap">Cognome:</p>
			<p class="text-recap">
				<%=utenteSingolo.getCognome()%></p>
		</div>
		<div class="text-All-Recap">
			<p class="titol-recap">Indirizzo di Spedizione:</p>
			<p class="text-recap">
				<%=utenteSingolo.getIndirizzoSpedizione()%></p>
		</div>
		<div class="text-All-Recap">
			<p class="titol-recap">Data di Nascita:</p>
			<%
			GregorianCalendar calendar = utenteSingolo.getDataDiNascita();
			LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String formattedDate = dateTime.format(formatter);
			%>
			<p class="text-recap">

				<%=formattedDate%></p>
		</div>
		<div class="text-All-Recap">
			<p class="titol-recap">Email:</p>
			<p class="text-recap">
				<%=utenteSingolo.getEmail()%></p>
		</div>
		<div class="text-All-Recap">
			<p class="titol-recap">Recapito Telefonico:</p>
			<p class="text-recap">
				<%=utenteSingolo.getTelefono()%></p>
		</div>

	</div>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>