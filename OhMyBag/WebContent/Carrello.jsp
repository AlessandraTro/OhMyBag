<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>
<%
float prezzo=0;
HashMap<Prodotto,Integer> prodotti=new HashMap<>();
Collection<Prodotto> product= (Collection<Prodotto>) request.getSession().getAttribute("Carrello");
if(product!=null){
	for (Prodotto prodotto:product){
		if(prodotti.containsKey(prodotto)){
			System.out.println("sono un doppione");
			int quantita=(int)prodotti.get(prodotto);
			prodotti.remove(prodotto);
			prodotti.put(prodotto,quantita+1);
		}else{
			System.out.println("sono singolo");
			prodotti.put(prodotto,1);
		}
	}
}

Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("images");
if(images != null){
    Set<Immagine> uniqueImages = new HashSet<>();
    Iterator<Immagine> iterator = images.iterator();
    while(iterator.hasNext()){
        Immagine immagine = iterator.next();
        if(uniqueImages.contains(immagine)){
            iterator.remove(); // Rimuovi l'immagine duplicata
        } else {
            uniqueImages.add(immagine); // Aggiungi l'immagine al set temporaneo
        }
    }
}
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

							<%if (!prodotti.isEmpty()){%>
							<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Your
								products</h3>
							<%for (Prodotto prodotto : prodotti.keySet()) {
								prezzo=(prodotti.get(prodotto)*prodotto.getPrezzo())+prezzo;%>
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
									<a href="RemoveProductControl?ID=<%=prodotto.getId()%>" class="float-end text-black"><i
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
												name="quantity" value="<%=prodotti.get(prodotto)%>" type="number">
											<button
												onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
												class="plus"></button>
										</div>
									</div>
								</div>
							</div>
							<% } 
							%>

						</div>

						<div class="col-lg-5 px-5 py-4">

							<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">RIEPILOGO</h3>

							<div class="d-flex justify-content-between">
								<p class="mb-2">Subtotale</p>
								<p class="mb-2">€<%=prezzo %></p>
							</div>
							
							<div class="d-flex justify-content-between">
								<%int spedizione=0; %>
								<input id="checkbox_toggle" type="checkbox" class="check">
								<div class="checkbox">
								  <label class="slide" for="checkbox_toggle">
								    <label class="toggle" for="checkbox_toggle"></label>
								    <label class="text" for="checkbox_toggle">Standard</label>
								    <label class="text" for="checkbox_toggle">Premium</label>
								  </label>
								</div>
								
								<p id="spedizione_value" class="mb-2">€<%=spedizione %></p> <!-- Aggiunto id per il valore della spedizione -->
							</div>

							<hr class="mb-4"
								style="height: 2px; background-color: #1266f1; opacity: 1;">

							<div class="d-flex justify-content-between p-2 mb-4"
								style="background-color: #e1f5fe;">
								<h5 class="fw-bold mb-2">Total:</h5>
								<h5 id="prezzo_value"class="fw-bold mb-0"><%=prezzo+spedizione %>€</h5>
							</div>
							<button type="button" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-primary btn-lg mx-auto d-block">Checkout</button>
							<%}else{%>
							<div style="display:flex; flex-direction:column; align-items:center;">
								<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">
									Nessun Prodotto nel carrello</h3>
								<img alt="immagine non trovata" src="img/website/mascotte.JPG" style="width:300px;">
							</div>
							<%} %>
							<div class="card mb-6 mb-lg-0 p-5"
								style="margin-top: 60px; background-color: #dcdcdc;">
								<div class="card-body">
									<div class="text-center" style="margin-top: -50px;">
										<p>
											<strong>METODI DI PAGAMENTO ACCETTATI</strong>
										</p>
									</div>
									<img class="me-2" 
										src="img/metodiDiPagamento/cc-visa.svg" width=45px
										alt="Visa" />
									<img class="me-2" 
										src="img/metodiDiPagamento/cc-mastercard.svg" width=45px
										alt="Mastercard" />
									<img class="me-2"
										src="img/metodiDiPagamento/cc-paypal.svg" width=45px
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
	    <!-- Aggiungi lo script JavaScript per invalidare la sessione quando la finestra del browser viene chiusa -->
	<script type="text/javascript">
	    var prezzo = <%= prezzo %>;
	    
	    document.addEventListener('DOMContentLoaded', function() {
	        var checkbox = document.getElementById('checkbox_toggle');
	        var spedizioneParagraph = document.getElementById('spedizione_value');
	        var prezzoValue = document.getElementById('prezzo_value');
	        
	        // Funzione per calcolare il totale
	        function calcolaTotale() {
	            var spedizione = 0;
	            var totale = prezzo; // Utilizza il valore di prezzo definito sopra
	            
	            if (checkbox.checked) {
	                spedizione = 10;
	                totale += spedizione;
	            }
	            
	            // Aggiorna il valore della spedizione nel paragrafo
	            spedizioneParagraph.innerText = '€' + spedizione;
	            // Aggiorna il valore del prezzo totale nel paragrafo
	            prezzoValue.innerText = '€' + totale;
	        }
	        
	        // Aggiungi un ascoltatore per l'evento change dello switch
	        checkbox.addEventListener('change', function() {
	            // Richiama la funzione per calcolare il totale
	            calcolaTotale();
	        });
	        
	        // Chiama la funzione per calcolare il totale all'avvio della pagina
	        calcolaTotale();
	    });
	</script>
</body>
</html>
