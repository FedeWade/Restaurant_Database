
DROP TABLE IF EXISTS Indirizzo;
CREATE TABLE Indirizzo(
CodiceIndirizzo VARCHAR(20) PRIMARY KEY,
Via VARCHAR(255) NOT NULL,
Città VARCHAR(30) NOT NULL,
Provincia VARCHAR(30) NOT NULL,
Regione VARCHAR(30) NOT NULL
);

INSERT INTO Indirizzo() VALUES
('I01','Via Colombara n. 5','Chioggia','Chioggia','Veneto'),
('I02','Via Roma n. 223','Padova','Padova','Veneto'),
('I03','Via Pigafetta n. 87','Chioggia','Chioggia','Veneto'),
('I04','Via Aldo Moro n. 12','Milano','Milano','Lombardia'),
('I05','Via Ulisse n. 44','Chioggia','Chioggia','Veneto'),
('I06','Via Mauro Conti n. 67','Roma','Roma','Lazio'),
('I07','Via Nicolò Zeno n. 229','Chioggia','Chioggia','Veneto'),
('I08','Via Garibaldi n. 3','Chioggia','Chioggia','Veneto'),
('I09','Via Eremita n. 99','Padova','Padova','Veneto'),
('I10','Via Colombara n. 86','Chioggia','Chioggia','Veneto');

DROP TABLE IF EXISTS Dipendente;
CREATE TABLE Dipendente(
CodiceDipendente VARCHAR(20) PRIMARY KEY,
Nome VARCHAR(20) NOT NULL,
Cognome VARCHAR(20) NOT NULL,
Sesso ENUM('F','M') NOT NULL,
Indirizzo VARCHAR(20) NOT NULL,
DataNascita DATE NOT NULL,
DataAssunzione DATE NOT NULL,
Mansione VARCHAR(20) NOT NULL,
Stipendio DECIMAL(7,2) UNSIGNED NOT NULL,
IBAN VARCHAR(35) NOT NULL,
NumeroTelefono VARCHAR(20) NOT NULL,
FOREIGN KEY(Indirizzo) REFERENCES Indirizzo(CodiceIndirizzo)
);

INSERT INTO Dipendente() VALUES
('D01','Federico','Ballarin','M','I01','1996-01-09','2015-10-12','M01','2000.00','3425215896541254','3803803812'),
('D02','Valentina','Bullo','F','I03','1996-10-11','2016-01-12','M02','1800.00','6652215896211254','3247473812'),
('D03','David','Varisco','M','I02','1980-04-07','2015-02-06','M01','2000.00','3654252196541254','3803801214'),
('D04','Alfredo','Bergamasco','M','I05','1970-04-09','2016-08-04','M05','2100.00','9875215896656565','9339653812'),
('D05','Claudia','Scarpa','F','I01','1997-12-02','2017-05-05','M03','1500.00','0000015896541254','3803802145'),
('D06','Gianfranco','Agatea','M','I07','1959-07-12','2014-01-01','M04','3500.00','3656589896541254','5544703812'),
('D07','Jack','Tchamp','M','I09','1991-05-11','2018-04-11','M06','1400.00','8778875896541254','6663803812'),
('D08','Amadio','Verona','M','I05','1996-03-01','2017-06-06','M02','1800.00','1234567896541254','3803888812'),
('D09','Gianni','Marella','M','I08','1978-01-09','2014-10-12','M05','2100.00','3425215896999999','3803803000'),
('D10','Mark','Zuker','M','I10','1996-07-05','2018-02-02','M03','1400.00','3335215896543333','3696369812');

DROP TABLE IF EXISTS Mansione;
CREATE TABLE Mansione(
CodiceMansione VARCHAR(20) PRIMARY KEY,
Descrizione ENUM('caposala','banconiere','cameriere','chef','cuoco','lavapiatti') NOT NULL
);

INSERT INTO Mansione() VALUES
('M01','caposala'),
('M02','banconiere'),
('M03','cameriere'),
('M04','chef'),
('M05','cuoco'),
('M06','lavapiatti');

DROP TABLE IF EXISTS Turno;
CREATE TABLE Turno(
Dipendente VARCHAR(20),
DataInizio DATE,
DataFine DATE NOT NULL,
OraInizio TIME NOT NULL,
OraFine TIME NOT NULL,
PRIMARY KEY(Dipendente, DataInizio),
FOREIGN KEY(Dipendente) REFERENCES Dipendente(CodiceDipendente)
);

INSERT INTO Turno() VALUES
('D01','2018-01-01','2018-01-01','080000','140000'),
('D02','2018-01-03','2018-01-03','090000','150000'),
('D03','2018-01-09','2018-01-09','070000','140000'),
('D07','2018-01-02','2018-01-02','160000','240000'),
('D07','2018-01-12','2018-01-12','150000','220000'),
('D06','2018-01-25','2018-01-25','080000','140000'),
('D09','2018-01-20','2018-01-20','010000','200000'),
('D01','2018-01-08','2018-01-08','080000','140000');


DROP TABLE IF EXISTS Tavolo;
CREATE TABLE Tavolo(
NumeroTavolo TINYINT UNSIGNED PRIMARY KEY,
NumeroPosti TINYINT UNSIGNED NOT NULL,
Descrizione VARCHAR(255) NOT NULL,
Sala ENUM('interna','esterna') NOT NULL
);

INSERT INTO Tavolo() VALUES
('1','4','vicino alla porta di ingresso','interna'),
('2','2','vicino ai bagni','interna'),
('3','6','vicino al bancone','interna'),
('4','4','centro sala','interna'),
('5','4','centro sala','interna'),
('20','6','tavolo riparato','esterna'),
('21','8','esterno vista mare','esterna'),
('60','10','esterno vista mare','esterna'),
('10','4','esterno sala vista fuori','interna');



DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente(
CodiceCliente VARCHAR(20) PRIMARY KEY,
Nome VARCHAR(20) NOT NULL,
Cognome VARCHAR(20) NOT NULL,
NumeroTelefono VARCHAR(20) NOT NULL,
Camping BOOLEAN NOT NULL
);

INSERT INTO Cliente() VALUES
('C01','Roberto','Boscolo','3512658521','0'),
('C02','Paolo','Belva','1212658521','1'),
('C03','Luca','Abete','3500058521','0'),
('C04','Marco','Carbonara','3512658333','0'),
('C05','Alessia','Rei','9999658521','1'),
('C06','Mario','Pasti','3513636327','0'),
('C07','Andrea','Boscolo','4242458521','0'),
('C08','Valeria','Tiozzo','3512658523','0'),
('C09','Massimo','Caenazzo','3444158521','1'),
('C10','Claudia','Conti','47412658591','0');

DROP TABLE IF EXISTS Prenotazione;
CREATE TABLE Prenotazione(
CodicePrenotazione VARCHAR(20) PRIMARY KEY,
Cliente VARCHAR(20) NOT NULL,
Tavolo TINYINT UNSIGNED NOT NULL,
Data DATE NOT NULL,
Ora TIME NOT NULL,
NumeroPersone SMALLINT UNSIGNED NOT NULL,
Nota VARCHAR(255),
FOREIGN KEY(Cliente) REFERENCES Cliente(CodiceCliente),
FOREIGN KEY(Tavolo) REFERENCES Tavolo(NumeroTavolo)
);

INSERT INTO Prenotazione() VALUES
('P01','C02','5','2018-08-27','120000','4','hanno un cane'),
('P02','C06','60','2018-08-28','123000','10','vista mare'),
('P03','C01','3','2018-08-24','130000','4','due sono bambini'),
('P04','C08','1','2018-08-23','120000','2','un bambino'),
('P05','C01','4','2018-08-25','124000','4','portano la torta'),
('P06','C05','2','2018-08-12','200000','4','compleanno'),
('P07','C07','20','2018-08-02','193000','3','hanno due cane'),
('P08','C02','5','2018-08-06','210000','4','compleanno'),
('P09','C02','60','2018-08-21','203000','10','vista mare');

DROP TABLE IF EXISTS Gruppo;
CREATE TABLE Gruppo(
CodiceGruppo VARCHAR(20) PRIMARY KEY,
Nome VARCHAR(20) NOT NULL
);

INSERT INTO Gruppo() VALUES
('G01','bibite'),
('G02','antipasti'),
('G03','primi'),
('G04','secondi'),
('G05','contorni'),
('G06','piatti freddi'),
('G07','dessert');

DROP TABLE IF EXISTS Elementomenù;
CREATE TABLE Elementomenù(
CodiceElemento VARCHAR(20) PRIMARY KEY,
Nome VARCHAR(20) NOT NULL,
Descrizione VARCHAR(255) NOT NULL,
Prezzo Decimal(7,2) NOT NULL,
Gruppo VARCHAR(20) NOT NULL,
FOREIGN KEY(Gruppo) REFERENCES Gruppo(CodiceGruppo)
);

INSERT INTO Elementomenù() VALUES
('E01','CocaCola','bibita frizzante','3.00','G01'),
('E02','bollito misto','misto antipasti di pesce','20.00','G02'),
('E03','spaghetti allo scoglio','spaghetti al sapore di mare','15.00','G03'),
('E04','filetto di branzino','filetto cotto al forno','13.00','G04'),
('E05','insalata mista','verde carore pomodoro','4.00','G05'),
('E06','prosciutto e melone','prosciutto crudo su letto di melone','13.00','G06'),
('E07','tiramisù','fatto in casa','5.00','G07'),
('E08','tagliolini alla granseola','granseola già curata','14.00','G03'),
('E09','grigliata mista','branzino scampi mazzancolle','18.00','G04'),
('E10','affettato misto','misto di affettati su tagliere','17.00','G02');

DROP TABLE IF EXISTS Ordinazione;
CREATE TABLE Ordinazione(
CodiceOrdinazione VARCHAR(20) PRIMARY KEY,
Operatore VARCHAR(20) NOT NULL,
Tavolo TINYINT UNSIGNED NOT NULL,
Data DATE NOT NULL,
Ora TIME NOT NULL,
FOREIGN KEY(Operatore) REFERENCES Dipendente(CodiceDipendente),
FOREIGN KEY(Tavolo) REFERENCES Tavolo(NumeroTavolo)
);

INSERT INTO Ordinazione() VALUES
('O01','D05','1','2018-08-28','124130'),
('O02','D05','60','2018-08-28','125530'),
('O03','D10','1','2018-08-26','134140');

DROP TABLE IF EXISTS DettaglioOrdinazione;
CREATE TABLE DettaglioOrdinazione(
CodiceDettaglio VARCHAR(20) PRIMARY KEY,
Ordinazione VARCHAR(20) NOT NULL,
Elemento VARCHAR(20) NOT NULL,
Quantità SMALLINT UNSIGNED NOT NULL,
Nota VARCHAR(255),
FOREIGN KEY(Ordinazione) REFERENCES Ordinazione(CodiceOrdinazione),
FOREIGN KEY(Elemento) REFERENCES ElementoMenù(CodiceElemento)
);

INSERT INTO DettaglioOrdinazione() VALUES
('DO01','O01','E02','1',''),
('DO02','O01','E01','2','con limone'),
('DO03','O01','E03','1',''),
('DO04','O02','E06','3','ben cotto'),
('DO05','O02','E04','2',''),
('DO06','O03','E07','4',''),
('DO07','O03','E02','3','no capasanta');

DROP TABLE IF EXISTS Pagamento;
CREATE TABLE Pagamento(
CodicePagamento VARCHAR(20) PRIMARY KEY,
Ordinazione VARCHAR(20) NOT NULL,
TipoPagamento ENUM('contanti','elettronico','fattura','bancomat','carta') NOT NULL,
ImportoTotale DECIMAL(7,2) NOT NULL,
Sconto DECIMAL(7,2) NOT NULL,
Dipendente VARCHAR(20) NOT NULL,
FOREIGN KEY(Ordinazione) REFERENCES Ordinazione(CodiceOrdinazione),
FOREIGN KEY(Dipendente) REFERENCES Dipendente(CodiceDipendente)
);

INSERT INTO Pagamento VALUES
('PAY01','O01','contanti','41.00','0','D08'),
('PAY02','O02','elettronico','58.50','6.50','D08'),
('PAY03','O03','bancomat','80.00','0','D02');


DROP TABLE IF EXISTS Fornitore;
CREATE TABLE Fornitore(
CodiceFornitore VARCHAR(20) PRIMARY KEY,
RagioneSociale VARCHAR(30) NOT NULL,
PartitaIVA VARCHAR(15) NOT NULL,
Indirizzo VARCHAR(20) NOT NULL,
NumeroTelefono VARCHAR(20) NOT NULL,
FOREIGN KEY(Indirizzo) REFERENCES Indirizzo(CodiceIndirizzo)
);

INSERT INTO Fornitore() VALUES
('F01','AllFood','12345678','I02','0415542225'),
('F02','De Bei','32145670','I04','0415549999'),
('F03','Bariga','34215678','I01','5555542225'),
('F04','PescaMar','99345677','I06','0015542225'),
('F05','Gnolo','10000678','I09','0999542225');

DROP TABLE IF EXISTS Prodotto;
CREATE TABLE Prodotto(
CodiceProdotto VARCHAR(20) PRIMARY KEY,
Fornitore VARCHAR(20) NOT NULL,
Nome VARCHAR(20) NOT NULL,
Prezzo DECIMAL(7,2) NOT NULL,
Descrizione VARCHAR(255) NOT NULL,
Utilizzo ENUM('sala','cucina','sala/cucina') NOT NULL,
FOREIGN KEY(Fornitore) REFERENCES Fornitore(CodiceFornitore)
);

INSERT INTO Prodotto() VALUES
('PROD01','F02','tovaglie grigie','25.00','100 tovaglie grigie in tessuto','sala'),
('PROD02','F01','salmone','50.00','salmone intero provenienza alaska','cucina'),
('PROD03','F05','detersivo','7.00','detersivo per tutti i tipi di superficie','sala/cucina'),
('PROD04','F04','tovaglie marroni','25.00','100 tovaglie marroni in tessuto','sala'),
('PROD05','F03','stuzzicadenti kimono','2.00','1000 stuzzicadenti di qualità','sala'),
('PROD06','F03','branzino','6.00','branzino piccola taglia provenienza polonia','cucina'),
('PROD07','F02','gamberetti','24.00','1 kg di gamberetti congelati','cucina'),
('PROD08','F05','forchette','31.00','50 forchette modello slim','sala');

DROP TABLE IF EXISTS Ordine;
CREATE TABLE Ordine(
Dipendente VARCHAR(20),
Data DATE,
Prodotto VARCHAR(20),
Quantità SMALLINT UNSIGNED NOT NULL,
PRIMARY KEY(Dipendente, Data, Prodotto),
FOREIGN KEY(Prodotto) REFERENCES Prodotto(CodiceProdotto),
FOREIGN KEY(Dipendente) REFERENCES Dipendente(CodiceDipendente)
);

INSERT INTO Ordine() VALUES
('D01','2018-08-27','PROD08','2'),
('D03','2018-08-25','PROD01','4'),
('D01','2018-08-20','PROD04','2'),
('D06','2018-08-26','PROD06','20'),
('D06','2018-08-26','PROD02','15');



DROP FUNCTION IF EXISTS TotaleOrdinazione;
DELIMITER !!
CREATE FUNCTION TotaleOrdinazione(CO VARCHAR(20)) RETURNS DECIMAL(7,2)
BEGIN
DECLARE Totale DECIMAL(7,2);
SELECT SUM(Quantità*Prezzo) INTO Totale
FROM DettaglioOrdinazione JOIN ElementoMenù ON Elemento=CodiceElemento
WHERE Ordinazione=CO;
IF Totale IS NULL THEN
SET Totale=0;
END IF;
RETURN Totale;
END!!
DELIMITER ;

DROP FUNCTION IF EXISTS TotaleOrdine;
DELIMITER !!
CREATE FUNCTION TotaleOrdine(dip VARCHAR(20), dt DATE, pr VARCHAR(20)) RETURNS DECIMAL(7,2)
BEGIN
DECLARE Totale DECIMAL(7,2);
SELECT SUM(Quantità*Prezzo) INTO Totale
FROM Ordine JOIN Prodotto ON Prodotto=CodiceProdotto
WHERE Dipendente=dip AND Data=dt AND Prodotto=pr;
IF Totale IS NULL THEN
SET Totale=0;
END IF;
RETURN Totale;
END!!
DELIMITER ;

DROP FUNCTION IF EXISTS NuOrdinazioniElemento;
DELIMITER !!
CREATE FUNCTION NuOrdinazioniElemento(NomeE VARCHAR(20), DataI DATE, DataF DATE) RETURNS INTEGER
BEGIN
DECLARE Totale INTEGER;
SELECT SUM(Quantità) INTO Totale
FROM Ordinazione JOIN DettaglioOrdinazione ON CodiceOrdinazione=Ordinazione JOIN ElementoMenù ON Elemento=CodiceElemento
WHERE Nome=NomeE AND DataI <= Data AND DataF >= Data;
IF Totale IS NULL THEN
SET Totale=0;
END IF;
RETURN Totale;
END!!
DELIMITER ;

DROP FUNCTION IF EXISTS TotaleDettaglio;
DELIMITER !!
CREATE FUNCTION TotaleDettaglio(CD VARCHAR(20)) RETURNS DECIMAL(7,2)
BEGIN
DECLARE Totale DECIMAL(7,2);
SELECT Quantità*Prezzo INTO Totale
FROM DettaglioOrdinazione JOIN ElementoMenù ON Elemento=CodiceElemento
WHERE CodiceDettaglio=CD;
IF Totale IS NULL THEN
SET Totale=0;
END IF;
RETURN Totale;
END!!
DELIMITER ;


CREATE OR REPLACE VIEW Query1 AS
SELECT CodiceElemento, nome, SUM(Quantità) AS Ordinazioni, SUM(Quantità*Prezzo) AS TotaleGuadagnato
FROM ElementoMenù JOIN DettaglioOrdinazione ON CodiceElemento=Elemento
GROUP BY CodiceElemento, nome
ORDER BY Ordinazioni DESC, TotaleGuadagnato DESC
LIMIT 5; 

CREATE OR REPLACE VIEW NuEleOrd AS 
SELECT Ordinazione, SUM(Quantità) AS ElePerOrd
FROM DettaglioOrdinazione
GROUP BY Ordinazione;

CREATE OR REPLACE VIEW Query2 AS 
SELECT CodiceDipendente, Nome, COUNT(*) AS NumeroOrdinazioni, AVG(ElePerOrd) AS MediaElementi
FROM Dipendente JOIN Ordinazione ON CodiceDipendente=Operatore JOIN NuEleOrd ON CodiceOrdinazione=Ordinazione
GROUP BY CodiceDipendente, nome;

CREATE OR REPLACE VIEW Query3 AS 
SELECT CodiceCliente, Nome, COUNT(*) AS NuPrenotazioni
FROM Cliente JOIN Prenotazione ON CodiceCliente=Cliente
WHERE Camping='1'
GROUP BY CodiceCliente
HAVING NuPrenotazioni>1;

CREATE OR REPLACE VIEW Query4 AS 
SELECT CodiceGruppo, Gruppo.Nome, Count(*) AS ElementiGruppo
FROM Gruppo JOIN ElementoMenù ON CodiceGruppo=Gruppo
WHERE Gruppo.Nome<>'bibite'
GROUP BY CodiceGruppo, Gruppo.Nome;

CREATE OR REPLACE VIEW Query5 AS 
SELECT Nome, Cognome, COUNT(*)  AS GiornateLavorative
FROM Turno JOIN Dipendente ON Dipendente=CodiceDipendente
WHERE Mansione='M01' OR Mansione='M02' OR Mansione='M03'
GROUP BY Nome, Cognome
ORDER BY GiornateLavorative DESC;

CREATE OR REPLACE VIEW Query6 AS 
SELECT Nome, Cognome, COUNT(*)  AS GiornateLavorative
FROM Turno JOIN Dipendente ON Dipendente=CodiceDipendente
WHERE Mansione='M04' OR Mansione='M05' OR Mansione='M06'
GROUP BY Nome, Cognome
ORDER BY GiornateLavorative DESC;



DROP PROCEDURE IF EXISTS EliminaPrenotazione;
DELIMITER !!
CREATE PROCEDURE EliminaPrenotazione(pid VARCHAR(20))
BEGIN
DELETE FROM Prenotazioni WHERE pid=CodicePrenotazione;
END !!
DELIMITER ;

DROP PROCEDURE IF EXISTS EliminaOrdine;
DELIMITER !!
CREATE PROCEDURE EliminaOrdine(did VARCHAR(20), dt DATE, pd VARCHAR(20) )
BEGIN
DELETE FROM Ordine WHERE did=Dipendente AND dt=Data AND pd=Prodotto;
END !!
DELIMITER ;



DROP TRIGGER IF EXISTS CheckOrdini;
DELIMITER !!
CREATE TRIGGER CheckOrdini BEFORE INSERT ON Ordine
FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(255);
DECLARE uso VARCHAR(20);
DECLARE mans VARCHAR(20);
SELECT Utilizzo INTO uso FROM Prodotto WHERE New.Prodotto=CodiceProdotto;
SELECT Descrizione INTO mans FROM Dipendente JOIN Mansione ON Mansione=CodiceMansione WHERE New.Dipendente=CodiceDipendente;
IF mans<>'caposala' AND mans<>'chef' THEN
SET msg='ERRORE! Dipendente non autorizzato';
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
ELSEIF (mans='chef' AND uso='sala') OR (mans='caposala' AND uso='cucina') THEN
SET msg='ERRORE! Prodotto non ordinabile';
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END!!
DELIMITER ;

DROP TRIGGER IF EXISTS CheckTurni;
DELIMITER !!
CREATE TRIGGER CheckTurni BEFORE INSERT ON Turno
FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(255);
DECLARE dataass DATE;
SELECT DataAssunzione INTO dataass FROM Dipendente WHERE CodiceDipendente=New.Dipendente;
IF New.OraInizio >= New.OraFine OR dataass>New.DataInizio OR New.DataInizio >= New.DataFine THEN 
SET msg='ERRORE! I valori inseriti sono errati';
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END!!
DELIMITER ;

DROP TRIGGER IF EXISTS CheckPagamenti;
DELIMITER !!
CREATE TRIGGER CheckPagamenti BEFORE INSERT ON Pagamento
FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(255);
DECLARE tot DECIMAL(7,2);
SELECT SUM(Quantità*Prezzo) INTO tot FROM DettaglioOrdinazione JOIN ElementoMenù ON Elemento=CodiceElemento WHERE dettaglioordinazione.Ordinazione = New.Ordinazione;
IF New.ImportoTotale <> (tot - New.Sconto) THEN 
SET msg='ERRORE! importo totale non corrisponde';
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END!!
DELIMITER ;


