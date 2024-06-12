<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
//Controlla se l'utente è autenticato e se è un amministratore
Utente admin = (Utente) request.getSession().getAttribute("utente");
if (admin == null || !admin.isAdmin()) {
//Reindirizza l'utente alla pagina di errore o a una pagina di accesso negato
response.sendRedirect("404.jsp");
return; // Esce dalla pagina corrente
}
    Collection<Ordine> ordini = (Collection<Ordine>) request.getAttribute("ordini");
    Collection<Utente> utenti = (Collection<Utente>) request.getAttribute("utenti");
    if (ordini == null) {
        ordini = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="./css/adminStyle.css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<title>Ordini</title>
</head>
<body>
	<%@ include file="HeaderAdmin.jsp"%>
	<div class="container-table">
		<h2>Ordini</h2>
		<form method="get" action="OrdiniAdminControl">
			<div>
				<label for="username">Utente:</label> <select id="username"
					name="username">
					<option value="">--Seleziona Utente--</option>
					<%
                        if (utenti != null) {
                            for (Utente utenteLoop : utenti) {
                    %>
					<option value="<%= utenteLoop.getUsername() %>"><%= utenteLoop.getUsername() %></option>
					<%
                            }
                        }
                    %>
				</select>
			</div>
			<div>
				<label for="startDate">Data Inizio:</label> <input type="date"
					id="startDate" name="startDate"> <label for="endDate">Data
					Fine:</label> <input type="date" id="endDate" name="endDate">
			</div>
			<div>
				<button type="submit">Filtra</button>
			</div>
		</form>
		<table border="1">
			<tr>
				<th>Code</th>
				<th>Utente</th>
				<th>Action</th>
			</tr>
			<%
                if (!ordini.isEmpty()) {
                    for (Ordine ordine : ordini) {
            %>
			<tr>
				<td><%= ordine.getId() %></td>
				<td><%= ordine.getUsername() %></td>
				<td><a
					href="AdminControl?action=delete&ID=<%= ordine.getId() %>">Delete</a><br>
					<a href="ButtonModificaProdottoControl?ID=<%= ordine.getId() %>">Details</a><br>
				</td>
			</tr>
			<%
                    }
                } else {
            %>
			<tr>
				<td colspan="3">No orders available</td>
			</tr>
			<%
                }
            %>
		</table>
	</div>
		<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
