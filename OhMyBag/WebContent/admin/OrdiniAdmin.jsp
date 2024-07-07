<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.bean.*,it.ohmybag.model.*"%>
<%
//Ottieni la collezione degli ordini dalla sessione
Collection<Ordine> ordini = (Collection<Ordine>) request.getSession().getAttribute("ordini");
//Ottieni la collezione degli utenti dalla sessione
Collection<Utente> utenti = (Collection<Utente>) request.getSession().getAttribute("utenti");
//Se non ci sono ordini, inizializza una nuova ArrayList
if (ordini == null) {
	ordini = new ArrayList<>();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="./css/OrdiniAdmin.css" rel="stylesheet" type="text/css">

<title>Ordini</title>
</head>
<body>
	<%-- Includi l'header dell'amministratore --%>
	<%@ include file="HeaderAdmin.jsp"%>
	<div class="tutto">
		<div class="container-table">
			<h2 class="titoloOrder">Ordini</h2>
			<form class="formOrdini" id="filterForm" method="post"
				action="OrdiniAdminControl">
				<div class="Sel-utente">
					<label class="text-inputs" for="username">Utente:</label> <select
						id="username" name="username">
						<option class="tendina" value="">--Seleziona Utente--</option>
						<%-- Ciclo sugli utenti disponibili e li aggiungi come opzioni nella tendina --%>
						<%
						if (utenti != null) {
							for (Utente utenteLoop : utenti) {
						%>
						<option class="tendina" value="<%=utenteLoop.getUsername()%>"><%=utenteLoop.getUsername()%></option>
						<%
						}
						}
						%>
					</select>
				</div>
				<div class="data">
					<label class="text-inputs" for="startDate">Data Inizio:</label> <input
						class="tendina" type="date" id="startDate" name="startDate">
				</div>
				<div class="data">
					<label class="text-inputs" for="endDate">Data Fine:</label> <input
						class="tendina" type="date" id="endDate" name="endDate">
				</div>
				<div class="div-bottoni">
					<button class="buttonsFilter" type="button" onclick="submitForm()">Filtra</button>
					<button class="buttonsFilter" type="button"
						onclick="resetFilters()">Reset</button>
				</div>
			</form>
			<table class="tavola" border="1">
				<tr class="tab">
					<th class="riga">Codice</th>
					<th class="riga">Utente</th>
					<th class="riga">Data Ordine</th>
					<th class="riga">Ordine</th>
				</tr>
				<%-- Ciclo sugli ordini e li visualizzi in una tabella --%>
				<%
				if (!ordini.isEmpty()) {
					for (Ordine ordine : ordini) {
				%>
				<tr class="tab">
					<td class="colonna"><%=ordine.getId()%></td>
					<td class="colonna"><%=ordine.getUsername()%></td>
					<!-- Formattata la data -->
					<%
					GregorianCalendar calendar = ordine.getData();
					LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
					String formattedDate = dateTime.format(formatter);
					%>
					<td class="colonna"><%=formattedDate%></td>
					<td class="colonna"><a href="#" class="details-link"
						data-bs-toggle="modal" data-bs-target="#ordiniModal"
						data-order-id="<%=ordine.getId()%>">Dettagli</a> <br></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr class="tab">
					<td class="colonna" colspan="3">No orders available</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>

	<!-- Modal per i dettagli dell'ordine -->
	<div class="modal fade" id="ordiniModal" tabindex="-1" role="dialog"
		aria-labelledby="ordiniModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ordiniModalLabel">Dettagli Ordine</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close">
					</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>	
	

	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script src="js/ordiniAdmin.js"></script>

</body>
</html>
