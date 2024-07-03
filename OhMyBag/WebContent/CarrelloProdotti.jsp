<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.math.BigDecimal,java.util.*,it.ohmybag.bean.*,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>
<%
BigDecimal prezzo = BigDecimal.ZERO;
Carrello prodotti = new Carrello();
prodotti = (Carrello) request.getSession().getAttribute("Carrello");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrello</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/Carrello.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="container-fluid">

		<div class="container-fluid no-padding">

			<div class="col-12">

				<div class="card-body p-4">

					<div class="row">


						<div class="inf">
							<%
							if (!prodotti.getProdotti().isEmpty()) {
							%>
							<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">I
								TUOI PRODOTTI</h3>
							<%
							for (Prodotto prodotto : prodotti.getProdotti().keySet()) {
								BigDecimal quantita = new BigDecimal(prodotti.getProdotti().get(prodotto));
								BigDecimal prezzoProdotto = new BigDecimal(prodotto.getPrezzo());
								prezzo = prezzo.add(quantita.multiply(prezzoProdotto));
							%>
							<div class="card-ct">
								<div class="col-cot">
									<%
										for (Immagine immagine : prodotti.getImmagini()) {
											if (immagine != null && prodotto.getId().equals(immagine.getIdProdotto()) && immagine.isCopertina()) {
										%>
									<div class="cont-img">
										<a href="DettagliControl?ID=<%=prodotto.getId()%>"><img
											src="<%=immagine.getNome()%>" class="card-img-top-custom"
											alt="Product Image"></a>
										<%
											}
											}
											%>
									</div>
								</div>
								<div class="card-body-cost" id="main-content">
									<div class="texttt-pr">
										<a href="DettagliControl?ID=<%=prodotto.getId()%>"><h5
												class="card-title-cust"><%=prodotto.getNome()%></h5></a>
										<h6 class="card-text-cust"><%=prodotto.getMarca()%></h6>
									</div>

									<div class="cust-class">
										<p class="prizess"><%=String.format("%.2f", prodotto.getPrezzo()) + " €"%></p>

									</div>
								</div>

								<div class="x-input-total">
									<div class="x-input">
										<a href="#" data-id="<%=prodotto.getId()%>"
											class="float-end text-black"><i class="fas fa-times"></i></a>
									</div>
									<div class="input-group">
										<span class="input-group-btn"> <a href="#"
											class="btn btn-outline-secondary minus"
											data-id="<%=prodotto.getId()%>">-</a>
										</span> <input class="form-control3 quantity fw-bold text-black"
											name="quantity"
											value="<%=prodotti.getProdotti().get(prodotto)%>" type="text"
											readonly> <span class="input-group-btn"> <a
											href="#" class="btn btn-outline-secondary plus"
											data-id="<%=prodotto.getId()%>">+</a>
										</span>
									</div>
								</div>
							</div>

							<hr class="hr hr-blurry" />
							<%
							}
							%>

						</div>

						<div class="information">
							<div class="classss">
								<h5 class="fw-bold mb-2">Riepilogo Prodotti</h5>
								<%
								// Loop attraverso ogni prodotto nel carrello
								for (Prodotto prodotto : prodotti.getProdotti().keySet()) {
									BigDecimal quantita = new BigDecimal(prodotti.getProdotti().get(prodotto));
									BigDecimal prezzoProdotto = new BigDecimal(prodotto.getPrezzo());
									BigDecimal totaleProdotto = quantita.multiply(prezzoProdotto);
								%>
								<div class="d-flex justify-content-between">
									<div class="name-prize">
										<p class="name-pr"><%=prodotto.getNome()%></p>
										<p class="prize-pr"><%=String.format("%.2f", prezzoProdotto)%>
											x
											<%=prodotti.getProdotti().get(prodotto)%></p>
									</div>
									<div class="prize-totalss">
										<p class="prize-total"><%=String.format("%.2f", totaleProdotto)%>
											€
										</p>
									</div>
								</div>
								<hr class="hr hr-blurry" />
								<%
								}
								%>
							</div>
							<div class="d-flex justify-content-between p-2"
								style="background-color: #ede4db;">
								<h5 class="fw-bold mb-2">Totale:</h5>
								<h5 id="prezzo_value" class="fw-bold mb-0"><%=prezzo.setScale(2, BigDecimal.ROUND_HALF_UP) + " €"%></h5>
							</div>
							<div class="bottoni-custom">
								<a class="pulsan" href="CheckoutControl">Checkout</a>
							</div>
							<div class="card mb-6 mb-lg-0 p-5"
								style="margin-top: 60px; background-color: #dcdcdc;">
								<div class="card-body">
									<div class="text-center" style="margin-top: -50px;">
										<p class="pagamenti">
											<strong>METODI DI PAGAMENTO ACCETTATI</strong>
										</p>
									</div>

									<div class="d-flex justify-content-center">
										<img class="me-2-cust" src="img/metodiDiPagamento/cc-visa.svg"
											width="45px" alt="Visa"> <img class="me-2-cust"
											src="img/metodiDiPagamento/cc-mastercard.svg" width="45px"
											alt="Mastercard">
									</div>
									<div class="text-center mt-4">
										<p class="fw-bold mb-2">SPEDIZIONE</p>
										<p class="fw mb-3">
											<strong> Spedizione Standard: </strong> Consegna entro 6-7
											giorni lavorativi (Gratis)<br> <strong>Spedizione
												Premium: </strong> Consegna entro 1-2 giorni lavorativi (+ 6,90 €)
										</p>
										<p class="fw-bold mb-2">RESO GRATUITO</p>
										<p class="fw mb-0">Garanzia di reso entro 14 giorni dalla
											consegna</p>
									</div>
								</div>
							</div>

							<%
							} else {
							%>
							<%@ include file="CarrelloVuoto.jsp"%>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="text-center">
		<h5 class="fw-bold mb-5">
			<a href="CatalogoControl"><i class="fas fa-angle-left me-2"></i>Back
				to shopping</a>
		</h5>
	</div>
	<%@ include file="Footer.jsp"%>

	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script>
		// Definizione della funzione calcolaTotale()
		var prezzo = <%=prezzo%>;

		function calcolaTotale() {
			var spedizione = 0;
			var totale = parseFloat(prezzo.toFixed(2)); // Converte prezzo in un numero con due cifre decimali

			var prezzoValue = document.getElementById('prezzo_value');

			// Aggiorna il valore del prezzo totale nel paragrafo
			prezzoValue.innerText = totale.toFixed(2) + ' €';
		}

		document.addEventListener('DOMContentLoaded', function() {
			// Chiama la funzione per calcolare il totale all'avvio della pagina
			calcolaTotale();
		});

		$(document)
				.ready(
						function() {
							$('.minus')
									.on(
											'click',
											function(e) {
												e.preventDefault();
												var idProdotto = $(this).data(
														'id');
												$
														.ajax({
															url : 'RemoveProductControl',
															type : 'GET',
															data : {
																ID : idProdotto,
																carts : 1
															},
															success : function(
																	response) {
																// Aggiorna il contenuto del carrello
																$(
																		'#dynamic-content')
																		.html(
																				response);
																// Ricalcola il totale
																calcolaTotale();
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error(
																				'Errore AJAX:',
																				status,
																				error);
																alert('Errore durante la rimozione del prodotto.');
															}
														});
											});

							// Analogamente per $('.plus').on('click') e $('.float-end').on('click')

							$('.plus')
									.on(
											'click',
											function(e) {
												e.preventDefault();
												var idProdotto = $(this).data(
														'id');
												$
														.ajax({
															url : 'CartControl',
															type : 'GET',
															data : {
																ID : idProdotto,
																carts : 1
															},
															success : function(
																	response) {
																$(
																		'#dynamic-content')
																		.html(
																				response);
																calcolaTotale();
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error(
																				'Errore AJAX:',
																				status,
																				error);
																alert('Errore durante l\'aggiunta del prodotto.');
															}
														});
											});

							$('.float-end')
									.on(
											'click',
											function(e) {
												e.preventDefault();
												var idProdotto = $(this).data(
														'id');
												$
														.ajax({
															url : 'RemoveAllProductControl',
															type : 'GET',
															data : {
																ID : idProdotto,
																carts : 1
															},
															success : function(
																	response) {
																$(
																		'#dynamic-content')
																		.html(
																				response);
																calcolaTotale();
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error(
																				'Errore AJAX:',
																				status,
																				error);
																alert('Errore durante la rimozione completa del prodotto.');
															}
														});
											});
						});
	</script>
</body>
</html>
