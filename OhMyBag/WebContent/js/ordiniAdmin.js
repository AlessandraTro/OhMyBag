/**
 * ordiniAdmin.js
 */

// Funzione per gestire l'invio del form di filtraggio
function submitForm() {
	var username = document.getElementById('username').value;
	var startDate = document.getElementById('startDate').value;
	var endDate = document.getElementById('endDate').value;

    // Controlla se tutti i campi sono vuoti
	if (username.trim() === '' && startDate.trim() === ''
		&& endDate.trim() === '') {
		alert('Nessun filtro selezionato');
	} else {
		// Memorizza i valori nel localStorage per ripristinarli dopo
		localStorage.setItem('username', username);
		localStorage.setItem('startDate', startDate);
		localStorage.setItem('endDate', endDate);
	
		// Invia il form
		document.getElementById('filterForm').submit();
	}
}

//resetta i filtri
function resetFilters() {
	// Resetta i valori nei campi input
	document.getElementById('username').value = '';
	document.getElementById('startDate').value = '';
	document.getElementById('endDate').value = '';

	// Memorizza i valori vuoti nel localStorage
	localStorage.setItem('username', '');
	localStorage.setItem('startDate', '');
	localStorage.setItem('endDate', '');
	
    // Invia il form per applicare i filtri vuoti
	document.getElementById('filterForm').submit();
}

// Codice per ripristinare i valori dopo il caricamento della pagina
window.onload = function() {
	var username = localStorage.getItem('username');
	var startDate = localStorage.getItem('startDate');
	var endDate = localStorage.getItem('endDate');

    // Ripristina i valori nei campi input se presenti nel localStorage
	if (username)
		document.getElementById('username').value = username;
	if (startDate)
		document.getElementById('startDate').value = startDate;
	if (endDate)
		document.getElementById('endDate').value = endDate;

    // Pulisce il localStorage dopo aver ripristinato i valori per evitare duplicati
	localStorage.clear();
}

// Evento che si attiva quando il documento HTML è completamente caricato
document.addEventListener('DOMContentLoaded', function () {
	    // Seleziona tutti i link con classe 'details-link'
    var detailsLinks = document.querySelectorAll('.details-link');
    
    detailsLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            var orderId = event.target.getAttribute('data-order-id');
            
            // Fa una chiamata AJAX per ottenere i dettagli dell'ordine
            fetch('DettagliOrdiniAdmin?Fattura=No&Codice=' + orderId, {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }
            })
            .then(response => response.text())
            .then(html => {
                // Aggiorna il corpo della modale con i dettagli ricevuti
                document.querySelector('#ordiniModal .modal-body').innerHTML = html;
                
                // Mostra la modale
                $('#ordiniModal').modal('show');
            });
        });
    });
});