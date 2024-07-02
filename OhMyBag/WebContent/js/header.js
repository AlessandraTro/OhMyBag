/**
 * header.js
 */

 function showSuggestions(str) {
    if (str.length == 0) {
        document.getElementById("suggestions").innerHTML = "";
        return;
    }

    const xhr = new XMLHttpRequest();
    xhr.open("GET", "BarraDiRicerca?searchField=" + encodeURIComponent(str), true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            const suggestions = JSON.parse(xhr.responseText);

            // Creiamo un array di elementi <div> per i suggerimenti
            let suggestionsList = suggestions.map(suggestion => {
                const div = document.createElement('div');
                div.classList.add('autocomplete-suggestion');
                div.textContent = suggestion.nome;
                div.onclick = function() {
                    selectSuggestion(suggestion.nome, suggestion.id);
                };
                return div;
            });

            // Aggiungiamo gli elementi <div> al container dei suggerimenti
            const suggestionsContainer = document.getElementById("suggestions");
            suggestionsContainer.innerHTML = ""; // Svuota eventuali suggerimenti precedenti
            const divider = document.createElement('hr');
            suggestionsList.forEach(div => suggestionsContainer.appendChild(div));
        }
    };
    xhr.send();
}

function selectSuggestion(nome, id) {
    document.getElementById("searchInput").value = nome; // Imposta il valore dell'input di ricerca con il nome del prodotto
    document.getElementById("suggestions").innerHTML = ""; // Svuota l'elenco dei suggerimenti

    // Redirigi alla pagina di dettaglio del prodotto
    window.location.href = "DettagliControl?ID=" + id;
}

function startsWithCaseInsensitive(str, prefix) {
    return str.toLowerCase().startsWith(prefix.toLowerCase());
}

document.getElementById("searchForm").onsubmit = function(event) {
    event.preventDefault(); // Evita l'invio del form
    const query = document.getElementById("searchInput").value;
    if (query.length > 0) {
        window.location.href = "ProdottiRicercaControl?searchField=" + encodeURIComponent(query);
    }
};


document.addEventListener("click", function(event) {
    const suggestions = document.getElementById("suggestions");
    if (!suggestions.contains(event.target) && event.target !== document.getElementById("searchInput")) {
        suggestions.innerHTML = "";
    }
});