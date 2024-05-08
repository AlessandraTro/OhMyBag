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
	<%@ include file="Header.jsp"%>

	<div class="container-fluid">

		<div class="container-fluid no-padding">

			<div class="col-12">

				<div class="card-body p-4">

					<div class="row">


						<div class="col-lg-7 mb-4">
							<%
							if (!prodotti.getProdotti().isEmpty()) {
							%>
							<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">I TUOI PRODOTTI</h3>
							<%for (Prodotto prodotto : prodotti.getProdotti().keySet()) {
								BigDecimal quantita = new BigDecimal(prodotti.getProdotti().get(prodotto));
                                BigDecimal prezzoProdotto = new BigDecimal(prodotto.getPrezzo());
                                prezzo = prezzo.add(quantita.multiply(prezzoProdotto));
                             %>
							<div class="card mb-3">
								<div class="row g-0">
									<div class="col-md-4">
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
									<div class="col-md-8">
										<div class="card-body">
											<a href="RemoveAllProductControl?ID=<%=prodotto.getId()%>"
												class="float-end text-black"><i class="fas fa-times"></i></a>
											<a href="DettagliControl?ID=<%=prodotto.getId()%>"><h5
													class="card-title text-primary"><%=prodotto.getNome()%></h5></a>
											<h6 class="card-text" style="color: #9e9e9e;"><%=prodotto.getMarca()%></h6>
											<div class="d-flex align-items-center">
												<p class="fw-bold mb-0 me-5 pe-3"><%=String.format("%.2f", prodotto.getPrezzo()) +" €"%></p>
												<div class="def-number-input number-input safari_only">
													<a href="RemoveProductControl?ID=<%=prodotto.getId()%>"
														class="minus">-</a> <input
														class="quantity fw-bold text-black" min="0"
														name="quantity"
														value="<%=prodotti.getProdotti().get(prodotto)%>"
														type="number"> <a
														href="CartControl?ID=<%=prodotto.getId()%>" class="plus">+</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<hr class="hr hr-blurry" />
							<%
							}
							%>

						</div>

						<div class="col-lg-5 ">

							<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">RIEPILOGO</h3>

							<div class="d-flex justify-content-between">
								<p class="mb-2" style="font-weight: bold"> Subtotale</p>
								<p class="mb-2"><%=prezzo.setScale(2, BigDecimal.ROUND_HALF_UP) +" €"%>
								</p>
							</div>
							<p class="mb-2" style="font-weight: bold"> Spedizione: </p>

							<div class="d-flex justify-content-between">
								<%
								int spedizione = 0;
								%>
								<input id="checkbox_toggle" type="checkbox" class="check">
								<div class="checkbox">
									<label class="slide" for="checkbox_toggle"> <label
										class="toggle" for="checkbox_toggle"></label> <label
										class="text" for="checkbox_toggle">Standard</label> <label
										class="text" for="checkbox_toggle">Premium</label>
									</label>
								</div>

								<p id="spedizione_value" class="mb-2"><%=spedizione + " €"%></p>
								<!-- Aggiunto id per il valore della spedizione -->
							</div>

							<hr class="mb-4"
								style="height: 2px; background-color: #000000; opacity: 1;">

							<div class="d-flex justify-content-between p-2 mb-4"
								style="background-color: #ede4db;">
								<h5 class="fw-bold mb-2">Totale:</h5>
								<h5 id="prezzo_value" class="fw-bold mb-0"><%=prezzo.setScale(2, BigDecimal.ROUND_HALF_UP) +" €"%></h5>
							</div>
							<a type="button" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-primary btn-lg mx-auto d-block"
								href="ButtonPagamentoControl">Checkout</a>
							<% 
							} else {
							%>
							<div
								style="display: flex; flex-direction: column; align-items: center;">
								<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">
									Nessun Prodotto nel carrello</h3>
								<img alt="immagine non trovata" src="img/website/mascotteCarrelloVuoto.jpg"
									style="width: 300px;">
							</div>
							<%
							}
							%>
							<div class="card mb-6 mb-lg-0 p-5"
								style="margin-top: 60px; background-color: #dcdcdc;">
								<div class="card-body">
									<div class="text-center" style="margin-top: -50px;">
										<p>
											<strong>METODI DI PAGAMENTO ACCETTATI</strong>
										</p>
									</div>
									
										<div class="d-flex justify-content-center">
											<img class="me-2" src="img/metodiDiPagamento/cc-visa.svg"
												width="45px" alt="Visa"> <img class="me-2"
												src="img/metodiDiPagamento/cc-mastercard.svg" width="45px"
												alt="Mastercard"> <img class="me-2"
												src="img/metodiDiPagamento/cc-paypal.svg" width="45px"
												alt="PayPal acceptance mark">
										</div>
										<div class="text-center mt-4">
											<p class="fw-bold mb-2">SPEDIZIONE</p>
											<p class="fw mb-3"><strong> Spedizione Standard: </strong> Consegna entro 6-7 giorni lavorativi (Gratis)<br>
											<strong>Spedizione Premium: </strong> Consegna entro 1-2 giorni lavorativi (+ 6,90 €)</p></p>
											<p class="fw-bold mb-2">RESO GRATUITO</p>
											<p class="fw mb-0">Garanzia di reso entro 14 giorni
												dalla consegna</p>
										</div>
									</div>
								</div>


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
		<script type="text/javascript">
	    var prezzo = <%= prezzo %>;
	    
	    document.addEventListener('DOMContentLoaded', function() {
	        var checkbox = document.getElementById('checkbox_toggle');
	        var spedizioneParagraph = document.getElementById('spedizione_value');
	        var prezzoValue = document.getElementById('prezzo_value');
	        
	        // Funzione per calcolare il totale
	        function calcolaTotale() {
	            var spedizione = 0;
	            var totale = parseFloat(prezzo.toFixed(2)); // Converte prezzo in un numero con due cifre decimali

	         // ...

	         if (checkbox.checked) {
	             spedizione = 6.90;
	             totale += spedizione;
	         }
	            
	            if (checkbox.checked) {
	                spedizione = 6.90;
	                totale += spedizione;
	            }
	            
	            // Aggiorna il valore della spedizione nel paragrafo
	            spedizioneParagraph.innerText = spedizione.toFixed(2) + ' €';
	            // Aggiorna il valore del prezzo totale nel paragrafo
	            prezzoValue.innerText = totale.toFixed(2) + ' €';
	        }
	        
	        // Aggiungi un ascoltatore per l'evento change dello switch
	        checkbox.addEventListener('change', function() {
	            // Richiama la funzione per calcolare il totale
	            calcolaTotale();
	        });
	        
	        // Chiama la funzione per calcolare il totale all'avvio della pagina
	        calcolaTotale();
	    });
	</script>
</body>
</html>
