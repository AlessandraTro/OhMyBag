<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>

<%
Prodotto product = (Prodotto) request.getAttribute("products");
Collection<Immagine> images = (Collection<Immagine>) request.getAttribute("ImageList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prodotto</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
             max-width: 1200px;
            margin: 20px auto;
            display: flex;
        }
        .product-images {
            flex: 1;
            margin-right: 20px;
            max-width: 100%;
        }
        .product-images img {
            width: 100%;
            display: block;
        }
        .product-info {
             flex: 1;
             margin-left: 40px;
        }
        .product-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .product-price {
            font-size: 20px;
            margin-bottom: 70px;
        }
        .add-to-cart {
            background-color: #007bff;
            color: #fff;
            padding: 10px 100px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 10px;
        }
        .description,
        .shipping-returns {
            display: none;
            margin-top: 20px;
        }
        .toggle-button {
            background: none;
            border: none;
            cursor: pointer;
            text-decoration: underline;
            color: #007bff;
            margin-bottom: 10px;
            display: block;
        }
        .description:target,
        .shipping-returns:target {
            display: block;
        }
    </style>
</head>
<body>
    <%@ include file="Header.jsp" %>
    <div class="container">
        <div class="product-images">
            <% 
                // Itera sulle immagini del prodotto
                for (Immagine immagine : images) { 
            %>
                <img src="<%= immagine.getNome() %>" alt="Immagine prodotto">
            <% } %>
        </div>

        <div class="product-info">
            <div class="product-name"><%= product.getNome() %></div>
            <div class="product-price">Prezzo: $<%= product.getPrezzo() %></div>
            <button class="add-to-cart">AGGIUNGI AL CARRELLO</button>
            <a href="#description" class="toggle-button" style="color: black;">Descrizione Prodotto</a>
            <div id="description" class="description">
                <p><%= product.getDescrizione() %></p>
            </div>
            <a href="#shipping-returns" class="toggle-button" style="color: black;">Spedizione e Resi</a>
            <div id="shipping-returns" class="shipping-returns">
                <!-- Informazioni sulla spedizione e resi -->
                <strong>Spedizione Standard</strong>
                <p>Consegna entro 3-4 giorni lavorativi (Gratis)</p>
            
                <strong>Spedizione Premium</strong>
                <p>Consegna entro 1-2 giorni lavorativi (+6,90)</p>
            
                <p>Gli articoli personalizzati sono spediti entro 30 giorni dalla conferma dell'ordine. Per suddetti prodotti non è prevista possibilità di reso, fatta eccezione per quelli non conformi al modello selezionato in fase di personalizzazione.</p>
            
                <strong>Reso facile</strong>
                <p>Forniamo un servizio gratuito di ritiro dei resi o dei cambi: puoi richiederlo entro 14 giorni dalla consegna.</p>
            </div>
        </div>
    </div>
    <%@ include file="Footer.jsp" %>
</body>
</html>
