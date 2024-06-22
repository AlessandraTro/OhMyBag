<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,java.time.*,java.time.format.DateTimeFormatter,it.ohmybag.model.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>

<%
Collection<Immagine> img = (Collection<Immagine>) request.getSession().getAttribute("productImages");
Immagine copertina = null;
List<Immagine> altreImmagini = new ArrayList<>();
if (img != null && !img.isEmpty()) {
	for (Immagine immagine : img) {
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
<title>Elimina Immagini</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/Modal.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<form id="deleteForm" action="ButtonDeleteImage" method="post">
					<div class="list-group gallery">
						<%
						if (copertina != null) {
						%>
						<div class="form-check copertina">
							<p class="text-copertina">Immagine di Copertina</p>
							<img src="<%=copertina.getNome()%>" alt="Image"
								class="img-responsive thumbnail">
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
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="imagePath"
								value="<%=immagine.getNome()%>"
								id="image<%=immagine.getNome()%>"> <label
								class="form-check-label" for="image<%=immagine.getNome()%>">
								<img src="<%=immagine.getNome()%>" alt="Image"
								class="img-responsive thumbnail">
							</label>
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
						<button type="submit" class="pulsanteBigElimina">
							<i class="fas fa-trash-alt"></i> Elimina Selezionate
						</button>
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
							$('#deleteForm')
									.on('submit',
											function(event) {
												event.preventDefault();

												// Verifica se almeno una checkbox è stata selezionata
												var checkboxesChecked = $("input[name='imagePath']:checked").length;
												if (checkboxesChecked === 0) {
													alert("Nessuna immagine selezionata");
													return; // Esce dalla funzione senza proseguire
												}

												if (confirm("Sei sicuro di voler eliminare le immagini selezionate?")) {
													$
															.ajax({
																url : 'ButtonDeleteImage',
																type : 'POST',
																data : $(this)
																		.serialize(),
																success : function(
																		response) {
																	alert('Immagini eliminate con successo');
																	// Ricarica il contenuto del modale
																	$(
																			"#modal-body")
																			.load(
																					"ButtonModal?Pulsante=Delete");
																},
																error : function(
																		xhr,
																		status,
																		error) {
																	alert('Si è verificato un errore: '
																			+ error);
																}
															});
												}
											});
						});
	</script>
</body>
</html>

