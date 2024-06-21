<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione Avvenuta Con Successo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="css/RegistrazioneAvvenutaConSuccesso.css" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- include dell'Header -->
	<jsp:include page="Header.jsp" />

	<div class="container-all">



		<div class="container-text">
			<h1>Lo staff di Oh My Bag ti da il benvenuto nella nostra famiglia!!</h1>
			<p>
				Grazie per esserti registrato su OhMyBag! Siamo lieti di averti con noi. <br>
				La tua registrazione ci permette di offrirti un'esperienza di shopping personalizzata <br> 
				e di tenerti aggiornato sulle nostre ultime collezioni e offerte esclusive. <br>
				Siamo qui per rendere la tua esperienza di shopping online semplice, conveniente e piena di stile. <br>
				Grazie ancora per aver scelto OhMyBag. Speriamo che tu possa trovare esattamente ciÃ² che stai cercando <br>
				e che ti innamori di tutti i nostri fantastici accessori tanto quanto noi! <br>
				E ricorda il nostro motto: <strong><i> I see it, I like it, I want it, I got it!!!</i></strong><br>
				Buono shopping!
			</p>
		</div>

		<div class="container-form">
			<p class = "Log-text">Registrazione Avvenuta con Successo!!! <br></p>
			<p class = "Log-prosegui">Prosegui nella Pagina di Login.</p>
			
			<p class="login">
                    <a href="LoginControl" class="btn btn-block btn-login"> 
                        <i class="fa fa-sign-in-alt"></i>   Login
                    </a>
                </p>
		</div>
	</div>



	<%@ include file="Footer.jsp"%>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>