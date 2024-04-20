<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
	
		<script>
		/*script per il botton top*/
		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				document.getElementById("myBtn").style.display = "block";
			} else {
				document.getElementById("myBtn").style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>

	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>