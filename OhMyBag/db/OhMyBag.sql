CREATE SCHEMA OhMyBag;

USE OhMyBag;

CREATE TABLE Utente(
Username			varchar(100) Primary key,
Cf					varchar(16)  not null,
Email				varchar(100) not null,
Password			varchar(1000) not null,
Telefono			varchar(10)	 not null,
Nome 				varchar(100) not null,
Cognome 			varchar(100) not null,
Admin				boolean 	 not null,
DataNascita			date 		 not null,
IndirizzoSpedizione varchar(500) not null
);

CREATE TABLE Carta(
Id 				int 		 Primary key auto_increment,
Username		varchar(100) not null,
CVV				int			 check(CVV>=0)not null,
Circuito		varchar(100) not null,
DataScadenza	date 		 not null,
NumeroCarta 	varchar(1000)  not null,
foreign key (Username) references Utente(Username) on delete cascade
);

CREATE TABLE Ordine(
Id 						int 		 	Primary key auto_increment,
PrezzoTotale			float		 	check(PrezzoTotale>=0)not null,
Destinatario			varchar(100) 	not null,
IndirizzoDiSpedizione	varchar(100) 	not null,
NoteCorriere			varchar(1000)	not null,
MetodoDiSPedizione		varchar(20) 	check(MetodoDiSpedizione IN ("Standard", "Premium"))not null,
NumeroTracking			varchar(100) 	not null,
Data					date 		 	not null,
Circuito				varchar(100) 	check(Circuito IN ("Mastercard", "Visa"))not null,
ConfezioneRegalo		boolean 	 	not null,
NumeroCarta				varchar(1000) 	not null,
Username				varchar(100) 	not null,
foreign key (Username) references Utente(Username) on delete cascade
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
    Sconto 			int 		  check(Sconto>=0 AND Sconto<100),
    Disponibilita 	int 		  check(Disponibilita>=0),
    Iva             int           not null,
    Eliminato		boolean		  not null DEFAULT false,
    foreign key (IDCategoria) references Categoria(ID)
);

CREATE TABLE Composizione(
	IDOrdine 	int 			not null,
    IDProdotto  varchar(100) 	not null,
    Prezzo 		float 			check(Prezzo>=0)not null,
    Quantita 	int 			check(Quantita>=0)not null,
    IVA 		float 			check(IVA>=0)not null,
    foreign key (IDOrdine) references Ordine(ID) on delete cascade,
    foreign key (IDProdotto) references Prodotto(ID),
    primary KEY(IDOrdine,IDProdotto)
);

CREATE TABLE Immagine(
	Nome 	   varchar(500) 	Primary key,
    Copertina  boolean			not null,
    IDProdotto varchar(100) 	not null,
    foreign key (IDProdotto) references Prodotto(ID) on delete cascade
);