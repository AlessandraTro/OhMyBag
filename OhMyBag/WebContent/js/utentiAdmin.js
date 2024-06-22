/**
 * utentiAdmin.js
 */

// Funzione per gestire l'input di ricerca e applicare il filtro
function filterUsers() {
	var input, filter, table, tr, td, i, txtValue;
	input = document.getElementById("usernameSearch");
	filter = input.value.toUpperCase(); // Ottiene il valore di ricerca e lo converte in maiuscolo
	table = document.getElementById("utentiTableBody");
	tr = table.getElementsByTagName("tr");

	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[2]; // Indice 2 per la colonna Username
		if (td) {
			txtValue = td.textContent || td.innerText;
			if (startsWithCaseInsensitive(txtValue, filter)) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}

// Funzione per controllare se una stringa inizia con un'altra stringa (case insensitive)
function startsWithCaseInsensitive(str, prefix) {
	return str.toUpperCase().startsWith(prefix);
}

// Gestisce l'evento di input per la ricerca
document.getElementById("usernameSearch").addEventListener("input", function() {
	filterUsers();
});

// Gestione del form per l'invio
function submitForm() {
	var usernameSearch = document.getElementById('usernameSearch').value.trim();
	localStorage.setItem('usernameSearch', usernameSearch);
	document.getElementById('filterForm').submit();
}

// Resetta i filtri di ricerca
function resetFilters() {
	document.getElementById('usernameSearch').value = '';
	localStorage.removeItem('usernameSearch');
	document.getElementById('filterForm').submit();
}

// Ripristina il valore della ricerca dopo il caricamento della pagina
window.onload = function() {
	var usernameSearch = localStorage.getItem('usernameSearch');
	if (usernameSearch) {
		document.getElementById('usernameSearch').value = usernameSearch;
		filterUsers(); // Applica il filtro alla tabella all'avvio
	}
	localStorage.removeItem('usernameSearch');
}