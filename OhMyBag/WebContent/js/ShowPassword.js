function togglePasswordVisibility(id) {
	var passwordField = document.getElementById(id);
	var passwordFieldType = passwordField.getAttribute("type");
	if (passwordFieldType === "password") {
		passwordField.setAttribute("type", "text");
	} else {
		passwordField.setAttribute("type", "password");
	}
}