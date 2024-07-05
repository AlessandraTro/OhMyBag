<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("productImages");
Immagine copertina = null;
List<Immagine> altreImmagini = new ArrayList<>();
if (images != null && !images.isEmpty()) {
    for (Immagine immagine : images) {
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
<title>Aggiungi Immagini</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/Modal.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div class="container">
        <div class="alert alert-success" role="alert" id="success-alert" style="display:none;">
            Immagini aggiunte con successo!
        </div>
        <div class="alert alert-danger" role="alert" id="error-alert" style="display:none;">
            Si è verificato un errore durante l'aggiunta delle immagini.
        </div>
        <div class="alert alert-info" role="alert" id="info-alert" style="display:none;">
            Nessuna nuova immagine scelta.
        </div>
        <div class="alert alert-secondary" role="alert" id="secondary-alert" style="display:none;">
            Formato file non valido.
        </div>
        <div class="card">
            <div class="card-body">
                <form id="addImageForm" onsubmit="return validateFiles(event)"
                    action="ButtonAddImage" method="post" enctype="multipart/form-data">
                    <div class="list-group gallery">
                        <% if (images != null && !images.isEmpty()) { %>
                        <% if (copertina != null) { %>
                        <div class="form-check copertina">
                            <p class="text-copertina">Immagine di Copertina</p>
                            <img src="<%= request.getContextPath() + "/" + copertina.getNome() %>"
                                 alt="Product Image" class="img-responsive">
                        </div>
                        <% } %>
                        <% for (Immagine immagine : altreImmagini) { %>
                        <div class="form-check">
                            <img src="<%= request.getContextPath() + "/" + immagine.getNome() %>"
                                 alt="Product Image" class="img-responsive">
                        </div>
                        <% } %>
                        <% } else { %>
                        <p>No images found.</p>
                        <% } %>
                    </div>

                    <hr class="featurette-divider">
                    <div class="mb-3">
                        <label for="formFile" class="form-label">Seleziona Immagini</label>
                        <input class="form-control" type="file" id="formFile" name="images" accept="image/*" multiple>
                    </div>
                    <div class="bottoneModal">
                        <button type="submit" class="pulsanteBigAdd">Aggiungi Immagini</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script>
	//Gestisce l'aggiunta di una o più immagini nella modale AddImage.jsp
    $(document).ready(function() {
        $('#addImageForm').on('submit', function(event) {
            event.preventDefault();
            if (validateFiles()) {
                var formData = new FormData(this);
                $.ajax({
                    url: 'ButtonAddImage',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                    	setTimeout(function() {
                            showAlert('success', 'Immagini aggiunte con successo!');
                        }, 100);
                        // Aggiorna solo la galleria di immagini
                        $("#modal-body").load("ButtonModal?Pulsante=Add");
                    },
                    error: function(xhr, status, error) {
                        showAlert('danger', 'Si è verificato un errore: ' + error);
                    }
                });
            }
        });
		//Controlla che i file siano immagini

        function validateFiles() {
            const files = document.getElementById('formFile').files;
            if (files.length === 0) {
                showAlert('info', 'Nessuna nuova immagine scelta');
                return false;
            }
            for (let i = 0; i < files.length; i++) {
                if (!files[i].type.startsWith('image/')) {
                    showAlert('danger', 'Formato file non valido: ' + files[i].name);
                    return false;
                }
            }
            return true;
        }

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
