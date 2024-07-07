<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, it.ohmybag.bean.*,java.util.GregorianCalendar, java.text.SimpleDateFormat, java.util.Date, java.io.*"%>
	
<%! // Dichiarazione delle variabili di stato per l'indirizzo di spedizione
	String citta;
	String provincia;
	String via;
	int cap;%>
<% // Recupero delle informazioni dell'utente, degli ordini e delle carte dalla sessione
Utente utente = (Utente) request.getSession().getAttribute("utente");
ArrayList<Ordine> ordini = (ArrayList<Ordine>) request.getSession().getAttribute("OrdiniUtente");
LinkedList<Carta> carte = (LinkedList<Carta>) request.getSession().getAttribute("Carte");

//Recupero dell'indirizzo di spedizione dell'utente
String indirizzoSpedizione = utente.getIndirizzoSpedizione();

// Utilizzo String.split per dividere l'indirizzo in componenti
String[] components = indirizzoSpedizione.split(",");

if (components.length >= 4) {// verifico se ci sono tutti i componenti
	via = components[0].trim();
	citta = components[1].trim();
	provincia = components[2].trim();
	cap = Integer.parseInt(components[3].trim());
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="css/PaginaUtente.css" rel="stylesheet">
<title>Utente</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="Header.jsp" />
		<div class="containerAll">
		
			<!-- creo il menu che esce sul lato sinistro della pagina -->
			<div class="container-menu">
				<div class="menu-up">
					<div>
						<a href="#" id="dati-anagrafici-link">Dati Anagrafici</a>
					</div>
					<div>
						<a href="#" id="ordini-link">Ordini</a>
					</div>
					<div>
						<a href="#" id="aggiungi-carta-link">Carte</a>
					</div>
					<div>
						<a href="#" id="cambia-indirizzo-link">Cambia indirizzo</a>
					</div>
					<div>
						<a href="#" id="cambia-password-link">Cambia password</a>
					</div>
				</div>
				<div class="menu-down">
					<div>
						<a href="#" onclick="return CancellaAccount()" ><b>Cancella account</b></a>
					</div>
					<div>
						<a href="LogoutControl"><b>Log-Out</b></a>
					</div>
				</div>
			</div>
			
			
			<!-- Alert se la modifica è andata a buon fine -->
			<%if(request.getSession().getAttribute("Alert")!=null){ %>
				<div class="alert alert-success" role="alert" id="AlertSuccess"><%=request.getSession().getAttribute("Alert")%></div>
				<%request.getSession().removeAttribute("Alert");%>
			<%}%>
				<div class="alert alert-info" role="alert" style="display:none" id="AlertInfo"></div>
				
			<!-- creo la pagina effettiva dove verranno visualizzate le div in base a ciò che viene scelto nel menu -->
			<div class="containerPagina">
				<!-- per i dispositivi mobile viene visualizzato un pulsante per aprire il menu -->
				<div class="setting">
					<i id="settings-icon" class="settings-icon fas fa-cog"></i>
				</div>
				<!-- la pagina di Default visualizza i dati anagrafici -->
				<div id="dati-anagrafici" class="container-insert Dati-anagrafici" style="display: none;">
					<h2>Dati Anagrafici</h2>
					<form id="modificaDatiForm" action="ModificaDatiControl" method="POST" onsubmit="return handleFormSubmit(event)">
						<div class="container-form">
						<!-- Campi dati anagrafici -->
							<div class="content">
								<label for="Nome">Nome:</label> 
								<input class="input-field" type="text" name="Nome" value="<%=utente.getNome()%>" disabled>
							</div>
							<div class="content">
								<label for="Cognome">Cognome:</label> 
								<input class="input-field" type="text" name="Cognome" value="<%=utente.getCognome()%>" disabled>
							</div>
							<div class="content">
								<label for="Email">Email:</label> 
								<input class="input-field" type="text" id="Email" name="Email" value="<%=utente.getEmail()%>" disabled readonly>
							</div>
							<div class="content">
								<label for="CF">Codice Fiscale:</label> 
								<input class="input-field" type="text" name="CF" value="<%=utente.getCodiceFiscale()%>" disabled>
							</div>
							<div class="content">
								<label for="DataDiNascita">Data di nascita:</label> 
								<input class="input-field" type="text" name="DataDiNascita" value="<%=new SimpleDateFormat("dd/MM/yyyy").format(utente.getDataDiNascita().getTime())%>" disabled>
							</div>
							<div class="content">
								<label for="Telefono">Telefono:</label> 
								<input class="input-field" type="text" name="Telefono" value="<%=utente.getTelefono()%>" disabled>
							</div>
							<div class="content button" id="modifica-bottoni" style="display: none;">
								<div class="content submit">
									<input type="submit" value="Applica Modifiche" class="input-submit">
								</div>
								<div class="content reset">
									<input type="reset" value="Reset" class="input-reset">
								</div>
							</div>
							<div class="content button">
								<input type="button" id="modifica-campi" value="Modifica i campi">
							</div>
						</div>
					</form>
				</div>


				<!-- la pagina visualizza gli ordini effettuati dall'utente -->
				<div id="ordini" class="container-insert Ordini" style="display: none;">
					<h2 style="margin-bottom: 10px">Ordini effettuati</h2>
					<table class="table-bordered">
						<tr>
							<th>Numero ordine</th>
							<th class="prezzo">Prezzo Totale</th>
							<th>Data Acquisto</th>
							<th>Azione</th>
						</tr>
						<!-- Ciclo per mostrare gli ordini -->
						<%
						if (ordini != null && !ordini.isEmpty()) {
							for (Ordine ordine : ordini) {
						%>
						<tr>
							<th><%=ordine.getId()%></th>
							<th class="prezzo"><%=String.format("%.2f", ordine.getPrezzoTotale())%></th>
							<th><%=new SimpleDateFormat("dd/MM/yyyy").format(ordine.getData().getTime())%></th>
							<th>
								<!-- Link per visualizzare dettagli e fattura -->
								<a href="#" onclick="window.open('DettagliOrdiniAdmin?Fattura=Si&Codice=<%=ordine.getId()%>');">Fattura</a><br> 
								<a href="#" class="details-link" data-bs-toggle="modal" data-bs-target="#ordiniModal" data-order-id="<%=ordine.getId()%>">Dettagli</a></th>
						</tr>
						<%
						}
						%>
						<%
						}
						%>
					</table>
				</div>


				<!-- la pagina visualizza una sezione per poter aggiungere le carte -->
				<div id="aggiungi-carta" class="container-insert Aggiungi-carta" style="display: none;">
				<!-- Form per aggiungere una carta -->
					<div style="display: none;">
						<h2 style="margin-bottom: 10px">Aggiungi Carta</h2>
						<form action="AddCreditCardControl" method="POST">
							<div class="container-form">
								<div class="content">
									<input type="hidden" name="action" value="addCard"> 
									<label for="NumeroCarta">Numero carta:</label>
									<div style="display: flex;">
										<input class="input-field" type="text" id="NumeroCarta" name="NumeroCarta" maxlenght=19 pattern="\d{4}-?\d{4}-?\d{4}-?\d{4}" required> 
										<img id="Mastercard" src="img/metodiDiPagamento/cc-mastercard.svg">
										<img id="Visa" src="img/metodiDiPagamento/cc-visa.svg">
									</div>
									<p id="ErroreCarta" style="color: red; display: none;">Inserire una carta valida</p>
								</div>
								<div class="content">
									<label for="DataScadenza">Data di scadenza:</label> 
									<input class="input-field" type="month" name="DataScadenza" min="2024-07" required>
								</div>
								<div class="content">
									<label for="CVV">CVV:</label> <input class="input-field" type="number" name="CVV" max="999" min="100" required>
								</div>
								<div id="circuitoContainer" class="content"></div>
								<div class="content button">
									<div class="content submit">
										<input type="submit" value="Aggiungi Carta" class="input-submit" id="input-submitCarta">
									</div>
									<div class="content reset">
										<input type="reset" value="Reset" class="input-reset">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div style="display: block;">
						<h2>Carte già presenti</h2>
						<table class="table-bordered">
							<tr>
								<th>Numero di carta (ultime 4 cifre)</th>
								<th><a href="#" id="showFormLink">Aggiungi Carta</a></th>
							</tr>
							<%
							if (carte.isEmpty()) {
							%>
							<tr>
								<th>Non sono presenti carte</th>
								<th>nessuna azione valida</th>
							</tr>
							<%
							} else {
							%>
							<%
							for (Carta carta : carte) {
								String numeroCarta = "************" + carta.getNumeroCarta().substring(carta.getNumeroCarta().length() - 4);
							%>
							<tr>
								<th><%=numeroCarta%></th>
								<th><a href="#" onclick="return CancellaCarta(<%=carta.getId()%>)">Cancella carta</a></th>
							</tr>
							<%
							}
							}
							%>
						</table>
					</div>
				</div>


				<!-- la pagina visualizza una sezione dove si puo visualizzare e cambiare indirizzo -->
				<div id="cambia-indirizzo" class="container-insert Cambia-indirizzo" style="display: none;">
					<h2 style="margin-bottom: 10px">Cambia indirizzo</h2>
					<form action="CambiaIndirizzoControl" method="POST" onsubmit="return ConfermaIndirizzo(event)">
						<div class="container-form">
							<div class="content">
								<label for="Citta">Città</label> 
								<input class="input-field" type="text" name="Citta" value="<%=citta%>" required disabled>
							</div>
							<div class="content">
								<label for="Provincia">Provincia</label> 
								<input class="input-field" type="text" name="Provincia" value="<%=provincia%>" required disabled>
							</div>
							<div class="content">
								<label for="Via">Via</label> 
								<input class="input-field" type="text" name="Via" value="<%=via%>" required disabled>
							</div>
							<div class="content">
								<label for="CAP">CAP</label> 
								<input class="input-field" type="number" name="CAP" value="<%=cap%>" required disabled>
							</div>
							<div class="content button" id="button-group" style="display: none;">
								<div class="content submit">
									<input type="submit" value="Cambia indirizzo" class="input-submit" id="input-submit">
								</div>
								<div class="content reset">
									<input type="reset" value="Reset" class="input-reset">
								</div>
							</div>
							<div class="content button">
								<input type="button" value="Modifica i campi" id="cambia-indirizzo-btn">
							</div>
						</div>
					</form>
				</div>


				<!-- la pagina visualizza una sezione dove è possibile cambiare la password -->
				<div id="cambia-password" class="container-insert Cambia-password"
					style="display: none;">
					<h2 style="margin-bottom: 10px">Cambia password</h2>
					<!-- Form per cambiare la password -->
					<form action="CambiaPasswordControl" method="POST" onsubmit="return validate(this)">
						<div class="container-form">
							<div class="content">
								<label for="PasswordVecchia">Inserisci vecchia Password</label>
								<div class="password-container">
									<input class="input-field" type="password" name="PasswordVecchia" id="PasswordVecchia" required>
									<i class="fas fa-eye-slash toggle-password" onclick="togglePasswordVisibility('PasswordVecchia', this)"></i>
								</div>
								<p id="ErroreVecchiaPassword" style="color: red; display: none;">Inserire la vecchia password</p>
							</div>
							<div class="content">
								<div class="login-box">
									<label for="pass" class="label">New Password</label>
									<div class="password-container">
										<input type="password" name="password" id="pass" class="input-field" required> <i class="fas fa-eye-slash toggle-password" onclick="togglePasswordVisibility('pass', this)"></i>
									</div>
									<p id="passwordError" class="error" style="color: red"></p>
								</div>
							</div>
							<div class="content">
								<div class="login-box">
									<label for="passRepeat" class="label">Repeat new Password</label>
									<div class="password-container">
										<input type="password" name="repeat" id="passRepeat" class="input-field" required>
										<i class="fas fa-eye-slash toggle-password" onclick="togglePasswordVisibility('passRepeat', this)"></i>
									</div>
									<p id="passwordValError" class="error" style="color: red;"></p>
								</div>
							</div>
							<div class="content button">
								<div class="content submit">
									<input type="submit" value="Cambia Password" class="input-submit" id="input-submitPassword">
								</div>
								<div class="content reset">
									<input type="reset" value="Reset" class="input-reset">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>


			<!-- modale quando si clicca sui dettagli di un determinato ordine -->
			<div class="modal fade" id="ordiniModal" tabindex="-1" role="dialog"
				aria-labelledby="ordiniModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="ordiniModalLabel">Dettagli Ordine</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>
			<%@ include file="/ConfirmationModal.jsp" %>
			
		</div>
		<jsp:include page="Footer.jsp" />
	</div>
	<script src="js/jquery-3.7.1.min.js"></script>	
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/PaginaUtente.js"></script>
	<script type="text/javascript" src="js/ShowPassword.js"></script>
	<script>
    // Controlla se l'elemento dell'alert è presente sulla pagina
    document.addEventListener("DOMContentLoaded", function() {
        var alertSuccess = document.getElementById("AlertSuccess");
        if (alertSuccess) {
            // Nasconde l'alert dopo 3 secondi
            setTimeout(function() {
                alertSuccess.style.display = 'none';
            }, 3000);
        }
    });
    
    //Funzione che cancella la carta
    function CancellaCarta(idCarta) {
        $('#confirmModalMessage').text("Sei sicuro di voler cancellare la carta selezionata?");
        // Mostra la modale di conferma
        $('#confirmModal').modal('show');

        // Imposta l'azione di conferma per la cancellazione
        $('#confirmActionBtn').off('click').on('click', function() {
            $.ajax({
            url: 'CancellaCartaControl',
            type: 'POST',
            data: { carta: idCarta },
            success: function(response) {
            	// Ricarica la pagina dopo la cancellazione
                location.reload();
                 },
             error: function(xhr, status, error) {
            	 newalert('Si è verificato un errore: ' + error);
            	 }
            });

            // Ritorna il risultato della conferma
            return true;
        });
        
     	// Gestione del clic sul pulsante "Annulla"
        $('#confirmModal .btn-secondary').off('click').on('click', function() {
            $('#confirmModal').modal('hide');
        });
        // Ritorna false per impedire la propagazione del click
        return false;
    }
    
    //funzione che cancella l'account
    function CancellaAccount() {
        $('#confirmModalMessage').text("Sei sicuro di voler cancellare il tuo account? Questa azione non può essere annullata.");
        // Mostra la modale di conferma
        $('#confirmModal').modal('show');

        // Imposta l'azione di conferma per la cancellazione
        $('#confirmActionBtn').off('click').on('click', function() {
            $.ajax({
            url: 'DeleteAccountControl',
            type: 'POST',
            
            success: function(response) {
            	window.location.href= '${pageContext.request.contextPath}/HomeControl';
                 },
             error: function(xhr, status, error) {
            	 newalert('Si è verificato un errore: ' + error);
            	 }
            });

            // Ritorna il risultato della conferma
            return true;
        });
     	
        // Gestione del clic sul pulsante "Annulla"
        $('#confirmModal .btn-secondary').off('click').on('click', function() {
            $('#confirmModal').modal('hide');
        });
        // Ritorna false per impedire la propagazione del click
        return false;
    }
    
 // Mostra il form per aggiungere una carta quando si clicca sul link "Aggiungi carta"
	  document.getElementById("showFormLink").addEventListener("click", function(event) {
	    event.preventDefault();
	    // Mostra il primo div (form per aggiungere carta) e nasconde il secondo div (messaggio di conferma)
	    document.querySelector(".Aggiungi-carta > div:first-child").style.display = "block";
	    document.querySelector(".Aggiungi-carta > div:last-child").style.display = "none";
	  });
	  
	// Nasconde il form per aggiungere una carta quando si clicca sul link "Aggiungi carta" nel menu laterale
	  document.getElementById("aggiungi-carta-link").addEventListener("click", function(event) {
		    event.preventDefault();
		    // Nasconde il primo div (form per aggiungere carta) e mostra il secondo div (messaggio di conferma)
		    document.querySelector(".Aggiungi-carta > div:first-child").style.display = "none";
		    document.querySelector(".Aggiungi-carta > div:last-child").style.display = "block";
	  });

	// Funzione che viene eseguita quando il documento HTML è completamente caricato
        document.addEventListener("DOMContentLoaded", function() {
            const editButton = document.getElementById("cambia-indirizzo-btn"); // Bottone per modificare l'indirizzo
            const submitButton = document.getElementById("input-submit"); // Bottone di submit
            const formFields = document.querySelectorAll(".input-field"); // Campi del form
            const buttonGroup = document.getElementById("button-group"); // Gruppo di pulsanti

            // Memorizza i valori iniziali dei campi del form
            const initialValues = Array.from(formFields).map(field => field.value);

         	// Abilita la modifica dei campi del form
            function enableFields() {
                formFields.forEach(field => field.disabled = false);
                buttonGroup.style.display = "flex";
            }

         	// Verifica se è stato modificato qualche campo del form
            function isFormModified() {
                return Array.from(formFields).some((field, index) => {
                    return field.value !== initialValues[index];
                });
            }

            // Event listener per il bottone di modifica
            editButton.addEventListener("click", function() {
                enableFields();
            });

         	// Gestore per la sottomissione del form
            window.ConfermaIndirizzo = function(event) {
                if (isFormModified()) {
                    $('#confirmModalMessage').text("Confermi di voler modificare l'indirizzo?");
                    $('#confirmModal').modal('show');

                    // Imposta l'azione di conferma per la cancellazione
                    $('#confirmActionBtn').off('click').on('click', function() {
                        $('#confirmModal').modal('hide');
                        document.forms[3].submit();  // Invia il form
                    });

                    // Gestione del clic sul pulsante "Annulla"
                    $('#confirmModal .btn-secondary').off('click').on('click', function() {
                        $('#confirmModal').modal('hide');
                        // Esegui altre azioni di annullamento se necessario
                    });

                    // Impedisce l'invio automatico del form
                    return false;
                } else {
                    // Mostra un messaggio se nessuna modifica è stata rilevata e ricarica la pagina dopo un secondo
                    newalert('Nessuna modifica rilevata.');
                    setTimeout(function() { location.reload(); }, 1000);
                    return false;
                }
            }
        });
        
     	// Funzione per validare il form
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

            // Mostra un messaggio di conferma utilizzando un modal
            $('#confirmModalMessage').text("Sei sicuro di voler applicare le modifiche?");
            $('#confirmModal').modal('show');

            // Imposta l'azione di conferma per la cancellazione
            $('#confirmActionBtn').off('click').on('click', function() {
                console.log("Confirm action clicked");
                $('#confirmModal').modal('hide');
                document.forms[4].submit();  // Invia il form
            });

            // Gestione del clic sul pulsante "Annulla"
            $('#confirmModal .btn-secondary').off('click').on('click', function() {
                console.log("Cancel action clicked");
                $('#confirmModal').modal('hide');
            });

            // Impedisce l'invio automatico del form
            return false;
        }
    </script>
</body>
</html>
