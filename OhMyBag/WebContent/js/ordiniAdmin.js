/**
 * ordiniAdmin.js
 */

function submitForm() {
	var username = document.getElementById('username').value;
	var startDate = document.getElementById('startDate').value;
	var endDate = document.getElementById('endDate').value;

	if (username.trim() === '' && startDate.trim() === ''
		&& endDate.trim() === '') {
		alert('Nessun filtro selezionato');
	} else {
		// Memorizza i valori nel localStorage
		localStorage.setItem('username', username);
		localStorage.setItem('startDate', startDate);
		localStorage.setItem('endDate', endDate);

		document.getElementById('filterForm').submit();
	}
}

//resetta i filtri
function resetFilters() {
	document.getElementById('username').value = '';
	document.getElementById('startDate').value = '';
	document.getElementById('endDate').value = '';

	// Memorizza i valori vuoti nel localStorage
	localStorage.setItem('username', '');
	localStorage.setItem('startDate', '');
	localStorage.setItem('endDate', '');

	document.getElementById('filterForm').submit();
}

// Codice per ripristinare i valori dopo il caricamento della pagina
window.onload = function() {
	var username = localStorage.getItem('username');
	var startDate = localStorage.getItem('startDate');
	var endDate = localStorage.getItem('endDate');

	if (username)
		document.getElementById('username').value = username;
	if (startDate)
		document.getElementById('startDate').value = startDate;
	if (endDate)
		document.getElementById('endDate').value = endDate;

	// Pulisce il localStorage dopo aver ripristinato i valori
	localStorage.clear();
}