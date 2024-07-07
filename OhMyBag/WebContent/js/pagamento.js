/**
 * paginaPagamento.js
 */


//gestisce la comparsa e la scomparsa delle sezioni indirizzo

function currentAddress() {
	var checkbox = document.getElementById("flexCheckDefault");
	var addressDiv = document.getElementById("savedAddresscont");
	var newAddressDiv = document.getElementById("new-address-content");
	var newAddressSection = document.getElementById("newAddressSection");
	var savedAddressSelect = document.getElementById("savedAddressSelect");

	if (checkbox.checked) {
		addressDiv.classList.remove("hidden");
		addressDiv.classList.add("visible");
		newAddressDiv.classList.remove("visible");
		newAddressDiv.classList.add("hidden");
		newAddressSection.classList.remove("visible");
		newAddressSection.classList.add("hidden");
		savedAddressSelect.disabled = false;
	} else {
		addressDiv.classList.remove("visible");
		addressDiv.classList.add("hidden");
		newAddressDiv.classList.remove("hidden");
		newAddressDiv.classList.add("visible");
		newAddressSection.classList.remove("hidden");
		newAddressSection.classList.add("visible");
		savedAddressSelect.disabled = true;
	}

}

// Gestisce il cambio di stato del toggle per l'indirizzo
document.getElementById("toggle-new-address").addEventListener("change", function() {
	var newAddressDiv = document.getElementById("new-address-content");
	if (this.checked) {
		newAddressDiv.classList.remove("hidden");
		newAddressDiv.classList.add("visible");
		document.getElementById("flexCheckDefault").checked = false;
		document.getElementById("savedAddresscont").classList.remove("visible");
		document.getElementById("savedAddresscont").classList.add("hidden");
		document.getElementById("newAddressSection").classList.remove("hidden");
		document.getElementById("newAddressSection").classList.add("visible");
		document.getElementById("savedAddressSelect").disabled = true;
	} else {
		newAddressDiv.classList.remove("visible");
		newAddressDiv.classList.add("hidden");
	}
});

// Funzione per verificare se la carta di credito esiste già
function checkCardExists(cardNumber) {
	const xhr = new XMLHttpRequest();
	xhr.open('POST', 'OttieniCartaControl', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			if (xhr.status === 200) {
				const response = JSON.parse(xhr.responseText);
				if (response.exists) {
					// Mostra un alert o aggiungi un feedback visivo
					alert('La carta di credito è già stata inserita nel database.');
					// Disabilita il pulsante di submit o gestisci di conseguenza
					document.getElementById('submit').disabled = true;
				} else {
					// Se la carta non esiste nel database, il form può essere inviato
					document.getElementById('submit').disabled = false;
				}
			} else {
				// Gestisci errori di connessione o dal server
				alert('Errore durante la verifica della carta.');
			}
		}
	};
	xhr.send('action=checkCard&NumeroCarta=' + encodeURIComponent(cardNumber));
}

//gestisce la comparsa e la scomparsa delle sezioni carta
function currentPaymentMethod() {
	var checkbox = document.getElementById("flexCheck");
	var savedPaymentDiv = document.getElementById("savedPaymentMethod");
	var paymentMethodDiv = document
		.getElementById("new-payment-method-content");
	var newPaymentSection = document
		.getElementById("newPaymentSection");
	var savedCardSelect = document.getElementById("savedCardSelect");

	if (checkbox.checked) {
		savedPaymentDiv.classList.remove("hidden");
		savedPaymentDiv.classList.add("visible");
		paymentMethodDiv.classList.remove("visible");
		paymentMethodDiv.classList.add("hidden");
		newPaymentSection.classList.remove("visible");
		newPaymentSection.classList.add("hidden");
		savedCardSelect.disabled = false;
	} else {
		savedPaymentDiv.classList.remove("visible");
		savedPaymentDiv.classList.add("hidden");
		paymentMethodDiv.classList.remove("hidden");
		paymentMethodDiv.classList.add("visible");
		newPaymentSection.classList.remove("hidden");
		newPaymentSection.classList.add("visible");
		savedCardSelect.disabled = true;
	}
}

// Gestisce il cambio di stato del toggle per il metodo di pagamento
document.getElementById("toggle-payment-method").addEventListener(
	"change",
	function() {
		var paymentMethodDiv = document
			.getElementById("new-payment-method-content");
		if (this.checked) {
			paymentMethodDiv.classList.remove("hidden");
			paymentMethodDiv.classList.add("visible");
			document.getElementById("flexCheck").checked = false;
			document.getElementById("savedPaymentMethod").classList
				.remove("visible");
			document.getElementById("savedPaymentMethod").classList
				.add("hidden");
			document.getElementById("newPaymentSection").classList
				.remove("hidden");
			document.getElementById("newPaymentSection").classList
				.add("visible");
			savedCardSelect.disabled = true;
		} else {
			paymentMethodDiv.classList.remove("visible");
			paymentMethodDiv.classList.add("hidden");
		}
	});

// gestisce l'inserimento dei caratteri della carta
	$(document).ready(function() {
		$('#card-number').on('input', function() {
			var cardNumber = $(this).val().replace(/\D/g, ''); // Rimuove tutti i caratteri non numerici
			var formattedCardNumber = '';
			for (var i = 0; i < cardNumber.length; i++) {
				if (i > 0 && i % 4 === 0) {
					formattedCardNumber += '-';
				}
				formattedCardNumber += cardNumber.charAt(i);
			}
			$(this).val(formattedCardNumber);
		});
	});

//validazione campi
var addressCorrect = false;
var cityCorrect = false;
var countryCorrect = false;
var zipCorrect = false;
var cardHolderCorrect = false;
var expiryCorrect = false;
var cardNumberCorrect = false;
var cvcCorrect = false;
var courierNotesCorrect = false;

function validateForm() {

	var addressCorrect = addressValidator(document.getElementById("address"));
	var cityCorrect = cityValidator(document.getElementById("city"));
	var countryCorrect = countryValidator(document.getElementById("country"));
	var zipCorrect = zipValidator(document.getElementById("zip"));
	var paymentMethodSelected = document.querySelector("input[name='circuito']:checked") !== null;
	var expiryCorrect = expiryValidator();
	var cardNumberCorrect = cardNumberValidator(document.getElementById("card-number"));
	var cvcCorrect = cvcValidator(document.getElementById("cvc"));
	var paymentMethodSelected = document.querySelector("input[name='circuito']:checked");
	var courierNotesCorrect = courierNotesValidator(document.getElementById("courierNotes"));

	if (!paymentMethodSelected) {
		alert('Selezionare un circuito di carta di credito (Visa o MasterCard).');
		return false;
	}
	return true;
}

/* Funzioni che controllano i vari campi input ogni volta che vengono modificati e ne controlla la validità */
$("#address").change(function() {
	addressCorrect = addressValidator(this);
});

$("#city").change(function() {
	cityCorrect = cityValidator(this);
});

$("#country").change(function() {
	countryCorrect = countryValidator(this);
});

$("#zip").change(function() {
	zipCorrect = zipValidator(this);
});

$(".expiration-date input").change(function() {
	expiryCorrect = expiryValidator();
});

$("#card-number").change(function() {
	cardNumberCorrect = cardNumberValidator(this);
});

$("#cvc").change(function() {
	cvcCorrect = cvcValidator(this);
});


/* Funzioni per il controllo della validità dei singoli input */
function addressValidator(address) {
	var addressReg = /^[A-Za-zÀ-ÖØ-öø-ÿ\s']+\s?\d+$/;

	if (address.value.match(addressReg)) {
		$("#address").css({
			"border-color": "#00fd00"
		});
		$("#address-error").text("");
		return true;
	} else {
		$("#address").css({
			"border-color": "red"
		});
		$("#address-error").text("Formato dell'indirizzo errato. Inserisci nel formato 'Via Roma 1'.");
		return false;
	}
}


function cityValidator(city) {
	var cityReg = /^(([A-Z])([a-z]+)(\s?))+$/;
	if (city.value.match(cityReg)) {
		$("#city").css({
			"border-color": "#00fd00"
		});
		$("#city-error").text("");
		return true;
	} else {
		$("#city").css({
			"border-color": "red"
		});
		$("#cityError").text("Formato della città errata");
		return false;
	}
}

function countryValidator(country) {
	var provinceReg = /^[A-Z]{2}$/; // Modifica secondo il formato esatto della provincia
	if (country.value.match(provinceReg)) {
		$("#country").css({
			"border-color": "#00fd00"
		});
		$("#country-error").text("");
		return true;
	} else {
		$("#country").css({
			"border-color": "red"
		});
		$("#country-error").text("Formato provincia errato.Inserisci nel formato RM(Roma)");
		return false;
	}
}

function zipValidator(zip) {
	var zipReg = /^[0-9]{5}$/;
	if (zip.value.match(zipReg)) {
		$("#zip").css({
			"border-color": "#00fd00"
		});
		$("#zip-error").text("");
		return true;
	} else {
		$("#zip").css({
			"border-color": "red"
		});
		$("#zip-error").text("Formato del CAP errato");
		return false;
	}
}

function expiryValidator() {
	var expiryMonth = document
		.querySelector('.expiration-date input:nth-child(1)').value;
	var expiryYear = document
		.querySelector('.expiration-date input:nth-child(3)').value;
	var monthReg = /^(0[1-9]|1[0-2])$/;
	var yearReg = /^\d{2}$/;
	if (monthReg.test(expiryMonth) && yearReg.test(expiryYear)) {
		$(".expiration-date input").css({
			"border-color": "#00fd00"
		});
		$("#expiry-date-error").text("");
		return true;
	} else {
		$(".expiration-date input").css({
			"border-color": "red"
		});
		$("#expiry-date-error").text(
			"Formato della data di scadenza errato");
		return false;
	}
}

function cardNumberValidator(cardNumber) {
	var cardNumberReg = /^\d{4}-?\d{4}-?\d{4}-?\d{4}$/;

	if (cardNumber.value.match(cardNumberReg)) {
		var cardNumberDigitsOnly = cardNumber.value.replace(/-/g, ''); // Rimuove i trattini per controlli successivi

		// Controlla il tipo di carta
		if (isVisa(cardNumberDigitsOnly)) {
			$("#card-number").css("border-color", "#00fd00");
			$("#card-number-error").text("");
			return true;
		} else if (isMastercard(cardNumberDigitsOnly)) {
			$("#card-number").css("border-color", "#00fd00");
			$("#card-number-error").text("");
			return true;
		} else {
			$("#card-number").css("border-color", "red");
			$("#card-number-error").text("Numero di carta non valido per Visa o Mastercard.");
			return false;
		}
	} else {
		$("#card-number").css("border-color", "red");
		$("#card-number-error").text("Formato del numero carta errato. Inserisci il numero nel formato corretto (es. 1234-5678-9012-3456).");
		return false;
	}

}

// Funzione per verificare se il numero è di tipo Visa
function isVisa(cardNumber) {
	var visaReg = /^4[0-9]{12}(?:[0-9]{3})?$/;
	return visaReg.test(cardNumber);
}

// Funzione per verificare se il numero è di tipo Mastercard
function isMastercard(cardNumber) {
	var mastercardReg = /^5[1-5][0-9]{14}$/;
	return mastercardReg.test(cardNumber);
}

function cvcValidator(cvc) {
	var cvcReg = /^[0-9]{3}$/;
	if (cvc.value.match(cvcReg)) {
		$("#cvc").css({
			"border-color": "#00fd00"
		});
		$("#cvc-error").text("");
		return true;
	} else {
		$("#cvc").css({
			"border-color": "red"
		});
		$("#cvc-error").text("Formato del CVC errato");
		return false;
	}
}
