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
                    if (utenti != null && !utenti.isEmpty()) {
                        for (Utente utenteLoop : utenti) {
                    %>
                    <tr class="tab">
                        <td class="colonna"><%= utenteLoop.getNome() %></td>
                        <td class="colonna"><%= utenteLoop.getCognome() %></td>
                        <td class="colonna"><%= utenteLoop.getUsername() %></td>
    
                        <!-- Formattata la data -->
                        <%
                        GregorianCalendar calendar = utenteLoop.getDataDiNascita();
                        LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                        String formattedDate = dateTime.format(formatter);
                        %>
                        <td class="colonna"><%= formattedDate %></td>
                        <td class="colonna"><a href="#">Dettagli</a><br></td>
                    </tr>
                    <% 
                        }
                    } else {
                    %>
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
    
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
     <script src="js/utentiAdmin.js"></script>
</body>
</html>
