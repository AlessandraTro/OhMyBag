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
CVV				int			 not null,
Circuito		varchar(100) not null,
DataScadenza	date 		 not null,
NumeroCarta 	int 		 not null,
foreign key (Username) references Utente(Username)
);

CREATE TABLE Ordine(
Id 						int 		 Primary key,
PrezzoTotale			float		 not null,
Destinatario			varchar(100) not null,
MetodoDiPagamento		varchar(100) not null,
IndirizzoDiSpedizione	varchar(100) not null,
NoteCorriere			varchar(500) not null,
MetodoDiSPedizione		varchar(100) not null,
NumeroTracking			varchar(100) not null,
Data					date 		 not null,
Circuito				varchar(100) not null,
ConfezioneRegalo		boolean 	 not null,
NumeroCarta				int 		 not null,
Username				varchar(100) not null,
foreign key (Username) references Utente(Username)
);

CREATE TABLE Categoria(
	ID 	 int 			Primary Key,
    Nome varchar(100)	not null    /*Donna, Uomo, Viaggi*/
);

CREATE TABLE Prodotto(
	ID 				varchar(100)  Primary Key,
    Marca 			varchar(100)  not null,
    Nome 			varchar(100)  not null,
    Prezzo 			float 		  not null,
    Tipologia 		varchar(100)  not null,
    IDCategoria 	int 		  not null,
    Descrizione 	varchar(2000) not null,
    AnnoCollezione  int 		  not null,
    DataInserimento Date 		  not null,
    Sconto 			int,
    Disponibilita 	int, 
    foreign key (IDCategoria) references Categoria(ID)
);

CREATE TABLE Composizione(
	IDOrdine 	int 			not null,
    IDProdotto  varchar(100) 	not null,
    Prezzo 		float 			not null,
    Quantita 	int 			not null,
    IVA 		float 			not null,
    foreign key (IDOrdine) references Ordine(ID),
    foreign key (IDProdotto) references Prodotto(ID)
);

CREATE TABLE Immagine(
	Nome 	   varchar(100) 	Primary key,
    Copertina  boolean,
    IDProdotto varchar(100) 	not null,
    foreign key (IDProdotto) references Prodotto(ID)
);