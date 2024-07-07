<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="it.ohmybag.bean.Utente"
%>
<%
//Ottieni l'oggetto Utente dalla sessione
Utente utente=(Utente)request.getSession().getAttribute("utente");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OhMyBag</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="css/NavBar.css" rel="stylesheet" type="text/css">
    
</head>
<body>

<nav class="navbar navbar-expand-lg bg-custom fixed-top">
    <div class="container-fluid">
        <!-- Logo OhMyBag nella barra di navigazione -->
        <a class="navbar-brand" href="/OhMyBag"><img class="immagine-logo" src="img/website/logo.png" alt="OhMyBag"></a>
        <!-- Pulsante per il menu espandibile su dispositivi mobili -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <!-- Link al catalogo generale -->
                <li class="nav-item">
                    <a class="nav-link" href="CatalogoControl">Catalogo</a>
                </li>
                <!-- Dropdown per la sezione Donna -->
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
                <!-- Dropdown per la sezione Uomo -->
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
                <!-- Dropdown per la sezione Viaggi -->
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
                <!-- Dropdown per la sezione Admin -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Admin Zone </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="AdminControl?pulsante=Ordini">Ordini</a></li>
                        <li><a class="dropdown-item" href="AdminControl?pulsante=Utenti">Utenti</a></li>
                        <li><a class="dropdown-item" href="AdminControl?pulsante=Add">Aggiunta Prodotto</a></li>
                        <li><a class="dropdown-item" href="AdminControl?pulsante=Catalogo">Catalogo</a></li>
                    </ul>
                </li>
            </ul>
            
			<!-- Form di ricerca -->
            <form class="d-flex" role="search" id="searchForm" style="position: relative; margin-right:10px;">
                <input class="form-control me-2" type="search" placeholder="Cerca" aria-label="Search" id="searchInput" onkeyup="showSuggestions(this.value)">
                <button class="btn btn-outline-success" type="submit">Cerca</button>
                <div id="suggestions" class="autocomplete-suggestions"></div>
            </form>
            
            <ul class="navbar-nav mb-2 mb-lg-0">
            	<!-- Dropdown per le opzioni utente -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img id="immagine-user" src="img/website/user-secret-solid.svg" alt="User Icon">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                    		 <!-- Nome dell'utente loggato -->
                            <li class="dropdown-item">Admin: <%= utente.getNome() %></li>
                            <!-- Link per il logout -->
							<li><a class="dropdown-item" href="LogoutControl">Logout</a></li>
						</ul>
					</li>
				<!-- Link per il carrello -->
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

<!-- Script JavaScript per gestire funzionalità aggiuntive -->
<!-- <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script> -->
<script src="js/header.js"></script>

</html>
