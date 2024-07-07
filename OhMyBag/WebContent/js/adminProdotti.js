/**
 * adminProdotti
 */

// Funzione per filtrare i prodotti nella tabella in base all'input di ricerca
    function filterUsers() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("prodottoSearch");
        filter = input.value.toUpperCase();
        table = document.getElementsByTagName("table")[0]; // Seleziona la prima tabella (presumibilmente l'unica)
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2]; // Indice 2 per la colonna del nome del prodotto
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
    
// Gestisce l'evento di input per attivare il filtro dei prodotti
    document.getElementById("prodottoSearch").addEventListener("input", function() {
        filterUsers();
    });

    
 // Funzione per controllare se una stringa inizia con un'altra stringa (case insensitive)
    function startsWithCaseInsensitive(str, prefix) {
    	return str.toUpperCase().startsWith(prefix);
    }

    // Gestisce l'evento di input per la ricerca
    document.getElementById("prodottoSearch").addEventListener("input", function() {
    	filterUsers();
    });

    // Gestione del form per l'invio
    function submitForm() {
    	var usernameSearch = document.getElementById('prodottoSearch').value.trim();
    	localStorage.setItem('prodottoSearch', usernameSearch); // Memorizza la ricerca nel localStorage
    	document.getElementById('filterForm').submit(); // Invia il form
    }
    
    // Resetta il filtro e invia il form
    function resetFilters() {
    	document.getElementById('prodottoSearch').value = '';
    	localStorage.removeItem('prodottoSearch'); // Rimuove la ricerca dal localStorage
    	document.getElementById('filterForm').submit(); // Invia il form
    }
    
    // Codice da eseguire quando la finestra è completamente caricata
    window.onload = function() {
    	var usernameSearch = localStorage.getItem('prodottoSearch');
    	if (usernameSearch) {
    		document.getElementById('prodottoSearch').value = usernameSearch;
    		filterUsers(); // Applica il filtro alla tabella all'avvio
    	}
    	localStorage.removeItem('prodottoSearch'); // Rimuove la ricerca dal localStorage dopo l'uso
    }
    
    // Funzione per eliminare un prodotto tramite ID
    function deleteProduct(productId) {
         // Apri la modale
         $('#confirmModalMessage').text("Sei sicuro di voler eliminare questo prodotto?");
         $('#confirmModal').modal('show');

         // Quando viene cliccato il pulsante di conferma
         $('#confirmActionBtn').off('click').on('click', function() {
             var xhr = new XMLHttpRequest();
             xhr.open('POST', 'AdminControl', true);
             xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
             xhr.onreadystatechange = function () {
                 if (xhr.readyState == 4 && xhr.status == 200) {
                     location.reload(); // Ricarica la pagina dopo il ripristino
                 }
             };
             xhr.send('pulsante=Delete&ID=' + productId); // Invia la richiesta con l'ID del prodotto da eliminare
             
         });
         
         // Gestione dell'azione di annullamento nella modale di conferma
         $('#confirmModal .btn-secondary').off('click').on('click', function() {
             $('#confirmModal').modal('hide'); // Chiudi la modale di conferma
         });
     }