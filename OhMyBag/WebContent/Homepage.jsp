<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/catalogo.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>OhMyBag</title>
</head>
<body>

	<!-- include dell'Header -->
	<jsp:include page="Header.jsp" />

	<!--<p>Home del sito OhMyBag</p>-->
	
	<!-- include del catalogo -->
	<jsp:include page= "Catalogo.jsp"/>

	<!-- include del footer -->
	<jsp:include page="Footer.jsp" />
	

	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>