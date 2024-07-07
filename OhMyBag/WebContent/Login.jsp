<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'> <!-- Collegamento ai file CSS esterni per le icone, Bootstrap e stili personalizzati -->
    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="css/Login.css">
	<link href="css/NavBar.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<%@ include file="Header.jsp"%>
    <div class="container-all">
    	
    	<!-- Sezione di benvenuto con testo descrittivo -->
        <div class="container-text">
            <h1>Benvenuti nella pagina di login</h1>
            <p>Sei alla ricerca dell'accessorio perfetto che ti faccia sentire sicuro e alla moda in ogni occasione? <br>
            Presso OhMyBag, abbiamo esattamente ciò di cui hai bisogno!<br> 
            Guarda le nostre meravigliose collezioni e trova ciò che fa per te. <br>
            Qui da noi, su OhMyBag, trasformiamo i tuoi desideri in realtà. <br>
            Non aspettare oltre, fai tuo quel pezzo di stile che ti distinguerà dalla massa.<br>
            Entra nel mondo di OhMyBag e vivi la tua moda con stile!</p>
        </div>
        
        <!-- Sezione di login -->
        <div class="container-login">
        	<!-- Form per il login -->
            <form action="LoginControl" method="post">
                <input type="hidden" name="action" value="login">
                
                <!-- Messaggio di successo per il cambio password -->
                <%if(request.getSession().getAttribute("newPassword") != null){ %>
					<div class="new-password">
						<h5 style="color:#60ff60; padding-bottom:30px;">Password aggiornata con successo</h5>
					</div>
				<%request.getSession().removeAttribute("newPassword");
				}else if(request.getSession().getAttribute("errorEmail")!= null){ %>
					<div class="new-password">
						<h5 style="color:red; padding-bottom:30px;">Email inserita non esistente perfavore registrati</h5>
					</div>
				<%request.getSession().removeAttribute("errorEmail");
				} %>
				
				<!-- Input per l'email -->
                <div class="login-box">
                    <input type="email" name="email" id="email" class="input-field">
                    <label for="email" class="label">E-mail</label>
                    <i class="bx bx-user icon"></i>
                </div>
                
                <!-- Input per la password -->
                <div class="login-box">
                    <input type="password" name="password" id="pass" class="input-field" required>
                    <label for="pass" class="label">Password</label>
                    <i class="fas fa-eye-slash toggle-password icon" onclick="togglePasswordVisibility('pass', this)" id="show-password"></i>
                </div>
                
                <!-- Messaggio di errore per login fallito -->
                <% if (request.getAttribute("loginError") != null) { %>
					<div class="login-error">
					    <p style="color:#970000 ">E-mail o password errata</p>
					</div>
				<% }%>
                
                <!-- Link per il recupero della password -->
                <div class="forgot">
                    <a href="ForgotPassControl">Forgot password</a>
                </div>
                <!-- Bottone per inviare il form -->
                <div class="login-box">
                    <input type="submit" value="Submit" class="input-submit" autocomplete="off">
                </div>
                <!-- Link per la registrazione -->
                <div class="register">
                    <span>Don't have an account?
                    <a href="ButtonRegistrazioneControl">Register</a></span>
                </div>
            </form>
        </div>
    </div>
    
    <%@ include file="Footer.jsp"%>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/ShowPassword.js"></script>
</body>
</html>
