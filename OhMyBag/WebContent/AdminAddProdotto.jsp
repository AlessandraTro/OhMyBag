<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Aggiungi Prodotto</title>
<link rel="stylesheet" type="text/css" href="./css/AdminAddProdotto.css">
</head>
<body>
	<div class="container-insert">
		<div class="insert-form">
			<h2>Insert</h2>
			<form action="AdminAddProdottoControl" method="post">
				<input type="hidden" name="action" value="insert">
				<div class="container-insert">
					<div class="content">
						<label for="ID">ID:</label><input name="ID" type="text" maxlength="100" required placeholder="enter ID"><br>
					</div>

					<div class="content">
						<label for="Nome">Nome:</label><input name="Nome" type="text" maxlength="100" required placeholder="enter Nome"><br>
					</div>

					<div class="content">
						<label for="Prezzo">Prezzo:</label><input name="Prezzo" type="number" min="0" required placeholder="enter Prezzo"><br>
					</div>
					<div class="content">
						<label for="Iva">Percentuale Iva:</label><input name="Iva" type="number" min="0" required placeholder="enter Iva"><br>
					</div>

					<div class="content">
						<label for="Sconto">Sconto:</label><input name="Sconto" type="number" maxlength="100" min="0" max="100" required placeholder="enter Sconto"><br>
					</div>

					<div class="content">
						<label for="Marca">Marca:</label><input name="Marca" type="text" maxlength="100" required placeholder="enter Marca"><br>
					</div>

					<div class="content">
						<label for="Categoria">Categoria:</label>
						<div>
							Donna <input name="Categoria" type="radio" value="01" onclick="updateTipologie(this.value)"><br>
							Uomo <input name="Categoria" type="radio" value="02" onclick="updateTipologie(this.value)"><br>
							Viaggi <input name="Categoria" type="radio" value="03" onclick="updateTipologie(this.value)"><br>
						</div>
					</div>

					<div class="content">
						<label for="Tipologia">Tipologia:</label>
						<select name="tipologie" id="tipologie">
							<option class="tipologia" value=""></option>
							
						</select><br>
					</div>

					<div class="content">
						<label for="Descrizione">Descrizione:</label>
						<textarea name="Descrizione" maxlength="3000" rows="3" required placeholder="enter Descrizione" id="inputDescrizione"></textarea><br>
					</div>

					<div class="content">
						<label for="AnnoCollezione">AnnoCollezione:</label>
						<input name="AnnoCollezione" type="number" min="1900" required placeholder="enter Anno Collezione"><br>
					</div>

					<div class="content">
						<label for="Disponibilita">Disponibilita:</label>
						<input name="Disponibilita" type="number" min="0" required placeholder="enter Disponibilita"><br>
					</div>

					<div class="content">
						<label for="imgCopertina">Aggiungi immagine di copertina</label>
						<input class="file" type="file" name="imgCopertina" value="" maxlength="255" accept="image/jpg,image/jpeg,image/png" id="imgCopertina">
					</div>
					<img alt="Immagine non ancora selezionata o invalida" src="#" id="imgView" style="display: none; max-width: 100px; height: 120px;">

					<div class="content">
						<label for="imgProdotto">Aggiungi immagini</label>
						<input class="file" type="file" name="imgProdotto" value="" maxlength="255" accept="image/jpg,image/jpeg,image/png" id="imgProdotto" multiple><br>
					</div>
					<div id="imgsView" style="display: flex; flex-wrap: wrap;"></div>

				</div>
				<div class="container-insert-submit">
					<input type="submit" value="Submit" class="input-submit">
					<input type="reset" value="Reset">
				</div>
			</form>
		</div>
	</div>
	
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script> <!-- script preso online per includere CKEditor dal CDN -->
<script>

/*visualizzazione immagine di copertina*/
document.getElementById('imgCopertina').addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const imgPreview = document.getElementById('imgView');
            imgPreview.src = e.target.result;
            imgPreview.style.display = 'block';
        };
        reader.readAsDataURL(file);
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
</script>
<script>
	// Script per trasformare la textarea in CKEditor
	CKEDITOR.replace('inputDescrizione');
	
    const tipologieOptions = {
        "01": [
            {value: "Accessori", text: "Accessori"},
            {value: "Borse", text: "Borse"},
            {value: "Cinture", text: "Cinture"},
            {value: "Portafogli", text: "Portafogli"},
            {value: "Sciarpe_e_Cappelli", text: "Sciarpe e Cappelli"},
            {value: "Zaini", text: "Zaini"}
        ],
        "02": [
            {value: "Marsupi_e_Borselli", text: "Marsupi e Borselli"},
            {value: "Zaini", text: "Zaini"},
            {value: "Cinture", text: "Cinture"},
            {value: "Portafogli", text: "Portafogli"},
            {value: "Accessori", text: "Accessori"},
            {value: "Sciarpe_e_Cappelli", text: "Sciarpe e Cappelli"}
        ],
        "03": [
            {value: "Valigie", text: "Valigie"},
            {value: "Bagaglio_a_mano", text: "Bagaglio a mano"},
            {value: "Zaini_da_Viaggio", text: "Zaini da Viaggio"},
            {value: "Borsoni_da_Viaggio", text: "Borsoni da Viaggio"},
            {value: "Accessori_da_Viaggio", text: "Accessori da Viaggio"}
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
    
    
</script>
</body>
</html>