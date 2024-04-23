<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .dropdown-hover:hover .dropdown-menu {
            display: block;
        }
         .navbar {
         height: 80px;
    }
    </style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/OhMyBag">OhMyBag</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="nav nav-underline">
					<li class="nav-item dropdown dropdown-hover">
                        <a class="nav-link dropdown-toggle" href="#" style="color: black; role="button"
                            aria-haspopup="true" aria-expanded="false">Donna</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-content" href="#">Borse</a></li>
                            <li><a class="dropdown-content" href="#">Zaini</a></li>
                            <li><a class="dropdown-content" href="#">Cinture</a></li>
                            <li><a class="dropdown-content" href="#">Portafogli</a></li>
                            <li><a class="dropdown-content" href="#">Accessori</a></li>
                            <li><a class="dropdown-content" href="#">Sciarpe e Cappelli</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown dropdown-hover">
                        <a class="nav-link dropdown-toggle" href="#" style="color: black; role="button"
                            aria-haspopup="true" aria-expanded="false">Uomo</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-content" href="#">Marsupi e Borselli</a></li>
                            <li><a class="dropdown-content" href="#">Zaini</a></li>
                            <li><a class="dropdown-content" href="#">Cinture</a></li>
                            <li><a class="dropdown-content" href="#">Portafogli</a></li>
                            <li><a class="dropdown-content" href="#">Accessori</a></li>
                            <li><a class="dropdown-content" href="#">Sciarpe e Cappelli</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown dropdown-hover">
                        <a class="nav-link dropdown-toggle" href="#" style="color: black; role="button"
                            aria-haspopup="true" aria-expanded="false">Viaggi</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-content" href="#">Valigie</a></li>
                            <li><a class="dropdown-content" href="#">Bagaglio a mano</a></li>
                            <li><a class="dropdown-content" href="#">Zaini da Viaggio</a></li>
                            <li><a class="dropdown-content" href="#">Borsoni da Viaggio</a></li>
                            <li><a class="dropdown-content" href="#">Accessori da Viaggio</a></li>
                        </ul>
                    </li>
                </ul>
						
			 <div class="ml-auto d-flex align-items-center">
           		<form class="d-flex" role="search"">
                	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                	<button class="btn btn-outline-success" type="submit">
					<i class="fas fa-search"></i></button>
            	</form>
            
            <div class="navbar-nav">
             	<a class="nav-link" href="#"><i class="fas fa-user"></i></a>
                <a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i></a>
            </div>
        </div>
    </div>
</nav>
						
			
</body>

