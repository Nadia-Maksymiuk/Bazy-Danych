CREATE DATABASE cw9;
USE cw9;

SET FOREIGN_KEY_CHECKS=0;


CREATE TABLE GeoEon(id_eon INT NOT NULL AUTO_INCREMENT, nazwa_eon VARCHAR(30) NOT NULL, PRIMARY KEY (id_eon));
CREATE TABLE GeoEra(id_era INT NOT NULL AUTO_INCREMENT, id_eon INT, nazwa_era VARCHAR(30) NOT NULL, PRIMARY KEY (id_era), FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon));
CREATE TABLE GeoOkres(id_okres INT NOT NULL AUTO_INCREMENT, id_era INT, nazwa_okres VARCHAR(30) NOT NULL, PRIMARY KEY (id_okres), FOREIGN KEY (id_era) REFERENCES GeoEra(id_era));
CREATE TABLE GeoEpoka(id_epoka INT NOT NULL AUTO_INCREMENT, id_okres INT, nazwa_epoka VARCHAR(30) NOT NULL, PRIMARY KEY (id_epoka), FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres));
CREATE TABLE GeoPietro(id_pietro INT NOT NULL AUTO_INCREMENT,id_epoka INT, nazwa_pietro VARCHAR(30) NOT NULL, PRIMARY KEY(id_pietro), FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka));

-- wypełnienie tabel

INSERT INTO GeoEon(nazwa_eon)
VALUES ('Fanerozoik');

INSERT INTO GeoEra(id_eon,nazwa_era)
VALUES (1,'Kenozoik'), (1,'Mezozoik'), (1,'Paleozoik');

INSERT INTO GeoOkres(id_era,nazwa_okres)
VALUES (1,'Czwartorzęd'), (1,'Neogen'), (1,'Paleogen'), (2,'Kreda'), (2,'Jura'), (2,'Trias'), (3,'Prem'), (3,'Karbon'), (3,'Dewon'), (3,'Sylur'), (3,'Ordowik'), (3,'Kambr');

INSERT INTO GeoEpoka(id_okres,nazwa_epoka)
VALUES
(1,'Plejstocen'), (1,'Halocen'),
(2,'Miocen'), (2,'Pliocen'),
(3,'Paleocen'), (3,'Eocen'), (3,'Oligocen'),
(4,'Dolna'), (4,'Górna'),
(5,'Dolna'), (5,'Środkowa'), (5,'Górna'),
(6,'Dolny'), (6,'Środkowy'), (6,'Górny'),
(7,'Cisural'), (7,'Gwadelup'), (7, 'Loping'),
(8,'Missisip'), (8,'Pensylwan'),
(9,'Dolny'), (9,'Środkowy'), (9,'Górny'),
(10,'Landower'), (10,'Wenlok'), (10,'Ludlow'), (10,'Przydol'),
(11,'Dolny'), (11,'Środkowy'), (11,'Górny'),
(12,'Terenew'), (12,'Oddział 2'), (12,'Oddział 3'), (12, 'Furong');





INSERT INTO GeoPietro(id_epoka,nazwa_pietro)
VALUES
(1,'Gelas'), (1,'Kalabr'), (1,'Jon'), (1,'Plejstocen górny'),
(2,'Zanki'), (2,'Piacent'),
(3,'Akwitan'), (3,'Burdygał'), (3,'Lang'), (3,'Serrawal'), (3,'Torton'), (3,'Messyn'),
(4,'Rupel'), (4,'Szat'),
(5,'Iprez'), (5,'Lutet'), (5,'Barton'), (5,'Priablon'),
(6,'Dan'), (6,'Zeland'), (6,'Tanet'),
(7,'Cenoman'), (7,'Turon'), (7,'Koniak'), (7,'Santon'), (7,'Kampan'), (7,'Mastrycht'),
(8,'Berias'), (8,'Walanżyn'), (8, 'Hoteryw'), (8,'Barrem'), (8,'Apt'), (8,'Alb'),
(9,'Oksford'), (9,'Kimeryd'), (9,'Tyton'),
(10,'Aalen'), (10,'Bajos'), (10,'Baton'), (10,'Kelowej'),
(11,'Hetang'), (11,'Synemur'), (11,'Pilensbach'), (11,'Toark'),
(12,'Karnik'), (12,'Noryk'), (12, 'Retyk'),
(12,'Anizyk'), (12,'Ladyn'),
(13,'Ind'), (13,'Olenek'),
(14,'Wucziaping'), (14, 'Czangszing'),
(15,'Road'), (15,'Word'), (15, 'Kapitan'),
(16, 'Aselsk'), (16, 'Sakmar'), (16, 'Artyńsk'), (16, 'Kungur'),
(17, 'Baszkir'), (17, 'Moskow'), (17, 'Kazim'), (17,'Gżel'),
(18, 'Turnej'), (18, 'Wizen'), (18, 'Serpuchow'),
(19, 'Fran'), (19, 'Famen'),
(20, 'Eifel'), (20,'Żywet'),
(21, 'Lochkow'), (21, 'Prag'), (21,'Ems'),
(23,'Gorst'), (23,'Ludford'),
(24, 'Sheinwood'), (24,'Homer'),
(25,'Rhuddan'), (25,'Aeron'), (25,'Telych'),
(26,'Sandb'), (26,'Kat'), (26,'Hirnant'), 
(27,'Daping'), (27,'Darriwil'), 
(28,'Tremadok'), (28,'Flo'), 
(29,'Paib'), (29,'iangshan'), (29,'Piętro 10'), 
(30,'Piętro 5'), (30,'Drum'), (30,'Gużang'), 
(31,'Piętro 3'), (31,'Piętro 4'), 
(32,'Fortun'), (32,'Piętro 2');


-- tworzenie zdenormalizowanej tabeli


CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon );



SELECT * FROM GeoTabela;

-- tworzenie tabel dziesiec i milion

CREATE TABLE Dziesiec(cyfra INT ,bicik INT);
INSERT INTO Dziesiec(cyfra)
VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

CREATE TABLE Milion(liczba INT,cyfra INT, bicik INT);
INSERT INTO  Milion SELECT a1.cyfra + 10* a2.cyfra + 100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 100000*a6.cyfra 
AS liczba , a1.cyfra AS cyfra, a1.bicik AS bicik FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;
 
CREATE INDEX idEra ON GeoEra(id_era, id_eon);
CREATE INDEX idOkres ON GeoOkres(id_okres, id_era);
CREATE INDEX idEpoka ON GeoEpoka(id_epoka, id_okres);
CREATE INDEX idPietro ON GeoPietro(id_pietro, id_epoka);
CREATE INDEX idLiczba ON Milion(liczba);
CREATE INDEX idGeoTabela ON GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);
 
-- zapytania
 
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON (mod(Milion.liczba,98)=(GeoTabela.id_pietro));
SELECT COUNT(*) FROM Milion INNER JOIN  GeoPietro  ON (mod(Milion.liczba,98)=GeoPietro.id_pietro) NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,98) = (SELECT id_pietro FROM GeoTabela   WHERE mod(Milion.liczba,98)=(id_pietro));
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,98) IN (SELECT id_pietro FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon); 