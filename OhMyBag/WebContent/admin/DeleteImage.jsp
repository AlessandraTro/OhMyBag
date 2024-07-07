<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*"%>

<%
//Ottieni la collezione di immagini dalla sessione
Collection<Immagine> img = (Collection<Immagine>) request.getSession().getAttribute("productImages");
Immagine copertina = null;
List<Immagine> altreImmagini = new ArrayList<>();
//Se esistono immagini, separa la copertina dalle altre
if (img != null && !img.isEmpty()) {
	for (Immagine immagine : img) {
		if (immagine.isCopertina()) {
			copertina = immagine;// Imposta l'immagine di copertina
		} else {
			altreImmagini.add(immagine);// Aggiungi altre immagini alla lista
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Elimina Immagini</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/Modal.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

</head>
<body>
    <div class="container">
    	<!-- Alert di successo -->
    	<div class="alert alert-success" role="alert" id="success-alert" style="display:none;">
            Immagini eliminate con successo!
        </div>
        <!-- Alert di errore -->
        <div class="alert alert-danger" role="alert" id="error-alert" style="display:none;">
            Si è verificato un errore durante l'eliminazione delle immagini.
        </div>
        <!-- Alert informativo -->
        <div class="alert alert-info" role="alert" id="info-alert" style="display:none;">
            Nessuna immagine selezionata.
        </div>
        <div class="card">
            <div class="card-body">
            	<!-- Form per eliminare immagini -->
                <form id="deleteForm" action="ButtonDeleteImage" method="post">
                    <div class="list-group gallery">
                        <% if (copertina != null) { %>
                        <!-- Visualizza l'immagine di copertina -->
                        <div class="form-check copertina">
                            <p class="text-copertina">Immagine di Copertina</p>
                            <img src="<%= copertina.getNome() %>" alt="Image" class="img-responsive thumbnail">
                        </div>
                        <% } %>
                        <% if (!altreImmagini.isEmpty()) { %>
                        <!-- Loop sulle altre immagini disponibili -->
                        <% for (Immagine immagine : altreImmagini) { %>
                        <div class="form-check">
                        	<!-- Checkbox per selezionare le immagini da eliminare -->
                            <input class="form-check-input" type="checkbox" name="imagePath" value="<%= immagine.getNome() %>" id="image<%= immagine.getNome() %>">
                            <label class="form-check-label" for="image<%= immagine.getNome() %>">
                                <!-- Immagine da visualizzare -->
                                <img src="<%= immagine.getNome() %>" alt="Image" class="img-responsive thumbnail">
                            </label>
                        </div>
                        <% } %>
                        <% } else { %>
                        <!-- Nessuna immagine trovata -->
                        <p>No images found.</p>
                        <% } %>
                    </div>
                    <!-- Pulsante per eliminare le immagini selezionate -->
                    <div class="bottoneModal">
                        <button type="submit" class="pulsanteBigElimina"><i class="fas fa-trash-alt"></i> Elimina Selezionate</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Inclusione del modale di conferma -->
	<%@ include file="/ConfirmationModal.jsp" %>

    <script src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
       <script>
    // Script per gestire l'eliminazione di una o più immagini nella modale DeleteImage.jsp
    $(document).ready(function() {
        $('#deleteForm').on('submit', function(event) {
            event.preventDefault();

         	// Controlla se almeno un'immagine è stata selezionata
            var checkboxesChecked = $("input[name='imagePath']:checked").length;
            if (checkboxesChecked === 0) {
            	showAlert("info", "Nessuna immagine selezionata");
                return;
            }

         	// Mostra il modale di conferma
            $('#confirmModalMessage').text("Sei sicuro di voler eliminare le immagini selezionate?");
            $('#confirmModal').modal('show');

            // Gestione del clic sul pulsante "Conferma" nel modale
            $('#confirmActionBtn').off('click').on('click', function() {
                $('#confirmModal').modal('hide');
             	// Effettua una chiamata AJAX per eliminare le immagini selezionate
                $.ajax({
                    url: 'ButtonDeleteImage',
                    type: 'POST',
                    data: $('#deleteForm').serialize(),
                    success: function(response) {
                    	setTimeout(function() {
                            showAlert('success', 'Immagini eliminate con successo!');
                        }, 100);
                        // Ricarica il contenuto del modale
                        $("#modal-body").load("ButtonModal?Pulsante=Delete");
                        
                        
                    },
                    error: function(xhr, status, error) {
                        showAlert('danger', 'Si è verificato un errore: ' + error);
                    }
                });
            });

         	// Gestione del clic sul pulsante "Annulla" nel modale di conferma
            $('#confirmModal .btn-secondary').off('click').on('click', function() {
                $('#confirmModal').modal('hide');
                // Esegui altre azioni di annullamento se necessario
            });
        });

     	// Funzione per mostrare gli alert
        function showAlert(type, message) {
            console.log('Show alert:', type, message); // Log di debug
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
    });
    </script>
</body>
</html>