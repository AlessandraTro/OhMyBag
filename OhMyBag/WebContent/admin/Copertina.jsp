<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*"%>
<%
Collection<Immagine> image = (Collection<Immagine>) request.getSession().getAttribute("productImages");
Immagine copertina = null;
List<Immagine> altreImmagini = new ArrayList<>();
if (image != null && !image.isEmpty()) {
	for (Immagine immagine : image) {
		if (immagine.isCopertina()) {
	copertina = immagine;
		} else {
	altreImmagini.add(immagine);
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set Cover Image</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/Modal.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">

</head>
<body>
    <div class="container">
        <!-- Alert di successo -->
        <div class="alert alert-success" role="alert" id="success-alert" style="display:none;">
            Immagine di copertina impostata con successo!
        </div>
        <!-- Alert di errore -->
        <div class="alert alert-danger" role="alert" id="error-alert" style="display:none;">
            Si è verificato un errore durante il cambio di Copertina! 
        </div>
        <!-- Alert di informazione -->
        <div class="alert alert-info" role="alert" id="info-alert" style="display:none;">
            Seleziona una nuova immagine di copertina oppure chiudi la finestra.
        </div>
        <div class="card">
            <div class="card-body">
                <!-- Form per impostare l'immagine di copertina -->
                <form id="setCoverForm" action="ButtonSetCover" method="post">
                    <div class="list-group gallery">
                        <% if (copertina != null) { %>
                        <div class="form-check changeCover">
                            <div class="CoverImg">
                                <p class="text-copertina">Immagine di Copertina</p>
                                <img src="<%=copertina.getNome()%>" alt="Image" class="img-responsive thumbnail">
                            </div>
                        </div>
                        <% } %>
                        <% for (Immagine immagine : altreImmagini) { %>
                        <div class="form-check changeCover">
                            <img src="<%=immagine.getNome()%>" alt="Image" class="img-responsive thumbnail">
                            <input type="radio" name="coverImage" value="<%=immagine.getNome()%>">
                        </div>
                        <% } %>
                        <% if (altreImmagini.isEmpty()) { %>
                        <p>No images found.</p>
                        <% } %>
                    </div>
                    <div class="bottoneModal">
                        <button type="submit" class="pulsanteBigCover">Set Cover Image</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script>
	//Funzione per settare la copertina nella modale Copertina.jsp

        $(document).ready(function() {
            $('#setCoverForm').on('submit', function(event) {
                event.preventDefault();
                
                // Controlla se è selezionata un'immagine di copertina
                if ($('input[name="coverImage"]:checked').length === 0) {
                    showAlert('info', 'Seleziona una nuova immagine di copertina oppure chiudi la finestra');
                    return;
                }
                
             	// Effettua una chiamata AJAX per impostare l'immagine di copertina
                $.ajax({
                    url: 'ButtonSetCover',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                    	setTimeout(function() {
                            showAlert('success', 'Immagine di copertina impostata con successo!');
                        }, 100);
                        // Aggiorna solo la galleria di immagini
                        $("#modal-body").load("ButtonModal?Pulsante=Copertina");
                    },
                    error: function(xhr, status, error) {
                        showAlert('danger', 'Si è verificato un errore: ' + error);
                    }
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
                        alertDiv = '#secondary-alert'; // Default to error alert if type is not recognized
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