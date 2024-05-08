<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/Pagamento.css" rel="stylesheet" type="text/css">
<link href="css/NavBar.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="Header.jsp"%>

	<div id="wrapper">
  <div class="container1">
    <div class="order">
      <h2>DETTAGLI ORDINE</h2>
      <div class="item">
        <img src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/1978060/balle.png' alt=''>
        <div class="info">
          <h4>Trixie Soccer Ball, Vinyl</h4>
          <p class="brand">Marca: </p>
          <p class="quantity">Quantità: 1</p>
          <p class="price">1.99€</p>
        </div> <!-- .info -->
      </div> <!-- .item -->
      
     
      
      <h4 class="ship">Spedizione: </h4>
      <hr>
      <h3 class="total">Totale: 60.91€</h3>
    </div> <!-- .order -->
  </div> <!-- .container1 -->
  
  <div class="container2">
    <div class="checkout">
      <p><i class="fas fa-check-circle"></i>Checkout</p>
      
      <div class="payment">
        <div class="content">
         
            <div class="method">
              <h2>Scegliere un metodo di pagamento</h2>
               <input type="radio" id="visa" name="payment_method" value="visa">
    <label for="visa">
        <img src='img/metodiDiPagamento/cc-visa.svg' alt='Visa' class="visa">
    </label>
    <input type ="radio" id="mastercard" name="payment_method" value="mastercard">
    <label for="mastercard">
              <img src='img/metodiDiPagamento/cc-mastercard.svg' alt='' class="mastercard">
              </label> 
              <input type ="radio" id="paypal" name="payment_method" value="paypal">
    <label for="paypal">
              <img src='img/metodiDiPagamento/cc-paypal.svg' alt='' class="paypal"> 
              </label>
            </div> <!-- .method -->
            <div class="cardNumber">
              <p class="title">Numero Carta</p><br>
              <input type="text" class="number" placeholder="1234 5678 9012 3457" >             
            </div> 
            <!-- .cardNumber -->
            <div class="cardHolderName">
              <p class="title">Proprietario Carta</p>
              <input type="text" placeholder="Mario Rossi">
            </div> 
            <!-- cardHolderName -->
            <div class="expiration">
              <p class="title">Data di Scadenza
              <input type="text" placeholder="01/29"></p>
            </div> <!-- .expiration -->
            <div class="security">
              <p class="title">Cvv</p>
              <input type="text" placeholder="&#9679;&#9679;&#9679;">
            </div><!-- .security -->
            <button class="checkoutButton">Checkout</button>
           <!-- .infos -->
        </div> <!-- .content -->
      </div> <!-- .payment -->
    </div> <!-- .checkout -->
  </div> <!-- .container2 -->
</div> <!-- #wrapper -->

	<%@ include file="Footer.jsp"%>
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>