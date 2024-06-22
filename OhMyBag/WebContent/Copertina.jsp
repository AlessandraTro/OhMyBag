<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>


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

</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<form id="setCoverForm" action="ButtonSetCover" method="post">
					<div class="list-group gallery">
						<%
						if (copertina != null) {
						%>
						<div class="form-check changeCover">
							<div class="CoverImg">
								<p class="text-copertina">Immagine di Copertina</p>
								<img src="<%=copertina.getNome()%>" alt="Image"
									class="img-responsive thumbnail">
							</div>
						</div>
						<%
						}
						%>
						<%
						if (!altreImmagini.isEmpty()) {
						%>
						<%
						for (Immagine immagine : altreImmagini) {
						%>
						<div class="form-check changeCover">
							<img src="<%=immagine.getNome()%>" alt="Image"
								class="img-responsive thumbnail"> <input type="radio"
								name="coverImage" value="<%=immagine.getNome()%>">
						</div>
						<%
						}
						%>
						<%
						} else {
						%>
						<p>No images found.</p>
						<%
						}
						%>
					</div>
					<div class="bottoneModal">
						<button type="submit" class="pulsanteBigCover">Set Cover
							Image</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('#setCoverForm')
									.on(
											'submit',
											function(event) {
												if ($('input[name="coverImage"]:checked').length === 0) {
													alert('Seleziona una nuova immagine di copertina oppure chiudi la finestra');
													return false;
												}

												event.preventDefault();
												$
														.ajax({
															url : 'ButtonSetCover',
															type : 'POST',
															data : $(this)
																	.serialize(),
															success : function(
																	response) {
																alert('Immagine di copertina impostata con successo');
																// Aggiorna solo la galleria di immagini
																$("#modal-body")
																		.load(
																				"ButtonModal?Pulsante=Copertina");
															},
															error : function(
																	xhr,
																	status,
																	error) {
																alert('Si è verificato un errore: '
																		+ error);
															}
														});
											});
						});
	</script>
</body>
</html>
