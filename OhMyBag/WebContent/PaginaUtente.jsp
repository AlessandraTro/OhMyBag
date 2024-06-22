<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, it.ohmybag.bean.*,java.util.GregorianCalendar, java.text.SimpleDateFormat, java.util.Date, java.io.*"%>
<%! String citta;
	String provincia;
	String via;
	int cap;
%>
<% 
    Utente utente = (Utente) request.getSession().getAttribute("utente"); 
    ArrayList<Ordine> ordini = (ArrayList<Ordine>) request.getSession().getAttribute("OrdiniUtente");
    
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOM3V4KJ3p3Z6gt54weEL5uE3T6egfbhEAA1e1C8" crossorigin="anonymous">
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="css/PaginaUtente.css" rel="stylesheet">
<title>Utente</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="Header.jsp" />
		<div class="containerAll">
			<div class="container">
				<div class="container-menu">
					<div class="menu-up">
						<div>
							<a href="#" id="dati-anagrafici-link">Dati Anagrafici</a>
						</div>
						<div>
							<a href="#" id="ordini-link">Ordini</a>
						</div>
						<div>
							<a href="#" id="aggiungi-carta-link">Aggiungi Carta</a>
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
							<a href="DeleteAccountControl">Cancella account</a>
						</div>
						<div>
							<a href="LogoutControl">Log-Out</a>
						</div>
					</div>
				</div>
				<div class="setting">
					<i id="settings-icon" class="settings-icon fas fa-cog"></i>
				</div>
				<div id="dati-anagrafici" class="container-insert Dati-anagrafici">
		
					<form id="modificaDatiForm" action="ModificaDatiControl" method="POST" onsubmit="return handleFormSubmit(event)">
						<div class="container-form">
							<div class="content">
								<label for="Nome">Nome:</label>
								<input class="input-field" type="text" name="Nome" value="<%= utente.getNome()%>" disabled>
							</div>
							<div class="content">
								<label for="Cognome">Cognome:</label>
								<input class="input-field" type="text" name="Cognome" value="<%= utente.getCognome()%>" disabled>
							</div>
							<div class="content">
								<label for="Email">Email:</label>
								<input class="input-field" type="text" id="Email" name="Email" value="<%= utente.getEmail()%>" disabled oninput="showEmailWarning()">
								<p id="email-warning" style="display:none; color:red;">Attenzione: modificare l'email richiede una verifica.<br> Verrà modificato anche lo Username.</p>
								<p id="email-error" style="display:none; color:red;">Email non valida.</p>
							</div>
							<div class="content">
								<label for="CF">Codice Fiscale:</label>
								<input class="input-field" type="text" name="CF" value="<%= utente.getCodiceFiscale()%>" disabled>
							</div>
							<div class="content">
								<label for="DataDiNascita">Data di nascita:</label>
								<input class="input-field" type="text" name="DataDiNascita" value="<%=new SimpleDateFormat("dd/MM/yyyy").format(utente.getDataDiNascita().getTime())%>" disabled>
							</div>
							<div class="content">
								<label for="Telefono">Telefono:</label>
								<input class="input-field" type="text" name="Telefono" value="<%= utente.getTelefono()%>" disabled>
							</div>
							<div class="content button" id="modifica-bottoni" style="display:none;">
								<div class="content submit">
									<input type="submit" value="Applica Modifiche" class="input-submit">
								</div>
								<div class="content reset">
									<input type="reset" value="Reset" class="input-reset">
								</div>
							</div>
							<div class="content">
								<button type="button" id="modifica-campi">Modifica i campi</button>
							</div>
						</div>
					</form>
				</div>
				
				<div id="ordini" class="container-insert Ordini" style="display:none;">
					<table border="1">
					<tr>
						<th>Numero ordine</th>
						<th class="prezzo">Prezzo Totale</th>
						<th>Data Acquisto</th>
						<th>Azione</th>
					</tr>
					<%if(ordini!=null && !ordini.isEmpty()){
						for(Ordine ordine:ordini){%>
						<tr>
							<th><%=ordine.getId()%></th>
							<th class="prezzo"><%=ordine.getPrezzoTotale()%></th>
							<th><%=new SimpleDateFormat("dd/MM/yyyy").format(ordine.getData().getTime())%></th>
							<th>
							<a href="#">Fattura</a><br>
							<a href="#" class="details-link"
								data-bs-toggle="modal" data-bs-target="#ordiniModal"
								data-order-id="<%=ordine.getId()%>">Dettagli</a>
							</th>
						</tr>
						<%} %>
					<%} %>
					</table>
				</div>
				
				<!-- Dettagli Ordine Image Modal -->
				<div class="modal fade" id="ordiniModal" tabindex="-1" role="dialog"
					aria-labelledby="ordiniModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="ordiniModalLabel">Dettagli Ordine</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body"></div>
						</div>
					</div>
				</div>
		
				<div id="aggiungi-carta" class="container-insert Aggiungi-carta" style="display:none;">
		        <form action="AddCreditCardControl" method="POST">
		            <div class="container-form">
		                <div class="content">
		                	<input type="hidden" name="action" value="addCard">
		                    <label for="NumeroCarta">Numero carta:</label>
		                    <input class="input-field" type="text" id="NumeroCarta" name="NumeroCarta" maxlenght=19 pattern="\d{4}-?\d{4}-?\d{4}-?\d{4}" required>
		                    <img id="Mastercard" src="img/metodiDiPagamento/cc-mastercard.svg">
		                    <img id="Visa" src="img/metodiDiPagamento/cc-visa.svg">
		                    <p id="ErroreCarta" style="color:red; display:none;">Inserire una carta valida</p>
		                </div>
		                <div class="content">
		                    <label for="DataScadenza">Data di scadenza:</label>
		                    <input class="input-field" type="month" name="DataScadenza" min="2024-07" required>
		                </div>
		                <div class="content">
		                    <label for="CVV">CVV:</label>
		                    <input class="input-field" type="number" name="CVV" max="999" min="100" required>
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
				
				<div id="cambia-indirizzo" class="container-insert Cambia-indirizzo" style="display:none;">
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
		
				            <div class="content button" id="button-group" style="display:none;">
				                <div class="content submit">
				                    <input type="submit" value="Cambia indirizzo" class="input-submit" id="input-submit">
				                </div>
				                <div class="content reset">
				                    <input type="reset" value="Reset" class="input-reset">
				                </div>
				            </div>
				            <div class="content">
				                <input type="button" value="Modifica i campi" id="cambia-indirizzo-btn">
				            </div>
				        </div>
				    </form>
				</div>
				<div id="cambia-password" class="container-insert Cambia-password" style="display:none;">
			        <form action="CambiaPasswordControl" method="POST" onsubmit="return validate(this)">
			            <div class="container-form">
				            <div class="content">
				                <label for="PasswordVecchia">Inserisci vecchia Password</label>
				                <input class="input-field" type="password" name="PasswordVecchia" id="PasswordVecchia" required>
				                <p id="ErroreVecchiaPassword" style="color:red; display:none;">Inserire la vecchia password</p>
				            </div>
			                <div class="content">
			                    <div class="login-box">
			                        <label for="pass" class="label">New Password</label>
			                        <input type="password" name="password" id="pass" class="input-field" required>
			                        <i class="bx bx-lock-alt icon" id="show-password"></i>
			                        <p id="passwordError" class="error" style="color:red"></p>
			                    </div>
			                </div>
							<div class="content">
			                    <div class="login-box">
			                        <label for="passRepeat" class="label">Repeat new Password</label>
			                        <input type="password" name="repeat" id="passRepeat" class="input-field" required>
			                        <i class="bx bx-lock-alt icon" id="show-password"></i>
			                        <p id="passwordValError" class="error" style="color:red;"></p>
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
		</div>
		<jsp:include page="Footer.jsp" />
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="js/PaginaUtente.js"></script>
	</div>
</body>
</html>
