<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<link href="css/Contattaci.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Contattaci</title>
</head>
<body>
	<jsp:include page="Header.jsp" />
	
	<main class="container">
		<div class="contenuto">
			<div class="mappa">
				<h2>Località sede</h2>
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1270.3529693944167!2d14.789510508819706!3d40.774657100271845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc5933f99d905%3A0xcabb7f7112897e3e!2sEdificio%20F3!5e0!3m2!1sit!2sit!4v1719851603103!5m2!1sit!2sit" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
			<div class="form">
				<h2>Invia una email</h2>
				<form action="#" method="POST">
					<div class="content">
						<label for="email">Email</label>
						<input name="email" type="email" class="input-field">
					</div>
					<div class="content richiesta">
						<label for="richiesta">Richiesta</label>
						<textarea name="richiesta" rows="3" class="textarea-field"></textarea>
					</div>
					<div class="button">
						<button><a href="mailto:ohmybag2024@gmail.com">Invia email</a></button>
						<input type="reset" value="Reset">
					</div>
				</form>
			</div>
		</div>
	</main>
	
	<jsp:include page="Footer.jsp"/>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>