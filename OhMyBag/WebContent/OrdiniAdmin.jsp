<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.bean.*,it.ohmybag.model.*"%>
<%
//Controlla se l'utente è autenticato e se è un amministratore
Utente admin = (Utente) request.getSession().getAttribute("utente");
if (admin == null || !admin.isAdmin()) {
	//Reindirizza l'utente alla pagina di errore
	response.sendRedirect("404.jsp");
	return; // Esce dalla pagina corrente
}

Collection<Ordine> ordini = (Collection<Ordine>) request.getSession().getAttribute("ordini");
Collection<Utente> utenti = (Collection<Utente>) request.getSession().getAttribute("utenti");
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

	<!-- Dettagli Ordine Image Modal -->
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
	


	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script src="js/ordiniAdmin.js"></script>

	<script>
document.addEventListener('DOMContentLoaded', function () {
    var detailsLinks = document.querySelectorAll('.details-link');
    
    detailsLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            var orderId = event.target.getAttribute('data-order-id');
            
            // Fai una chiamata AJAX per ottenere i dettagli dell'ordine
            fetch('DettagliOrdiniAdmin?Codice=' + orderId, {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.text())
            .then(html => {
                // Aggiorna il corpo della modale con i dettagli ricevuti
                document.querySelector('#ordiniModal .modal-body').innerHTML = html;
                
                // Mostra la modale
                $('#ordiniModal').modal('show');
            });
        });
    });
});
</script>

</body>
</html>
