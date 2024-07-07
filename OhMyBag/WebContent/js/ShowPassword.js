
// Funzione per cambiare la visibilità della password
function togglePasswordVisibility(id) {
	var passwordField = document.getElementById(id);     // Ottiene il campo password dal documento HTML utilizzando l'id fornito
	var passwordFieldType = passwordField.getAttribute("type");     // Ottiene il tipo attuale del campo password (può essere "password" o "text")
	
	// Verifica il tipo attuale del campo password
	if (passwordFieldType === "password") {
		passwordField.setAttribute("type", "text");  // Se il tipo attuale è "password", lo cambia a "text" per mostrare il testo della password
	} else {
		passwordField.setAttribute("type", "password");  // Altrimenti, se il tipo attuale non è "password" (quindi è "text"), lo reimposta a "password"
	}
}