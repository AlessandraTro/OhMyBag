<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<% Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("images");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image View</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style>
.gallery {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
}

.thumbnail {
	display: block;
	padding: 4px;
	margin-bottom: 20px;
}

.img-responsive {
	display: block;
	max-width: 100%;
	height: auto;
}

.list-group gallery {
	display: contents;
}

.form-check {
	margin-bottom: 15px;
}
</style>
<script>
        function confirmDeletion(event) {
            const confirmed = confirm("Sei sicuro di voler eliminare le immagini selezionate?");
             if (!confirmed) {                 event.preventDefault();
            }
       }
     </script>
</head>
<body>
	<div class="container">
		<form action="ButtonDeleteImage" method="post"
			onsubmit="confirmDeletion(event)">
			<div class="list-group gallery">
				<% if (images != null && !images.isEmpty()) { %>
				<% for (Immagine immagine : images) { %>
				<p><%= immagine.getNome()%></p>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" name="imagePath"
						value="<%= immagine.getNome() %>"
						id="image<%= immagine.getNome() %>"> <label
						class="form-check-label" for="image<%= immagine.getNome() %>">
						<img src="<%= immagine.getNome()%>" alt="Image"
						class="img-responsive" style="width: 100px;">
					</label>
				</div>
				<% } %>
				<% } else { %>
				<p>No images found.</p>
				<% } %>
			</div>
			<button type="submit" class="btn btn-danger">Elimina
				Selezionate</button>
		</form>
	</div>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
