<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException, java.util.*, java.time.*, java.time.format.DateTimeFormatter, it.ohmybag.bean.*, it.ohmybag.model.*"%>

<%
//Ottieni l'oggetto UtenteSingolo dalla sessione
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
	<!-- Contenitore principale per le informazioni utente -->
	<div class="information">
        <!-- Blocco di informazioni: Nome -->
		<div class="text-All-Recap">
			<p class="titol-recap">Nome:</p>
			<p class="text-recap">
				<%=utenteSingolo.getNome()%></p>
		</div>
        <!-- Blocco di informazioni: Cognome -->
		<div class="text-All-Recap">
			<p class="titol-recap">Cognome:</p>
			<p class="text-recap">
				<%=utenteSingolo.getCognome()%></p>
		</div>
        <!-- Blocco di informazioni: Indirizzo di Spedizione -->
		<div class="text-All-Recap">
			<p class="titol-recap">Indirizzo di Spedizione:</p>
			<p class="text-recap">
				<%=utenteSingolo.getIndirizzoSpedizione()%></p>
		</div>
        <!-- Blocco di informazioni: Data di Nascita -->
		<div class="text-All-Recap">
			<p class="titol-recap">Data di Nascita:</p>
			<%
			// Ottieni la data di nascita come oggetto GregorianCalendar
			GregorianCalendar calendar = utenteSingolo.getDataDiNascita();
			// Converti in LocalDateTime per ottenere la data e l'ora
			LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
			// Formatta la data nel formato desiderato
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String formattedDate = dateTime.format(formatter);
			%>
			<p class="text-recap">

				<%=formattedDate%></p>
		</div>
		<!-- Blocco di informazioni: Email -->
		<div class="text-All-Recap">
			<p class="titol-recap">Email:</p>
			<p class="text-recap">
				<%=utenteSingolo.getEmail()%></p>
		</div>
		<!-- Blocco di informazioni: Recapito Telefonico -->
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