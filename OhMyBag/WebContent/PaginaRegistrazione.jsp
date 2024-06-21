<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/StileRegistrazione.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

<title>Pagina Registrazione</title>
</head>
<body>
	<!-- include dell'Header -->
	<jsp:include page="Header.jsp" />

	<div class="container-all">

		<div class="container-form">
			<article class="card-body mx-auto">
				<h4 class="card-title-costum">Se hai già un Account</h4>
				<p class="login">
					<a href="LoginControl" class="btn btn-block btn-login"> <i
						class="fa fa-sign-in-alt"></i> Login
					</a>
				</p>
				<p class="divider-text">
					<span class="bg-light">O</span>
				</p>
				<h4 class="card-title-costum">Crea un Account</h4>

				<form name="form" id="form" action="RegistrazioneControl"
					method="post" onsubmit="return validate(this)">

					<div class="form-group-costum">
						<img class="immagine-reg" src="img/website/user-solid.svg">
						<input name="inputNome" class="form-control" placeholder="Nome"
							type="text" id="nome" required> <input
							name="inputCognome" class="form-control" placeholder="Cognome"
							type="text" id="cognome" required>
					</div>

					<p id="nomeError" class="error"></p>
					<p id="cognomeError" class="error"></p>

					<div class="form-group-costum">
						<img class="immagine-reg"
							src="img/website/calendar-days-solid.svg"> <input
							name="data" class="form-control" type="date" id="data" required>
					</div>

					<p id="userNameError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/envelope-solid.svg">
						<input name="email" class="form-control"
							placeholder="Indirizzo Email" type="text" id="mail" required>
					</div>

					<p id="mailError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/phone-solid.svg">
						<input name="phone" class="form-control"
							placeholder="Numero di telefono" type="text" id="phone" required>
					</div>

					<p id="phoneError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/address-card-solid.svg">
						<input name="cf" class="form-control" type="text"
							placeholder="Codice Fiscale" id="cf" required>
					</div>

					<p id="cfError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/house-solid.svg">
						<input name="indirizzo" class="form-control" type="text"
							placeholder="Indirizzo" id="indirizzo" required>
					</div>
					<p id="indirizzoError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/lock-solid.svg">
						<input name="password" class="form-control"
							placeholder="Crea password" type="password" id="password"
							required>
					</div>
					<p id="passwordError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/lock-solid.svg">
						<input name="repeat" class="form-control"
							placeholder="Ripeti password" type="password" id="passwordRepeat"
							required>
					</div>
					<p id="passwordValError" class="error"></p>

					<div class="form-group">
						<button type="submit" class="btn btn-block">Crea un
							Account</button>
					</div>

				</form>
			</article>
		</div>

	</div>

	<%@ include file="Footer.jsp"%>
	<!-- SCRIPT -->
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script src="js/paginaRegistrazione.js"></script>
</body>
</html>