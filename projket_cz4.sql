DROP TABLE IF EXISTS auto CASCADE;
DROP TABLE IF EXISTS miasto CASCADE;
DROP TABLE IF EXISTS pensja CASCADE;
DROP TABLE IF EXISTS typ_2 CASCADE;
DROP TABLE IF EXISTS typ CASCADE;
DROP TABLE IF EXISTS adres CASCADE;
DROP TABLE IF EXISTS stanowisko CASCADE;
DROP TABLE IF EXISTS pracownik CASCADE;
DROP TABLE IF EXISTS egzemplarz CASCADE;
DROP TABLE IF EXISTS egzemplarz_2 CASCADE;
DROP TABLE IF EXISTS klient CASCADE;
DROP TABLE IF EXISTS bagazniki_bazowe CASCADE;
DROP TABLE IF EXISTS boxy_dachowe CASCADE;

CREATE TABLE auto
(
idauto INTEGER NOT NULL PRIMARY KEY,
marka VARCHAR(45) NOT NULL,
model VARCHAR(45) NOT NULL,
typ_nadwozia VARCHAR(45),
rok_produkcji DATE
);

CREATE TABLE miasto
(
idmiasto INTEGER NOT NULL PRIMARY KEY,
nazwa VARCHAR(45) NOT NULL
);

CREATE TABLE pensja
(
idpensja INTEGER NOT NULL PRIMARY KEY,
netto MONEY NOT NULL,
brutto MONEY NOT NULL
);

CREATE TABLE typ_2
(
idtyp_2 INTEGER NOT NULL PRIMARY KEY,
dlugosc INTEGER NOT NULL
);

CREATE TABLE typ
(
idtyp INTEGER NOT NULL PRIMARY KEY,
dlugosc INTEGER NOT NULL,
szerokosc INTEGER NOT NULL,
wysokosc INTEGER NOT NULL,
waga INTEGER NOT NULL,
pojemnosc INTEGER NOT NULL
);

CREATE TABLE adres
(
idadres INTEGER NOT NULL PRIMARY KEY,
idmiasto INTEGER NOT NULL,
ulica VARCHAR(45) NOT NULL,
nr_ulicy INTEGER,
nr_mieszkania INTEGER,
kod_pocztowy INTEGER
);

CREATE TABLE stanowisko
(idstanowisko INTEGER NOT NULL PRIMARY KEY,
idpensja INTEGER NOT NULL,
nazwa VARCHAR(45) NOT NULL);

CREATE TABLE pracownik
(
idpracownik INTEGER NOT NULL PRIMARY KEY,
idstanowisko INTEGER NOT NULL,
idadres INTEGER NOT NULL,
imie VARCHAR(45),
nazwisko VARCHAR(45) NOT NULL,
nr_tel INTEGER NULL,
rok_ur VARCHAR(4) NOT NULL
);

CREATE TABLE egzemplarz_2
(
idegzemplarz_2 INTEGER NOT NULL PRIMARY KEY,
idtyp_2 INTEGER NOT NULL,
marka VARCHAR(45) NOT NULL,
model VARCHAR(45) NOT NULL
);

CREATE TABLE egzemplarz
(
idegzemplarz INTEGER NOT NULL PRIMARY KEY,
idtyp INTEGER NOT NULL,
marka VARCHAR(45) NOT NULL,
model VARCHAR(45) NOT NULL,
cena INTEGER NOT NULL
);

CREATE TABLE klient
(
idklient INTEGER PRIMARY KEY,
idauto INTEGER NOT NULL,
idadres INTEGER NOT NULL,
imie VARCHAR(45) NOT NULL,
nazwisko VARCHAR(45) NOT NULL,
nr_tel VARCHAR(15) NOT NULL
);

CREATE TABLE bagazniki_bazowe
(
idbagazniki_bazowe INTEGER NOT NULL PRIMARY KEY,
idegzemplarz_2 INTEGER NOT NULL,
idtyp_2 INTEGER NOT NULL,
idauto INTEGER NOT NULL,
idpracownik INTEGER NOT NULL
);

CREATE TABLE boxy_dachowe
(
idboxy_dachowe INTEGER NOT NULL PRIMARY KEY,
idpracownik INTEGER NOT NULL,
idtyp INTEGER NOT NULL,
idegzemplarz INTEGER NOT NULL,
idauto INTEGER NOT NULL
);

INSERT INTO auto
VALUES (1, 'VOLKSWAGEN','PASSAT','SEDAN','2004-02-03');
INSERT INTO auto
VALUES (2, 'BMW','Z3','ROADSTER','2007-08-08');
INSERT INTO auto
VALUES (3, 'FIAT','PANDA','MIKROVAN','2002-01-12');
INSERT INTO auto
VALUES (4, 'AUDI','A6','SEDAN','2004-02-03');
INSERT INTO auto
VALUES (5, 'PEUGEOT','307','HATCHBACK','2010-05-03');

INSERT INTO miasto
VALUES (1, 'GDANSK');
INSERT INTO miasto
VALUES (2, 'GDANSK');
INSERT INTO miasto
VALUES (3, 'SOPOT');
INSERT INTO miasto
VALUES (4, 'GDANSK');
INSERT INTO miasto
VALUES (5, 'GDYNIA');

INSERT INTO adres
VALUES (1,1,'WITA STWOSZA','25','12','80396');
INSERT INTO adres
VALUES (2,2,'KOLOBRZESKA','65','5','80396');
INSERT INTO adres
VALUES (3,3,'WALY JAGIELLONSKIE','33','11','80120');
INSERT INTO adres
VALUES (4,4,'MICKIEWICZA','1','3','80405');
INSERT INTO adres
VALUES (5,5,'WROCLAWSKA','2','12','80092');

INSERT INTO pensja
VALUES (1,'2500','3500');
INSERT INTO pensja
VALUES (2,'1750','2600');
INSERT INTO pensja
VALUES (3,'2100','3000');
INSERT INTO pensja
VALUES (4,'3500','4600');
INSERT INTO pensja
VALUES (5,'2500','3500');

INSERT INTO typ_2
VALUES (1,'120');
INSERT INTO typ_2
VALUES (2,'110');
INSERT INTO typ_2
VALUES (3,'90');
INSERT INTO typ_2
VALUES (4,'115');
INSERT INTO typ_2
VALUES (5,'100');

INSERT INTO typ
VALUES (1,'132','78','36','50','320');
INSERT INTO typ
VALUES (2,'228','48','32','40','280');
INSERT INTO typ
VALUES (3,'205','50','38','60','320');
INSERT INTO typ
VALUES (4,'130','90','38','45','300');
INSERT INTO typ
VALUES (5,'198','78','39','70','480');

INSERT INTO stanowisko
VALUES (1,1,'ELEKTRYK');
INSERT INTO stanowisko
VALUES (2,2,'MECHANIK');
INSERT INTO stanowisko
VALUES (3,3,'MECHANIK');
INSERT INTO stanowisko
VALUES (4,4,'ZARZADCA');
INSERT INTO stanowisko
VALUES (5,5,'MECHANIK');

INSERT INTO pracownik
VALUES (1,1,1,'TOMEK','BOMBA','011000111','1988');
INSERT INTO pracownik
VALUES (2,2,2,'MICHAL','ATOM','139087831','1969');
INSERT INTO pracownik
VALUES (3,3,3,'WOJTEK','WYBUCH','565656511','1975');
INSERT INTO pracownik
VALUES (4,4,4,'ROMAN','POCISK','545454566','1977');
INSERT INTO pracownik
VALUES (5,5,5,'KUBA','STRZAL','213213123','1979');

INSERT INTO egzemplarz
VALUES (1,1,'THULE','OCEAN','499');
INSERT INTO egzemplarz
VALUES (2,2,'INTER PACK','ECONOMIC','450');
INSERT INTO egzemplarz
VALUES (3,3,'THULE','EASY','600');
INSERT INTO egzemplarz
VALUES (4,4,'INTER PACK','ECONOMIC','700');
INSERT INTO egzemplarz
VALUES (5,5,'INTER PACK','STELLA','550');

INSERT INTO egzemplarz_2
VALUES (1,1,'THULE','RAPID FIXPOINT XT 751');
INSERT INTO egzemplarz_2
VALUES (2,2,'THULE','RAPID SYSTEM 757');
INSERT INTO egzemplarz_2
VALUES (3,3,'THULE','RAPID SYSTEM 754 WINGBAR');
INSERT INTO egzemplarz_2
VALUES (4,4,'MONT BLANC','RF20 ALU');
INSERT INTO egzemplarz_2
VALUES (5,5,'auto MAXI','SILVER LINE');

INSERT INTO klient
VALUES (1,1,1,'JERZY','MANIAK','36547921');
INSERT INTO klient
VALUES (2,2,2,'MROSLAW','POLO','12137898');
INSERT INTO klient
VALUES (3,3,3,'TOMEK','MARCHEWKA','54534667');
INSERT INTO klient
VALUES (4,4,4,'MICHAL','KUROPATWA','5457644');
INSERT INTO klient
VALUES (5,5,5,'BARTLOMIEJ','PRAD','5456734');

INSERT INTO bagazniki_bazowe
VALUES (1,1,1,1,1);
INSERT INTO bagazniki_bazowe
VALUES (2,2,2,2,2);
INSERT INTO bagazniki_bazowe
VALUES (3,3,3,3,3);
INSERT INTO bagazniki_bazowe
VALUES (4,4,4,4,4);
INSERT INTO bagazniki_bazowe
VALUES (5,5,5,5,5);

INSERT INTO boxy_dachowe
VALUES (1,1,1,1,1);
INSERT INTO boxy_dachowe
VALUES (2,2,2,2,2);
INSERT INTO boxy_dachowe
VALUES (3,3,3,3,3);
INSERT INTO boxy_dachowe
VALUES (4,4,4,4,4);
INSERT INTO boxy_dachowe
VALUES (5,5,5,5,5);


SELECT (SELECT COUNT(*) FROM auto) AS "auta",
  	(SELECT COUNT(*) FROM miasto) AS "miasta",
		(SELECT COUNT(*) FROM pensja) AS "pensje",
		(SELECT COUNT(*) FROM typ) AS "typy",
		(SELECT COUNT(*) FROM typ_2) AS "typy_2",
		(SELECT COUNT(*) FROM adres) AS "adresy",
		(SELECT COUNT(*) FROM stanowisko) AS "stanowiska",
		(SELECT COUNT(*) FROM pracownik) AS "pracownicy",
		(SELECT COUNT(*) FROM egzemplarz) AS "egzemplarze",
		(SELECT COUNT(*) FROM egzemplarz_2) AS "egzemplarze_2",
		(SELECT COUNT(*) FROM klient) AS "klienci",
		(SELECT COUNT(*) FROM bagazniki_bazowe) AS "bagazniki_bazowe",
		(SELECT COUNT(*) FROM boxy_dachowe) AS "boxy_dachowe";
		
--CZ.2	SELECTY
--1
SELECT nazwa
FROM stanowisko s 
WHERE EXISTS 
	(SELECT brutto, netto
	FROM pensja pe
	WHERE pe.brutto<=pe.netto);
--2
SELECT s.nazwa, COUNT(p.idpracownik) AS ilosc
FROM pracownik p JOIN stanowisko s 
	ON p.idstanowisko=s.idstanowisko
	GROUP BY s.nazwa
HAVING COUNT(p.idstanowisko)>=1;
--3
UPDATE pensja SET netto='3000'
WHERE netto='2500';
UPDATE pensja SET brutto='4000' 
WHERE brutto='3500';
--4
SELECT p.imie, p.nazwisko, w.brutto, w.netto
FROM pracownik p LEFT JOIN  pensja w 
ON p.idpracownik=w.idpensja
ORDER BY w.brutto DESC
LIMIT 1 OFFSET 3;
--5
SELECT p.imie, p.nazwisko, s.nazwa
FROM pracownik p LEFT JOIN stanowisko s 
ON p.idstanowisko=s.idstanowisko
ORDER BY s.nazwa ASC;
--CZ.3

--VIEW
CREATE VIEW Mechanicy
AS
SELECT s.nazwa, COUNT(p.idpracownik) AS ilosc
FROM pracownik p JOIN stanowisko s 
	ON p.idstanowisko=s.idstanowisko
	GROUP BY s.nazwa
HAVING COUNT(p.idstanowisko)>1;
SELECT ilosc, nazwa
FROM Mechanicy
ORDER BY ilosc DESC;

--FUNCTION
CREATE FUNCTION wymiary
(	
	dlugosc varchar(10),
	szerokosc varchar(10),
	wysokosc varchar(10)
)
RETURNS varchar(10)
AS $$
BEGIN
	DECLARE wymiary varchar(10)
	SET wymiary=dlugosc+ 'x' + szerokosc + 'x' + wysokosc
	RETURN wymiary
END;
$$ LANGUAGE 'SQL';
??????????????
