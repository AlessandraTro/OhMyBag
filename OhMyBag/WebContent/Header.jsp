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
        <a class="navbar-brand" href="/OhMyBag">OhMyBag</a>
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
                        <li><a class="dropdown-item" href="#">Borse</a></li>
                        <li><a class="dropdown-item" href="#">Zaini</a></li>
                        <li><a class="dropdown-item" href="#">Cinture</a></li>
                        <li><a class="dropdown-item" href="#">Portafogli</a></li>
                        <li><a class="dropdown-item" href="#">Accessori</a></li>
                        <li><a class="dropdown-item" href="#">Sciarpe e Cappelli</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Uomo </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Marsupi e Borselli</a></li>
                        <li><a class="dropdown-item" href="#">Zaini</a></li>
                        <li><a class="dropdown-item" href="#">Cinture</a></li>
                        <li><a class="dropdown-item" href="#">Portafogli</a></li>
                        <li><a class="dropdown-item" href="#">Accessori</a></li>
                        <li><a class="dropdown-item" href="#">Sciarpe e Cappelli</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Viaggi </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Valigie</a></li>
                        <li><a class="dropdown-item" href="#">Bagaglio a mano</a></li>
                        <li><a class="dropdown-item" href="#">Zaini da Viaggio</a></li>
                        <li><a class="dropdown-item" href="#">Borsoni da Viaggio</a></li>
                        <li><a class="dropdown-item" href="#">Accessori da Viaggio</a></li>
                    </ul>
                </li>
            </ul>
            
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Cerca" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Cerca</button>
            </form>
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left:15px; margin-right:15px;">
                    <img id="immagine-user" src="img/website/user-solid.svg" >
                </a>
                <%if(utente!=null){%>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li class="dropdown-item">Ciao: <%=utente.getNome()%></li>
                    <li><a class="dropdown-item" href="#">Logout</a></li>
                    <%if(utente.isAdmin()){%>
                    <li><a class="dropdown-item" href="AdminControl">Admin Zone</a></li>
                    <%}%>
                </ul>

                <%}else{ %>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="LoginControl">Login</a></li>
                    <li><a class="dropdown-item" href="ButtonRegistrazioneControl">Registrati</a></li>
                </ul>
                <%}%>
            </div>
            <a class="nav-link" href="ButtonCarrelloControl">
                <img id="immagine-cart" src="img/website/cart-shopping-solid.svg" >
            </a>
        </div>
    </div>
</nav>

</body>
</html>
