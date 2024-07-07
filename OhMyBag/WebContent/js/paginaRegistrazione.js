/**
 * paginaRegistrazione.js
 */

/* Dichiarazione variabili booleane per controllo campi*/
var nameCorrect = false;
var surnameCorrect = false;
var mailCorrect = false;
var numberCorrect = false;
var cfCorrect = false;
var addressCorrect = false;
var passwordCorrect = false;
var passwordValCorrect = false;

/* Funzione chiamata al submit che controlla che tutti i campi rispettino le regole di validazione prestabilite */
function validate(form) {

	if (!nameCorrect) {
		return false;
	}

	if (!surnameCorrect) {
		return false;
	}

	if (!mailCorrect) {
		return false;
	}

	if (!numberCorrect) {
		return false;
	}

	if (!cfCorrect) {
		return false;
	}

	if (!addressCorrect) {
		return false;
	}

	if (!passwordCorrect) {
		return false;
	}

	if (!passwordValCorrect) {
		return false;
	}

	return true;
}

/* Funzioni che controllano i vari campi input ogni volta che vengono modificati e ne controlla la validità */
$("#nome").change(function() {
	nameCorrect = nameValidator(form.nome, this);

});

$("#cognome").change(function() {
	surnameCorrect = surnameValidator(form.cognome, this);

});

$("#phone").change(function() {
	numberCorrect = phonenumber(this);

});

$("#cf").change(function() {
	cfCorrect = cfValidator(form.cf, this);

});

$("#indirizzo").change(function() {
	addressCorrect = addressValidator(form.indirizzo, this);

});

$("#password").change(
	function() {
		passwordCorrect = passwordValidator(this);
		if (($('#passwordRepeat').val().length) > 0)
			passwordValCorrect = passwordRepeat(form.password,
				form.passwordRepeat);
	});

$("#passwordRepeat").change(function() {
	passwordValCorrect = passwordRepeat(form.password, this);

});

/* Funzione utilizzata per verificare che l'email inserita non sia stata già utilizzata. */
$("#mail").on("keyup  change", function(e) {
	var email = $(this).val();
	mailCorrect = validateEmail(this); //richiamata la funzione per verificare la validità dell'email

	if (mailCorrect) { //email nel formato giusto
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {

				var result = xhttp.responseText;

				if (result == "true") { //se esiste già un account con lo stessa email
					$("#mailError").text("Email già utilizzata");
					$("#mail").css({ "border-color": "red" });
					mailCorrect = false;
				} else { //l'email non è stata mai utilizzata
					$("#mailError").text("");
					$("#mail").css({ "border-color": "#00fd00" });
					mailCorrect = true;
				}
			}
		};
	}

	xhttp.open("POST", "EmailControl", true);
	xhttp.setRequestHeader("content-type", "application/x-www-form-urlencoded"); //imposta l'header ovvero content-type e il tipo di contenuto standard dei form
	xhttp.setRequestHeader("connection", "close");
	xhttp.send("email=" + email);
});

/* Funzioni per il controllo della validità dei singoli input */

// Validità nome
function nameValidator(nome) {
	var nomeReg = /^(([A-Z])([a-z]+)(\s?))+$/;
	if (nome.value.match(nomeReg)) {
		$("#nome").css({ "border-color": "#00fd00" });
		$("#nomeError").text("");
		return true;
	}
	else {
		$("#nome").css({ "border-color": "red" });
		$("#nomeError").text("Formato del Nome errato");

		return false;
	}

}


// Validità cognome
function surnameValidator(cognome) {
	var cognomeReg = /^(([A-Z])([a-z]+)(\s?))+$/;
	if (cognome.value.match(cognomeReg)) {
		$("#cognome").css({ "border-color": "#00fd00" });
		$("#cognomeError").text("");
		return true;
	}
	else {
		$("#cognome").css({ "border-color": "red" });
		$("#cognomeError").text("Formato del Cognome errato");

		return false;
	}

}

// Validità email
function validateEmail(uemail) {
	var mailformat = /^\S+@\S+\.\S{2,3}$/; //espressione regolare per email
	if (uemail.value.match(mailformat)) {
		$("#mail").css({ "border-color": "#00fd00" });
		$("#mailError").text("");
		return true;
	}
	else {
		$("#mail").css({ "border-color": "red" });
		$("#mailError").text("Email non valida, scrivere un email in un formato corretto.Es: example@live.it");
		return false;
	}
}

// Validità telefono
function phonenumber(inputtxt) {
	var phoneno = /^\+?([0-9]{3})\)?([0-9]{7})$/;
	if (inputtxt.value.match(phoneno)) {
		$("#phone").css({ "border-color": "#00fd00" });
		$("#phoneError").text("");
		return true;
	}
	else {
		$("#phone").css({ "border-color": "red" });
		$("#phoneError").text("Numero di telefono non valido!");
		return false;
	}
}

// Validità CF
function cfValidator(cf) {
	var cfReg = /^(?:(?:[B-DF-HJ-NP-TV-Z]|[AEIOU])[AEIOU][AEIOUX]|[B-DF-HJ-NP-TV-Z]{2}[A-Z]){2}[\dLMNP-V]{2}(?:[A-EHLMPR-T](?:[04LQ][1-9MNP-V]|[1256LMRS][\dLMNP-V])|[DHPS][37PT][0L]|[ACELMRT][37PT][01LM])(?:[A-MZ][1-9MNP-V][\dLMNP-V]{2}|[A-M][0L](?:[1-9MNP-V][\dLMNP-V]|[0L][1-9MNP-V]))[A-Z]$/;
	if (cf.value.match(cfReg)) {
		$("#cf").css({ "border-color": "#00fd00" });
		$("#cfError").text("");
		return true;
	}
	else {
		$("#cf").css({ "border-color": "red" });
		$("#cfError").text("Formato del CF errato");

		return false;
	}

}

// Validità indirizzo
function addressValidator(indirizzo) {
    var ind = /^(([A-Z][a-z]+)(\s))+(\d+)(,)(\s?)([A-Z][a-z]+)(,\s?)([A-Z]{2})(,\s?\d{5})$/;
    if (indirizzo.value.match(ind)) {
        $("#indirizzo").css({ "border-color": "#00fd00" });
        $("#indirizzoError").text("");
        return true;
    } else {
        $("#indirizzo").css({ "border-color": "red" });
        $("#indirizzoError").text("L'indirizzo deve essere del formato es. 'Via Genova 24, Roma, RM, 84033'");
        return false;
    }
}


// Validità Password
function passwordValidator(password) {
	var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_])[a-zA-Z0-9\W_]{6,}$/;

	if (password.value.match(passw)) {
		$("#password").css({ "border-color": "#00fd00" });
		$("#passwordError").text("");
		return true;
	}
	else {
		$("#password").css({ "border-color": "red" });
		$("#passwordError").text("La password deve contenere almeno un numero, una lettera minuscola e una maiuscola e deve essere lunga almeno sei caratteri che possono essere lettere, numeri o underscore");

		return false;
	}

}

// Validità Password ripetuta
function passwordRepeat(password, repeat) {

	if (repeat.value != password.value) {
		$("#passwordRepeat").css({ "border-color": "red" });
		$("#passwordValError").text("Le due password non coincidono!");
		return false;
	}
	else {
		$("#passwordRepeat").css({ "border-color": "#00fd00" });
		$("#passwordValError").text("");
		return true;
	}
}
