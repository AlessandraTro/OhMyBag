<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException, java.util.*, it.ohmybag.bean.*, it.ohmybag.model.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Catalogo</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="css/Catalogo.css" rel="stylesheet" type="text/css">
	<link href="css/NavBar.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		Utente user = (Utente) request.getSession().getAttribute("utente");
		if (user != null && user.isAdmin()) {
	%>
	<jsp:include page="HeaderAdmin.jsp" />
	<%
		} else {
	%>
	<jsp:include page="Header.jsp" />
	<%
		}
	%>
	
	<!-- Immagini carousel -->
    <div id="carouselCatalogo" class="carousel slide w-100 mx-auto" data-bs-ride="carousel">
        <div class="carousel-inner justify-content-center">
            <!-- Prima immagine -->
            <div class="carousel-item active">
                <img src="img/website/Carousel/dior.jpg" class="responsive mx-auto d-block" alt="...">
            </div>
            <!-- Seconda immagine -->
            <div class="carousel-item">
                <img src="img/website/Carousel/louisVuitton.jpg" class="responsive mx-auto d-block" alt="...">
            </div>
            <!-- Terza immagine -->
            <div class="carousel-item">
                <img src="img/website/Carousel/versace.jpg" class="responsive mx-auto d-block" alt="...">
            </div>
        </div>
    </div>

	<main>
    <div id="dynamic-content">
        <jsp:include page="ProdottiCatalogo.jsp" />
    </div>
</main>


<%@ include file="Footer.jsp"%>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
