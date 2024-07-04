<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Prodotto product = (Prodotto) request.getSession().getAttribute("ProdottoDaModificare");
Categoria categoria = (Categoria) request.getSession().getAttribute("categoria");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modifica Prodotto</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="./css/ModificaProdotto.css" rel="stylesheet" type="text/css">
<link href="css/Modal.css" rel="stylesheet" type="text/css">
</head>

<body>
    <%@ include file="HeaderAdmin.jsp"%>
	<form class="formAdmin" id="productForm" action="AdminModificaControl" method="post" onsubmit="return validate(this)">
	<div class="informazioni">
		<div class="header">
			<h2 class="titolo">Dettagli Prodotto</h2>
			<button type="button" class="pulsante" onclick="goToCatalog()">Torna al Catalogo</button>
		</div>
		<div class="container-dettagli">
        
                <div class="campi">
        
            <!-- Campi che non si modificano -->
            <div class="login-box">
                <label for="productId" class="label">ID Prodotto: </label>
                <input type="text" name="productId" id="productId" class="input-field" value="<%=product.getId()%>" readonly>
            </div>

            <div class="login-box">
                <label for="productName" class="label">Nome: </label>
                <input type="text" name="productName" id="productName" class="input-field" value="<%=product.getNome()%>" readonly>
            </div>

            <div class="login-box">
                <label for="productBrand" class="label">Marca: </label>
                <input type="text" name="productBrand" id="productBrand" class="input-field" value="<%=product.getMarca()%>" readonly>
            </div>

            <div class="login-box">
                <label for="productType" class="label">Tipologia: </label>
                <input type="text" name="productType" id="productType" class="input-field" value="<%=product.getTipologia()%>" readonly>
            </div>

            <div class="login-box">
                <label for="categoryName" class="label">Categoria: </label>
                <input type="text" name="categoryName" id="categoryName" class="input-field" value="<%=categoria.getNome()%>" readonly>
            </div>

            <div class="login-box">
                <label for="collectionYear" class="label">Anno Collezione: </label>
                <input type="text" name="collectionYear" id="collectionYear" class="input-field" value="<%=product.getAnnoCollezione()%>" readonly>
            </div>

            <div class="login-box">
            <!-- Formattata la data -->
			<%
			GregorianCalendar calendar = product.getDataInserimento();
			LocalDateTime dateTime = LocalDateTime.ofInstant(calendar.toInstant(), ZoneId.systemDefault());
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String formattedDate = dateTime.format(formatter);
			%>
                <label for="dateInserted" class="label">Data Inserimento: </label>
                <input type="text" name="dateInserted" id="dateInserted" class="input-field" value="<%= formattedDate %>" readonly>
            </div>

            <!-- Campi che si modificano -->
            <div class="login-box">
                <label for="inputPrezzo" class="label">Prezzo: </label>
                <input type="text" class="input-field" name="inputPrezzo" id="inputPrezzo" placeholder="<%=String.format("%.2f", product.getPrezzo())%> €">
                <p id="inputPrezzoError" class="error"></p>
            </div>

            <div class="login-box">
                <label for="inputSconto" class="label">Sconto: </label>
                <input type="number" class="input-field" name="inputSconto" id="inputSconto" min="0" max="99" placeholder="<%=product.getSconto()%> %">
                <p id="inputScontoError" class="error"></p>
            </div>

            <div class="login-box">
                <label for="inputQuantity" class="label">Quantità: </label>
                <input type="number" class="input-field" name="inputQuantity" id="inputQuantity" min="1" max="100" placeholder="<%=product.getDisponibilita()%>">
                <p id="inputQuantityError" class="error"></p>
            </div>

            <div class="login-box">
                <label for="inputIva" class="label">IVA: </label>
                <input type="number" class="input-field" name="inputIva" id="inputIva" min="1" max="100" placeholder="<%=product.getIva()%> %">
                <p id="inputIvaError" class="error"></p>
            </div>
			</div>
			<div class="descrizione-immagini">
			<div class="descrizione">
            <div class="login-box">
                <label for="inputDescrizione" class="label-Descrizione">Descrizione: </label>
                <textarea rows="3" cols="3" class="input-field" name="inputDescrizione" id="inputDescrizione"><%=product.getDescrizione()%></textarea>
                <p id="inputDescrizioneError" class="error"></p>
            </div>
            </div>
            <div class="img-change">
        	<div class="immagine-prodotto">
            	<label for="inputImmagine" class="label-Immigine">Immagini: </label>
        	</div>
        	<div class="buttons-container">
            	<button type="button" class="pulsante" onclick="openModal('Delete')" data-bs-toggle="modal" data-bs-target="#modalDelete">Elimina Immagini</button>
				<button type="button" class="pulsante" onclick="openModal('Add')" data-bs-toggle="modal" data-bs-target="#modalAdd">Aggiungi Immagini</button>
				<button type="button" class="pulsante" onclick="openModal('Copertina')" data-bs-toggle="modal" data-bs-target="#modalCopertina">Modifica Copertina</button>

        	</div>
        	        	<hr class="featurette-divider">
        	
        	<div class="buttonBig">
        		 <button type="submit" class="pulsanteBig" onclick="return confirmNoChanges()">Modifica</button>
        	     <button type="reset" class="pulsanteBig" onclick="confirmReset(event)">Reset</button>
   			</div>        	
           	</div>
    		</div>
    	</div>
    </div>	
    </form>
    <!-- MODALI -->
	<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel">Gestione Immagini</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modal-body">
                <!-- Il contenuto del modale sarà caricato dinamicamente -->
            </div>
        </div>
    </div>
</div>
	<!-- SCRIPT -->
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<!-- script preso online per includere CKEditor dal CDN -->
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script src="js/modificaProdotto.js"></script>
</body>
</html>
