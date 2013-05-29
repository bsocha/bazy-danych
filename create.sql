CREATE TABLE auto
(idauto INTEGER NOT NULL PRIMARY KEY,
marka VARCHAR(45) NOT NULL,
model VARCHAR(45) NOT NULL,
typ_nadwozia VARCHAR(45),
rok_produkcji DATE);
GO
CREATE TABLE miasto
(idmiasto INTEGER NOT NULL PRIMARY KEY,
nazwa VARCHAR(45) NOT NULL CHECK(LEN(nazwa)>1));
GO
CREATE TABLE pensja
(idpensja INTEGER NOT NULL PRIMARY KEY,
netto MONEY NOT NULL,
brutto MONEY NOT NULL);
GO
CREATE TABLE typ_2
(idtyp_2 INTEGER NOT NULL PRIMARY KEY,
dlugosc INTEGER NOT NULL);
GO
CREATE TABLE typ
(idtyp INTEGER NOT NULL PRIMARY KEY,
dlugosc INTEGER NOT NULL,
szerokosc INTEGER NOT NULL,
wysokosc INTEGER NOT NULL,
waga INTEGER NOT NULL,
pojemnosc INTEGER NOT NULL);
GO
CREATE TABLE adres
(idadres INTEGER NOT NULL PRIMARY KEY,
idmiasto INTEGER NOT NULL references miasto,
ulica VARCHAR(45) NOT NULL,
nr_ulicy INTEGER,
nr_mieszkania INTEGER,
kod_pocztowy INTEGER);
GO
CREATE TABLE stanowisko
(idstanowisko INTEGER NOT NULL PRIMARY KEY,
idpensja INTEGER NOT NULL references pensja,
nazwa VARCHAR(45) NOT NULL);
GO
CREATE TABLE pracownik
(idpracownik INTEGER NOT NULL PRIMARY KEY,
idstanowisko INTEGER NOT NULL references stanowisko,
idadres INTEGER NOT NULL references adres,
imie VARCHAR(45) NOT NULL CHECK(LEN(imie)>2),
nazwisko VARCHAR(45) NOT NULL CHECK(LEN(nazwisko)>2),
nr_tel INTEGER NULL,
rok_ur VARCHAR(4) NOT NULL);
GO
CREATE TABLE egzemplarz_2
(idegzemplarz_2 INTEGER NOT NULL PRIMARY KEY,
idtyp_2 INTEGER NOT NULL references typ_2,
marka VARCHAR(45) NOT NULL,
model VARCHAR(45) NOT NULL);
GO
CREATE TABLE egzemplarz
(idegzemplarz INTEGER NOT NULL PRIMARY KEY,
idtyp INTEGER NOT NULL references typ,
marka VARCHAR(45) NOT NULL,
model VARCHAR(45) NOT NULL,
cena INTEGER NOT NULL);
GO
CREATE TABLE klient
(idklient INTEGER PRIMARY KEY,
idauto INTEGER NOT NULL references auto,
idadres INTEGER NOT NULL references adres,
imie VARCHAR(45) NOT NULL CHECK(LEN(imie)>2),
nazwisko VARCHAR(45) NOT NULL CHECK(LEN(nazwisko)>2),
nr_tel VARCHAR(15) NOT NULL);
GO
CREATE TABLE bagazniki_bazowe
(idbagazniki_bazowe INTEGER NOT NULL PRIMARY KEY,
idegzemplarz_2 INTEGER NOT NULL references egzemplarz_2,
idtyp_2 INTEGER NOT NULL references egzemplarz_2,
idauto INTEGER NOT NULL references auto,
idpracownik INTEGER NOT NULL references pracownik);
GO
CREATE TABLE boxy_dachowe
(idboxy_dachowe INTEGER NOT NULL PRIMARY KEY,
idpracownik INTEGER NOT NULL references pracownik,
idtyp INTEGER NOT NULL references egzemplarz,
idegzemplarz INTEGER NOT NULL references egzemplarz,
idauto INTEGER NOT NULL references auto);
GO
