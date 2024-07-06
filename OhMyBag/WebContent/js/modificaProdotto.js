/**
 * modificaProdotto.js
 */

// Variabile globale per il contenuto iniziale di CKEditor
var initialCKEditorContent = "";

// Funzione per inizializzare CKEditor e gestire il cambio
$(document).ready(function() {
	// Inizializza CKEditor
	CKEDITOR.replace('inputDescrizione', {
		on: {
			instanceReady: function(evt) {
				// Salva il contenuto iniziale di CKEditor
				initialCKEditorContent = evt.editor.getData();
			},
			change: function(evt) {
				// Gestisci il cambio di CKEditor
				var isModified = isFormModified(document.getElementById("productForm"));
				console.log("CKEditor modificato:", isModified);
			}
		}
	});

	// Gestione del clic sul pulsante di conferma della modale
	$('#confirmActionBtn').off('click').on('click', function() {
		var form = $(this).data('form');
		if (form) {
			showAlert("success", "Modifiche avvenute con successo.");
			form.submit();
		}
	});
});

var prezzoCorrect = true;
var scontoCorrect = true;
var quantityCorrect = true;
var ivaCorrect = true;
var descrizioneCorrect = true;
var isModified = false;

/* Funzione chiamata al submit che controlla che tutti i campi rispettino le regole di validazione prestabilite */
function validate(form) {
	var isModified = isFormModified(form);

	if (!prezzoCorrect) {
		return false;
	}

	if (!scontoCorrect) {
		return false;
	}

	if (!quantityCorrect) {
		return false;
	}

	if (!ivaCorrect) {
		return false;
	}

	if (!descrizioneCorrect) {
		return false;
	}

	if (!isModified) {
		showAlert("info", "Nessuna modifica effettuata.");
		return false;
	}

	// Mostra la modale di conferma
	$('#confirmModalMessage').text("Sei sicuro di voler modificare le informazioni del prodotto?");
	$('#confirmModal').modal('show');

	// Imposta l'azione di conferma per la cancellazione
	$('#confirmActionBtn').off('click').on('click', function() {
		console.log("Confirm action clicked");
		$('#confirmModal').modal('hide');
		document.forms[1].submit();  // Submitting the form
	});

	// Gestione del clic sul pulsante "Annulla"
	$('#confirmModal .btn-secondary').off('click').on('click', function() {
		console.log("Cancel action clicked");
		$('#confirmModal').modal('hide');
	});

	// Ritorna false per impedire il submit del form
	return false;
}

/* Funzioni che controllano i vari campi input ogni volta che vengono modificati e ne controlla la validità */

$("#inputPrezzo").change(function() {

	prezzoCorrect = ValidatePrezzo(this);
});

$("#inputSconto").change(function() {

	scontoCorrect = ValidateSconto(this);
});

$("#inputQuantity").change(function() {

	quantityCorrect = ValidateQuantity(this);
});

$("#inputIva").change(function() {

	ivaCorrect = ValidateIva(this);
});

$("#inputDescrizione").change(function() {

	descrizioneCorrect = ValidateDescrizione(this);
});

/* Funzioni per il controllo della validità dei singoli input */

// Validità Prezzo
function ValidatePrezzo(InputPrezzo) {
	// Accetta prezzi con un massimo di due cifre decimali, separati da un punto
	var PrezzoFormat = /^(?!(0{2,})(\.)(0{2,}))([0-9]+)(\.[0-9]{1,2})?$/;

	if (PrezzoFormat.test(InputPrezzo.value)) {
		$("#inputPrezzo").css({
			"border-color": "#00fd00"
		});
		$("#inputPrezzoError").text("");
		return true;
	} else {
		$("#inputPrezzo").css({
			"border-color": "red"
		});
		$("#inputPrezzoError").text("Formato Prezzo non corretto. Usa il formato 00.00");
		return false;
	}
}


// Validità Sconto
function ValidateSconto(InputSconto) {

	var ScontoFormat = /^([0-9])+$/;
	if (InputSconto.value.match(ScontoFormat)
		&& parseInt(InputSconto.value) >= 0
		&& parseInt(InputSconto.value) <= 99) {

		$("#inputSconto").css({
			"border-color": "#00fd00"
		});
		$("#inputScontoError").text("");
		return true;
	} else {

		$("#inputSconto").css({
			"border-color": "red"
		});
		$("#inputScontoError").text("Formato Sconto non corretto.");
		return false;
	}
}

// Validità Quantità
function ValidateQuantity(InputQuantity) {

	var QuantityFormat = /^([0-9])+$/;
	if (InputQuantity.value.match(QuantityFormat)) {

		$("#inputQuantity").css({
			"border-color": "#00fd00"
		});
		$("#inputQuantityError").text("");
		return true;
	} else {

		$("#inputQuantity").css({
			"border-color": "red"
		});
		$("#inputQuantityError").text("Formato Quantità non corretto.");
		return false;
	}
}

// Validità Iva
function ValidateIva(InputIva) {

	var IvaFormat = /^([0-9])+$/;
	if (InputIva.value.match(IvaFormat)
		&& parseInt(InputIva.value) >= 0
		&& parseInt(InputIva.value) <= 100) {

		$("#inputIva").css({
			"border-color": "#00fd00"
		});
		$("#inputIvaError").text("");
		return true;
	} else {

		$("#inputIva").css({
			"border-color": "red"
		});
		$("#inputIvaError").text("Formato Iva non corretto.");
		return false;
	}
}
// Validità Descrizione
function ValidateDescrizione(InputDescrizione) {
	var DescrizioneFormat = /^[\w\W]+$/;
	if (InputDescrizione.value.match(DescrizioneFormat)) {
		$("#inputDescrizione").css({
			"border-color": "#00fd00"
		});
		$("#inputDescrizioneError").text("");
		return true;
	} else {
		$("#inputDescrizione").css({
			"border-color": "red"
		});
		$("#inputDescrizioneError").text(
			"Formato Descrizione non corretto.");
		return false;
	}
}

// Funzione per aprire il modale
function openModal(modalType) {
	let url = "ButtonModal?Pulsante=" + modalType;
	$("#modal-body").load(url, function() {
		$("#modal").modal("show");
	});
}

//gestire il reset degli stili e dei messaggi di errore
function clearFieldStyles() {
	var inputFields = document
		.querySelectorAll("#productForm .input-field");
	var errorMessages = document
		.querySelectorAll("#productForm .error");

	inputFields.forEach(function(field) {
		field.style.borderColor = "";
	});

	errorMessages.forEach(function(error) {
		error.textContent = "";
	});
}

//gestire il reset di conferma
// Funzione per gestire il reset di conferma
function confirmReset(event) {
	event.preventDefault();
	showModal("Sei sicuro di voler annullare le modifiche?", function() {
		// Resetta gli stili e i messaggi di errore
		clearFieldStyles();

		// Mantieni i dati immessi nei campi
		var formElements = event.target.form.elements;
		for (var i = 0; i < formElements.length; i++) {
			var element = formElements[i];
			if (element.type === "text" || element.type === "number" || element.tagName.toLowerCase() === "textarea") {
				element.value = element.defaultValue;
			}
		}

		// Resetta CKEditor
		CKEDITOR.instances['inputDescrizione'].setData(CKEDITOR.instances['inputDescrizione'].element.getAttribute('defaultValue'));
	});
}
// Funzione per controllare se il form è stato modificato
function isFormModified(form) {
	var isModified = false;
	var elements = form.elements;

	// Controlla gli elementi del form
	for (var i = 0; i < elements.length; i++) {
		var element = elements[i];

		if (element.type === "text" || element.type === "number" || element.tagName.toLowerCase() === "textarea") {
			// Controlla solo i campi non readonly
			if (!element.readOnly && element.value !== element.defaultValue) {
				isModified = true;
				break;
			}
		}
	}

	// Confronta CKEditor separatamente
	var editor = CKEDITOR.instances['inputDescrizione'];
	var editorData = editor.getData();

	// Confronta il contenuto attuale di CKEditor con il contenuto iniziale salvato
	if (editorData !== initialCKEditorContent) {
		isModified = true;
	}

	return isModified;
}

// Funzione per mostrare la modale di conferma
function showModal(message, confirmCallback) {
	$('#confirmModalMessage').text(message);
	$('#confirmModal').modal('show');
	$('#confirmActionBtn').off('click').on('click', function() {
		confirmCallback();
		$('#confirmModal').modal('hide');
	});
	// Gestione del clic sul pulsante "Annulla"
	$('#confirmModal .btn-secondary').off('click').on('click', function() {
		console.log("Cancel action clicked");
		$('#confirmModal').modal('hide');
	});
}

// Funzione per gestire il caso in cui nessun campo è stato modificato
function confirmNoChanges() {
	var form = document.getElementById("productForm");
	var isModified = isFormModified(form);

	if (!isModified) {
		showModal("Nessun campo modificato, tornare alla pagina del catalogo?", function() {
			window.location.href = "admin.jsp";
		});
		return false; // Blocca l'azione di default del form
	}

	// Se il form è stato modificato, restituisci true per permettere la navigazione
	return true;
}

function showAlert(type, message) {
	console.log('Show alert:', type, message); // Log di debug
	var alertDiv;
	switch (type) {
		case 'success':
			alertDiv = '#success-alert';
			break;
		case 'danger':
			alertDiv = '#error-alert';
			break;
		case 'info':
			alertDiv = '#info-alert';
			break;
		default:
			alertDiv = '#secondary-alert';
	}
	$(alertDiv).text(message).show();
	setTimeout(function() {
		$(alertDiv).hide();
	}, 3000);
}

// Funzione per ritornare al catalogo
function goToCatalog() {
	var form = document.getElementById("productForm");
	var isModified = isFormModified(form);

	if (!isModified) {
		window.location.href = "admin.jsp";
	} else {
		showModal("Ci sono modifiche non salvate. Sei sicuro di voler tornare al catalogo?", function() {
			window.location.href = "admin.jsp";
		});
	}
}


