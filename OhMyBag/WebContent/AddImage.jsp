<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("images");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiungi Immagini</title>
</head>
<body>
    <div class="container">
        <form onsubmit="return validateFiles(event)" action="ButtonAddImage" method="post" enctype="multipart/form-data">
        <div class="list-group gallery">
            <% if (images != null && !images.isEmpty()) { %>
                <% for (Immagine immagine : images) { %>
                    <div class="form-check">
                                <img src="<%= request.getContextPath() + "/" + immagine.getNome() %>" alt="Product Image" class="img-responsive" style="width: 100px;">
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
    
    <script>
        function validateFiles(event) {
            const files = document.getElementById('formFile').files;
            for (let i = 0; i < files.length; i++) {
                if (!files[i].type.startsWith('image/')) {
                    alert('Formato file non valido: ' + files[i].name);
                    event.preventDefault();
                    return false;
                }
            }
            return true;
        }
    </script>
    
</body>

</html>





