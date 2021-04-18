DROP DATABASE IF EXISTS firma; 
DROP SCHEMA IF EXISTS ksiegowosc;
CREATE DATABASE firma;
CREATE SCHEMA ksiegowosc;
CREATE TABLE ksiegowosc.pracownicy (id_pracownika INT PRIMARY KEY, imie VARCHAR(20) NOT NULL, nazwisko VARCHAR(40) NOT NULL, adres VARCHAR(60) NOT NULL, telefon INT NOT NULL)
COMMENT = 'tabela przedstawiajaca pracownikow';
CREATE TABLE ksiegowosc.godziny (id_godziny INT PRIMARY KEY, daty DATE NOT NULL, liczba_godzin INT NOT NULL, id_pracownika INT)
COMMENT = 'tabela przedstawiajaca godziny';
CREATE TABLE ksiegowosc.pensje (id_pensji INT PRIMARY KEY, stanowisko VARCHAR(100) NOT NULL, kwota INT NOT NULL, id_premii INT)
COMMENT = 'tabela przedstawiajaca pensje';
CREATE TABLE ksiegowosc.premie (id_premii INT PRIMARY KEY, rodzaj VARCHAR(50) NOT NULL, kwota INT )
COMMENT = 'tabela przedstawiajaca premie';
CREATE TABLE ksiegowosc.wynagrodzenie (id_wynagrodzenia INT PRIMARY KEY, daty DATE NOT NULL, id_pracownika INT, id_godziny INT, id_pensji INT, id_premii INT)
COMMENT = 'tabela przedstawiajaca wynagrodzenia';
ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.pensje
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_godziny) REFERENCES godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji) REFERENCES pensje(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);
INSERT INTO ksiegowosc.pracownicy
values (1, 'Jakub' , 'Kozlinski', 'Warszawa, Zwierzeca 83' ,  639531852);
INSERT INTO ksiegowosc.pracownicy
values (2, 'Tomasz' , 'Laskowski', 'Krakow, Ptasia 53' ,  639501282);
INSERT INTO ksiegowosc.pracownicy
values (3, 'Sergiusz' , 'Koci', 'Zakopane, Krupowki 11' ,  892531852);
INSERT INTO ksiegowosc.pracownicy
values (4, 'Pola' , 'Nowak', 'Nowy Targ, Jutrzenki 3' ,  720428124);
INSERT INTO ksiegowosc.pracownicy
values (5, 'Jozef' , 'Pawlak', 'Wroclaw, Glowna 15' ,  740210400);
INSERT INTO ksiegowosc.pracownicy
values (6, 'Agata' , 'Kowalska', 'Lublin, Warszawska 93' ,  983124523);
INSERT INTO ksiegowosc.pracownicy
values (7, 'Marta' , 'Lew', 'Rzeszow, Cmentarna 98' ,  743881852);
INSERT INTO ksiegowosc.pracownicy
values (8, 'Mariola' , 'Zak', 'Gdansk, Morska 221' ,  733295123);
INSERT INTO ksiegowosc.pracownicy
values (9, 'Ludwik' , 'Kasztan', 'Szczecin, Zalewowa 115' ,  532123794);
INSERT INTO ksiegowosc.pracownicy
values (10, 'Jan' , 'Nowacki', 'Gdynia Trojmiejska 183' ,  831643001);
INSERT INTO ksiegowosc.godziny
values (1, '2021-04-02' , 165, 1 );
INSERT INTO ksiegowosc.godziny
values (2, '2021-04-02' , 166, 2 );
INSERT INTO ksiegowosc.godziny
values (3, '2021-04-02' , 157, 3 );
INSERT INTO ksiegowosc.godziny
values (4, '2021-04-02' , 160, 4 );
INSERT INTO ksiegowosc.godziny
values (5, '2021-04-02' , 167, 5 );
INSERT INTO ksiegowosc.godziny
values (6, '2021-04-02' , 152, 6 );
INSERT INTO ksiegowosc.godziny
values (7, '2021-04-02' , 171, 7 );
INSERT INTO ksiegowosc.godziny
values (8, '2021-04-02' , 149, 8 );
INSERT INTO ksiegowosc.godziny
values (9, '2021-04-02' , 169, 9 );
INSERT INTO ksiegowosc.godziny
values (10, '2021-04-02' , 160, 10 );
INSERT INTO ksiegowosc.premie
values (1, 'dodatek' , 400 );
INSERT INTO ksiegowosc.premie
values (2, 'brak premii' , 0 );
INSERT INTO ksiegowosc.premie
values (3, 'dodatek' , 550 );
INSERT INTO ksiegowosc.premie
values (4, 'dodatek' , 700 );
INSERT INTO ksiegowosc.premie
values (5, 'brak premii' , 0 );
INSERT INTO ksiegowosc.premie
values (6, 'dodatek' , 170 );
INSERT INTO ksiegowosc.premie
values (7, 'dodatek' , 540 );
INSERT INTO ksiegowosc.premie
values (8, 'dodatek' , 200 );
INSERT INTO ksiegowosc.premie
values (9, 'dodatek' , 980 );
INSERT INTO ksiegowosc.premie
values (10, 'dodatek' , 3750 );
INSERT INTO ksiegowosc.pensje
values (1, 'Ksiegowy' , 4200, 1 );
INSERT INTO ksiegowosc.pensje
values (2, 'Glowny ksiegowy' , 5400, 2 );
INSERT INTO ksiegowosc.pensje
values (3, 'Menager' , 5200, 3 );
INSERT INTO ksiegowosc.pensje
values (4, 'Glowny menager' , 6100, 4 );
INSERT INTO ksiegowosc.pensje
values (5, 'Sprzataczka' , 2400, 5 );
INSERT INTO ksiegowosc.pensje
values (6, 'Sprzedawca' , 1100, 6 );
INSERT INTO ksiegowosc.pensje
values (7, 'Kierownik zmiany' , 4700, 7 );
INSERT INTO ksiegowosc.pensje
values (8, 'Ochroniarz' , 2900, 8 );
INSERT INTO ksiegowosc.pensje
values (9, 'Kierownik dzialu ds sprzedazy' , 6500, 9 );
INSERT INTO ksiegowosc.pensje
values (10, 'CEO zakladu' , 12900, 10 );
INSERT INTO ksiegowosc.wynagrodzenie
values (1, '2021-04-02' , 1, 1, 1, 1 );
INSERT INTO ksiegowosc.wynagrodzenie
values (2, '2021-04-02' , 2, 2, 2, 2 );
INSERT INTO ksiegowosc.wynagrodzenie
values (3, '2021-04-02' ,  3,3, 3, 3);
INSERT INTO ksiegowosc.wynagrodzenie
values (4, '2021-04-02' ,  4,4, 4, 4 );
INSERT INTO ksiegowosc.wynagrodzenie
values (5, '2021-04-02' ,  5,5, 5, 5);
INSERT INTO ksiegowosc.wynagrodzenie
values (6, '2021-04-02' , 6, 6, 6,6 );
INSERT INTO ksiegowosc.wynagrodzenie
values (7, '2021-04-02' ,  7,7, 7, 7 );
INSERT INTO ksiegowosc.wynagrodzenie
values (8, '2021-04-02' ,  8,8, 8, 8 );
INSERT INTO ksiegowosc.wynagrodzenie
values (9, '2021-04-02' , 9, 9, 9, 9);
INSERT INTO ksiegowosc.wynagrodzenie
values (10, '2021-04-02', 10, 10, 10 , 10 );
-- a
SELECT nazwisko, id_pracownika FROM ksiegowosc.pracownicy;
-- b
SELECT ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pensje.kwota 
FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji) ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
WHERE ksiegowosc.pensje.kwota > 1000.00;
-- c
SELECT ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN (ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenie.id_premii) ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji) 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
WHERE ksiegowosc.premie.kwota IS NULL AND ksiegowosc.pensje.kwota > 2000;
-- d
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'j%';
-- e
SELECT * FROM KSIEGOWOSC.pracownicy WHERE imie LIKE '%a'AND nazwisko LIKE '%n%';
-- f
SELECT imie, nazwisko,  liczba_godzin - 160 AS liczba_nadgodzin
FROM ksiegowosc.pracownicy INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
WHERE ksiegowosc.godziny.liczba_godzin > 160;
-- g
SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko 
FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji) ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
WHERE ksiegowosc.pensje.kwota >= 1500.00 AND ksiegowosc.pensje.kwota <= 3000;
-- h
	SELECT imie, nazwisko FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.godziny INNER JOIN
	(ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenie.id_premii)
	ON ksiegowosc.godziny.id_godziny = ksiegowosc.wynagrodzenie.id_godziny) 
	ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
	WHERE ksiegowosc.godziny.liczba_godzin > 160 AND ksiegowosc.premie.kwota = 0 ;
-- i
SELECT * 
FROM ksiegowosc.pracownicy
INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji) ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
ORDER BY ksiegowosc.pensje.kwota;
-- j
SELECT * FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN (ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenie.id_premii) ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji) 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
ORDER BY ksiegowosc.pensje.kwota DESC, ksiegowosc.premie.kwota DESC;
-- k
SELECT ksiegowosc.pensje.stanowisko,count(ksiegowosc.pensje.stanowisko)
FROM ksiegowosc.pensje
GROUP BY ksiegowosc.pensje.stanowisko;
-- l
SELECT max(ksiegowosc.pensje.kwota),min(ksiegowosc.pensje.kwota),AVG(ksiegowosc.pensje.kwota)
FROM ksiegowosc.pensje
WHERE ksiegowosc.pensje.stanowisko = 'menager';
-- m
SELECT sum(ksiegowosc.pensje.kwota)
FROM ksiegowosc.pensje;
-- n
SELECT stanowisko, SUM(ksiegowosc.pensje.kwota) FROM ksiegowosc.pensje GROUP BY stanowisko;
-- o
SELECT ksiegowosc.pensje.stanowisko, SUM(ksiegowosc.premie.kwota) 
FROM ksiegowosc.premie INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji) ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenie.id_premii
GROUP BY ksiegowosc.pensje.stanowisko;
-- p
SET FOREIGN_KEY_CHECKS=0; -- to disable them
delete ksiegowosc.pracownicy, ksiegowosc.pensje, ksiegowosc.premie, ksiegowosc.godziny
from ksiegowosc.pracownicy inner join (ksiegowosc.pensje inner join (ksiegowosc.premie inner join(ksiegowosc.godziny inner join ksiegowosc.wynagrodzenie on ksiegowosc.godziny.id_godziny = ksiegowosc.wynagrodzenie.id_godziny)) on ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji)
-- FROM pracownicy inner join (pensje inner join (premie inner join (godziny inner join wynagrodzenie on godziny.id_godziny = wynagrodzenie.id_godziny) pensje.id_pensji = wynagrodzenie.id_pensji))
WHERE pensje.kwota <1200;
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them
-- SELECT DATEPART (dw, godziny.daty) AND DATEPART (mm, godziny.daty);
ALTER TABLE pensje CHANGE kwota kwota_brutto INT;
ALTER TABLE pensje ADD kwota_netto INT;
UPDATE pensje SET kwota_netto = kwota_brutto * 0.6836;
SELECT * FROM ksiegowosc.pensje;