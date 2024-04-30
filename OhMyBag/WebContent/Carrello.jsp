<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>
<%
Collection <Prodotto> product= (Collection<Prodotto>) request.getSession().getAttribute("Carrello");
Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("images");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/Carrello.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%@ include file="Header.jsp"%>

	<div class="container-fluid">

		<div class="container-fluid no-padding">

			<div class="col-12">

				<div class="card-body p-4">

					<div class="row no-gutters">


						<div class="col-lg-7 " id="mySection">

							<%if (product!=null) {%>
							<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Your
								products</h3>
							<% for (Prodotto prodotto : product) {%>
							<div class="d-flex align-items-center mb-5">
								<div class="flex-shrink-0">
									<% for (Immagine immagine : images) {
                                        if (immagine != null && prodotto.getId().equals(immagine.getIdProdotto())&& immagine.isCopertina()) {
                                    %>
									<img src="<%= immagine.getNome() %>" class="img-fluid"
										style="width: 150px;" alt="Generic placeholder image">
									<% } 
                                        } %>
								</div>

								<div class="flex-grow-1 ms-3">
									<a href="#!" class="float-end text-black"><i
										class="fas fa-times"></i></a>
									<h5 class="text-primary"><%= prodotto.getNome()%></h5>
									<h6 style="color: #9e9e9e;"><%= prodotto.getMarca()%></h6>
									<div class="d-flex align-items-center">
										<p class="fw-bold mb-0 me-5 pe-3"><%=prodotto.getPrezzo()+"€"%></p>
										<div class="def-number-input number-input safari_only">
											<button
												onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
												class="minus"></button>
											<input class="quantity fw-bold text-black" min="0"
												name="quantity" value="1" type="number">
											<button
												onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
												class="plus"></button>
										</div>


									</div>
								</div>

							</div>
							<% } 
							}else{
							%><h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">
								Nessun Prodotto nel carrello</h3>
							<%} %>

						</div>

						<div class="col-lg-5 px-5 py-4">

							<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">RIEPILOGO</h3>

							<div class="d-flex justify-content-between">
								<p class="mb-2">Subtotale</p>
								<p class="mb-2">$4798.00</p>
							</div>

							<div class="d-flex justify-content-between">
								<p class="mb-2">Spedizione</p>
								<p class="mb-2">$20.00</p>
							</div>

							<hr class="mb-4"
								style="height: 2px; background-color: #1266f1; opacity: 1;">

							<div class="d-flex justify-content-between p-2 mb-4"
								style="background-color: #e1f5fe;">
								<h5 class="fw-bold mb-2">Total:</h5>
								<h5 class="fw-bold mb-0">2261$</h5>
							</div>
							<button type="button" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-primary btn-lg mx-auto d-block">Checkout</button>

							<div class="card mb-6 mb-lg-0 p-5"
								style="margin-top: 60px; background-color: #dcdcdc;">
								<div class="card-body">
									<div class="text-center" style="margin-top: -50px;">
										<p>
											<strong>METODI DI PAGAMENTO ACCETTATI</strong>
										</p>
									</div>
									<img class="me-2" width="35px"
										src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
										alt="Visa" /> <img class="me-2" width="45px"
										src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
										alt="American Express" /> <img class="me-2" width="45px"
										src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
										alt="Mastercard" /> <img class="me-2" width="45px"
										src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.svg"
										alt="PayPal acceptance mark" />
								</div>

								<div class="d-flex justify-content-center">
									<div class="text-center">
										<p class="fw-bold mb-2">SPEDIZIONE</p>
									</div>
								</div>

								<div class="text-center">
									<p class="fw-bold mb-3">Consegna entro 3-4 giorni
										lavorativi</p>
								</div>
								<div class="d-flex justify-content-center">
									<div class="text-center">
										<p class="fw-bold mb-2">RESO GRATUITO</p>
									</div>
								</div>
								<div class="text-center">
									<p class="fw-bold mb-0">Garanzia di reso entro 14 giorni
										dalla consegna</p>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="text-center">
		<h5 class="fw-bold mb-5">
			<a href="CatalogoControl"><i class="fas fa-angle-left me-2"></i>Back
				to shopping</a>
		</h5>
	</div>

	<%@ include file="Footer.jsp"%>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>

