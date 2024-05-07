<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

<title>Acquisto Completato</title>
<style>
.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 30px;
}

.immagine {
	width: 400px;
	margin: 20px;
}

body {
	font-family: Times New Roman, Sans-Serif;
}

p {
	font-size: 20px;
}


</style>
</head>
<body>
	<%@ include file="Header.jsp"%>

	<div class="jumbotron jumbotron-fluid">

		<div class="container">
			<h1 class="display-4">Grazie, il tuo ordine è stato completato.</h1>
			<p class="lead">Su OhMyBag puoi trovare un sacco di offerte
				imperdibili e i migliori prodotti adatti ad ogni esigenza.</p>
			<img class="immagine" alt="immagine non trovata"
				src="img/website/mascotte.JPG">

			<p>Continua a fare shopping e cerca il pulsante "Aggiungi al
				carrello".</p>

			<div class="text-center">
				<h5 class="fw-bold mb-5">
					<a href="CatalogoControl"><i class="fas fa-angle-left me-2"></i>Back
						to shopping</a>
				</h5>
			</div>
		</div>
	</div>

	<%@ include file="Footer.jsp"%>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>