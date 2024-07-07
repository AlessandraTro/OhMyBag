/**
 * adminProdotti
 */

 // Funzione per gestire l'input di ricerca e applicare il filtro
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
    	localStorage.setItem('prodottoSearch', usernameSearch);
    	document.getElementById('filterForm').submit();
    }
    
    function resetFilters() {
    	document.getElementById('prodottoSearch').value = '';
    	localStorage.removeItem('prodottoSearch');
    	document.getElementById('filterForm').submit();
    }
    
    window.onload = function() {
    	var usernameSearch = localStorage.getItem('prodottoSearch');
    	if (usernameSearch) {
    		document.getElementById('prodottoSearch').value = usernameSearch;
    		filterUsers(); // Applica il filtro alla tabella all'avvio
    	}
    	localStorage.removeItem('prodottoSearch');
    }
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
             xhr.send('pulsante=Delete&ID=' + productId);
             
         });
         $('#confirmModal .btn-secondary').off('click').on('click', function() {
             $('#confirmModal').modal('hide');
             // Esegui altre azioni di annullamento se necessario
         });
     }
   
  
