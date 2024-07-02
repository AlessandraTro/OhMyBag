USE OhMyBag;

/*creazione utente di prova*/
INSERT INTO utente (Username, Cf, Email, Password, Telefono, Nome, Cognome, Admin, DataNascita, IndirizzoSpedizione) VALUES ("otineb", "CRNFTM05C07R791N", "email@gmail.com","password","9999999999","Marco","Verdi",0,"2024-05-20",
"<ul>
<li><b>Citta:</b> Roma</li>
<li><b>Via:</b> Via Roma</li>
<li><b>CAP:</b> 00100</li>
<li><b>Provincia:</b> RM</li>
</ul>");

/*creazione di un'ordine fatto dall'utente otineb*/
INSERT INTO Ordine 
    (PrezzoTotale, Destinatario, IndirizzoDiSpedizione, 
    NoteCorriere, MetodoDiSpedizione, NumeroTracking, Data, Circuito, 
    ConfezioneRegalo, NumeroCarta, Username) 
VALUES 
    (100.50, 
    'Nome Destinatario', 
    'Indirizzo di Spedizione', 
    'Note per il corriere', 
    'Standard', 
    '123456789', 
    '2024-05-05', 
    'Visa', 
    true, 
    '1234 5678 9012 3456', 
    'email@gmail.com');

/* INSERIMENTO CATEGORIA */
INSERT INTO Categoria (ID, Nome) VALUES (01, "Donna");
INSERT INTO Categoria (ID, Nome) VALUES (02, "Uomo");
INSERT INTO Categoria (ID, Nome) VALUES (03, "Viaggi");


/* INSERIMENTO DONNA */

/* INSERIMENTO BORSE */

/* GUCCI DIANA */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("678842 FACPO 5743", "Gucci", "Borsa Shopping Gucci Diana Misura Media", 4500.00, "Borsa", 01, 
"La collezione Cruise 24 trae ispirazione dai motivi iconici della Maison, reinterpretando simboli ed elementi inconfondibili in modi sempre nuovi. Stagione dopo stagione, l’heritage Gucci caratterizza design, materiali e modelli contemporanei.<br>
<ul>
  <li><b>Materiale:</b> Pelle</li>
  <li><b>Colore:</b> Beige chiaro</li>
  <li><b>Finiture:</b> anticate color oro lucido</li>
  <li><b>Logo:</b> Gucci in rilievo</li>
  <li><b>Fodera:</b> in cotone e lino</li>
  <li><b>Tasca interna:</b> aperta e due scomparti con cerniera</li>
  <li><b>Manico:</b> altezza (luce) 10 cm</li>
  <li><b>Tracolla:</b> in tessuto, altezza (luce) 63 cm, e tracolla in pelle, altezza (luce) 58 cm</li>
  <li><b>Peso:</b> circa 1,256 kg</li>
  <li><b>Misura media:</b> L 35 cm x A 30 cm x P 14 cm</li>
  <li><b>Fabbricato in Italia</b></li>
  <li>Può contenere iPhone Pro Max/Plus, Airpods, portafoglio piccolo e rossetto</li>
</ul>", 
2024, '2024-04-13', 0, 10, 22);


/* VERSACE MEDUSA '95 */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES("1013169-1A10795_DTU_UNICA_1B00V__", "Versace", "Shopper Piccola Medusa '95", 1700.00, "Borsa", 01,
"Shopper orizzontale con dettaglio cintura caratterizzata dalla personalizzazione Medusa '95, l'iconico codice della Maison visto per la prima volta nelle collezioni del 1995. Il design del manico superiore è realizzato in pelle liscia a grana piatta con chiusura magnetica e presenta una tracolla rimovibile.<br>
<ul>
  <li><b>Personalizzazione Medusa '95</b></li>
  <li><b>Logo Versace in rilievo</b></li>
  <li><b>Manici</b></li>
  <li><b>Chiusura magnetica</b></li>
  <li><b>Taschina interna</b></li>
  <li><b> Colore: </b> Nero + Oro </li>
  <li><b>Tracolla rimovibile:</b> L91,5 -100 cm</li>
  <li><b>Altezza (luce) della tracolla:</b> 12 cm</li>
  <li><b>Piedini in metallo</b></li>
  <li><b>Composizione esterno:</b> 100% pelle di vitello</li>
  <li><b>Fodera:</b> 100% pelle di agnello</li>
  <li><b>Peso approssimativo:</b> 0,5 kg</li>
  <li>L 23 x L 8 x A 14 cm</li>
</ul>", 
2024, '2024-04-13', 0, 10, 22);


/*CARPISA BORSA SHOPPING - ATHENA*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES("BSB99201444", "Carpisa", "Borsa Shopping - Athena", 49.95, "Borsa", 01,
"Shopping della linea Athena by Carpisa in similpelle granato sfoderata. Il modello è dotato di chiusura con zip, una tasca interna, due ampi manici e una tracolla regolabile e removibile in similpelle liscia in tinta. La shopping è pratica, capiente e comoda.<br>
<ul>
  <li><b>Linea:</b> ATHENA</li>
  <li><b>Materiale:</b> Sintetico</li>
  <li><b>Colore:</b> Nero</li>
  <li><b>Made in:</b> Cina</li>
  <li><b>Collezione:</b> Primavera/Estate 2024</li>
  <li><b>Dimensioni (cm):</b> 35.5 x 28.5 x 14</li>
</ul>", 
2024, '2024-04-13', 0, 10, 22);


/* ARMANI Borsa hobo a spalla in pelle stampa cervo */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES("Y3E205Y497O180100", "Armani", "Borsa hobo a spalla in pelle stampa cervo", 550.00, "Borsa", 01,
"Linee pulite super minimal con piccoli tocchi di metallo. L’ispirazione di queste borse dal tipico design hobo, nasce dal trend delle borse sottospalla, dai volumi decisi e dalla silhouette particolarmente geometrica. Borsa a spalla realizzata in pelle con finish stampa cervo e provvista di chiusura con linguetta di pelle che viene inserita all’interno di un passante di metallo logato.<br>
<ul>
  <li><b>Dettagli metallici:</b> gold</li>
  <li><b>Dimensioni:</b> 25 x 36 x 7 cm</li>
  <li><b>Composizione:</b> 100% Pelle di bovino</li>
  <li><b>Materiale: </b> Pelle</li>
  <li><b>Brand logo</b></li>
  <li><b>Colore:</b> Tortora, tinta unita</li>
  <li><b>Manico:</b> singolo</li>
  <li><b>Interno foderato</b></li>
  <li><b>Tasca interna con zip</b></li>
</ul>", 
2024, '2024-04-13', 0, 10, 22);


/* PADRA Borsa a tracolla Prada Re-Edition 1978 mini in Re-Nylon e Saffiano */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("1BH218_R064_F0594_V_OOO", "Prada", "Borsa a tracolla Prada Re-Edition 1978 mini in Re-Nylon e Saffiano", 1900.00, "Borsa", 01,
"Re-Edition di un design d’archivio, questa borsa a tracolla dal fascino senza tempo sintetizza i codici Prada in una silhouette pragmatica e sofisticata. Il modello essenziale dalle geometrie pulite è realizzato in Re-Nylon, tessuto innovativo in nylon rigenerato, evoluzione sostenibile di un materiale distintivo del marchio. Dotato di una tasca esterna con zip e impreziosito da eleganti dettagli in pelle Saffiano, l’accessorio è completato dall’iconico del logo triangolo in metallo smaltato.<br>
<ul>
  <li><b>Tracolla regolabile in Saffiano.</b> Lunghezza massima 125 cm - Lunghezza minima 115 cm - Luce massima 60 cm- Luce minima 55 cm</li>
  <li><b>Portachiavi Re-Edition rimovibile in pelle</b></li>
  <li><b>Tasca frontale con zip</b></li>
  <li><b>Finiture in metallo</b></li>
  <li><b>Logo su triangolo in metallo smaltato frontale</b></li>
  <li><b>Chiusura zip</b></li>
  <li><b>Colore:</b> Sughero</li>
  <li><b>Interno in Re-Nylon siglato con tasca zip</b></li>
  <li><b>Altezza:</b> 17cm</li>
  <li><b>Larghezza:</b> 21cm</li>
  <li><b>Lunghezza:</b> 8cm</li>
  <li><b>Materia:</b> Tessuto/Pelle</li>
</ul>
<i>Per una cura sostenibile del prodotto, per preservarne le caratteristiche e per ridurre la dispersione di microfibre, si consiglia di non lavare il prodotto troppo spesso, di far prendere aria dopo ogni utilizzo e affidare il lavaggio a secco ad una tintoria specializzata ed ecologica.</i>", 
2024, '2024-04-13', 0, 10, 22);



/* INSERIMENTO ZAINI */

/* CALVIN KLEIN ZAINO ROTONDO */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES("0000PH0700010", "Calvin Klein", "Zaino Rotondo", 84.90, "Zaino", 01, 
"L'esterno dello zaino è realizzato al 100% in poliestere riciclato, escluse le finiture. Il poliestere riciclato di questo prodotto è stato ottenuto dalla rielaborazione di materiali esistenti.<br>
<ul>
  <li><b>Esterno in poliestere riciclato resistente all'acqua</b></li>
  <li><b>Manico superiore e spalline regolabili</b></li>
  <li><b>Lunghezza della tracolla regolabile:</b> 49 cm - 91 cm</li>
  <li><b>Modello con zip integrale</b></li>
  <li><b>Tasca esterna sul davanti</b></li>
  <li><b>Sostegno imbottito in rete</b></li>
  <li><b>A:</b> 45 cm <b>L:</b> 30 cm <b>l:</b> 12 cm</li>
  <li><b>Logo Calvin Klein sul davanti</b></li>
  <li><b>Colore:</b> Nero</li>
  <li>100% poliestere riciclato</li>
  <li>Paese d'origine: Cina</li>
</ul>", 
2023, '2024-04-16', 10, 10, 22);

/* GUCCI ZAINO OPHIDIA DOPPIA GG */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("547965 9U8BT 8994", "Gucci", "Zaino Ophidia in GG Supreme Misura Piccola", 1490.00, "Zaino", 01, "Lo zaino si conferma un accessorio essenziale delle collezioni Gucci e ogni stagione è riproposto in nuove varianti e dimensioni. Parte della linea Ophidia, questo modello è realizzato in tessuto GG Supreme, profilato da pelle marrone a contrasto. Il nastro Web verde e rosso e la Doppia G rendono omaggio alla tradizione della Maison.<br>
<ul>
  <li><b>Tessuto GG Supreme beige ed ebano, materiale a ridotto impatto ambientale, con finiture in pelle marrone</b></li>
  <li><b>Colore:</b> Beige ed Ebano</li>
  <li><b>Nastro Web rosso e verde</b></li>
  <li><b>Finiture anticate color oro</b></li>
  <li><b>Doppia G</b></li>
  <li><b>Parte posteriore </b>  in rete nera</li>
  <li><b>Tasca frontale </b> con cerniera</li>
  <li><b>Tasca interna </b>  cerniera</li>
  <li><b>Spallacci </b> regolabili</li>
  <li><b>Chiusura con cerniera</b></li>
  <li><b>Misura piccola:</b> L 22 cm x A 29 cm x P 15 cm</li>
  <li><b>Peso:</b> circa 0,4 kg</li>
  <li><b>Fabbricato in Italia</b></li>
  <li>La modella è alta 180cm</li>
  <li><b>Fodera </b> in cotone e lino</li>
</ul>", 2024, '2024-04-16', 0, 10, 22);

/* ZAINO CHANEL 22 */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("AS3859 B16652 NY077", "Chanel", "Zaino Chanel 22", 5800.00, "Zaino", 01, "Pelle effetto lucido, pelle & metallo effetto dorato Bianco & nero.<br>
<ul>
  <li><b>Dimensioni:</b> 34 × 29 × 8 cm ( in )</li>
</ul>", 2024, '2024-04-16', 0, 10, 22);

/* PRADA Zaino small in Re-Nylon */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("1BZ677_RV44_F0076_V_OOO", "Prada", "Zaino small in Re-Nylon", 1750.00, "Zaino", 01, "Parte dell'heritage di Prada fin dagli anni '80, lo zaino in nylon riflette le caratteristiche principali del marchio: l'innovazione dei materiali, l’approccio utilitaristico al lusso e la reinterpretazione dei classici. Questo modello dal design minimalista e moderno è riproposto in Re-Nylon, ottenuto dal riciclo e dalla purificazione delle materie plastiche raccolte negli oceani.<br>
<ul>
  <li>Dettagli in Saffiano</li>
  <li><b>Bretelle </b> regolabili e maniglia in nastro </li>
  <li><b>Tasche </b> davanti con pattina e chiusura a fibbia</li>
  <li><b>Finiture in metallo</b></li>
  <li><b>Logo </b>  su triangolo in metallo smaltato sulla pattina</li>
  <li><b>Chiusura </b> con coulisse, pattina e chiusura a fibbia</li>
  <li><b>Interno in Re-Nylon </b> siglato con due tasche di cui una con zip</li>
  <li><b>Altezza:</b> 28cm</li>
  <li><b>Larghezza:</b> 23cm</li>
  <li><b>Lunghezza:</b> 12cm</li>
  <li><b>Materiale:</b> Tessuto</li>
  <li><b>Colore:</b> Celeste</li>
</ul>
<i> Per una cura sostenibile del prodotto, per preservarne le caratteristiche e per ridurre la dispersione di microfibre, si consiglia di non lavare il prodotto troppo spesso, di far prendere aria dopo ogni utilizzo e affidare il lavaggio a secco ad una tintoria specializzata ed ecologica.</i>", 2024, '2024-04-16', 0, 10, 22);

/* CARPISA Zaino - New Mandy V2 */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("BSB05007942", "Carpisa", "Zaino - New Mandy V2", 69.95, "Zaino", 01, "Zaino da donna della linea New Mandy V2 by Carpisa pratico e resistente. Il modello si contraddistingue per la sua ampiezza e capienza che la rendono adatto per portare con te tutto ciò che ti serve in ufficio ma anche nelle trasferte di lavoro.<br>
<ul>
  <li><b>Ampio scomparto interno </b>con chiusura a zip</li>
  <li><b>Spallacci </b>in nastro regolabili</li>
  <li><b>Due tasche esterne </b>nella parte frontale con chiusura con cerniera</li>
  <li><b>Una tasca </b>sul retro con zip</li>
  <li>Numerose tasche interne per gli accessori</li>
  <li><b>Capienza </b> PC da max 15</li>
  <li><b>Linea:</b> NEW MANDY V2</li>
  <li><b>Materiale:</b> Sintetico</li>
  <li><b>Made in:</b> Cina</li>
  <li><b>Collezione:</b> Continuativo 2022</li>
  <li><b>Dimensioni (cm):</b> 30 x 39 x 12.5</li>
  <li><b>Colore:</b> Indaco</li>",
2023, '2024-04-16', 43, 10, 22);




/* INSERIMENTO CINTURE */

/* TOMMY HILFIGER CINTURA TH MONOGRAM IN PELLE */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("AW0AW15763AES", "Tommy Hilfiger", "Cintura TH Monogram in pelle", 64.90, "Cintura", 01, 
"Il nuovo segno distintivo unisce con genialità tradizione e innovazione. Il monogramma rivisita in chiave moderna un'icona inconfondibile del brand. L'elegante cintura in pelle aggiunge una nota di lusso al tuo look, grazie al brillante monogramma TH in metallo sul passante.<br>
<ul>
  <li><b>Finitura liscia</b></li>
  <li><b>Fibbia quadrata in metallo</b></li>
  <li><b>Placchetta con monogramma TH sul passante</b></li>
  <li><b>Branding Tommy Hilfiger</b></li>
  <li><b>Colore:</b> white clay</li>
  <li><b>Larghezza:</b> 2,5 cm</li>
  <li><b>Materiale:</b> 100% pelle</li>
</ul>", 
2023, '2024-04-16', 30, 10, 22);

/* CHANEL Cintura*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("AAA105 B16750 NY272", "Chanel", "Cintura", 1210.00, "Cintura", 01, "Capretto effetto scamosciato, pelle di agnello & metallo.<br>
<ul>
  <li><b>Colore:</b> Nero & oro</li>
</ul>", 2024, '2024-04-16', 0, 10, 22);


/*GUCCI Cintura Sottile GG Marmont */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("409417 0AAA5 1000", "Gucci", "Cintura Sottile GG Marmont", 350.00, "Cintura", 01, "Nell'ultima collezione, i motivi più emblematici della Maison sono rappresentati come simboli senza tempo ma in continua evoluzione. L'iconica Doppia G color oro definisce questo accessorio con il suo stile inconfondibile.<br>
<ul>
  <li><b>Pelle nera</b></li>
  <li><b>Finiture color oro chiaro</b></li>
  <li><b>Fibbia Doppia G</b></li>
  <li><b>Fibbia:</b> L 4 cm x A 3 cm</li>
  <li><b>Altezza cintura:</b> 2 cm</li>
  <li><b>Larghezza:</b> 2 cm</li>
  <li><b>Fabbricato in Italia</b></li>
</ul>", 2024, '2024-04-16', 0, 10, 22);

/* VERSACE Cintura con catena */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("1007687-1A00620_DTU_UNICA_3P010__", "Versace", "Cintura con catena Grega Goddess", 790.00, "Cintura", 01, "Questa cintura con catena è realizzata con iconiche maglie con Greca, un simbolo del brand, reso con un'unica linea ininterrotta. Tutti i gioielli firmati Versace sono privi di piombo e nichel. Tutti i materiali sono ipoallergenici.<br>
<ul>
  <li><b>Elementi in metallo con Greca</b></li>
  <li><b>Chiusura con moschettone</b></li>
  <li><b>Materiale:</b> 100% metallo</li>
  <li><b>Colore:</b> Metallico</li>
</ul>", 2024, '2024-04-16', 0, 10, 22);

/* CARPISA Cintura - Liv */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("ACC08305444", "Carpisa", "Cintura - Liv", 9.95, "Cintura", 01, "Cintura da donna della linea Liv by Carpisa in simil pelle effetto granato. Un accessorio in stile classico, sempre di moda, che vi permetterà facili abbinamenti.<br>
<ul>
  <li><b>Linea:</b> LIV</li>
  <li><b>Materiale:</b> Sintetico</li>
  <li><b>Colore:</b> Ardesia</li>
  <li><b>Made in:</b> Cina</li>
  <li><b>Collezione:</b> Primavera/Estate 2024</li>
  <li><b>Dimensioni (cm):</b> 115 x 2 x 0</li>
</ul>", 2024, '2024-04-16', 0, 10, 22);



/* INSERIMENTO PORTAFOGLI */

/* LOUIS VUITTON PORTAFOGLIO SARAH*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES("M60531", "Louis Vuitton", "Portafoglio Sarah", 530.00, "Portafoglio", 01, 
"Il portafoglio Sarah, grande classico di Louis Vuitton, combina la tela Monogram con una fodera in pelle martellata. Il raffinato accessorio, con apertura a busta, rivela due spaziosi scomparti, pratiche tasche e fessure per carte di credito. La creazione si distingue per il design elegante e funzionale, perfetto per contenere l'essenziale.<br>
<ul>
  <li><b>Dimensioni:</b> 19 x 10.5 x 2.5 cm (Lunghezza x Altezza x Larghezza)</li>
  <li><b>Esterno in tela Monogram</b></li>
  <li><b>Colore:</b> Marrone</li>
  <li><b>Fodera</b> in vacchetta pieno fiore</li>
  <li>Parti metalliche dorate</li>
  <li>Chiusura con bottone a pressione</li>
  <li>Tasca piatta esterna</li>
  <li>Sedici fessure per carte di credito</li>
  <li>Scomparto con zip per monete</li>
  <li>Due ampi scomparti a soffietto</li>
  <li>Tasca piatta interna</li>
</ul>
L'articolo può essere prodotto in Francia, Spagna, Italia o negli Stati Uniti.", 
2024, '2024-04-17', 0, 10, 22);

/* CARPISA Piccolo - Alma */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("PDC01308444", "Carpisa", "Portafoglio Piccolo - Alma", 15.95, "Portafoglio", 01, "Portafoglio piccolo della linea Alma by Carpisa realizzato in similpelle effetto struzzo.
Dotato di chiusura con cerniera all round, tasca interna portamonete e otto slot portacarte.<br>
<ul>
  <li><b>Linea:</b> ALMA</li>
  <li><b>Materiale:</b> Sintetico</li>
  <li><b>Colore:</b> Pistacchio chiaro</li>
  <li><b>Made in:</b> Cina</li>
  <li><b>Collezione:</b> Primavera/Estate 2024</li>
  <li><b>Dimensioni (cm):</b> 11.5 x 8 x 2</li>
</ul>", 2024, '2024-04-16', 0, 10, 22);

/* GUCCI Portacarte GG Marmont */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("466492 DTDHT 1712", "Gucci", "Portacarte GG Marmont", 385.00, "Portafoglio", 01, "La collezione GG Marmont è definita dall'emblematico dettaglio Doppia G, una versione contemporanea di una fibbia per cintura degli archivi Gucci degli anni '70 diventata un elemento distintivo della Maison. Questo portacarte è realizzato con la stessa pelle matelassé delle borse della collezione.<br>
<ul>
  <li><b>Pelle chevron matelassé grigio chiaro</b></li>
  <li><b>Finiture color oro</b></li>
  <li><b>Fodera in moiré</b></li>
  <li><b>Colore:</b> Grigio chiaro</li>
  <li><b>Doppia G</b></li>
  <li><b>Cinque fessure per carte</b></li>
  <li><b>Uno scomparto per banconote</b></li>
  <li><b>Tasca con cerniera</b></li>
  <li><b>Chiusura a scatto</b></li>
  <li><b>Chiuso:</b> L 11 cm x A 8,5 cm x P 3 cm</li>
  <li><b>Aperto:</b> L 11 cm x A 17,5 cm</li>
  <li><b>Fabbricato in Italia</b></li>
</ul>", 2024, '2024-04-16', 0, 10, 22);

/* VERSACE Medusa '95 */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("1014689-1A10795_DTU_UNICA_1KD7V__", "Versace", "Portafoglio Medusa ‘95", 550.00, "Portafoglio", 01, "Un portafoglio realizzato in pelle liscia dettagliato da una personalizzazione con cintura Medusa '95 sul davanti e dotato di diversi scomparti interni per carte e banconote e un portamonete. Il piccolo accessorio è completato da una taschina posteriore con logo in rilievo.<br>
<ul>
  <li><b>Personalizzazione Medusa '95</b></li>
  <li><b>Logo Versace</b></li>
  <li><b>Scomparti interni per carte</b></li>
  <li><b>Scomparto per banconote</b></li>
  <li><b>Portamonete con zip</b></li>
  <li><b>Taschino posteriore</b></li>
  <li><b>Design con tre parti</b></li>
  <li><b>Colore:</b> Nero</li>
  <li><b>Composizione esterno:</b> 100% pelle di vitello</li>
  <li><b>Fodera:</b> 60% cotone, 40% viscosa</li>
  <li><b>Finiture:</b> 100% pelle di agnello</li>
</ul>", 2024, '2024-04-17', 0, 10, 22);

/* Tommy Hilfiger PORTAFOGLI ICONIC GRANDE CON MONOGRAMMI */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("AW0AW15743BDS", "Tommy Hilfiger", "Portafogli Iconic Grande con Monogrammi", 79.90, "Portafoglio", 01, "Il nuovo segno distintivo unisce con genialità tradizione e innovazione. Il monogramma rivisita in chiave moderna un'icona inconfondibile del brand. La stampa di monogrammi TH all over e la pratica chiusura con zip sono le caratteristiche distintive del grintoso portafogli, abbastanza spazioso da contenere tutto l'essenziale.<br>
<ul>
  <li><b>Finitura liscia</b></li>
  <li><b>Stampa di monogrammi TH all over</b></li>
  <li><b>Chiusura con zip</b></li>
  <li><b>Colore:</b> Nero</li>
  <li><b>Scomparto principale</b></li>
  <li><b>Placchetta con monogramma TH sul davanti</b></li>
  <li><b>Branding Tommy Hilfiger</b></li>
  <li><b>Dimensioni:</b> 11 x 20 x 3 cm</li>
  <li><b>100% poliuretano</b></li>
</ul>", 2023, '2024-04-17', 30, 10, 22);


/* INSERIMENTO SCIARPE E CAPPELLI */

/* LOUIS VUITTON SCIARPA THE ULTIMATE */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ("M76382","Louis Vuitton","Sciarpa The Ultimate", 890.00, "Sciarpe e Cappelli", 01, 
"La sciarpa The Ultimate è decorata con il motivo Monogram oversize in colori a contrasto, dallo stile decisamente originale. L'accessorio, dalle dimensioni generose, è realizzato in pregiato misto cachemire e lana. La maestria artigianale della Maison è messa in risalto dall'abile uso della tecnica jacquard, che crea il particolare gioco cromatico del raffinato modello.<br>
<ul>
  <li><b>Dimensioni:</b> 200 x 70 cm (Lunghezza x Altezza)</li>
  <li><b>Tessuto:</b> 50% cachemire, 50% lana</li>
  <li><b>Colore:</b> Beige</li>
  <li>Trama jacquard</li>
  <li>Motivo Monogram</li>
  <li>Bordo sfrangiato<</li>
  <li>Firma Louis Vuitton</li>
  <li> Solo lavaggio a secco</li>
</ul>",
2024, '2024-04-17', 0, 10, 22);


/* INSERIMENTO ACCESSORI */

/* CARPISA PORTACELLULARE*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES("AAC06204444", "Carpisa", "Portacellulare - Vanity Spring", 19.95, "Accessori", 01, 
"Portacellulare della linea Vanity Spring by Carpisa realizzato in similpelle effetto lucertolina.
Dotato di chiusura principale con cerniera, due taschine esterne, tira lampo in metallo logato e tracolla in nastro regolabile e removibile. Il modello è disponibile in vari colori pastello che ricordano la primavera.<br>
<ul>
  <li><b>Linea:</b> VANITY SPRING</li>
  <li><b>Materiale:</b> Sintetico</li>
  <li><b>Colore:</b> Nero</li>
  <li><b>Made in:</b> Cina</li>
  <li><b>Collezione:</b> Primavera/Estate 2024</li>
  <li><b>Dimensioni (cm):</b> 10 x 17 x 2</li>
</ul>", 
2024, '2024-04-18', 0, 10, 22);




/* INSERIMENTO IMMAGINI */

/* BORSE */

/* GUCCI DIANA */

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/1.jpg", 1, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/2.jpg", 0, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/3.jpg", 0, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/4.jpg", 0, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/5.jpg", 0, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/6.jpg", 0, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/7.jpg", 0, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/8.jpg", 0, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/9.jpg", 0, "678842 FACPO 5743");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Gucci/Borsa Shopping Gucci Diana Misura Media/10.jpg", 0, "678842 FACPO 5743");



/* VERSACE MEDUSA '95 */

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Versace/Shopper Piccola Medusa '95/1.jpg", 1, "1013169-1A10795_DTU_UNICA_1B00V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Versace/Shopper Piccola Medusa '95/2.jpg", 0, "1013169-1A10795_DTU_UNICA_1B00V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Versace/Shopper Piccola Medusa '95/3.jpg", 0, "1013169-1A10795_DTU_UNICA_1B00V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Versace/Shopper Piccola Medusa '95/4.jpg", 0, "1013169-1A10795_DTU_UNICA_1B00V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Versace/Shopper Piccola Medusa '95/5.jpg", 0, "1013169-1A10795_DTU_UNICA_1B00V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Versace/Shopper Piccola Medusa '95/6.jpg", 0, "1013169-1A10795_DTU_UNICA_1B00V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Versace/Shopper Piccola Medusa '95/7.jpg", 0, "1013169-1A10795_DTU_UNICA_1B00V__");



/*CARPISA BORSA SHOPPING - ATHENA*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Carpisa/Borsa Shopping - Athena/1.jpg", 1,"BSB99201444"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Carpisa/Borsa Shopping - Athena/2.jpg", 0,"BSB99201444"); 


/* ARMANI Borsa hobo a spalla in pelle stampa cervo */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Armani/Borsa hobo a spalla in pelle stampa cervo/1.jpg", 1, "Y3E205Y497O180100");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Armani/Borsa hobo a spalla in pelle stampa cervo/2.jpg", 0, "Y3E205Y497O180100");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Armani/Borsa hobo a spalla in pelle stampa cervo/3.jpg", 0, "Y3E205Y497O180100");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Armani/Borsa hobo a spalla in pelle stampa cervo/4.jpg", 0, "Y3E205Y497O180100");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Armani/Borsa hobo a spalla in pelle stampa cervo/5.jpg", 0, "Y3E205Y497O180100");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Armani/Borsa hobo a spalla in pelle stampa cervo/6.jpg", 0, "Y3E205Y497O180100");



/* PADRA Borsa a tracolla Prada Re-Edition 1978 mini in Re-Nylon e Saffiano */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Prada/Borsa a tracolla Prada Re-Edition 1978 mini in Re-Nylon e Saffiano/1.jpg", 1,"1BH218_R064_F0594_V_OOO");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Prada/Borsa a tracolla Prada Re-Edition 1978 mini in Re-Nylon e Saffiano/2.jpg", 0,"1BH218_R064_F0594_V_OOO");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Prada/Borsa a tracolla Prada Re-Edition 1978 mini in Re-Nylon e Saffiano/3.jpg", 0,"1BH218_R064_F0594_V_OOO");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Prada/Borsa a tracolla Prada Re-Edition 1978 mini in Re-Nylon e Saffiano/4.jpg", 0,"1BH218_R064_F0594_V_OOO");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Borsa/Prada/Borsa a tracolla Prada Re-Edition 1978 mini in Re-Nylon e Saffiano/5.jpg", 0,"1BH218_R064_F0594_V_OOO");


/* ZAINI */

/* CALVIN KLEIN ZAINO ROTONDO */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Calvin Klein/Zaino Rotondo/1.jpg", 1,"0000PH0700010"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Calvin Klein/Zaino Rotondo/2.jpg", 0,"0000PH0700010"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Calvin Klein/Zaino Rotondo/3.jpg", 0,"0000PH0700010"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Calvin Klein/Zaino Rotondo/4.jpg", 0,"0000PH0700010"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Calvin Klein/Zaino Rotondo/5.jpg", 0,"0000PH0700010"); 

/* GUCCI ZAINO OPHIDIA DOPPIA GG */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Gucci/Zaino Ophidia in GG Supreme Misura Piccola/1.jpg", 1,"547965 9U8BT 8994"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Gucci/Zaino Ophidia in GG Supreme Misura Piccola/2.jpg", 0,"547965 9U8BT 8994"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Gucci/Zaino Ophidia in GG Supreme Misura Piccola/3.jpg", 0,"547965 9U8BT 8994"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Gucci/Zaino Ophidia in GG Supreme Misura Piccola/4.jpg", 0,"547965 9U8BT 8994"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Gucci/Zaino Ophidia in GG Supreme Misura Piccola/5.jpg", 0,"547965 9U8BT 8994"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Gucci/Zaino Ophidia in GG Supreme Misura Piccola/6.jpg", 0,"547965 9U8BT 8994"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Gucci/Zaino Ophidia in GG Supreme Misura Piccola/7.jpg", 0,"547965 9U8BT 8994"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Gucci/Zaino Ophidia in GG Supreme Misura Piccola/8.jpg", 0,"547965 9U8BT 8994"); 

/* ZAINO CHANEL 22 */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Chanel/Zaino Chanel 22/1.jpg", 1,"AS3859 B16652 NY077"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Chanel/Zaino Chanel 22/2.jpg", 0,"AS3859 B16652 NY077"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Chanel/Zaino Chanel 22/3.jpg", 0,"AS3859 B16652 NY077"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Chanel/Zaino Chanel 22/4.jpg", 0,"AS3859 B16652 NY077"); 


/* PRADA Zaino small in Re-Nylon */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Prada/Zaino small in Re-Nylon/1.jpg", 1,"1BZ677_RV44_F0076_V_OOO"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Prada/Zaino small in Re-Nylon/2.jpg", 0,"1BZ677_RV44_F0076_V_OOO"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Prada/Zaino small in Re-Nylon/3.jpg", 0,"1BZ677_RV44_F0076_V_OOO"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Prada/Zaino small in Re-Nylon/4.jpg", 0,"1BZ677_RV44_F0076_V_OOO"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Prada/Zaino small in Re-Nylon/5.jpg", 0,"1BZ677_RV44_F0076_V_OOO"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Prada/Zaino small in Re-Nylon/6.jpg", 0,"1BZ677_RV44_F0076_V_OOO"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Prada/Zaino small in Re-Nylon/7.jpg", 0,"1BZ677_RV44_F0076_V_OOO"); 

/* CARPISA Zaino - New Mandy V2 */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Carpisa/Zaino - New Mandy V2/1.jpg", 1,"BSB05007942"); 
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Carpisa/Zaino - New Mandy V2/2.jpg", 0,"BSB05007942");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Carpisa/Zaino - New Mandy V2/3.jpg", 0,"BSB05007942");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Zaino/Carpisa/Zaino - New Mandy V2/4.jpg", 0,"BSB05007942");



/* CINTURE */

/* TOMMY HILFIGER CINTURA TH MONOGRAM IN PELLE */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Tommy Hilfiger/Cintura TH Monogram in pelle/1.jpg", 1, "AW0AW15763AES");


/* CHANEL Cintura*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Chanel/Cintura/1.jpg", 1, "AAA105 B16750 NY272");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Chanel/Cintura/2.jpg", 0, "AAA105 B16750 NY272");


/*GUCCI Cintura Sottile GG Marmont */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Gucci/Cintura Sottile GG Marmont/1.jpg", 1, "409417 0AAA5 1000");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Gucci/Cintura Sottile GG Marmont/2.jpg", 0, "409417 0AAA5 1000");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Gucci/Cintura Sottile GG Marmont/3.jpg", 0, "409417 0AAA5 1000");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Gucci/Cintura Sottile GG Marmont/4.jpg", 0, "409417 0AAA5 1000");

/* VERSACE Cintura con catena */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Versace/Cintura con catena Grega Goddess/1.jpg", 1, "1007687-1A00620_DTU_UNICA_3P010__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Versace/Cintura con catena Grega Goddess/2.jpg", 0, "1007687-1A00620_DTU_UNICA_3P010__");

/* CARPISA Cintura - Liv */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Cintura/Carpisa/Cintura - Liv/1.jpg", 1, "ACC08305444");





/* PORTAFOGLI */

/* LOUIS VUITTON PORTAFOGLIO SARAH*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Louis Vuitton/Portafoglio Sarah/1.jpg", 1, "M60531");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Louis Vuitton/Portafoglio Sarah/2.jpg", 0, "M60531");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Louis Vuitton/Portafoglio Sarah/3.jpg", 0, "M60531");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Louis Vuitton/Portafoglio Sarah/4.jpg", 0, "M60531");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Louis Vuitton/Portafoglio Sarah/5.jpg", 0, "M60531");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Louis Vuitton/Portafoglio Sarah/6.jpg", 0, "M60531");


/* CARPISA Piccolo - Alma */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Carpisa/Portafoglio Piccolo - Alma/1.jpg", 1, "PDC01308444");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Carpisa/Portafoglio Piccolo - Alma/2.jpg", 0, "PDC01308444");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Carpisa/Portafoglio Piccolo - Alma/3.jpg", 0, "PDC01308444");

/* GUCCI Portacarte GG Marmont */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Gucci/Portacarte GG Marmont/1.jpg", 1, "466492 DTDHT 1712");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Gucci/Portacarte GG Marmont/2.jpg", 0, "466492 DTDHT 1712");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Gucci/Portacarte GG Marmont/3.jpg", 0, "466492 DTDHT 1712");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Gucci/Portacarte GG Marmont/4.jpg", 0, "466492 DTDHT 1712");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Gucci/Portacarte GG Marmont/5.jpg", 0, "466492 DTDHT 1712");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Gucci/Portacarte GG Marmont/6.jpg", 0, "466492 DTDHT 1712");

/* VERSACE Medusa '95 */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Versace/Portafoglio Medusa ‘95/1.jpg", 1, "1014689-1A10795_DTU_UNICA_1KD7V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Versace/Portafoglio Medusa ‘95/2.jpg", 0, "1014689-1A10795_DTU_UNICA_1KD7V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Versace/Portafoglio Medusa ‘95/3.jpg", 0, "1014689-1A10795_DTU_UNICA_1KD7V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Versace/Portafoglio Medusa ‘95/4.jpg", 0, "1014689-1A10795_DTU_UNICA_1KD7V__");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Versace/Portafoglio Medusa ‘95/5.jpg", 0, "1014689-1A10795_DTU_UNICA_1KD7V__");

/* Tommy Hilfiger PORTAFOGLI ICONIC GRANDE CON MONOGRAMMI */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Tommy Hilfiger/Portafogli Iconic Grande con Monogrammi/1.jpg", 1, "AW0AW15743BDS");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Tommy Hilfiger/Portafogli Iconic Grande con Monogrammi/2.jpg", 0, "AW0AW15743BDS");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Portafoglio/Tommy Hilfiger/Portafogli Iconic Grande con Monogrammi/3.jpg", 0, "AW0AW15743BDS");




/* SCIARPE E CAPPELLI */

/* LOUIS VUITTON SCIARPA THE ULTIMATE */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Sciarpe e Cappelli/Louis Vuitton/Sciarpa The Ultimate/1.jpg", 1, "M76382");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Sciarpe e Cappelli/Louis Vuitton/Sciarpa The Ultimate/2.jpg", 0, "M76382");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Sciarpe e Cappelli/Louis Vuitton/Sciarpa The Ultimate/3.jpg", 0, "M76382");


/* ACCESSORI */

/* CARPISA PORTACELLULARE*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Accessori/Carpisa/Portacellulare - Vanity Spring/1.jpg", 1, "AAC06204444");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Donna/Accessori/Carpisa/Portacellulare - Vanity Spring/2.jpg", 0, "AAC06204444");

/*UOMO*/

/*INSERIMENTO ZAINI*/

/*TUCANO*/
use OhMyBag;
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
values ("003AAA", "Tucano",  "Luna Gravity", 200.00, "Zaino",  02, "Zaino per laptop 15.6 e MacBook 16 dotato di sistema anti-gravity, una sospensione elastica degli spallacci concepita per ridurre il carico sulle spalle e sulla schiena quando il corpo è in movimento. La funzione anti gravity system, oltre a migliorare la postura e a ridurre lo sforzo muscolare, attenua in modo specifico la rigidità dei muscoli del dorso e del collo distribuendo in modo equilibrato il peso dello zaino tra le spalle e il bacino. Realizzato in materiale tecnico ad alta densità, Luna Gravity ha un'ottima organizzazione delle tasche. Il vano interno, è dotato di una tasca protettiva per laptop mentre il lato anteriore presenta tasche con differenti altezze chiuse da cerniere. La parte posteriore ha uno schienale ergonomico, spallacci imbottiti con sistema di sospensione, fascia per trolley e tasca di sicurezza. Una rain cover estraibile, nascosta all'interno della base, permette di proteggere lo zaino durante la pioggia.
<ul>
<li>Colore Nero</li>
  <li>
    <strong>AGS, Anti Gravity System:</strong> grazie allelasticità degli spallacci alleggerisce la sensazione di peso sulle spalle migliorando la postura
  </li>
  <li>Materiale tecnico ad alta densità</li>
  <li>Ottima organizzazione delle tasche</li>
  <li>Tasca interna imbottita per laptop</li>
  <li>Tasca di sicurezza sulla parte posteriore</li>
  <li>Spallacci imbottiti dotati di sistema di sospensione</li>
  <li>Schienale ergonomico</li>
  <li>Rain cover estraibile</li>
  <li>Nastri con stampa all over</li>
</ul>", 2023, "2024-04-16", 0, 10, 22);

/*SPRAYGROUND*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES (
    '002AAA', 'SprayGround', 'Zaino SprayGround Tear It Up Camo Backpack Marrone', 119.00, 'Zaino', 02,
    'Esterno<ul>
    <li>Dimensioni: 46cm x 15cm x 29cm</li>
    <li>Tasca frontale con cerniera</li>
    <li>Tasche laterali</li>
    <li>Tasca nascosta con cerniera</li>
    <li>Imbottitura posteriore ergonomica in rete</li>
    <li>Cinghie regolabili per taglie personalizzate</li>
    <li>Cerniere in nylon con hardware in metallo</li>
    <li>Badge "Sprayground Authentic" in metallo</li>
    <li>Manicotto posteriore scorrevole si collega al bagaglio a mano per liberare le mani</li>
    </ul>Interno<ul>
    <li>Scomparto separato per laptop</li>
    <li>Scomparto separato per occhiali da sole in velour</li>
    <li>Tasca organizer in rete</li>
    </ul>Tessuto Eco-Pelle resistente e durevole',
    2024, '2024-04-16', 0, 10, 22);

/*PIQUADRO*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES (
    '001AAA', 'Piquadro', 'Zaino piccolo per computer 14’’ ed ipad', 365.00, 'Zaino', 02,
    'Zaino piccolo porta computer con scomparto per iPad®, tasche porta bottiglia e porta ombrello
    <ul>
      <li>Numero comparti: 2</li>
      <li>Può contenere: notebook da 14"</li>
      <li>Caratteristiche porta PC: Shock Absorber</li>
      <li>Porta iPad® 10,2\'\'Air 10,9\'\'Pro 11\'\': not removable</li>
      <li>Materiale: pelle</li>
      <li>Fodera interna: 100% Poliestere</li>
      <li>Tipologia manici: fissi</li>
      <li>Litraggio: 15,50</li>
      <li>Codice prodotto: CA3214B2</li>
      <li>Dimensioni: 27.5 X 39.0 X 15.0 (cm)</li>
      <li>Peso: 838 gr</li>
    </ul>',
    2022, '2024-04-16', 0, 10, 22);

/*MOLESKINE*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES (
    '000AAA', 'Moleskine', 'Precious & Ethical', 318.00, 'Zaino', 02,
    'Esterne<ul>
    <li>Zaino in materiale nuovo con effetto pitone (lesterno è 100% VEGEA®)</li>
    <li>Logo serigrafato metallizzato</li>
    <li>Apertura principale con cerniera lampo in metallo</li>
    <li>Tracolla regolabile in fettuccia in tonalità</li>
    <li>Schienale in air-mesh traspirante</li>
    <li>Cinghia per bagagli</li>
    <li>Piedini in metallo sul fondo</li>
    <li>Accessori in metallo</li>
    <li>Maniglia in fettuccia sulla parte superiore</li>
    <li>Anello da personalizzare con charms</li></ul>
    Interne<ul>
    <li>Tasca porta taccuino pocket My Moleskine per mettere via le idee</li>
    <li>Scomparto per dispositivi: 22x33cm</li>
    <li>Tasca interna con zip e porta biglietti da visita</li>
    <li>Tasca per occhiali foderata in microfibra</li>
    <li>Pochette separata foderata dello stesso tessuto dello zaino con una seconda pochette in mesh all\'interno</li>
    <li>Custodia per riporre il sacchetto antipolvere</li><li>Clip portachiavi per ritrovare sempre le chiavi</li>
    </ul>Dimensione e volume <br> 
    Dimensioni: 26 x 37 x 9 cm; <br> 
    Volume: 8L; <br>
    Vi presentiamo uno zaino lussuoso che unisce design, manifattura artigianale e attenzione ai dettagli. L\'esterno tattile e particolare è realizzato da VEGEA®, 
    un marchio all avanguardia che utilizza gli scarti organici dell industria vinicola italiana e li trasforma in materiali innovativi. 
    All interno dello zaino si trovano tre pochette, una dust bag e scomparti foderati per un dispositivo digitale (dimensioni dello scomparto: 22x33 cm), 
    occhiali e altri oggetti indispensabili. La sacca antipolvere ripiegabile è contenuta in un elegante custodia. Sono inoltre presenti una pochette con 
    cerniera dello stesso materiale dello zaino e una custodia in mesh per racchiudere e proteggere i propri effetti personali quando si è in movimento. 
    Questo zaino è dotato anche di una clip portachiavi attaccata ad una lunga cinghia interna, per poter usare le chiavi senza doverle tirare fuori 
    completamente dallo zaino e quindi senza mai perderle. Gli spallacci regolabili e lo schienale in air-mesh traspirante contribuiscono alla confortevolezza 
    durante la giornata, mentre una cinghia per bagaglio mantiene lo zaino saldamente attaccato alla valigia nei viaggi più lunghi.</li>',
    2024, '2024-04-16', 0, 10, 22);

/*EASTPAK*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES (
    '004AAA', 'Eastpak', 'Padded Pak’R', 55.00, 'Zaino', 02,
    'L iconico zaino Padded Pak’r nella nostra classica tonalità Black: stile tradizionale, struttura comoda
    <ul>
      <li>Altezza: 40 cm</li>
      <li>Larghezza: 30 cm</li>
      <li>Profondità: 18 cm</li>
      <li>Volume (in L): 24 Litri</li>
      <li>Peso: 380 g</li>
      <li>Garanzia: 30 anni</li>
      <li>Occasion: Studio | Lavoro | Gite fuori porta</li>
      <li>Volume Size: M</li>
    </ul>',
    2020, '2024-04-16', 0, 10, 22);

/*Sciarpe e cappelli*/

/*GUCCI*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES (
    '002AAB', 'Gucci', 'Sciarpa In Lana Cashmere con Incrocio GG', 430.00, 'Sciarpe e Cappelli', 02,
    'I motivi storici della Maison risplendono su nuove stampe accattivanti. Questa sciarpa in cashmere presenta il dettaglio Incrocio GG jacquard, che propone l innovazione dei codici d archivio di Gucci.
<ul>
    <li>Lana cashmere nera e grigio chiaro</li>
    <li>Nappine</li>
    <li>Dettaglio Incrocio GG jacquard</li>
    <li>L 32 cm x A 200 cm</li>
    <li>Fabbricato in Italia</li>
    <li>85% lana, 15% cashmere</li>
</ul>',
    2024, '2024-04-17', 0,10, 22);

/*TOMMY HILFIGER-CAPPELLO*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES (
    '000AAB', 'Tommy Hilfiger', 'Cappello da Baseball con Bandierina', 39.99, 'Sciarpe e Cappelli', 02,
    'Completa gli outfit per la bella stagione grazie al classico cappello da baseball con sei sezioni e visiera a contrasto, rifinito dallesclusiva bandierina ricamata.<br>
<ul>
    <li>Puro cotone biologico</li>
    <li>Visiera a contrasto</li>
    <li>Modello con sei sezioni</li>
    <li>Bottone sulla corona</li>
    <li>Fori di ventilazione</li>
    <li>Cuciture in rilievo sulla visiera</li>
    <li>Regolatore in metallo sul retro</li>
    <li>Branding Tommy Hilfiger</li>
    <li>Bandierina Tommy Hilfiger ricamata sul davanti</li>
    <li>Logo Tommy Hilfiger impresso sul regolatore</li>
</ul>

Modello e vestibilità<br>
<ul>
    <li>Circonferenza: 58 cm</li>
</ul>

Composizione e lavaggio<br>
<ul>
    <li>100% cotone biologico</li>
</ul>',
2020, '2024-04-16', 0, 10, 22);

/*TOMMY HILFIGER-SCIARPA*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES (
    '001AAB', 'Tommy Hilfiger', 'Sciarpa Hilfiger Monotype', 79.90, 'Sciarpe e Cappelli', 02,
    'Il nuovo segno distintivo unisce con genialità tradizione e innovazione. Il monogramma rivisita in chiave moderna un icona inconfondibile del brand. La sciarpa in maglia misto viscosa, cotone e lana, abbellita dal logo Hilfiger monotipo, è l alleata perfetta per esprimere tutto il tuo stile.
Caratteristiche principali
<ul>
    <li>Misto viscosa, cotone e lana</li>
    <li>Nastro iconico sul lato</li>
    <li>Logo Hilfiger monotipo sul lato</li>
    <li>Branding Tommy Hilfiger</li>
</ul>

Composizione e lavaggio
<ul>
    <li>50% bambù, 30% cotone, 20% lana</li>
</ul>',
    2023, '2024-04-16', 0, 10, 22);
/*PORTAFOGLIO*/

/*PIQUADRO*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita,Iva) 
VALUES ('003AAC','Piquadro','Portafoglio uomo tascabile con porta monete',99.00,'Portafoglio',02,
    'Portafoglio uomo tascabile con porta monete posteriore, carte di credito e protezione anti frode RFID
<ul>
    <li>Numero comparti: 1</li>
    <li>Materiale: pelle</li>
    <li>Fodera interna: 100% Poliestere</li>
    <li>Fessure per carte di credito: 6</li>
    <li>Porta monete: sì</li>
    <li>Dimensioni: 8.0 X 10.0 X 2.0 (cm)</li>
    <li>Peso: 60 gr</li>
</ul>',
2022,'2024-04-17',0,10,22);

/*Borselli e Marsupi*/

/*ARMANI*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita,Iva) 
values ("003AAF", "Armani",  "Borsa a spalla in lino intrecciato e pelle", 1900.00,"Marsupi e Borselli", 02 ,
"Linee morbide e destrutturate per questa borsa a mano realizzata in morbido lino intrecciato, impreziosita da inserti in pelle a contrasto. Il modello, dalla particolare forma a mezzaluna, vanta un interno capiente per contenere tutto il necessario per gli impegni quotidiani. La personalizzazione con logo Giorgio Armani ricamato completa l'accessorio.",
2024, '2024-04-17', 0, 10,22);

/*Calvin Klein*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita,Iva) 
values ("004AAD", "Calvin Klein",  "Borsa Reporter A Tracolla Con Logo",69.90,"Marsupi e Borselli", 02,
"<table>
  <tr>
    <th>Caratteristica</th>
    <th>Descrizione</th>
  </tr>
  <tr>
    <td>Materiale esterno</td>
    <td>Morbida ecopelle liscia</td>
  </tr>
  <tr>
    <td>Tracolla</td>
    <td>Incrociata regolabile</td>
  </tr>
  <tr>
    <td>Lunghezza tracolla</td>
    <td>34 cm - 65 cm</td>
  </tr>
  <tr>
    <td>Chiusura</td>
    <td>Con zip integrale</td>
  </tr>
  <tr>
    <td>Tasca esterna</td>
    <td>Sul davanti</td>
  </tr>
  <tr>
    <td>Tasca interna</td>
    <td>Con scomparto</td>
  </tr>
  <tr>
    <td>Fodera</td>
    <td>Morbido poliestere riciclato</td>
  </tr>
  <tr>
    <td>Sostegno</td>
    <td>Imbottito in rete</td>
  </tr>
  <tr>
    <td>Logo</td>
    <td>Distintivo Calvin Klein goffrato sul davanti</td>
  </tr>
  <tr>
    <td>Composizione</td>
    <td>100% poliuretano</td>
  </tr>
</table>
",
2022, '2024-04-17', 0, 10,22);

/*CINTURE*/

/*GUCCI*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita,Iva) 
values ("000AAE", "Gucci",  "Cintura Reversibile GG Marmont", 470.00, "Cintura", 02 , 
"Evolvendosi stagione dopo stagione, il design inconfondibile delle GG Marmont mescola l'hardware GG proveniente dagli anni '70 insieme a stili contemporanei.
Questa cintura in tessuto GG Supreme grigia e nera è reversibile e sull'altro lato presenta un'elegante pelle grigia offrendo così un look alternativo.", 
2023, '2024-04-17', 0, 10,22);

/*ACCESSORI*/

/*CARPISA*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita,Iva) 
values ("000AAG", "Carpisa",  "Portachiavi - Portachiavi New", 9.95, "Accessori", 02 , 
"<table>
  <tr>
    <th>Caratteristica</th>
    <th>Descrizione</th>
  </tr>
  <tr>
    <td>Linea</td>
    <td>PORTACHIAVI NEW</td>
  </tr>
  <tr>
    <td>Materiale</td>
    <td>Pelle</td>
  </tr>
  <tr>
    <td>Made in</td>
    <td>Cina</td>
  </tr>
  <tr>
    <td>Collezione</td>
    <td>Continuativo 2023</td>
  </tr>
  <tr>
    <td>Dimensioni (cm)</td>
    <td>1.5 x 10 x 2</td>
  </tr>
</table>", 
2024, '2024-04-17', 0, 10,22);

/*IMMAGINI*/

/*ZAINI*/

/*TUCANO*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16.jpg", 1, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (1).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (2).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (3).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (4).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (5).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (6).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (7).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (8).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (9).jpg", 0, "003AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Tucano/Luna Gravity/tucano-tutti-gli-zaini-luna-gravity-macbook-pro-16 (10).jpg", 0, "003AAA");

/*SPRAYGROUND*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-1-140-1710931105_900x.jpg", 1, "002AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-2-140-1710931105_900x.jpg", 0, "002AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-3-140-1710931105_900x.jpg", 0, "002AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-4-140-1710931111_900x.jpg", 0, "002AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-5-140-1710931111_900x.jpg", 0, "002AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-6-140-1710931111_900x.jpg", 0, "002AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-7-140-1710931118_900x.jpg", 0, "002AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-8-140-1710931118_900x.jpg", 0, "002AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/SprayGround/Zaino SprayGround Tear It Up Camo Backpack Marrone/ext-135018-9-140-1710931118_900x.jpg", 0, "002AAA");

/*PIQUADRO*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Piquadro/Zaino piccolo per computer 14’/CA3214B2-R_1.jpg", 1, "001AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Piquadro/Zaino piccolo per computer 14’/CA3214B2-R_DETT1.jpg", 0, "001AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Piquadro/Zaino piccolo per computer 14’/CA3214B2-R_DETT10.jpg", 0, "001AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Piquadro/Zaino piccolo per computer 14’/CA3214B2-R_DETT2.jpg", 0, "001AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Piquadro/Zaino piccolo per computer 14’/CA3214B2-R_DETT3.jpg", 0, "001AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Piquadro/Zaino piccolo per computer 14’/CA3214B2-R_DETT8.jpg", 0, "001AAA");

/*MOLESKINE*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Moleskine/Precious & Ethical/gtin_8056999271305_01.png", 1, "000AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Moleskine/Precious & Ethical/gtin_8056999271305_02.png", 0, "000AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Moleskine/Precious & Ethical/gtin_8056999271305_03.png", 0, "000AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Moleskine/Precious & Ethical/gtin_8056999271305_04.png", 0, "000AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Moleskine/Precious & Ethical/gtin_8056999271305_06.png", 0, "000AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Moleskine/Precious & Ethical/gtin_8056999271305_08.png", 0, "000AAA");

/*EASTPACK*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Eastpack/Padded Pak’R/EK000620_9J4_1.jpg", 1, "004AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Eastpack/Padded Pak’R/EK000620_9J4_ALT001_1.jpg", 0, "004AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Eastpack/Padded Pak’R/EK000620_9J4_ALT002_1.jpg", 0, "004AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Eastpack/Padded Pak’R/EK000620_9J4_ALT003_1.jpg", 0, "004AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Eastpack/Padded Pak’R/EK000620_9J4_ALT004_1.jpg", 0, "004AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Eastpack/Padded Pak’R/EK000620_9J4_ALT005_1.jpg", 0, "004AAA");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Zaino/Eastpack/Padded Pak’R/EK000620_9J4_ALT006_1.jpg", 0, "004AAA");

/*SCIARPE E CAPPELLI*/
/*GUCCI*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Gucci/Sciarpa In Lana Cashmere con Incrocio GG/1.jpg", 1, "002AAB");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Gucci/Sciarpa In Lana Cashmere con Incrocio GG/2.jpg", 0, "002AAB");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Gucci/Sciarpa In Lana Cashmere con Incrocio GG/3.jpg", 0, "002AAB");

/*TOMMY HILFIGER CAPPELLO*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Tommy Hilfiger/Cappello da Baseball con Bandierina/1.jpg", 1, "000AAB");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Tommy Hilfiger/Cappello da Baseball con Bandierina/2.jpg", 0, "000AAB");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Tommy Hilfiger/Cappello da Baseball con Bandierina/3.jpg", 0, "000AAB");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Tommy Hilfiger/Cappello da Baseball con Bandierina/4.jpg", 0, "000AAB");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Tommy Hilfiger/Cappello da Baseball con Bandierina/5.jpg", 0, "000AAB");

/*TOMMY HILFIGER SCIARPA*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Tommy Hilfiger/Sciarpa Hilfiger Monotype/1.jpg", 1, "001AAB");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Tommy Hilfiger/Sciarpa Hilfiger Monotype/2.jpg", 0, "001AAB");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Sciarpe e Cappelli/Tommy Hilfiger/Sciarpa Hilfiger Monotype/3.jpg", 0, "001AAB");
/*PORTAFOGLIO*/

/*PIQUADRO*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Portafoglio/Piquadro/Portafoglio uomo tascabile con porta monete/1.jpg", 0, "003AAC");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Portafoglio/Piquadro/Portafoglio uomo tascabile con porta monete/2.jpg", 1, "003AAC");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Portafoglio/Piquadro/Portafoglio uomo tascabile con porta monete/3.jpg", 0, "003AAC");
/*Borselli e Marsupi*/

/*Calvin Klein*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Calvin Klein/Borsa Reporter A Tracolla Con Logo/1.jpg", 1, "004AAD");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Calvin Klein/Borsa Reporter A Tracolla Con Logo/2.jpg", 0, "004AAD");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Calvin Klein/Borsa Reporter A Tracolla Con Logo/3.jpg", 0, "004AAD");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Calvin Klein/Borsa Reporter A Tracolla Con Logo/4.jpg", 0, "004AAD");
/*CINTURE*/

/*GUCCI*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Cintura/Gucci/CINTURA REVERSIBILE GG MARMONT/1.jpg", 1, "000AAE");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Cintura/Gucci/CINTURA REVERSIBILE GG MARMONT/2.jpg", 0, "000AAE");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Cintura/Gucci/CINTURA REVERSIBILE GG MARMONT/3.jpg", 0, "000AAE");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Cintura/Gucci/CINTURA REVERSIBILE GG MARMONT/4.jpg", 0, "000AAE");
/*BORSE*/

/*ARMANI*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Armani/Borsa a spalla in lino intrecciato e pelle/1.jpg", 1, "003AAF");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Armani/Borsa a spalla in lino intrecciato e pelle/2.jpg", 0, "003AAF");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Armani/Borsa a spalla in lino intrecciato e pelle/3.jpg", 0, "003AAF");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Armani/Borsa a spalla in lino intrecciato e pelle/4.jpg", 0, "003AAF");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Marsupi e Borselli/Armani/Borsa a spalla in lino intrecciato e pelle/5.jpg", 0, "003AAF");
/*ACCESSORI*/

/*CARPISA*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Uomo/Accessori/Carpisa/Portachiavi - Portachiavi New/1.jpg", 1, "000AAG");
/*VIAGGI*/
/*INSERIMENTO ACCESSORI DA VIAGGIO*/

/*POCHETTE DIORTRAVEL CON CERNIERA*/
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('S5440UTEU_M928', 'Dior', 'Pochette DiorTravel con cerniera', 530.00, 'Accessori Da Viaggio', 03,
'Questa pochette DiorTravel è un accessorio pratico e minimalista. Realizzata in tessuto tecnico blu, presenta il motivo Toile de Jouy Reverse, una rivisitazione a colori invertiti della classica fantasia Dior. Impreziosita dalla firma Christian Dior Paris, è abbastanza capiente da poter custodire tutto l’indispensabile. Può essere portata a mano o riposta in una borsa, ed è perfetta da abbinare alle altre creazioni Toile de Jouy Reverse. Firma Christian Dior Paris sul davanti.Made in Italy <br>
<ul>
  <li><b> Dimensioni:</b> 27,5 x 21,5 cm (lunghezza x altezza)</li>
</ul>',
2024, '2024-04-16', 0, 10, 22);

/* MONO SILVER WASHBAG UNISEX - Accessorio da viaggio */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('C1854H03O-Q11', 'Calvin Klein', 'Mono Silver Washbag Unisex', 59.90, 'Accessori Da Viaggio', 03,
'<ul>
  <li><b>Materiale: </b> Poliestere</li>
  <li><b>Materiale esterno:</b> Poliestere</li>
  <li><b>Fodera:</b> Poliestere</li>
  <li><b>Materiale:</b> Tessuto</li>
</ul>',
2024, '2024-04-20', 0, 5, 22);

/* HERITAGE ROUND DUFFLE UNISEX - Accessorio da viaggio */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('TOB54H06R-Q11', 'Tommy Hilfigher', 'Heritage Round Duffle Unisex', 117.00, 'Accessori da Viaggio', 03,
'<ul>
    <li><b>Materiale esterno:</b> Poliestere</li>
   <li><b>Colore:</b> Nero</li>
    <li><b>Materiale della fodera:</b> Poliestere</li>
    <li><b>Scomparti:</b> Scomparto interno spazioso, Tasche anteriori</li>
    <li><b>Chiusura:</b> Cerniera</li>
    <li><b>Fantasia:</b> Monocromo</li>
    <li><b>Taglia e fit</b></li>
    <li><b>Altezza:</b> 29 cm nella taglia One Size</li>
    <li><b>Lunghezza:</b> 46 cm nella taglia One Size</li>
    <li><b>Ampiezza:</b> 29 cm nella taglia One Size</li>
    <li><b>Manico:</b> 21 cm nella taglia One Size</li>
    <li><b>Standard del prodotto</b></li>
    <li><b>Materiale riciclato</b></li>
    <li><b>Materiale esterno:</b> 100% materiale riciclato</li>
</ul>',
2024, '2024-04-16', 10, 10, 22);

/*BEAUTY-GOTECH GREEN BEAUTY*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('VVA65601942', 'Carpisa', 'Beauty - Gotech Green Beauty', 49.95, 'Accessori da Viaggio', 03,
'Beauty Gotech® è realizzato con materiale ultra resistente progettato dal centro R&S CARPISA e dotato di superficie anti-graffio. Dispone di una tracolla staccabile. <br>
<ul>
    <li><b>Materiale:</b> ABS/Policarbonato </li>
   <li><b>Colore:</b> Avion</li>
    <li><b> Made in: </b> Cina</li>
    <li><b> Dimensioni (cm):</b> 32.5 x 26 x 18 </li>
</ul>',
2022, '2024-04-16', 0, 10, 22);


/* INSERIMENTO ZAINI */

/*ZAINO – JUMP GP*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('VBC04402444', 'Carpisa', 'Zaino - Jump GP Go', 99.95, 'Zaini da Viaggio', 03,
'Borsone-Zaino della linea Jump Go by Carpisa realizzato in materiali performanti e tecnici con contrasti materici e dettagli in contrasto di colore. Il modello, dal design forte e deciso sfrutta al meglio tutti gli spazi e scomparti, l’interno è strutturato con cinghie ferma abiti, vano per pc o tablet fino a 17’, numerose tasche esterne, schienale con rivestimento in rete per conferire una maggiore traspirabilità, fascia per aggancio a trolley e spallacci imbottiti regolabili e removibili. Ultraccessoriato con divisorio regolabile e necessaire staccabile. Zaino perfetto per viaggiare in totale comfort.<br>
<ul>
    <li><b>Linea:</b> JUMP GO</li>
    <li><b>Materiale:</b> Tessuto </li>
    <li><b>Colore:</b> Nero</li>
    <li><b> Made in: </b> Cina</li>
    <li><b> Dimensioni (cm):</b> 32 x 50 x 18 </li>
</ul>',
2024, '2024-04-16', 0, 10, 22);



/*URBAN TRACK -ZAINO 14*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('147626-A029', 'American Tourister', 'Urban Track - Zaino 14', 79.90, 'Zaini da viaggio', 03,
'<ul>
<li><b>Garanzia:</b> Garanzia legale</li>
<li><b>Modello:</b> Zaino</li>
<li><b>Materiale:</b> Fabbricati a partire da Poliestere rPet con 17 bottiglie riciclate in PET usando la tecnologia Recyclex™</li>
<li><b>Colore:</b> Verdigris</li>
<li><b>Dimensione:</b> 40 x 25 x 20 cm</li>
<li><b>Volume:</b> 24 L</li>
<li><b>Peso:</b> 0.5 kg</li>
<li><b>Categoria:</b> Morbido</li>
<li><b>Cerniere:</b> Sì</li>
<li><b>Maniglie:</b> Manigli(a)(e) superior(e)(i)</li>
<li><b>Smart Sleeve:</b> Sì</li>
<li><b>Spallacci:</b> Spallacci ergonomici</li>
<li><b>Bagaglio a mano:</b> Sì</li>
<li><b>Porta bottiglie:</b> Sì</li>
<li><b>Logo:</b> Sul davanti</li>
<li><b>Cinghie fermabiti:</b> Nel comparto inferiore</li>
<li><b>Comparto porta laptop:</b> Sì</li>
<li><b>Dimensioni dello schermo:</b> 14</li>
<li><b>Organizzazione interna:</b> Sì</li>
</ul>',
 2024, '2024-04-13', 0, 10, 22);

/*SOJOURN PORTER 65L*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('O8D2401', 'Osprey', 'Sojourn Porter 65L', 220.00, 'Zaini da Viaggio', 03,
'Ideale per le escursioni più lunghe e le avventure di tutti i tipi, il Sojourn Porter 65 offre una maggiore capienza e un’organizzazione pratica per permetterti di accedere al contenuto quando sei in movimento. Lo schienale AirScape™ ti mantiene al fresco e all’asciutto durante tutto il viaggio. Le pareti laterali imbottite proteggono il contenuto durante i viaggi in aereo, in treno o in automobile. Le cinghie StraightJacket comprimono l’interno per massimizzare lo spazio e migliorare l’ergonomia. Puoi estrarre l’imbracatura e la cintura in vita a scomparsa per trasportarlo come uno zaino, o riporle per proteggerle. Realizzato con tessuti durevoli, così potrai contare sulla longevità di questo zaino per anni. <br>
<ul>
<li><b>Taglia unica</b></li>
<li><b>Colore</b> koseret green</li>
<li><b>Volume:</b> 65 L</li>
<li><b>Dimensioni:</b> 48H X 45W X 39D CM</li>
<li><b>Peso:</b> 1.85 KG</li>
<li><b>Tessuto principale: </b> Approvato bluesign®, 100% poliestere riciclato 200D, trattamento DWR senza PFAS</li>
<li><b>Tessuto in basso</b>100% poliestere balistico riciclato 1680D, trattamento DWR senza PFAS</li>
</ul>', 2024, '2024-04-16', 0, 10, 22);

/* BOREALIS CLASSIC – ZAINO DA VIAGGIO*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('TH344E013-Q11', 'The North Face', 'Borealis Classic - Zaino da viaggio', 105.99, 'Zaini da viaggio', 03,
'<ul>
    <li><b>Composizione e istruzioni di lavaggio</b></li>
    <li><b>Materiale esterno:</b> Nylon</li>
    <li><b>Materiale della fodera:</b> Tessuto</li>
    <li><b>Colore: </b> Black/asphalt grey </li>
    <li><b>Tipo di sport:</b> Outdoor, Training, Trekking urbano, Sci alpino</li>
    <li><b>Extra:</b> Compartimento per portatile 15 pollici, Possibilità di agganciare il casco</li>
    <li><b>Cinture:</b> Cintura altezza busto, Bretelle rinforzate, Cintura removibile</li>
    <li><b>Chiusura:</b> Cerniera</li>
    <li><b>Apertura:</b> Apertura frontale</li>
    <li><b>Fantasia:</b> Stampa</li>
    <li><b>Sistema di idratazione:</b> Compatibile</li>
    <li><b>Volume:</b> 29 l nella taglia One Size</li>
    <li><b>Altezza:</b> 50 cm nella taglia One Size</li>
    <li><b>Lunghezza:</b> 34.5 cm nella taglia One Size</li>
    <li><b>Lunghezza schienale:</b> Corto (40-49 cm)</li>
    <li><b>Ampiezza:</b> 22 cm nella taglia One Size</li>
</ul>', 2024, '2024-04-16', 0, 10, 22);

/* PRO-DLX 6 */
INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('151779-1090', 'Samsonite', 'PRO-DLX 6', 280.00, 'Zaini da viaggio', 03,
'<ul>
    <li><b>Porta USB:</b> Sì</li>
    <li><b>Garanzia:</b> Garanzia legale</li>
    <li><b>Modello:</b> Zaino</li>
    <li><b>Materiale:</b> Exterior: Nylon balistico / Interior: 100% Poliestere riciclato (RPET)</li>
    <li><b>Colore:</b> Blu</li>
    <li><b>Dimensione:</b> 45 x 35 x 20 cm</li>
    <li><b>Grandezza:</b> Bagaglio a mano</li>
    <li><b>Volume:</b> 26.5 L</li>
    <li><b>Peso:</b> 1.3 kg</li>
    <li><b>Categoria:</b> Morbido</li>
    <li><b>Cerniere:</b> Sì</li>
    <li><b>Maniglie:</b> Manigli(a)(e) superior(e)(i)</li>
    <li><b>Tasche esterne:</b> 2 tasche frontali</li>
    <li><b>Smart Sleeve:</b> Sì</li>
    <li><b>Spallacci:</b> Spallacci ergonomici</li>
    <li><b>Porta bottiglie:</b> 2 portabottiglia</li>
    <li><b>Logo:</b> Sul davanti</li>
    <li><b>Resistente All’acqua:</b> Sì</li>
    <li><b>Underseater:</b> Sì</li>
    <li><b>Scomparto principale:</b> Sì</li>
    <li><b>Divisorio:</b> Sì</li>
    <li><b>Comparto porta laptop:</b> Sì</li>
    <li><b>Dimensioni dello schermo:</b> 15.6"</li>
    <li><b>Tasca per tablet:</b> Sì</li>
    <li><b>Portachiavi:</b> Sì</li>
    <li><b>Tasca di plastica:</b> Sì</li>
    <li><b>RFID:</b> La tasca con protezione da RFID mette al riparo da frodi su pagamenti e furti d’identità, grazie al materiale di blocco RFID posizionato tra lo strato esterno del prodotto e la fodera interna.</li>
    <li><b>Dimensioni dello schermo del tablet:</b> 10.5"</li>
    <li><b>Sistema Easy Pass:</b> Sì</li>
    <li><b>Organizzazione interna:</b> Sì</li>
    <li><b>Cinghie elastiche fermabiti:</b> Sì</li>
</ul>', 2024, '2024-04-16', 0, 10, 22);

/* INSERIMENTO VALIGIE */

/* SOUNDBOX TROLLEY – Trolley*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('AT851H00K-I11', 'American Tourister', 'Soundbox Trolley', 155.00, 'Valigie', 03,  
'<ul>
    <li><b>Colore:</b> lilla</li>
    <li><b>Dettagli prodotto</b></li>
    <li><b>Chiusura:</b> Cerniera</li>
    <li><b>Fantasia:</b> Monocromo</li>
    <li><b>Dettagli:</b> Cerniera lampo a due direzioni</li>
    <li><b>Volume:</b> 97 l nella taglia One Size</li>
    <li><b>Peso:</b> 4200 g</li>
    <li><b>Altezza:</b> 77 cm nella taglia One Size</li>
    <li><b>Lunghezza:</b> 51.5 cm nella taglia One Size</li>
    <li><b>Ampiezza:</b> 32.5 cm nella taglia One Size</li>
</ul>', 2024, '2024-04-16', 0, 10, 22); 


/* GOTECH GREEN PLUS */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('VAA505MN942', 'Carpisa', 'Gotech Green Plus', 149.95, 'Valigie', 03,  
'La linea vanta un upgrade di qualità e sposa a pieno la filosofia GREEN ORIENTED.
Carpisa Gotech Green è realizzata con materiale ultra resistente e composto da un mix all’80% di materiali provenienti da riciclo. La fodera interna è in 100% materiale riciclato.
Il bagaglio è dotato del CARPISA QR-GO: nuovo Sistema di comunicazione e accesso a vari servizi, fruibili in maniera semplice ed immediata.
Garanzia 10 anni sul materiale e, grande novità, estesa anche sulle doppie ruote removibili brevettate, ultra-silenziose ed innovative.
Chiusura con lucchetto TSA. <br> 
<ul>
    <li><b>Linea:</b> GOTECH GREEN</li>
    <li><b>Materiale:</b> CARPISA GOTECH</li>
    <li><b>Colore:</b> Avion</li>
    <li><b>Capacità (L):</b> 60</li>
    <li><b>Tipologia:</b> RIGIDO</li>
    <li><b>Taglia:</b> Trolley M</li>
    <li><b>Caratteristiche Speciali:</b> Green Oriented</li>
    <li><b>Chiusura:</b> TSA</li>
    <li><b>Ruote:</b> 4</li>
    <li><b>Made in:</b> Cina</li>
    <li><b>Collezione:</b> Continuativo 2022</li>
    <li><b>Espandibile:</b> SI</li>
    <li><b>Dimensioni senza ruote e carrello (cm):</b> 40.5 x 60.5 x 26</li>
    <li><b>Dimensioni con ruote e carrello (cm):</b> 44 x 68 x 26</li>
    <li><b>Peso (kg):</b> 3.7</li>
</ul>', 2024, '2024-04-16', 0, 10, 22); 

/* INSERIMENTO BORSONI DA VIAGGIO */

/* BORSONE-LUCKY TRAVEL BAGS */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('BSC21402444', 'Carpisa', 'Borsone - Lucky Travel Bags', 59.95, 'Borsoni da Viaggio', 03,  
'Borsone della linea Lucky Travel Bags by Carpisa realizzato in similpelle con stampa all over.Il modello è dotato di chiusura con zip, ampi manici e una tracollina regolabile e removibile. Pratico, capiente e leggero è ideale per viaggiare. <br> 
<ul>
    <li><b>Linea:</b> LUCKY TRAVEL BAGS</li>
    <li><b>Colore:</b> Ardesia/Multicolore</li>
    <li><b>Materiale:</b> Sintetico</li>
    <li><b>Made in:</b> Cina</li>
    <li><b>Collezione:</b> Primavera/Estate 2024</li>
</ul>', 2024, '2024-04-17', 0, 10, 22); 	

/* ESSENTIAL DUFFLE UNISEX - Borsa da viaggio*/

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('C1854H024-Q11', 'Calvin Klein', 'Essential Duffle Unisex', 71.92, 'Borsoni da Viaggio', 03,  
'<ul>
    <li><b>Colore :</b> Colore: black</li>
    <li><b>Materiale esterno:</b> Poliestere</li>
    <li><b>Chiusura:</b> Cerniera</li>
    <li><b>Fantasia:</b> Monocromo</li>
    <li><b>Codice articolo:</b> C1854H024-Q11</li>
    <li><b>Altezza:</b> 26 cm nella taglia One Size</li>
    <li><b>Lunghezza:</b> 46 cm nella taglia One Size</li>
    <li><b>Ampiezza:</b> 17 cm nella taglia One Size</li>
    <li><b>Manico:</b> 19 cm nella taglia One Size</li>
</ul>', 2024, '2024-04-17', 20, 10, 22); 	

/* INSERIMENTO BAGAGLI A MANO */

/* LUSTRE - Bagaglio a mano */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('GU151H448-A11', 'Guess', 'Lustre - Bagaglio a mano', 136.00, 'Bagagli a mano', 03,  
'<ul>
    <li><b>Colore:</b> bianco</li>
    <li><b>Materiale esterno:</b> ABS</li>
    <li><b>Chiusura:</b> Cerniera</li>
    <li><b>Fantasia:</b> Monocromo</li>
    <li><b>Dettagli:</b> Cerniera lampo a due direzioni</li>
    <li><b>Codice articolo:</b> GU151H448-A11</li>
    <li><b>Altezza:</b> 45.72 cm nella taglia One Size</li>
    <li><b>Lunghezza:</b> 31.75 cm nella taglia One Size</li>
    <li><b>Ampiezza:</b> 24.13 cm nella taglia One Size</li>
</ul>', 
2024, '2024-04-19', 15, 10, 22); 	

/* BUGATTI – Bagaglio a mano */

INSERT INTO Prodotto (ID, Marca, Nome, Prezzo, Tipologia, IDCategoria, Descrizione, AnnoCollezione, DataInserimento, Sconto, Disponibilita, Iva) 
VALUES ('BU154H03T-Q11', 'Bugatti', 'Bugatti - Bagaglio a Mano', 136.00, 'Bagagli a mano', 03,  
'<ul>
    <li><b>Colore:</b> Nero</li>
    <li><b>Materiale esterno:</b> Tessuto</li>
    <li><b>Dettagli prodotto</b></li>
    <li><b>Chiusura:</b> Cerniera</li>
    <li><b>Fantasia:</b> Monocromo</li>
    <li><b>Dettagli:</b> Cerniera lampo a due direzioni</li>
    <li><b>Altezza:</b> 64 cm nella taglia One Size</li>
    <li><b>Lunghezza:</b> 44 cm nella taglia One Size</li>
    <li><b>Ampiezza:</b> 29 cm nella taglia One Size</li>
</ul>',
2024, '2024-04-19', 15, 10, 22); 	

/*IMMAGINI*/
/*POCHETTE DIORTRAVEL CON CERNIERA*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Dior/Pochette DiorTravel con cerniera/1.jpg", 1, "S5440UTEU_M928");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Dior/Pochette DiorTravel con cerniera/2.jpg", 0, "S5440UTEU_M928");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Dior/Pochette DiorTravel con cerniera/3.jpg", 0, "S5440UTEU_M928");

/* MONO SILVER WASHBAG UNISEX - Accessorio da viaggio */

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Calvin Klein/Mono Silver Washbag Unisex/1.jpg", 1, "C1854H03O-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Calvin Klein/Mono Silver Washbag Unisex/2.jpg", 0, "C1854H03O-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Calvin Klein/Mono Silver Washbag Unisex/3.jpg", 0, "C1854H03O-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Calvin Klein/Mono Silver Washbag Unisex/4.jpg", 0, "C1854H03O-Q11");

/* HERITAGE ROUND DUFFLE UNISEX - Accessorio da viaggio*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Tommy Hilfigher/Heritage Round Duffle Unisex/4.jpg", 1, "TOB54H06R-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Tommy Hilfigher/Heritage Round Duffle Unisex/1.jpg", 0, "TOB54H06R-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Tommy Hilfigher/Heritage Round Duffle Unisex/2.jpg", 0, "TOB54H06R-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Tommy Hilfigher/Heritage Round Duffle Unisex/3.jpg", 0, "TOB54H06R-Q11");

/*BEAUTY-GOTECH GREEN BEAUTY*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Carpisa/Beauty - Gotech Green Beauty/2.jpg", 1, "VVA65601942");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Carpisa/Beauty - Gotech Green Beauty/1.jpg", 0, "VVA65601942");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Carpisa/Beauty - Gotech Green Beauty/3.jpg", 0, "VVA65601942");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Accessori Da Viaggio/Carpisa/Beauty - Gotech Green Beauty/4.jpg", 0, "VVA65601942");

/*ZAINO – JUMP GP*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Carpisa/Zaino - Jump GP Go/1.jpg", 1, "VBC04402444");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Carpisa/Zaino - Jump GP Go/2.jpg", 0, "VBC04402444");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Carpisa/Zaino - Jump GP Go/3.jpg", 0, "VBC04402444");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Carpisa/Zaino - Jump GP Go/4.jpg", 0, "VBC04402444");

/*URBAN TRACK -ZAINO 14*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/American Tourister/Urban Track - Zaino 14/3.jpg", 1, "147626-A029");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/American Tourister/Urban Track - Zaino 14/1.jpg", 0, "147626-A029");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/American Tourister/Urban Track - Zaino 14/2.jpg", 0, "147626-A029");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/American Tourister/Urban Track - Zaino 14/4.jpg", 0, "147626-A029");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/American Tourister/Urban Track - Zaino 14/5.jpg", 0, "147626-A029");

/*SOJOURN PORTER 65L*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Osprey/Sojourn Porter 65L/1.jpg", 1, "O8D2401");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Osprey/Sojourn Porter 65L/2.jpg", 0, "O8D2401");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Osprey/Sojourn Porter 65L/3.jpg", 0, "O8D2401");

/* BOREALIS CLASSIC – ZAINO DA VIAGGIO*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/The North Face/Borealis Classic - Zaino da viaggio/3.jpg", 1, "TH344E013-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/The North Face/Borealis Classic - Zaino da viaggio/1.jpg", 0, "TH344E013-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/The North Face/Borealis Classic - Zaino da viaggio/2.jpg", 0, "TH344E013-Q11");

/* PRO-DLX 6*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Samsonite/PRO-DLX 6/1.jpg", 1, "151779-1090");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Samsonite/PRO-DLX 6/2.jpg", 0, "151779-1090");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Samsonite/PRO-DLX 6/3.jpg", 0, "151779-1090");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Samsonite/PRO-DLX 6/4.jpg", 0, "151779-1090");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Zaini da Viaggio/Samsonite/PRO-DLX 6/5.jpg", 0, "151779-1090");

/*INSERIMENTO VALIGIE*/

/* SOUNDBOX TROLLEY – Trolley*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Valigie/American Tourister/Soundbox Trolley/1.jpg", 0, "AT851H00K-I11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Valigie/American Tourister/Soundbox Trolley/2.jpg", 1, "AT851H00K-I11");

/* GOTECH GREEN PLUS */ 

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Valigie/Carpisa/Gotech Green Plus/1.jpg", 1, "VAA505MN942");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Valigie/Carpisa/Gotech Green Plus/2.jpg", 0, "VAA505MN942");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Valigie/Carpisa/Gotech Green Plus/3.jpg", 0, "VAA505MN942");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Valigie/Carpisa/Gotech Green Plus/4.jpg", 0, "VAA505MN942");

/*INSERIMENTO BORSONI DA VIAGGIO */

/*BORSONE-LUCKY TRAVEL BAGS*/

INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Borsoni da Viaggio/Carpisa/Borsone - Lucky Travel Bags/1.jpg", 1, "BSC21402444");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Borsoni da Viaggio/Carpisa/Borsone - Lucky Travel Bags/2.jpg", 0, "BSC21402444");

/* ESSENTIAL DUFFLE UNISEX - Borsa da viaggio*/
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Borsoni da Viaggio/Calvin Klein/Essential Duffle Unisex/1.jpg", 1, "C1854H024-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Borsoni da Viaggio/Calvin Klein/Essential Duffle Unisex/2.jpg", 0, "C1854H024-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Borsoni da Viaggio/Calvin Klein/Essential Duffle Unisex/3.jpg", 0, "C1854H024-Q11");

/*INSERIMENTO BAGAGLI A MANO*/

/* LUSTRE - Bagaglio a mano */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Bagagli a mano/Guess/Lustre - Bagaglio a mano/3.jpg", 1, "GU151H448-A11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Bagagli a mano/Guess/Lustre - Bagaglio a mano/1.jpg", 0, "GU151H448-A11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Bagagli a mano/Guess/Lustre - Bagaglio a mano/2.jpg", 0, "GU151H448-A11");

/*BUGATTI – Bagaglio a mano */
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Bagagli a mano/Bugatti/Bugatti - Bagaglio a Mano/5.jpg", 1, "BU154H03T-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Bagagli a mano/Bugatti/Bugatti - Bagaglio a Mano/1.jpg", 0, "BU154H03T-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Bagagli a mano/Bugatti/Bugatti - Bagaglio a Mano/2.jpg", 0, "BU154H03T-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Bagagli a mano/Bugatti/Bugatti - Bagaglio a Mano/3.jpg", 0, "BU154H03T-Q11");
INSERT INTO Immagine (Nome, Copertina, IDProdotto) VALUES("img/prodotti/Viaggi/Bagagli a mano/Bugatti/Bugatti - Bagaglio a Mano/4.jpg", 0, "BU154H03T-Q11");
