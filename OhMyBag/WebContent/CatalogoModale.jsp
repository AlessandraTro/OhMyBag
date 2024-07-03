<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.math.BigDecimal,java.util.*,it.ohmybag.bean.*,it.ohmybag.model.*"%>
<%
BigDecimal prezzo = BigDecimal.ZERO;
Carrello prodotti = (Carrello) request.getSession().getAttribute("Carrello");

//Stampa dei prodotti e delle quantità nel terminale
if (prodotti != null && !prodotti.getProdotti().isEmpty()) {
 System.out.println("Prodotti nel carrello:");
 for (Prodotto p : prodotti.getProdotti().keySet()) {
     System.out.println("Nome prodotto Carrello: " + p.getNome() + ", Quantità: " + prodotti.getProdotti().get(p));
 }
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrello</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/CatalogoModale.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">


</head>
<body>
	<div class="modal-body" id="cartModalContent">
		<div class="custom-col2">
			<%
			if (prodotti != null && !prodotti.getProdotti().isEmpty()) {
			%>
			<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">I TUOI
				PRODOTTI</h3>

			<div class="product-list-container">
				<%
				for (Prodotto prodotto : prodotti.getProdotti().keySet()) {
					BigDecimal quantita = new BigDecimal(prodotti.getProdotti().get(prodotto));
					BigDecimal prezzoProdotto = new BigDecimal(prodotto.getPrezzo());
					prezzo = prezzo.add(quantita.multiply(prezzoProdotto));
				%>
				<div class="cust-card" data-prodotto-id="<%=prodotto.getId()%>">
					<div class="cust-col">
						<%
						for (Immagine immagine : prodotti.getImmagini()) {
							if (immagine != null && prodotto.getId().equals(immagine.getIdProdotto()) && immagine.isCopertina()) {
						%>
						<a href="DettagliControl?ID=<%=prodotto.getId()%>"><img
							src="<%=immagine.getNome()%>" class="custom-card2"
							alt="Product Image"></a>
						<%
						}
						}
						%>
					</div>
					<div class="custom-col2">
						<div class="card-body2">
							<a href="#" data-id="<%=prodotto.getId()%>"
								class="float-end text-black"><i class="fas fa-times"></i></a> <a
								href="DettagliControl?ID=<%=prodotto.getId()%>"><h5
									class="custom-card-title"><%=prodotto.getNome()%></h5></a>
							<h6 class="card-text2"><%=prodotto.getMarca()%></h6>
							<div class="text-and-input">
								<p class="prezzo"><%=String.format("%.2f", prodotto.getPrezzo())%>
									€
								</p>
								<div class="def-number-input number-input safari_only">
									<div class="input-group">
										<span class="input-group-btn"> <a href="#"
											class="btn btn-outline-secondary minus"
											data-id="<%=prodotto.getId()%>">-</a>
										</span> <input class="form-control2 quantity fw-bold text-black"
											name="quantity"
											value="<%=prodotti.getProdotti().get(prodotto)%>" type="text"
											readonly> <span class="input-group-btn"> <a
											href="#" class="btn btn-outline-secondary plus"
											data-id="<%=prodotto.getId()%>">+</a>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr class="hr hr-blurry" />
				<%
				}
				%>
			</div>
			<%
			} else {
			%>
			<div class="custom-col2">
			<p class="text-center">Il carrello è vuoto.</p>
			</div>
			<%
			}
			%>
			
			<div class="prezzoPosition">
					<p class="mb-2-to" >Totale:</p>
					<p class="mb-2"><%=prezzo.setScale(2, BigDecimal.ROUND_HALF_UP) + " €"%>
					</p>
				</div>
			<!-- Pulsanti per la pagina del carrello e per il pagamento -->
			<div class="bottoni-custom">
				
				<a href="ButtonCarrelloControl" class="pulsanti">Vai al carrello</a>
				<a href="CheckoutControl" class="pulsanti">Procedi
					al pagamento</a>
			</div>
		</div>
	</div>

	<!-- <script src="js/jquery-3.7.1.min.js"></script> 
<!-- 	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script> -->
	<script>
		$(document).ready(function() {

			$('.minus').on('click', function(e) {
				e.preventDefault();
				var idProdotto = $(this).data('id');
				$.ajax({
					url : 'RemoveProductControl',
					type : 'GET',
					data : {
						ID : idProdotto
					},
					success : function(response) {
						$('#cartModalContent').html(response);
					}
				});
			});

			$('.plus').on('click', function(e) {
				e.preventDefault();
				var idProdotto = $(this).data('id');
				$.ajax({
					url : 'CartControl',
					type : 'GET',
					data : {
						ID : idProdotto
					},
					success : function(response) {
						$('#cartModalContent').html(response);
					}
				});
			});

			$('.float-end').on('click', function(e) {
				e.preventDefault();
				var idProdotto = $(this).data('id');
				$.ajax({
					url : 'RemoveAllProductControl',
					type : 'GET',
					data : {
						ID : idProdotto
					},
					success : function(response) {
						$('#cartModalContent').html(response);
					}
				});
			});
		});
	</script>
</body>
</html>
