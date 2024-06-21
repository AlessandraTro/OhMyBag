<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="it.ohmybag.bean.Utente"
%>
<%Utente utente=(Utente)request.getSession().getAttribute("utente"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OhMyBag</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>

<nav class="navbar navbar-expand-lg bg-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="/OhMyBag"><img class="immagine-logo" src="img/website/logo.png" alt="OhMyBag"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="CatalogoControl">Catalogo</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Donna </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Donna&tipo=Borsa">Borse</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Donna&tipo=Zaino">Zaini</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Donna&tipo=Cintura">Cinture</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Donna&tipo=Portafoglio">Portafogli</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Donna&tipo=Accessori">Accessori</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Donna&tipo=Sciarpe e Cappelli">Sciarpe e Cappelli</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Uomo </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Uomo&tipo=Marsupi e Borselli">Marsupi e Borselli</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Uomo&tipo=Zaino">Zaini</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Uomo&tipo=Cintura">Cinture</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Uomo&tipo=Portafoglio">Portafogli</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Uomo&tipo=Accessori">Accessori</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Uomo&tipo=Sciarpe e Cappelli">Sciarpe e Cappelli</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Viaggi </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Viaggi&tipo=Valigie">Valigie</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Viaggi&tipo=Bagagli a mano">Bagaglio a mano</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Viaggi&tipo=Zaini da Viaggio">Zaini da Viaggio</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Viaggi&tipo=Borsoni da Viaggio">Borsoni da Viaggio</a></li>
                        <li><a class="dropdown-item" href="CategorieProdottiControl?categoria=Viaggi&tipo=Accessori Da Viaggio">Accessori da Viaggio</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link info" href="OrdiniAdminControl">Chi Siamo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contattaci</a>
                </li>
            </ul>
            
			<form class="d-flex" role="search" style="margin-right:10px;">
			    <input class="form-control me-2" type="search" placeholder="Cerca" aria-label="Search">
			    <button class="btn btn-outline-success" type="submit">Cerca</button>
			</form>
            
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    	<%if (utente != null){%> <!-- utente loggato -->
                        	<img id="immagine-user" src="img/website/circle-user-solid.svg" alt="User Icon" style="width:30px">
                        <%}else{ %> <!-- utente non loggato -->
                        	<img id="immagine-user" src="img/website/user-solid.svg" alt="User Icon">
                        <%} %>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <% if (utente != null) { %>
                            <li class="dropdown-item">Ciao: <%= utente.getNome() %></li>
                            <% if (!utente.isAdmin()) { %>
                                <li><a class="dropdown-item" href="OrdiniUtenteControl">User Zone</a></li>
                            <% } %>
                            <li><a class="dropdown-item" href="LogoutControl">Logout</a></li>
                        <% } else { %>
                            <li><a class="dropdown-item" href="LoginControl">Login</a></li>
                            <li><a class="dropdown-item" href="ButtonRegistrazioneControl">Registrati</a></li>
                        <% } %>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ButtonCarrelloControl">
                        <img id="immagine-cart" src="img/website/cart-shopping-solid.svg" alt="Cart Icon">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>
