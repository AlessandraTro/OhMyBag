<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
		import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/StileRegistrazione.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

<title>Pagina Registrazione</title>
</head>
<body>
	<!-- include dell'Header -->
	<jsp:include page="Header.jsp" />

	<div class="container">

		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">Se hai già un account</h4>
				<p class="login">
					<a href="LoginControl" class="btn btn-block btn-login"> 
						<i class="fa fa-sign-in-alt"></i>   Login
					</a>

				</p>
				<p class="divider-text">
					<span class="bg-light">O</span>
				</p>
				<h4 class="card-title mt-3 text-center">Crea un account</h4>

				<form name="form" id="form" action="RegistrazioneControl"
					method="post" onsubmit="return validate(this)">

					<div class="form-group-costum">
						<img class="immagine-reg" src="img/website/user-solid.svg">
						<input name="inputNome" class="form-control" placeholder="Nome"
							type="text" id="nome" required> <input
							name="inputCognome" class="form-control" placeholder="Cognome"
							type="text" id="cognome" required>
					</div>

					<p id="nomeError" class="error"></p>
					<p id="cognomeError" class="error"></p>

					<div class="form-group-costum">
						<img class="immagine-reg"
							src="img/website/calendar-days-solid.svg"> <input
							name="data" class="form-control" type="date" id="data" required>

					</div>

					<p id="userNameError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/envelope-solid.svg">
						<input name="email" class="form-control"
							placeholder="Indirizzo Email" type="text" id="mail" required>
					</div>

					<p id="mailError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/phone-solid.svg">
						<input name="phone" class="form-control"
							placeholder="Numero di telefono" type="text" id="phone" required>
					</div>

					<p id="phoneError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/address-card-solid.svg">
						<input name="cf" class="form-control" type="text"
							placeholder="Codice Fiscale" id="cf" required>
					</div>

					<p id="cfError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/house-solid.svg">
						<input name="indirizzo" class="form-control" type="text"
							placeholder="Indirizzo" id="indirizzo" required>
					</div>
					<p id="indirizzoError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/lock-solid.svg">
						<input name="password" class="form-control"
							placeholder="Crea password" type="password" id="password"
							required>
					</div>
					<p id="passwordError" class="error"></p>

					<div class="form-group-costum ">
						<img class="immagine-reg" src="img/website/lock-solid.svg">
						<input name="repeat" class="form-control"
							placeholder="Ripeti password" type="password" id="passwordRepeat"
							required>
					</div>
					<p id="passwordValError" class="error"></p>



					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							Crea un Account</button>
					</div>

				</form>
			</article>
		</div>

	</div>


	<!-- SCRIPT -->
	<script src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>

	<script>
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
		$("#mail").on("keyup  change",function (e){
	   		   var email = $(this).val();
	   			mailCorrect = validateEmail(this); //richiamata la funzione per verificare la validità dell'email
	   			
	   			if(mailCorrect){ //email nel formato giusto
	   		   		var xhttp = new XMLHttpRequest();
	    				xhttp.onreadystatechange = function() {
	    					if (xhttp.readyState == 4 && xhttp.status == 200) {
	    					
		    	      			var result = xhttp.responseText;
		    	      			
		    	      			if(result=="true"){ //se esiste già un account con lo stessa email
		    	      				$("#mailError").text("Email già utilizzata");
		    	      				console.log("OKOK")
		    	      			 	$("#mail").css({"border-color":"red"});
		    	      			 	mailCorrect = false;
		    	      			}else { //l'email non è stata mai utilizzata
			    	      				$("#mailError").text("");
			    	      				$("#mail").css({"border-color":"#00fd00"});
			    	      				console.log("Oppp")
			    	      				mailCorrect = true;
		    	      			} 
	    					}	
	    	    		};
	    			}
	    			
	    			xhttp.open("POST", "EmailControl", true);
	    			xhttp.setRequestHeader("content-type","application/x-www-form-urlencoded"); //imposta l'header ovvero content-type e il tipo di contenuto standard dei form
	     			xhttp.setRequestHeader("connection","close");
	     			xhttp.send("email="+email);	
	       }); 
		
	    /* Funzioni per il controllo della validità dei singoli input */
	    
	    // Validità nome
	    function nameValidator(nome)
		{
			var nomeReg= /^(([A-Z])([a-z]+)(\s?))+$/;
			if(nome.value.match(nomeReg)) 
			{ 
				$("#nome").css({"border-color":"#00fd00"});
				$("#nomeError").text("");
			    return true;
			}
			else
			{ 
				$("#nome").css({"border-color":"red"});
			   $("#nomeError").text("Formato del Nome errato");
				
			     return false;
			}
			    	
		}
	    
	    
	    // Validità cognome
	    function surnameValidator(cognome)
		{
			var cognomeReg= /^(([A-Z])([a-z]+)(\s?))+$/;
			if(cognome.value.match(cognomeReg)) 
			{ 
				$("#cognome").css({"border-color":"#00fd00"});
				$("#cognomeError").text("");
			    return true;
			}
			else
			{ 
				$("#cognome").css({"border-color":"red"});
			   $("#cognomeError").text("Formato del Cognome errato");
				
			     return false;
			}
			    	
		}
	    
	    // Validità email
	    function validateEmail(uemail)
		{
		   //var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		   var mailformat = /^\S+@\S+\.\S{2,3}$/; //espressione regolare per email
		   if(uemail.value.match(mailformat))
		   {
			   $("#mail").css({"border-color":"#00fd00"});
			   $("#mailError").text("");
		     return true;
		   }
		   else
		   {
			   $("#mail").css({"border-color":"red"});
		      $("#mailError").text("Email non valida, scrivere un email in un formato corretto.Es: example@live.it");
		      return false;
		   }
	    }

	    // Validità telefono
	    function phonenumber(inputtxt)
		{
		  var phoneno = /^\+?([0-9]{3})\)?([0-9]{7})$/;
		  if(inputtxt.value.match(phoneno))
		        {
			      $("#phone").css({"border-color":"#00fd00"});
			      $("#phoneError").text("");
		          return true;
		        }
		      else
		        {
		    	 $("#phone").css({"border-color":"red"});
		    	  $("#phoneError").text("Numero di telefono non valido!");
		        return false;
		        }
		}
		
	    // Validità CF
	    function cfValidator(cf)
		{
			var cfReg= /^(?:(?:[B-DF-HJ-NP-TV-Z]|[AEIOU])[AEIOU][AEIOUX]|[B-DF-HJ-NP-TV-Z]{2}[A-Z]){2}[\dLMNP-V]{2}(?:[A-EHLMPR-T](?:[04LQ][1-9MNP-V]|[1256LMRS][\dLMNP-V])|[DHPS][37PT][0L]|[ACELMRT][37PT][01LM])(?:[A-MZ][1-9MNP-V][\dLMNP-V]{2}|[A-M][0L](?:[1-9MNP-V][\dLMNP-V]|[0L][1-9MNP-V]))[A-Z]$/;
			if(cf.value.match(cfReg)) 
			{ 
				$("#cf").css({"border-color":"#00fd00"});
				$("#cfError").text("");
			    return true;
			}
			else
			{ 
				$("#cf").css({"border-color":"red"});
			   $("#cfError").text("Formato del CF errato");
				
			     return false;
			}
			    	
		}
	    
	    // Validità indirizzo
	    function addressValidator(indirizzo)
		{
			var ind= /^(([A-Z])([a-z]+)(\s))+(\d+)(,)(\s?)(([A-Z])([a-z]+)(\s?))+$/;
			if(indirizzo.value.match(ind)) 
			{ 
				$("#indirizzo").css({"border-color":"#00fd00"});
				$("#indirizzoError").text("");
			    return true;
			}
			else
			{ 
				$("#indirizzo").css({"border-color":"red"});
			   $("#indirizzoError").text("L'indirizzo deve essere del formato es. 'Via Genova 24, Roma'");
				
			     return false;
			}
			    	
		}
	    
	    // Validità Password
	    function passwordValidator(password)
		{
			var passw= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{6,}$/;
			if(password.value.match(passw)) 
			{ 
				$("#password").css({"border-color":"#00fd00"});
				$("#passwordError").text("");
			    return true;
			}
			else
			{ 
				$("#password").css({"border-color":"red"});
			   $("#passwordError").text("La password deve contenere almeno un numero, una lettera minuscola e una maiuscola e deve essere lunga almeno sei caratteri che possono essere lettere, numeri o underscore");
				
			     return false;
			}
			    	
		}
	    
	    // Validità Password ripetuta
		function passwordRepeat(password,repeat){
			
			if(repeat.value != password.value){
				$("#passwordRepeat").css({"border-color":"red"});
				 $("#passwordValError").text("Le due password non coincidono!");
				 return false;
			}
			else {
				$("#passwordRepeat").css({"border-color":"#00fd00"});
				 $("#passwordValError").text("");
				return true;
			}
		}
	    
	</script>
	

</body>
</html>