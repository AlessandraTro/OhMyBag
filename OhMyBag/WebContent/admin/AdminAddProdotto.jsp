<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggiungi Prodotto</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/AdminAddProdotto.css">
</head>
<body>

	<!-- fragment per poter aggiungere l'Header dell'admin -->
	<%@ include file="HeaderAdmin.jsp"%>
	<div class="alert-container">
		<!-- Allerta per operazione avvenuta con successo -->
		<div class="alert alert-success" role="alert" id="success-alert"
			style="display: none;"></div>
		<!-- Allerta per errore -->
		<div class="alert alert-danger" role="alert" id="error-alert"
			style="display: none;"></div>
	</div>
	
	<!-- Contenuto principale della pagina -->
	<div class="container-insert">
		<div class="insert-form">
			<h2>Inserimento Prodotto</h2>
			<!-- Form per aggiungere un nuovo prodotto -->
			<form action="AdminAddProdottoControl" method="post" id="productForm"
				enctype="multipart/form-data">
				<input type="hidden" name="action" value="insert">
				<div class="container-inserimento">
					<div class="container">
						<div class="content">
							<label class="label-field" for="ID">ID:</label><input
								class="input-field" name="ID" type="text" maxlength="100"
								required placeholder="Inserisci ID">
						</div>
						<div class="content">
							<label class="label-field" for="Nome">Nome:</label><input
								class="input-field" name="Nome" type="text" maxlength="100"
								required placeholder="Inserisci Nome">
						</div>
					</div>
					<div class="container">
						<div class="content">
							<label class="label-field" for="Prezzo">Prezzo:</label><input
								class="input-field" name="Prezzo" type="number" min="0" required
								placeholder="Inserisci Prezzo">
						</div>
						<div class="content">
							<label class="label-field" for="Iva">Percentuale Iva:</label><input
								class="input-field" name="Iva" type="number" min="0" required
								placeholder="Inserisci Iva">
						</div>
					</div>
					<div class="container">
						<div class="content">
							<label class="label-field" for="Sconto">Sconto:</label><input
								class="input-field" name="Sconto" type="number" maxlength="100"
								min="0" max="100" required placeholder="Inserisci Sconto">
						</div>
						<div class="content">
							<label class="label-field" for="Disponibilita">Disponibilita:</label>
							<input class="input-field" name="Disponibilita" type="number"
								min="0" required placeholder="Inserisci Disponibilità">
						</div>
					</div>
					<div class="container">
						<div class="content">
							<label class="label-field" for="Marca">Marca:</label><input
								class="input-field" name="Marca" type="text" maxlength="100"
								required placeholder="Inserisci Marca">
						</div>
						<div class="content">
							<label class="label-field" for="AnnoCollezione">AnnoCollezione:</label>
							<input class="input-field" name="AnnoCollezione" type="number"
								min="1900" required placeholder="Inserisci Anno Collezione">
						</div>
					</div>
					<div class="container">
						<div class="content">
							<label for="Categoria">Categoria:</label>
							<div class="categoria">
								<div class="option">
									<label>Donna</label> <input name="Categoria" type="radio"
										value="01" onclick="updateTipologie(this.value)"
										class="categoria">
								</div>
								<div class="option">
									<label>Uomo</label> <input name="Categoria" type="radio"
										value="02" onclick="updateTipologie(this.value)"
										class="categoria">
								</div>
								<div class="option">
									<label>Viaggi</label> <input name="Categoria" type="radio"
										value="03" onclick="updateTipologie(this.value)"
										class="categoria">
								</div>
							</div>
						</div>
						<div class="content">
							<label for="Tipologia">Tipologia:</label> <select
								name="tipologie" id="tipologie">
								<option class="tipologia" value=""></option>

							</select><br>
						</div>
					</div>
					<div class="container">
						<div class="content">
							<label for="Descrizione">Descrizione:</label>
							<textarea name="Descrizione" maxlength="3000" rows="3" required
								placeholder="Inserisci Descrizione" id="inputDescrizione"></textarea>
						</div>
						<div class="content">
							<label for="imgCopertina">Aggiungi immagine di copertina</label>
							<input class="file" type="file" name="imgCopertina" value=""
								maxlength="255" accept="image/jpg,image/jpeg,image/png"
								id="imgCopertina"> <img
								alt="Immagine non ancora selezionata o invalida" src="#"
								id="imgView"
								style="display: none; max-width: 100px; height: 120px;"> <label
								for="imgProdotto">Aggiungi immagini</label> <input class="file"
								type="file" name="imgProdotto" value="" maxlength="255"
								accept="image/jpg,image/jpeg,image/png" id="imgProdotto"
								multiple>
							<div id="imgsView" style="display: flex; flex-wrap: wrap;"></div>
						</div>
					</div>
				</div>
				<div class="container button">
					<div class="content submit">
						<input type="submit" value="Aggiungi Prodotto"
							class="input-submit">
					</div>
					<div class="content reset">
						<input type="reset" value="Resetta campi" class="input-reset">
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/ConfirmationModal.jsp"%>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<!-- script preso online per includere CKEditor dal CDN -->

	<script>

/*visualizzazione immagine di copertina*/
document.getElementById('imgCopertina').addEventListener('change', function(event) {
    const file = event.target.files[0];
    const imgPreview = document.getElementById('imgView');

    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            imgPreview.src = e.target.result;
            imgPreview.style.display = 'block';
        };
        reader.readAsDataURL(file);
    } else {
        // Se non c'è nessun file selezionato, nascondi l'immagine
        imgPreview.src = '';
        imgPreview.style.display = 'none';
    }
});


/*visualizzazione immagini del prodotto*/
document.getElementById('imgProdotto').addEventListener('change', function(event) {
    const files = event.target.files;
    const imgContainer = document.getElementById('imgsView');
    imgContainer.innerHTML = ''; // Pulisci il contenitore delle immagini prima di aggiungere le nuove anteprime

    Array.from(files).forEach(file => {
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const imgPreview = document.createElement('img');
                imgPreview.src = e.target.result;
                imgPreview.style.display = 'block';
                imgPreview.style.maxWidth='100px';
                imgPreview.style.height='120px';
                imgPreview.style.margin = '5px'; // Margine tra le anteprime
                imgContainer.appendChild(imgPreview);
            };
            reader.readAsDataURL(file);
        }
    });
});

/*Reset form handler*/
document.getElementById('productForm').addEventListener('reset', function() {
    const imgPreview = document.getElementById('imgView');
    imgPreview.src = '';
    imgPreview.style.display = 'none';

    const imgContainer = document.getElementById('imgsView');
    imgContainer.innerHTML = ''; // Pulisci il contenitore delle immagini
});

	// Script per trasformare la textarea in CKEditor
	CKEDITOR.replace('inputDescrizione');
	
    const tipologieOptions = {
        "01": [
            {value: "Accessori", text: "Accessori"},
            {value: "Borsa", text: "Borsa"},
            {value: "Cintura", text: "Cintura"},
            {value: "Portafoglio", text: "Portafoglio"},
            {value: "Sciarpe e Cappelli", text: "Sciarpe e Cappelli"},
            {value: "Zaino", text: "Zaini"}
        ],
        "02": [
            {value: "Marsupi e Borselli", text: "Marsupi e Borselli"},
            {value: "Zaino", text: "Zainio"},
            {value: "Cintura", text: "Cintura"},
            {value: "Portafoglio", text: "Portafoglio"},
            {value: "Accessori", text: "Accessori"},
            {value: "Sciarpe e Cappelli", text: "Sciarpe e Cappelli"}
        ],
        "03": [
            {value: "Valigie", text: "Valigie"},
            {value: "Bagagli a mano", text: "Bagagli a mano"},
            {value: "Zaini da Viaggio", text: "Zaini da Viaggio"},
            {value: "Borsoni da Viaggio", text: "Borsoni da Viaggio"},
            {value: "Accessori Da Viaggio", text: "Accessori da Viaggio"}
        ]
    };

    function updateTipologie(categoria) {
        const tipologieSelect = document.getElementById("tipologie");
        tipologieSelect.innerHTML = ""; // Svuota le opzioni esistenti

        if (tipologieOptions[categoria]) {
            tipologieOptions[categoria].forEach(option => {
                const newOption = document.createElement("option");
                newOption.value = option.value;
                newOption.text = option.text;
                tipologieSelect.appendChild(newOption);
            });
        }
    }

document.getElementById('productForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevenire il submit di default

    // Mostra la modale di conferma
    $('#confirmModalMessage').text("Sei sicuro di voler aggiungere questo prodotto?");
    $('#confirmModal').modal('show');

    // Gestisci il click del pulsante "Conferma" nella modale
    document.getElementById('confirmActionBtn').addEventListener('click', function() {
        // Nascondi la modale
        $('#confirmModal').modal('hide');

        // Continua con il submit del form
        showAlert('success', 'Prodotto aggiunto con successo!');
        
        setTimeout(function() {
        	document.getElementById('productForm').submit();
		}, 1000);
	
    });

    // Gestione del clic sul pulsante "Annulla"
    $('#confirmModal .btn-secondary').off('click').on('click', function() {
        $('#confirmModal').modal('hide');
        // Esegui altre azioni di annullamento se necessario
    });
});

function showAlert(type, message) {
    var alertDiv;
    switch(type) {
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

</script>
</body>
</html>
