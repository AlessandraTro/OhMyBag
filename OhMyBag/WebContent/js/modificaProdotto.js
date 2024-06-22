/**
 * modificaProdotto.js
 */

// Variabile globale per il contenuto iniziale di CKEditor
var initialCKEditorContent = "";

// Funzione per inizializzare CKEditor e gestire il cambio
$(document).ready(function() {
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
		alert("Nessuna modifica effettuata.");
		return false;
	}

	if (confirm("Sei sicuro di voler modificare le informazioni del prodotto?")) {
		alert("Modifiche avvenute con successo.");
		return true;
	} else {
		return false;
	}
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

	var PrezzoFormat = /^(?!(0)+(,?)(0)+)([0-9]+)(([.,]?)([0-9]{2}))?$/;
	if (InputPrezzo.value.match(PrezzoFormat)) {
		$("#inputPrezzo").css({
			"border-color": "#00fd00"
		});
		$("#inputPrezzoError").text("");
		return true;
	} else {
		$("#inputPrezzo").css({
			"border-color": "red"
		});
		$("#inputPrezzoError").text("Formato Prezzo non corretto.");
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
function confirmReset(event) {
	event.preventDefault();
	if (confirm("Sei sicuro di voler annullare le modifiche?")) {
		// Resetta gli stili e i messaggi di errore
		clearFieldStyles();

		// Mantieni i dati immessi nei campi
		var formElements = event.target.form.elements;
		for (var i = 0; i < formElements.length; i++) {
			var element = formElements[i];
			if (element.type === "text" || element.type === "number"
				|| element.tagName.toLowerCase() === "textarea") {
				element.value = element.defaultValue;
			}
		}

		// Resetta CKEditor
		CKEDITOR.instances['inputDescrizione']
			.setData(CKEDITOR.instances['inputDescrizione'].element
				.getAttribute('defaultValue'));
	}
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



// Funzione per gestire il caso in cui nessun campo è stato modificato
function confirmNoChanges() {
	var form = document.getElementById("productForm");
	var isModified = isFormModified(form);

	if (!isModified) {
		if (confirm("Nessun campo modificato, tornare alla pagina del catalogo?")) {
			window.location.href = "admin.jsp";
		}
		return false; // Blocca l'azione di default del form
	}

	// Se il form è stato modificato, restituisci true per permettere la navigazione
	return true;
}

//funzione per ritornare al catalogo
function goToCatalog() {
	var form = document.getElementById("productForm");
	var isModified = isFormModified(form);

	if (!isModified || confirm("Ci sono modifiche non salvate. Sei sicuro di voler tornare al catalogo?")) {
		window.location.href = "admin.jsp";
	}
}
