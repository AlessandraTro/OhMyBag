<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">


					<li class="nav-item"><a class="nav-link"
						href="CatalogoControl">Catalogo</a></li>
						
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Donna </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Borse</a></li>
							<li><a class="dropdown-item" href="#">Zaini</a></li>
							<li><a class="dropdown-item" href="#">Cinture</a></li>
							<li><a class="dropdown-item" href="#">Portafogli</a></li>
							<li><a class="dropdown-item" href="#">Accessori</a></li>
							<li><a class="dropdown-item" href="#">Sciarpe e Cappelli</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Uomo </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Marsupi e Borselli</a></li>
							<li><a class="dropdown-item" href="#">Zaini</a></li>
							<li><a class="dropdown-item" href="#">Cinture</a></li>
							<li><a class="dropdown-item" href="#">Portafogli</a></li>
							<li><a class="dropdown-item" href="#">Accessori</a></li>
							<li><a class="dropdown-item" href="#">Sciarpe e Cappelli</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Viaggi </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Valigie</a></li>
							<li><a class="dropdown-item" href="#">Bagaglio a mano</a></li>
							<li><a class="dropdown-item" href="#">Zaini da Viaggio</a></li>
							<li><a class="dropdown-item" href="#">Borsoni da Viaggio</a></li>
							<li><a class="dropdown-item" href="#">Accessori da
									Viaggio</a></li>
						</ul></li>

				</ul>
				<div class="custom-container">
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search" placeholder="Cerca"
							aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Cerca</button>

					</form>
					<div class="cart-section">
						<a class="nav-link" href="AdminControl"><i class="fas fa-user"></i></a> <a
							class="nav-link" href="ButtonCarrelloControl"><i class="fas fa-shopping-cart"></i></a>
					</div>
				</div>

			</div>
		</div>
	</nav>


</body>

