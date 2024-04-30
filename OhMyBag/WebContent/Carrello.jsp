<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.SQLException,java.util.*,it.ohmybag.bean.Prodotto,it.ohmybag.model.ProdottoModel,it.ohmybag.bean.Utente,it.ohmybag.bean.Immagine,it.ohmybag.model.ImmagineModel"%>
<%
Collection<Prodotto> product = (Collection<Prodotto>) request.getSession().getAttribute("Carrello");
Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("images");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
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

                            <h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">I tuoi prodotti</h3>
                            <% if (product != null && !product.isEmpty()) { %>
                                <% for (Prodotto prodotto : product) { %>
                                    <div class="d-flex align-items-center mb-5">
                                        <div class="flex-shrink-0">
                                            <% for (Immagine immagine : images) {
                                                if (prodotto.getId().equals(immagine.getIdProdotto())) { %>
                                                    <img src="<%= immagine.getNome() %>" class="img-fluid" style="width: 150px;" alt="Immagine prodotto">
                                            <% } %>
                                            <% } %>
                                        </div>
                                        <div class="flex-grow-1 ms-3">
                                            <a href="#!" class="float-end text-black"><i class="fas fa-times"></i></a>
                                            <h5 class="text-primary"><%= prodotto.getNome() %></h5>
                                            <h6 style="color: #9e9e9e;"><%= prodotto.getMarca() %></h6>
                                            <div class="d-flex align-items-center">
                                                <p class="fw-bold mb-0 me-5 pe-3"><%= prodotto.getPrezzo() + "€" %></p>
                                                <div class="def-number-input number-input safari_only">
                                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                                                    <input class="quantity fw-bold text-black" min="0" name="quantity" value="1" type="number">
                                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <% } %>
                            <% } else { %>
                                <p>Nessun prodotto nel carrello</p>
                            <% } %>
                        </div>
                        <div class="col-lg-5 px-5 py-4">

                            <h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">RIEPILOGO</h3>

                            <!-- Aggiungi qui il codice per il riepilogo -->

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="text-center">
        <h5 class="fw-bold mb-5">
            <a href="CatalogoControl"><i class="fas fa-angle-left me-2"></i>Torna allo shopping</a>
        </h5>
    </div>

    <%@ include file="Footer.jsp"%>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
