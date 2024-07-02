<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="css/ChiSiamo.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Chi Siamo</title>
</head>
<body>
	<jsp:include page="Header.jsp" />
	
	<main class="container">
		<div class="descrizione">
			<div class="testo">
				<h2>Com'è nato il progetto</h2>
				<p>
					<strong>Oh My Bag</strong> è nato dall'idea di tre studenti
					universitari che a seguito della realizzazione di un progetto hanno
					pensato che un e-commerce sarebbe stato un'ottima idea da
					realizzare e mettere in pratica. <strong>Oh My Bag</strong> è
					l'e-commerce perfetto per gli amanti delle borse e non solo.
					L'obiettivo è quello di soddisfare più gusti differenti tra loro e
					di far conoscere i più amati marchi di borse, unendoli tutti in un
					unico sito. Questo permetterà agli utenti di ricercare in modo
					semplice e veloce la borsa, il borsello, la cintura e molto altro
					ancora, più adatto alle proprie esigenze, con pochi e semplici
					click.
				</p>
			</div>
			<hr style="border: none; border-left: 1px solid #000;">
			<div class="testo">
				<h2>Fondatori del progetto</h2>
				<p>
					I fondatori del progetto sono tre ragazzi che si sono conosciuti
					dietro i banchi dell'università. <strong>Benito</strong>, <strong>Alessandra</strong>
					e <strong>Anna</strong> frequentano tutti il corso di laurea in
					Informatica. La loro passione per la moda e il desiderio di creare
					qualcosa di innovativo li hanno spinti a unire le forze e a dar
					vita a <strong>Oh My Bag</strong>. Questo Trio forma un team
					affiatato e complementare, capace di trasformare una semplice idea
					in una realtà imprenditoriale di successo. La loro determinazione e
					il loro spirito innovativo sono il motore che alimenta <strong>Oh
						My Bag</strong>, sempre alla ricerca di nuove opportunità per crescere e
					migliorare.
				</p>
			</div>

		</div>
		<hr class="featurette-divider">
		<div class="creatori">
			<div class="creatore">
				<img src="img/ChiSiamo/Anna.jpg" alt="immagine non presente">
				<h4>Anna Atte</h4>
				<p>È l'esperto di <b>marketing del gruppo</b>, con un occhio attento alle tendenze del mercato e alle strategie di comunicazione.</p>
			</div>
			<div class="creatore">
				<img src="img/ChiSiamo/Alessandra.jpg" alt="immagine non presente" class="alessandra">
				<h4>Alessandra Trotta</h4>
				<p>Con una passione per il <b>design e la creatività</b>, si occupa della selezione dei prodotti e della cura dell'immagine del sito.</p>
			</div>
			<div class="creatore">
				<img src="img/ChiSiamo/Benito.jpeg" alt="immagine non presente">
				<h4>Benito Farina</h4>
				<p>È responsabile della <b>gestione del prodotto</b>, assicurando che la piattaforma risponda alle esigenze degli utenti e migliorando continuamente le funzionalità offerte.</p>
			</div>
		</div>
	</main>
	
	<jsp:include page="Footer.jsp"/>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>