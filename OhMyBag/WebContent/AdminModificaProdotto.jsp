<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Prodotto product = (Prodotto) request.getSession().getAttribute("ProdottoDaModificare");
Categoria categoria = (Categoria) request.getSession().getAttribute("categoria");
Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("images");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifica Prodotto</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="./css/AdminModificaProdotto.css" rel="stylesheet"
	type="text/css">
<!-- Da cambiare css admin -->
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<form action="AdminModificaControl" method="post"
		onsubmit="return validate(this)">
		<div class="container-dettagli">
			<table class="table-costum">
				<thead>
					<th>Dettagli prodotto</th>
				</thead>

				<tbody>
					<!-- Campi che non si modificano -->
					<tr>
						<td>ID:</td>
						<td><%= product.getId()%></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><%= product.getNome()%></td>
					</tr>
					<tr>
						<td>Marca:</td>
						<td><%= product.getMarca()%></td>
					</tr>
					<tr>
						<td>Tipologia:</td>
						<td><%= product.getTipologia()%></td>
					</tr>
					<tr>
						<td>Categoria:</td>
						<td><%= categoria.getNome()%></td>
					</tr>
					<tr>
						<td>Anno Collezione:</td>
						<td><%= product.getAnnoCollezione()%></td>
					</tr>
					<tr>
						<td>Data Inserimento:</td>
						<!-- Formattata la data -->
						<%
						    GregorianCalendar calendar = product.getDataInserimento();
						    LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
						    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
						    String formattedDate = dateTime.format(formatter);
						%>
						<td><%= formattedDate%></td>
					</tr>

					<!-- Campi che si modificano -->
					<tr>
						<td>Prezzo:</td>
						<td><input type="text" class="form-control"
							name="inputPrezzo" id="inputPrezzo"
							placeholder="<%=String.format("%.2f", product.getPrezzo())%> €">
							<p id="inputPrezzoError" class="error"></p></td>
					</tr>
					<tr>
						<td>Sconto:</td>
						<td><input type="number" class="form-control"
							name="inputSconto" id="inputSconto" min=0 max=99
							placeholder="<%=product.getSconto()%> %">
							<p id="inputScontoError" class="error"></p></td>
					</tr>
					<tr>
						<td>Quantità:</td>
						<td><input type="number" class="form-control"
							name="inputQuantity" id="inputQuantity" min=1 max=100
							placeholder="<%=product.getDisponibilita()%>">
							<p id="inputQuantityError" class="error"></p></td>

					</tr>
					<tr>
						<td>Iva:</td>
						<td><input type="number" class="form-control" name="inputIva"
							id="inputIva" min=1 max=100 placeholder="<%=product.getIva()%> %">
							<p id="inputIvaError" class="error"></p></td>
					</tr>
					<tr>
						<td>Descrizione:</td>
						<td><textarea rows="3" cols="3" class="form-control"
								name="inputDescrizione" id="inputDescrizione"> <%=product.getDescrizione()%></textarea>
							<p id="inputDescrizioneError" class="error"></p></td>
					</tr>
					<tr>
						<td>Immagine:</td>
						<td><button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#deleteImageModal">Elimina
								Immagini</button>
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#addImageModal">Aggiungi
								Immagini</button></td>
					</tr>
					<tr>
						<td><button type="submit" class="btn btn-primary">Modifica</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>

  <!-- Delete Image Modal -->
    <div class="modal fade" id="deleteImageModal" tabindex="-1" aria-labelledby="deleteImageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteImageModalLabel">Elimina Immagini</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <jsp:include page="DeleteImage.jsp" flush="true">
                        <jsp:param name="images" value="<%= images %>" />
                    </jsp:include>
                </div>
            </div>
        </div>
    </div>


   <!-- Add Image Modal -->
    <div class="modal fade" id="addImageModal" tabindex="-1" aria-labelledby="addImageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addImageModalLabel">Aggiungi Immagini</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <jsp:include page="AddImage.jsp" flush="true">
                        <jsp:param name="images" value="<%= images %>" />
                    </jsp:include>
                </div>
            </div>
        </div>
    </div>

	<!-- SCRIPT -->
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<!-- script preso online per includere CKEditor dal CDN -->
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>

	<script>
	// Script per trasformare la textarea in CKEditor
    CKEDITOR.replace('inputDescrizione');
	
	var prezzoCorrect = true;
	var scontoCorrect = true;
	var quantityCorrect = true;
	var ivaCorrect = true;
	var descrizioneCorrect = true;
	
	/* Funzione chiamata al submit che controlla che tutti i campi rispettino le regole di validazione prestabilite */
	function validate(form) {

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

		return true;
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

			var PrezzoFormat = /^(?!(0)+(.?)(0)+)([0-9]+)((\.?)([0-9]{2}))?$/;
			if (InputPrezzo.value.match(PrezzoFormat)) {
				$("#inputPrezzo").css({
					"border-color" : "#00fd00"
				});
				$("#inputPrezzoError").text("");
				return true;
			} else {
				$("#inputPrezzo").css({
					"border-color" : "red"
				});
				$("#inputPrezzoError").text("Formato Prezzo non corretto.");
				return false;
			}
		}

		// Validità Sconto
		function ValidateSconto(InputSconto) {

			var ScontoFormat = /^([0-9])+$/;
		    if (InputSconto.value.match(ScontoFormat) && parseInt(InputSconto.value) >= 0 && parseInt(InputSconto.value) <= 99) {

				$("#inputSconto").css({
					"border-color" : "#00fd00"
				});
				$("#inputScontoError").text("");
				return true;
			} else {

				$("#inputSconto").css({
					"border-color" : "red"
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
					"border-color" : "#00fd00"
				});
				$("#inputQuantityError").text("");
				return true;
			} else {

				$("#inputQuantity").css({
					"border-color" : "red"
				});
				$("#inputQuantityError").text("Formato Quantità non corretto.");
				return false;
			}
		}

		// Validità Iva
		function ValidateIva(InputIva) {

			var IvaFormat = /^([0-9])+$/;
			if (InputIva.value.match(IvaFormat)&& parseInt(InputIva.value) >= 0 && parseInt(InputIva.value) <= 100) {

				$("#inputIva").css({
					"border-color" : "#00fd00"
				});
				$("#inputIvaError").text("");
				return true;
			} else {

				$("#inputIva").css({
					"border-color" : "red"
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
					"border-color" : "#00fd00"
				});
				$("#inputDescrizioneError").text("");
				return true;
			} else {
				$("#inputDescrizione").css({
					"border-color" : "red"
				});
				$("#inputDescrizioneError").text(
						"Formato Descrizione non corretto.");
				return false;
			}
		}
	</script>
</body>
</html>


<!--  

<form action="AdminControl" method="POST">
		<input type="hidden" name="action" value="modDesc"> 
		<input type="hidden" name="ID" value="<%=request.getParameter("ID")%>">

		<label for="modDescrizione">Modifica Descrizione:</label><br>
		<textarea name="modDescrizione" type="text" maxlength="3000" rows="3" required placeholder="enter Descrizione" style="height: 400px;">
		<%=request.getAttribute("descrizione")%>
		</textarea><br>
		<input type="submit" value="apply">
		<input type="reset" value="Reset">
	</form> -->