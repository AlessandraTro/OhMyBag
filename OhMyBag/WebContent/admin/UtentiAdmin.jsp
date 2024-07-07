<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.SQLException, java.util.*, java.time.*, java.time.format.DateTimeFormatter, it.ohmybag.bean.*, it.ohmybag.model.*"%>
    
<%
//Ottieni la collezione degli utenti dalla sessione
Collection<Utente> utenti = (Collection<Utente>) request.getSession().getAttribute("utenti");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="./css/OrdiniAdmin.css" rel="stylesheet" type="text/css">

<title>Utenti</title>
</head>
<body>
	<%-- Includi l'header dell'amministratore --%>
    <%@ include file="HeaderAdmin.jsp"%>
    <div class="tutto">
        <div class="container-table">
            <h2 class="titoloOrder">Utenti</h2>
            <form class="formOrdini" id="filterForm" method="post">
                <div class="Sel-utente">
                    <label class="text-inputs" for="usernameSearch">Utente:</label>
                    <input class="barraRicerca" type="text" role="search" id="usernameSearch" name="usernameSearch" placeholder="Cerca utente...">
                </div>
                <div class="div-bottoni">
                    <button class="buttonsFilter" type="button" onclick="resetFilters()">Reset</button>
                </div>
            </form>
            <table class="tavola" border="1">
                <thead>
                    <tr class="tab">
                        <th class="riga">Nome</th>
                        <th class="riga">Cognome</th>
                        <th class="riga">Username</th>
                        <th class="riga">Data Nascita</th>
                        <th class="riga">Dettagli</th>
                    </tr>
                </thead>
                <tbody id="utentiTableBody">
                    <%
                 	// Verifica se ci sono utenti da visualizzare
                    if (utenti != null && !utenti.isEmpty()) {
                    	// Ciclo attraverso gli utenti e li visualizzo in una tabella
                        for (Utente utenteLoop : utenti) {
                    %>
                    <tr class="tab">
                        <td class="colonna"><%= utenteLoop.getNome() %></td>
                        <td class="colonna"><%= utenteLoop.getCognome() %></td>
                        <td class="colonna"><%= utenteLoop.getUsername() %></td>
    
                        <!-- Formattata la data di nascita -->
                        <%
                        GregorianCalendar calendar = utenteLoop.getDataDiNascita();
                        LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                        String formattedDate = dateTime.format(formatter);
                        %>
                        <td class="colonna"><%= formattedDate %></td>
                        <td class="colonna">
                        <!-- Link per visualizzare i dettagli dell'utente in una modale -->
                        <a href="#" class="details-link"
						data-bs-toggle="modal" data-bs-target="#utenteModal"
						data-order-id="<%=utenteLoop.getEmail()%>">Dettagli</a><br></td>
                    </tr>
                    <% 
                        }
                    } else {
                    %>
                    <!-- Nessun utente trovato -->
                    <tr class="tab">
                        <td class="colonna" colspan="5">Nessun utente trovato</td>
                    </tr>
                    <% 
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Modale per i dettagli dell'utente -->
	<div class="modal fade" id="utenteModal" tabindex="-1" role="dialog"
		aria-labelledby="utenteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="utenteModalLabel">Dettagli Utente</h5>
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
     <script src="js/utentiAdmin.js"></script>

	<script>
	// Aggiungi un listener quando il documento è completamente caricato
document.addEventListener('DOMContentLoaded', function () {
	// Seleziona tutti i link per i dettagli degli utenti
    var detailsLinks = document.querySelectorAll('.details-link');
    
 	// Itera su ogni link
    detailsLinks.forEach(function(link) {
    	// Aggiungi un listener per l'evento click
        link.addEventListener('click', function(event) {
        	// Ottieni l'username dell'utente cliccato
            var username = event.target.getAttribute('data-order-id');
            
            // Fai una chiamata AJAX per ottenere i dettagli dell'ordine
            fetch('DettagliUtenteAdmin?Username=' + username, {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.text())
            .then(html => {
                // Aggiorna il corpo della modale con i dettagli ricevuti
                document.querySelector('#utenteModal .modal-body').innerHTML = html;
                
                // Mostra la modale
                $('#utenteModal').modal('show');
            });
        });
    });
});
</script>
</body>
</html>
