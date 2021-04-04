DROP DATABASE IF EXISTS firma; 
DROP SCHEMA IF EXISTS rozliczenia;
CREATE DATABASE firma;
CREATE SCHEMA rozliczenia;
CREATE TABLE rozliczenia.pracownicy (id_pracownika INT PRIMARY KEY, imie VARCHAR(20) NOT NULL, nazwisko VARCHAR(40) NOT NULL, adres VARCHAR(60) NOT NULL, telefon INT NOT NULL);
CREATE TABLE rozliczenia.godziny (id_godziny INT PRIMARY KEY, daty DATE NOT NULL, liczba_godzin INT NOT NULL, id_pracownika INT);
CREATE TABLE rozliczenia.pensje (id_pensji INT PRIMARY KEY, stanowisko VARCHAR(100) NOT NULL, kwota INT NOT NULL, id_premii INT);
CREATE TABLE rozliczenia.premie (id_premii INT PRIMARY KEY, rodzaj VARCHAR(50) NOT NULL, kwota INT );
USE rozliczenia;
ALTER TABLE godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE pensje
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);
INSERT INTO pracownicy
values (1, 'Jakub' , 'Kozlinski', 'Warszawa, Zwierzeca 83' ,  639531852);
INSERT INTO pracownicy
values (2, 'Tomasz' , 'Laskowski', 'Krakow, Ptasia 53' ,  639501282);
INSERT INTO pracownicy
values (3, 'Sergiusz' , 'Koci', 'Zakopane, Krupowki 11' ,  892531852);
INSERT INTO pracownicy
values (4, 'Pola' , 'Nowak', 'Nowy Targ, Jutrzenki 3' ,  720428124);
INSERT INTO pracownicy
values (5, 'Jozef' , 'Pawlak', 'Wroclaw, Glowna 15' ,  740210400);
INSERT INTO pracownicy
values (6, 'Agata' , 'Kowalska', 'Lublin, Warszawska 93' ,  983124523);
INSERT INTO pracownicy
values (7, 'Marta' , 'Lew', 'Rzeszow, Cmentarna 98' ,  743881852);
INSERT INTO pracownicy
values (8, 'Mariola' , 'Zak', 'Gdansk, Morska 221' ,  733295123);
INSERT INTO pracownicy
values (9, 'Ludwik' , 'Kasztan', 'Szczecin, Zalewowa 115' ,  532123794);
INSERT INTO pracownicy
values (10, 'Jan' , 'Nowacki', 'Gdynia Trojmiejska 183' ,  831643001);
INSERT INTO godziny
values (1, '2021-04-02' , 115, 1 );
INSERT INTO godziny
values (2, '2021-04-02' , 113, 2 );
INSERT INTO godziny
values (3, '2021-04-02' , 104, 3 );
INSERT INTO godziny
values (4, '2021-04-02' , 105, 4 );
INSERT INTO godziny
values (5, '2021-04-02' , 125, 5 );
INSERT INTO godziny
values (6, '2021-04-02' , 109, 6 );
INSERT INTO godziny
values (7, '2021-04-02' , 121, 7 );
INSERT INTO godziny
values (8, '2021-04-02' , 122, 8 );
INSERT INTO godziny
values (9, '2021-04-02' , 135, 9 );
INSERT INTO godziny
values (10, '2021-04-02' , 120, 10 );
INSERT INTO premie
values (1, 'dodatek' , 400 );
INSERT INTO premie
values (2, 'dodatek' , 650 );
INSERT INTO premie
values (3, 'dodatek' , 550 );
INSERT INTO premie
values (4, 'dodatek' , 700 );
INSERT INTO premie
values (5, 'dodatek' , 140 );
INSERT INTO premie
values (6, 'dodatek' , 170 );
INSERT INTO premie
values (7, 'dodatek' , 540 );
INSERT INTO premie
values (8, 'dodatek' , 200 );
INSERT INTO premie
values (9, 'dodatek' , 980 );
INSERT INTO premie
values (10, 'dodatek' , NULL );
INSERT INTO pensje
values (1, 'Ksiegowy' , 4200, 1 );
INSERT INTO pensje
values (2, 'Glowny ksiegowy' , 5400, 2 );
INSERT INTO pensje
values (3, 'Menager' , 5200, 3 );
INSERT INTO pensje
values (4, 'Glowny menager' , 6100, 4 );
INSERT INTO pensje
values (5, 'Sprzataczka' , 2400, 5 );
INSERT INTO pensje
values (6, 'Sprzedawca' , 2500, 6 );
INSERT INTO pensje
values (7, 'Kierownik zmiany' , 4700, 7 );
INSERT INTO pensje
values (8, 'Ochroniarz' , 2900, 8 );
INSERT INTO pensje
values (9, 'Kierownik dzialu ds sprzedazy' , 6500, 9 );
INSERT INTO pensje
values (10, 'CEO zakladu' , 12900, 10 );
SELECT nazwisko, adres FROM pracownicy;
-- Baza danych byla pisana w MySQL. Niestety ten program nie posiada funkcji DATEPART, po swietach bede probowac zainstalowac inny program lub poszukac inna funkcje ktora moze zastapic DATEPART
ALTER TABLE pensje CHANGE kwota kwota_brutto INT;
ALTER TABLE pensje ADD kwota_netto INT;
UPDATE pensje SET kwota_netto = kwota_brutto * 0.6836;