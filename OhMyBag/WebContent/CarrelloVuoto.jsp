<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello Vuoto</title>
</head>
<body>
	<!-- Div principale per il contenuto principale -->
	<div class="row-cust" id="main-content">
	
	 <!-- Sezione che mostra il messaggio di carrello vuoto -->
		<div class="cart-vuoto">
			<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Nessun Prodotto nel carrello</h3>
		</div>
		
		<!-- Sezione per l'immagine e informazioni aggiuntive -->
		<div class="img-prize2">
			<div class="inf2">
                <!-- Immagine che indica il carrello vuoto -->
				<img class="nonTrovata" alt="immagine non trovata" src="img/website/mascotteCarrelloVuoto.jpg">
			</div>
			
			<div class="information2">
			 <!-- Riepilogo prodotti vuoto -->
				<div class="clas-vuota">
					<h5 class="fw-bold riepilogo">Riepilogo Prodotti</h5>
					<div class="d-flex justify-content-between p-2" style="background-color: #ede4db;">
						<h5 class="fw-bold mb-2">Totale:</h5>
						<h5 id="prezzo_value" class="fw-bold mb-0">"0.00 €"</h5>
					</div>
				</div>
				
				<!-- Informazioni sui metodi di pagamento e spedizione -->
				<div class="card-vuoto mb-6 mb-lg-0 p-5" style="margin-top: 60px; background-color: #dcdcdc;">
					<div class="card-body2">
						<div class="text-center" style="margin-top: -50px;">
							<p class="pagamenti">
								<strong class="fw-bold-cu">METODI DI PAGAMENTO ACCETTATI</strong>
							</p>
						</div>

						<!-- Icone dei metodi di pagamento -->
						<div class="d-flex justify-content-center">
							<img class="me-2-cust" src="img/metodiDiPagamento/cc-visa.svg" width="45px" alt="Visa"> 
							<img class="me-2-cust" src="img/metodiDiPagamento/cc-mastercard.svg" width="45px" alt="Mastercard">
						</div>
						
						 <!-- Informazioni sulla spedizione e reso -->
						<div class="text-center mt-4">
							<p class="fw-bold-cu mb-2">SPEDIZIONE</p>
							<p class="fw-cu mb-3">
								<strong> Spedizione Standard: </strong> Consegna entro 6-7
								giorni lavorativi (Gratis)<br> <strong>Spedizione
									Premium: </strong> Consegna entro 1-2 giorni lavorativi (+ 6,90 €)
							</p>
							<p class="fw-bold-cu mb-2">RESO GRATUITO</p>
							<p class="fw-cu mb-0">Garanzia di reso entro 14 giorni dalla
								consegna</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>