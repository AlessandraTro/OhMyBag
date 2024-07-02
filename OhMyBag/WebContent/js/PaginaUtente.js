//verifico quale menu viene scelto dall'utente
document.addEventListener("DOMContentLoaded", function() {
	// Ottieni tutti i link del menu
	const menuLinks = document.querySelectorAll(".menu-up a");

	// Ottieni tutte le sezioni della pagina utente
	const sections = document.querySelectorAll(".container-insert");

	// Funzione per mostrare una specifica sezione e nascondere le altre
	function showSection(sectionId) {
		sections.forEach(section => {
			if (section.id === sectionId) {
				section.style.display = "block";
			} else {
				section.style.display = "none";
			}
		});
	}

	// Gestisci il click su ciascun link del menu
	menuLinks.forEach(link => {
		link.addEventListener("click", function(event) {
			event.preventDefault(); // Evita il comportamento di default del link
			const sectionId = this.getAttribute("id").replace("-link", "");
			showSection(sectionId);
		});
	});

	// Controlla se c'è un hash nella URL per mostrare la sezione corretta all'avvio
	const hash = window.location.hash.substring(1); // Ottieni l'hash senza #
	if (hash && document.getElementById(hash)) {
		showSection(hash);
	} else {
		// Se non c'è un hash valido, mostra la prima sezione di default
		showSection("dati-anagrafici"); // Modifica "dati-anagrafici" con l'ID della sezione predefinita
	}
});

//inizia la parte in cui vengono modificati e verificati i dati anagrafici
let initialFormData = {};

document.getElementById('modifica-campi').addEventListener('click', function() {
	// Abilita tutti i campi di input
	document.querySelectorAll('#dati-anagrafici input[type="text"], #dati-anagrafici input[type="number"]').forEach(function(input) {
		input.disabled = false;
	});
	// Mostra i pulsanti submit e reset
	document.getElementById('modifica-bottoni').style.display = 'flex';
	// Nascondi il pulsante "Modifica i campi"
	this.style.display = 'none';
});

document.addEventListener('DOMContentLoaded', function() {
	// Save the initial form data
	const fields = document.querySelectorAll('#dati-anagrafici input[type="text"]');
	fields.forEach(field => {
		initialFormData[field.name] = field.value;
	});
});

function showEmailWarning() {
	const emailField = document.getElementById('Email');
	const emailWarning = document.getElementById('email-warning');
	emailWarning.style.display = (emailField.value !== initialFormData['Email']) ? 'block' : 'none';
}

function validateEmail(email) {
	// Simple email validation check for '@' and '.'
	const atIndex = email.indexOf('@');
	const dotIndex = email.lastIndexOf('.');
	return atIndex > 0 && dotIndex > atIndex + 1 && dotIndex < email.length - 1;
}

function confirmModifications() {
	const fields = document.querySelectorAll('#dati-anagrafici input[type="text"]');
	let isModified = false;
	fields.forEach(field => {
		if (field.value !== initialFormData[field.name]) {
			isModified = true;
		}
	});

	if (!isModified) {
		newalert('Nessuna modifica rilevata.');
		setTimeout(function(){location.reload();},1000);
		
		return false;
	}

	const emailField = document.getElementById('Email');
	const emailError = document.getElementById('email-error');
	if (emailField.value !== initialFormData['Email'] && !validateEmail(emailField.value)) {
		emailError.style.display = 'block';
		return false;
	} else {
		emailError.style.display = 'none';
	}

	return confirm('Sei sicuro di voler applicare le modifiche?');
}

function handleFormSubmit(event) {
	if (!confirmModifications()) {
		event.preventDefault();
	}
}

//inizia la parte in cui vengono modificate e verificate le carte che si vogliono inserire
document.getElementById('NumeroCarta').addEventListener('input', function() {
	let cardNumber = this.value.replace(/\D/g, ''); // Remove non-numeric characters
	const mastercardImage = document.getElementById('Mastercard');
	const visaImage = document.getElementById('Visa');
	const circuitoContainer = document.getElementById('circuitoContainer');
	const error = document.getElementById('ErroreCarta');
	const errorSubmit = document.getElementById('input-submitCarta');

	// Automatically add dashes every 4 digits
	cardNumber = cardNumber.match(/.{1,4}/g)?.join('-') || cardNumber;
	this.value = cardNumber;

	let circuito = "";

	if (cardNumber.length >= 2) {
		const firstTwoDigits = cardNumber.replace(/-/g, '').substring(0, 2);

		if (['51', '52', '53', '54', '55'].includes(firstTwoDigits)) {
			mastercardImage.style.display = 'inline';
			visaImage.style.display = 'none';
			circuito = "Mastercard";

			error.style.display = 'none';
			errorSubmit.disabled = false;
		} else if (['40', '41', '42', '43', '44', '45', '46', '47', '48', '49'].includes(firstTwoDigits)) {
			mastercardImage.style.display = 'none';
			visaImage.style.display = 'inline';
			circuito = "Visa";

			error.style.display = 'none';
			errorSubmit.disabled = false;
		} else {
			mastercardImage.style.display = 'none';
			visaImage.style.display = 'none';
			error.style.display = 'flex';
			errorSubmit.disabled = true;

		}
	} else {
		mastercardImage.style.display = 'none';
		visaImage.style.display = 'none';
		errorSubmit.disabled = false;
	}

	// Remove existing circuito input if it exists
	const existingInput = document.querySelector('#circuitoInput');
	if (existingInput) {
		existingInput.remove();
	}

	// Add new circuito input if circuito is identified
	if (circuito) {
		const input = document.createElement('input');
		input.type = 'hidden';
		input.id = 'circuitoInput';
		input.name = 'circuito';
		input.value = circuito;
		circuitoContainer.appendChild(input);
	}

	if (cardNumber.length >= 19) {
		checkCardExists(cardNumber);
	}
});
//verifico se la carta è gia presente per quel determinato utente
function checkCardExists(cardNumber) {
	const errorSubmit = document.getElementById('input-submitCarta');
	const xhr = new XMLHttpRequest();
	xhr.open('POST', 'AddCreditCardControl', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
			const response = JSON.parse(xhr.responseText);
			if (response.exists) {
				errorSubmit.disabled = true;
				newalert("La carta di credito e' gia' stata inserita nel database.");
			}
		}
	};
	xhr.send('action=checkCard&NumeroCarta=' + encodeURIComponent(cardNumber));
}

function newalert(message) {
    var alertSuccess = document.getElementById("AlertInfo");
    if (alertSuccess) {
        alertSuccess.style.display = "block";
        alertSuccess.innerHTML = message;
        // Nasconde l'alert dopo 3 secondi
        setTimeout(function() {
            alertSuccess.style.display = 'none';
        }, 3000);
    }
}
//inizia la parte di modifica e verifica della password
var passwordCorrect = false;
var passwordValCorrect = false;

function validate(form) {
	console.log("Validating form");
	if (!passwordCorrect) {
		console.log("Password not correct");
		return false;
	}

	if (!passwordValCorrect) {
		console.log("Password validation not correct");
		return false;
	}

	return confirm('Sei sicuro di voler applicare le modifiche?');
}

$("#pass").on('input', function() {
	console.log("Password changed");
	passwordCorrect = passwordValidator(this);
	if ($('#passRepeat').val().length > 0) {
		passwordValCorrect = passwordRepeat(this, $('#passRepeat')[0]);
	}
});

$("#passRepeat").on('input', function() {
	console.log("Password repeat changed");
	passwordValCorrect = passwordRepeat($('#pass')[0], this);
});

function passwordValidator(password) {
	var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_])[a-zA-Z0-9\W_]{6,}$/;
	if (password.value.match(passw)) {
		$("#pass").css({ "border-color": "#00fd00" });
		$("#passwordError").text("");
		return true;
	} else {
		$("#pass").css({ "border-color": "red" });
		$("#passwordError").text("La password deve contenere almeno un numero, una lettera minuscola e una maiuscola e deve essere lunga almeno sei caratteri che possono essere lettere, numeri o underscore");
		return false;
	}
}

function passwordRepeat(password, repeat) {
	if (repeat.value !== password.value) {
		$("#passRepeat").css({ "border-color": "red" });
		$("#passwordValError").text("Le due password non coincidono!");
		return false;
	} else {
		$("#passRepeat").css({ "border-color": "#00fd00" });
		$("#passwordValError").text("");
		return true;
	}
}
document.getElementById('PasswordVecchia').addEventListener('input', function() {
	let password = this.value.trim();

	if (password !== '') {
		matchPassword();
	}
});

function matchPassword() {
	const errorSubmit = document.getElementById('ErroreVecchiaPassword');
	const disable = document.getElementById('input-submitPassword');
	const xhr = new XMLHttpRequest();

	xhr.open('POST', 'VerificaVecchiaPasswordControl', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
			const response = JSON.parse(xhr.responseText);
			if (response.exists) {
				$("#PasswordVecchia").css({ "border-color": "#00fd00" });
				errorSubmit.style.display = "none";
				disable.disabled = false;
			} else {
				$("#PasswordVecchia").css({ "border-color": "red" });
				errorSubmit.style.display = "block"; // Mostra l'errore se la vecchia password non è corretta
				disable.disabled = true;
			}
		}
	};

	const oldPassword = document.getElementById('PasswordVecchia').value;
	xhr.send('PasswordVecchia=' + encodeURIComponent(oldPassword));
}



//inizia la parte di verifica dell'indirizzo di spedizione
document.getElementById('cambia-indirizzo-btn').addEventListener('click', function() {
	// Abilita tutti i campi di input
	document.querySelectorAll('#cambia-indirizzo input[type="text"], #cambia-indirizzo input[type="number"]').forEach(function(input) {
		input.disabled = false;
	});
	// Mostra i pulsanti submit e reset
	document.getElementById('button-group').style.display = 'flex';
	// Nascondi il pulsante "Modifica i campi"
	this.style.display = 'none';
});

//permetto di visualizzare l'icona delle impostazioni solo sui dispositivi mobile
document.addEventListener("DOMContentLoaded", function() {
	const settingsIcon = document.getElementById("settings-icon");
	const containerMenu = document.querySelector(".container-menu");
	const menuLinks = containerMenu.querySelectorAll("a");

	function updateIconVisibility() {
		if (window.innerWidth > 1000) {
			settingsIcon.style.display = "none";
			containerMenu.classList.remove("open");
		} else {
			settingsIcon.style.display = "block";
		}
	}

	settingsIcon.addEventListener("click", function(event) {
		event.stopPropagation();
		containerMenu.classList.toggle("open");
	});

	document.addEventListener("click", function(event) {
		if (!containerMenu.contains(event.target) && !settingsIcon.contains(event.target)) {
			containerMenu.classList.remove("open");
		}
	});

	menuLinks.forEach(function(link) {
		link.addEventListener("click", function() {
			containerMenu.classList.remove("open");
		});
	});

	window.addEventListener("resize", updateIconVisibility);

	updateIconVisibility();
});

//modale per visualizzare i vari ordini
document.addEventListener('DOMContentLoaded', function() {
	var detailsLinks = document.querySelectorAll('.details-link');

	detailsLinks.forEach(function(link) {
		link.addEventListener('click', function(event) {
			var orderId = event.target.getAttribute('data-order-id');

			// Fai una chiamata AJAX per ottenere i dettagli dell'ordine
			fetch('DettagliOrdiniAdmin?Fattura=No&Codice=' + orderId, {
				headers: {
					'X-Requested-With': 'XMLHttpRequest'
				}
			})
				.then(response => response.text())
				.then(html => {
					// Aggiorna il corpo della modale con i dettagli ricevuti
					document.querySelector('#ordiniModal .modal-body').innerHTML = html;

					// Mostra la modale
					$('#ordiniModal').modal('show');
				});
		});
	});
});

//permetto di visualizzare un pulsante di conferma per la cancellazione dell'account
document.getElementById('deleteAccount').addEventListener('click', function(event) {
	var confirmation = confirm('Sei sicuro di voler cancellare il tuo account? Questa azione non puo essere annullata.');
	if (!confirmation) {
		event.preventDefault(); // Annulla l'azione di cancellazione se l'utente non conferma
	}
});
