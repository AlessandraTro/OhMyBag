<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Forgot Password</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
    <link rel="stylesheet" href="css/Login.css">
    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="css/NavBar.css" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<%@ include file="Header.jsp"%>
    <div class="container-all">

        <div class="container-login">
            <form action="ForgotPassControl" method="post" onsubmit="return validate(this)">
                <input type="hidden" name="action" value="pass">

                <div class="login-box">
                    <input type="email" name="email" id="email" class="input-field">
                    <label for="email" class="label">E-mail</label>
                    <i class="bx bx-user icon"></i>
                </div>
                <div class="login-box" style="margin-bottom:14px">
                    <input type="password" name="password" id="pass" class="input-field" required >
                    <label for="pass" class="label">New Password</label>
                    <i class="bx bx-lock-alt icon" id="show-password"></i>
                    <p id="passwordError" class="error" style="color:ffffff"></p>
                </div>
                
                
                <div class="login-box">
                    <input type="password" name="repeat" id="passRepeat" class="input-field" required>
                    <label for="passRepeat" class="label">Repeat new Password</label>
                    <i class="bx bx-lock-alt icon" id="show-password"></i>
                    <p id="passwordValError" class="error" style="color:ffffff"></p>
                </div>
                <%if(request.getAttribute("oldPassword")!=null){ %>
					<div class="login-error">
					    <p style="color:#970000 ">Inserire una password diversa dalla precedente</p>
					</div>
				<%}%>
					
                
                <div class="login-box">
                    <input type="submit" value="Submit" class="input-submit" autocomplete="off">
                </div>
            </form>
        </div>
    </div>
    
    <%@ include file="Footer.jsp"%>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	var passwordCorrect = false;
		var passwordValCorrect = false;

		/* Funzione chiamata al submit che controlla che tutti i campi rispettino le regole di validazione prestabilite */
		function validate(form) {
			console.log("Validating form");
			if (!passwordCorrect) {
				console.log("Password not correct");
				return false;
			}

			if (!passwordValCorrect) {
				console.log("Password validation not correct");
				return false;
			}

			return true;
		}
		
		$("#pass").change(function() {
			console.log("Password changed");
			passwordCorrect = passwordValidator(this);
			if (($('#passRepeat').val().length) > 0)
				passwordValCorrect = passwordRepeat(this, $('#passRepeat')[0]);
		});

		$("#passRepeat").change(function() {
			console.log("Password repeat changed");
			passwordValCorrect = passwordRepeat($('#pass')[0], this);
		});
		
	    // Validità Password
	    function passwordValidator(password) {
			var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\w\d\s:]).{6,}$/;
			if (password.value.match(passw)) {
				$("#pass").css({"border-color":"#00fd00"});
				$("#passwordError").text("");
				return true;
			} else {
				$("#pass").css({"border-color":"red"});
				$("#passwordError").text("La password deve contenere almeno un numero, una lettera minuscola e una maiuscola e deve essere lunga almeno sei caratteri che possono essere lettere, numeri o underscore");
				return false;
			}
		}
	    
	    // Validità Password ripetuta
		function passwordRepeat(password, repeat) {
			if (repeat.value != password.value) {
				$("#passRepeat").css({"border-color":"red"});
				$("#passwordValError").text("Le due password non coincidono!");
				return false;
			} else {
				$("#passRepeat").css({"border-color":"#00fd00"});
				$("#passwordValError").text("");
				return true;
			}
		}
    </script>
    
</body>
</html>
