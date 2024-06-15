<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("productImages");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiungi Immagini</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="css/Modal.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div class="container">
        <form id="addImageForm" onsubmit="return validateFiles(event)" action="ButtonAddImage" method="post" enctype="multipart/form-data">
            <div class="list-group gallery">
                <% if (images != null && !images.isEmpty()) { %>
                    <% for (Immagine immagine : images) { %>
                        <div class="form-check">
                            <img src="<%= request.getContextPath() + "/" + immagine.getNome() %>" alt="Product Image" class="img-responsive">
                        </div>
                    <% } %>
                <% } else { %>
                    <p>No images found.</p>
                <% } %>
            </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">Seleziona Immagini</label>
                <input class="form-control" type="file" id="formFile" name="images" accept="image/*" multiple>
            </div>
            <button type="submit" class="btn btn-primary">Aggiungi Immagini</button>
        </form>
    </div>
    <script src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script>
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
                            alert('Immagini aggiunte con successo');
                            // Aggiorna solo la galleria di immagini
                            $("#modal-body").load("ButtonModal?Pulsante=Add");
                        },
                        error: function(xhr, status, error) {
                            alert('Si è verificato un errore: ' + error);
                        }
                    });
                }
            });

            function validateFiles() {
                const files = document.getElementById('formFile').files;
                if (files.length === 0) {
                    alert('Nessuna nuova immagine scelta');
                    return false;
                }
                for (let i = 0; i < files.length; i++) {
                    if (!files[i].type.startsWith('image/')) {
                        alert('Formato file non valido: ' + files[i].name);
                        return false;
                    }
                    
                }
                
                return true;
            }
        });
    </script>
</body>
</html>





