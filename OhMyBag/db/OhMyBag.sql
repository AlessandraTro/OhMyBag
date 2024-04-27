CREATE SCHEMA OhMyBag;

USE OhMyBag;

CREATE TABLE Utente(
Username			varchar(100) Primary key,
Cf					varchar(16)  not null,
Email				varchar(100) not null,
Password			varchar(100) not null,
Telefono			int 		 not null,
Nome 				varchar(100) not null,
Cognome 			varchar(100) not null,
Admin				boolean 	 not null,
DataNascita			date 		 not null,
IndirizzoSpedizione varchar(100) not null
);

CREATE TABLE Carta(
Id 				int 		 Primary key,
Username		varchar(100) not null,
CVV				int			 check(CVV>=0)not null,
Circuito		varchar(100) not null,
DataScadenza	date 		 not null,
NumeroCarta 	varchar(25)  not null,
foreign key (Username) references Utente(Username)
);

CREATE TABLE Ordine(
Id 						int 		 	Primary key,
PrezzoTotale			float		 	check(PrezzoTotale>=0)not null,
Destinatario			varchar(100) 	not null,
MetodoDiPagamento		varchar(100) 	not null,
IndirizzoDiSpedizione	varchar(100) 	not null,
NoteCorriere			varchar(1000)	not null,
MetodoDiSPedizione		varchar(20) 	check(MetodoDiSpedizione IN ("Standard", "Premium"))not null,
NumeroTracking			varchar(100) 	not null,
Data					date 		 	not null,
Circuito				varchar(100) 	not null,
ConfezioneRegalo		boolean 	 	not null,
NumeroCarta				varchar(25) 	not null,
Username				varchar(100) 	not null,
foreign key (Username) references Utente(Username)
);

CREATE TABLE Categoria(
	ID 	 int 			check(ID IN (01,02,03))Primary Key,
    Nome varchar(10)	check(Nome IN ("Donna","Uomo","Viaggi"))not null
);

CREATE TABLE Prodotto(
	ID 				varchar(100)  Primary Key,
    Marca 			varchar(100)  not null,
    Nome 			varchar(100)  not null,
    Prezzo 			float 		  check(Prezzo>=0)not null,
    Tipologia 		varchar(100)  not null,
    IDCategoria 	int 		  check(IDCategoria IN (01,02,03))not null,
    Descrizione 	varchar(3000) not null,
    AnnoCollezione  int 		  check(AnnoCollezione>=1900)not null,
    DataInserimento Date 		  not null,
    Sconto 			int 		  check(Sconto>=0 && Sconto<100),
    Disponibilita 	int 		  check(Disponibilita>=0),
    foreign key (IDCategoria) references Categoria(ID)
);

CREATE TABLE Composizione(
	IDOrdine 	int 			not null,
    IDProdotto  varchar(100) 	not null,
    Prezzo 		float 			check(Prezzo>=0)not null,
    Quantita 	int 			check(Quantita>=0)not null,
    IVA 		float 			check(IVA>=0)not null,
    foreign key (IDOrdine) references Ordine(ID),
    foreign key (IDProdotto) references Prodotto(ID)
);

CREATE TABLE Immagine(
	Nome 	   varchar(500) 	Primary key,
    Copertina  boolean			not null,
    IDProdotto varchar(100) 	not null,
    foreign key (IDProdotto) references Prodotto(ID) on delete cascade
);