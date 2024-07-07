<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.math.BigDecimal,java.util.*,it.ohmybag.bean.*,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel,it.ohmybag.model.CartaModel, it.ohmybag.model.OrdineModel"%>

<%
Carrello prodotti = (Carrello) request.getSession().getAttribute("Carrello");
BigDecimal prezzo = BigDecimal.ZERO;
CartaModel cartaModel = new CartaModel();
OrdineModel ordineModel = new OrdineModel();

%>

<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Pagamento</title>

<link href="css/Pagamento.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%@ include file="Header.jsp"%>

	<%
	List<Carta> carteSalvate = cartaModel.getCarte(utente.getUsername());
	List<String> indirizzi = ordineModel.getIndirizziSpedizioneByUsername(utente.getUsername());
	%>
	<div id="wrapper">
		<form id="paymentForm" action="ButtonPagamentoControl" method="post"
			onsubmit="return makeAjaxCallIfDataExists()&&  validateForm();" >
			<div class="container1">

	
				
				<div class="order">

					<h2>DETTAGLI ORDINE</h2>
					<div class="scroll-container">
						<%
						if(!prodotti.getProdotti().isEmpty()){
							
						
						for (Prodotto prodotto : prodotti.getProdotti().keySet()) {
							BigDecimal quantita = new BigDecimal(prodotti.getProdotti().get(prodotto));
							BigDecimal prezzoProdotto = new BigDecimal(prodotto.getPrezzo());
							prezzo = prezzo.add(quantita.multiply(prezzoProdotto));
							
						%>
						<input type="hidden" name="action" value="true">
						<div class="item">
							<%
							for (Immagine immagine : prodotti.getImmagini()) {
								if (immagine != null && prodotto.getId().equals(immagine.getIdProdotto()) && immagine.isCopertina()) {
							%>
							<div class="image">
								<img src="<%=immagine.getNome()%>" class="image1"
									alt="Product Image">
								<%
								}
								}
								%>
							</div>
							<div class="info">

								<h4><%=prodotto.getNome()%></h4>
								<p class="brand"><%=prodotto.getMarca()%></p>
								<p>
									Prezzo:<%=String.format("%.2f", prodotto.getPrezzo()) + " €"%></p>
								<p class="quantity">
									Quantità:<%=quantita%></p>
								<p class="price"><%=String.format("%.2f", prodotto.getPrezzo()) + " €"%></p>
							</div>
							<!-- .info -->
						</div>
						<!-- .item -->
						<%
						}}
						else { %>
						<input type="hidden" name="action">
						<% 
						}
						%>

					</div>

				</div>




				<div class="shipping-container">

					<h4 class="ship">SPEDIZIONE:</h4>
					<div class="shipping-options">
						<div class="option">
							<input type="radio" id="standard" name="shippingOption"
								value="standard" checked> <label for="standard">Standard
								(gratuita)</label>
						</div>
						<div class="option">
							<input type="radio" id="premium" name="shippingOption"
								value="premium"> <label for="premium">Premium
								(€6.90)</label>
						</div>
					</div>

				</div>
				<hr class="hr hr-blurry" />



				<h3 class="total">
					TOTALE: <span id="total"><%=prezzo.setScale(2, BigDecimal.ROUND_HALF_UP)%>
						€</span>
				</h3>

				<input type="hidden" id="hiddenTotal" name="totalPrice"
					value="<%=prezzo.setScale(2, BigDecimal.ROUND_HALF_UP)%>">

				<div class="information-container">
					<div class="form-check form-switch">
						<input type="hidden" id="giftPackagingHidden" name="giftPackaging"
							value="false"> <input
							class="form-check-input custom-checkbox" type="checkbox"
							role="switch" id="flexSwitchCheckDefault" /> <label
							class="form-check-label1" for="flexSwitchCheckDefault">Confezione
							regalo</label>
					</div>

					<div class="notes-container">
						<label for="courierNotes">Note corriere</label>
						<textarea id="courierNotes" name="courierNotes" rows="4" cols="50"></textarea>		
					</div>
					
				</div>





			</div>
			<!-- .order -->

			<!-- .container1 -->

			<div class="container2">

				<!--Inizio sezione indirizzo-->

				<div class="address" >
					<div class="address-details">
						<div class="card shadow-2-strong mb-5 mb-lg-0">
							<div class="card-body">
								<h3>Indirizzo Di Spedizione</h3>
								<hr class="hr hr-blurry" />
								<div class="form-check">
									<% if (utente.getIndirizzoSpedizione() != null) { %>

									<input class="form-check-input" type="checkbox"
										id="flexCheckDefault" name="useSavedAddress" value="on"
										onclick="currentAddress()"  /> <label class="form-check-label"
										for="flexCheckDefault">Utilizzare l'indirizzo già
										salvato</label>

									<div id="savedAddresscont" class="hidden">
										<select class="form-select" name="savedAddress"
											id="savedAddressSelect" aria-label="Default select example">
											<option selected disabled>Selezionare indirizzo</option>
											<% for (String indirizzo :  indirizzi) { %>
											<option value="<%= indirizzo %>"><%= indirizzo %></option>

											<% } %>
										</select>
									</div>
								</div>
								<% } %>
								<hr class="hr hr-blurry" />
								<div id="newAddressSection" class="visible">
									<input type="checkbox" id="toggle-new-address"> <label
										for="toggle-new-address"
										class="toggle-button toggle-button-new-address">
										Aggiungere un nuovo indirizzo<i class="fas fa-angle-down"></i>
									</label>
								</div>

								<div class="new-address" id="new-address-content">
									<div class="row">
										<div class="form-group col-sm-6">
											<label for="address">Indirizzo</label> <input id="address"
												name="address" type="text" class="form-control"
												placeholder="Via Roma, 1"  > <span id="address-error"
												class="text-danger"></span>
										</div>
										<div class="form-group col-sm-6">
											<label for="city">Città</label> <input id="city" name="city"
												type="text" class="form-control" placeholder="Roma" >
											<span id="city-error" class="text-danger"></span>
										</div>
										<div class="form-group col-sm-6">
											<label for="country">Provincia</label> <input id="country"
												name="country" type="text" class="form-control"
												placeholder="RM"  onclick="checkAddressCompletion()"> <span id="country-error"
												class="text-danger"></span>
										</div>
										<div class="form-group col-sm-6">
											<label for="zip">CAP</label> <input id="zip" name="zip"
												type="text" class="form-control" placeholder="00100" >
											<span id="zip-error" class="text-danger"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>






				<%!public String maskCardNumber(String fullCardNumber) {
		int length = fullCardNumber.length();
		String maskedNumber = "****-****-****-" + fullCardNumber.substring(length - 4);
		return maskedNumber;
	}%>

				<!--Inizio sezione pagamento-->
				<div class="checkout">
					<div class="payment-section">
						<div class="card shadow-2-strong mb-5 mb-lg-0">
							<div class="card-body">
								<h3>Metodo Di Pagamento</h3>
								<hr class="hr hr-blurry" />
								<div class="form-check">

									<%
									if (!carteSalvate.isEmpty()) {
									%>
									<input class="form-check-input" type="checkbox" id="flexCheck"
										onclick="currentPaymentMethod()" /> <label
										class="form-check-label" for="flexCheck">Utilizzare
										una carta già salvata</label>
									<div id="savedPaymentMethod" class="hidden">


										<select class="form-select" name="savedCard"
											id="savedCardSelect" aria-label="Default select example">
											<option selected disabled>Selezionare carta</option>
											<%
											for (Carta carta : carteSalvate) {
											%>
											<option value="<%=carta.getNumeroCarta()%>"><%=maskCardNumber(carta.getNumeroCarta())%></option>
											<%
											}
											%>
										</select>

									</div>
									<%
									} else {
									%>
									<p>Nessuna carta salvata per l'utente.</p>
									<%
									}
									%>
								</div>

								<div id="newPaymentSection" class="visible">
									<hr class="hr hr-blurry" />
									<input type="checkbox" id="toggle-payment-method"> <label
										for="toggle-payment-method" class="toggle-button">
										Aggiungere un nuovo metodo di pagamento <i
										class="fas fa-angle-down"></i>
									</label>
								</div>
								<div class=" new-payment-method" id="new-payment-method-content">

									<div class="row">
										<input type="radio" id="visa" name="circuito" value="visa">
										<label for="visa"> <img
											src='img/metodiDiPagamento/cc-visa.svg' alt='Visa'
											class="payment-icon visa"> <span class="payment-text">Visa</span>
										</label> <input type="radio" id="mastercard" name="circuito"
											value="mastercard"> <label for="mastercard">
											<img src='img/metodiDiPagamento/cc-mastercard.svg'
											alt='MasterCard' class="payment-icon mastercard"> <span
											class="payment-text">MasterCard</span>
										</label>
									</div>
									<div class="infos">
										<div class="form-group col-sm-6">
											<label for="expiry-date">Data di Scadenza</label>
											<div class="input-group expiration-date">
												<input id="expiry-date" name="expiry-month"
													class="form-control" placeholder="01"> <span
													class="date-separator">/</span> <input type="text"
													name="expiry-year" class="form-control" placeholder="29">
												<span id="expiry-date-error" class="text-danger"></span>
											</div>
										</div>
										<div class="form-group col-sm-6">
											<label for="card-number">Numero Carta</label> <input
												id="card-number" name="card-number" type="text"
												class="form-control"
												pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}"
												inputmode="numeric" placeholder="1234-5678-9012-3456"
												oninput="checkCardExists(this.value)"> <span
												id="card-number-error" class="text-danger"></span>
										</div>
										<div class="form-group col-sm-6">
											<label for="cvc">CVC</label> <input id="cvc" name="cvc"
												type="text" class="form-control"
												placeholder="&#9679;&#9679;&#9679;"> <span
												id="cvc-error" class="text-danger"></span>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<button type="submit" id="submit" class="btn btn1-primary">Procedi
						al Pagamento</button>
				</div>

			</div>
		</form>
	</div>


	<!-- #wrapper -->


	<%@ include file="Footer.jsp"%>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/pagamento.js"></script>
	
	<!--gestisce il valore del totale con la spedizione-->
	<script> document.addEventListener("DOMContentLoaded", function() {
		// Prezzo di base
		var basePrice = parseFloat('<%=prezzo.setScale(2, BigDecimal.ROUND_HALF_UP)%>');

		// Elementi
		var totalElement = document.getElementById("total");
		var hiddenTotalElement = document.getElementById("hiddenTotal");
		var shippingOptions = document.getElementsByName("shippingOption");

		// Funzione per aggiornare il totale
		function updateTotal() {
			var selectedShipping = document.querySelector('input[name="shippingOption"]:checked').value;
			var total = basePrice;

			if (selectedShipping === "premium") {
				total += 6.90;
			}
			
			totalElement.innerText = total.toFixed(2) + " €";
			hiddenTotalElement.value = total.toFixed(2);
			
		}

		// Aggiungi evento di cambio a tutte le opzioni di spedizione
		for (var i = 0; i < shippingOptions.length; i++) {
			shippingOptions[i].addEventListener("change", updateTotal);
		}

		// Aggiornare il totale al caricamento della pagina
		updateTotal();
	});

	document.addEventListener("DOMContentLoaded", function() {
		var checkbox = document.getElementById('flexSwitchCheckDefault');
		var hiddenField = document.getElementById('giftPackagingHidden');

		checkbox.addEventListener('change', function() {
			hiddenField.value = checkbox.checked ? 'true' : 'false';
		});
	});
	
	</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	 <script>
	    function makeAjaxCallIfDataExists() {
	        var addressField = document.getElementById('address');
	        var cityField = document.getElementById('city');
	        var countryField = document.getElementById('country');
	        var zipField = document.getElementById('zip');
	        var cardNumberField = document.getElementById('card-number');

	        // Verifica se almeno uno dei campi relativi all'indirizzo o alla carta è stato compilato
	        var isAddressOrCardFilled = (addressField.value !== '' || cityField.value !== '' || countryField.value !== '' || zipField.value !== '' || cardNumberField.value !== '');

	        // Verifica se è selezionato il bottone "Utilizza indirizzo già salvato"
	        var useSavedAddressCheckbox = document.getElementById('flexCheckDefault').checked;

	        // Se nessun campo è stato compilato e non è selezionato "Utilizza indirizzo già salvato", mostra avviso
	        if (!isAddressOrCardFilled && !useSavedAddressCheckbox) {
	        	alert("Compila almeno uno dei campi dell'indirizzo o della carta di credito o seleziona 'Utilizza indirizzo già salvato'.");
	            return false;
	        }

	        // Esegui la chiamata AJAX qui
	        $.ajax({
	            type: 'POST',
	            url: 'ButtonPagamentoControl', // Sostituisci con l'URL corretto per il controllore di pagamento
	            data: $('#paymentForm').serialize(), // Serializza il form per inviare tutti i dati
	            success: function(response) {
	                // Gestisci la risposta in base alle necessità (es. redirect, messaggi, etc.)
	                alert('Pagamento completato con successo!');
	                window.location.href = 'AcquistoCompletato.jsp'; // Sostituisci con l'URL di conferma
	            },
	            error: function(xhr, status, error) {
	                alert('Si è verificato un errore durante il pagamento.');
	                console.error(error);
	            }
	        });

	        // Rimuovi l'alert qui, perché la chiamata Ajax è asincrona e la risposta verrà gestita nel success o error
	        // alert('Form validato e inviato con successo.');
	        return false; // Ritorna false per impedire l'invio del form in modo tradizionale
	    }
	    
	</script>




</body>
</html>