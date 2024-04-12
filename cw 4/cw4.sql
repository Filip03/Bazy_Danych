-- Database: firma
CREATE DATABASE firma;
-- DROP SCHEMA IF EXISTS rozliczenia CASCADE;

CREATE SCHEMA rozliczenia;
CREATE TABLE rozliczenia.pracownicy(id_pracownika INT NOT NULL PRIMARY KEY,
									imie VARCHAR NOT NULL,
									nazwisko VARCHAR NOT NULL,
									adres VARCHAR NOT NULL,
									telefon VARCHAR NULL) ;
									
								
									
CREATE TABLE rozliczenia.godziny(id_godziny INT NOT NULL PRIMARY KEY,
								 data DATE NOT NULL,
								 liczba_godzin REAL NOT NULL,
								 id_pracownika INT NOT NULL);
								 
ALTER TABLE  rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

CREATE TABLE rozliczenia.pensje(id_pensji INT NOT NULL PRIMARY KEY,
								stanowisko VARCHAR NOT NULL,
								kwota REAL NOT NULL,
								id_premii INT NOT NULL);

								
CREATE TABLE rozliczenia.premie(id_premii INT NOT NULL PRIMARY KEY,
								rodzaj VARCHAR NOT NULL,
								kwota REAL NOT NULL);

ALTER TABLE  rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);			

INSERT INTO rozliczenia.pracownicy (id_pracownika,imie,nazwisko,adres,telefon)
VALUES
  (1,'Adrienne','England','263-3109 Tristique Avenue','441-211-551'),
  (2,'Hammett','Charles','320-3333 Imperdiet St.','481-827-568'),
  (3,'Hamilton','Langley','885-1400 Pede Av.','245-526-564'),
  (4,'Ina','Mcmahon','Ap #569-3561 Molestie St.','477-857-324'),
  (5,'Jessica','Campos','P.O. Box 797, 4460 Aenean Road','451-261-862'),
  (6,'Zorita','Patton','P.O. Box 534, 3922 Arcu. Ave','356-548-386'),
  (7,'Caleb','Moody','4042 Curabitur Av.','243-314-748'),
  (8,'Tara','Walton','515-7848 Erat, Rd.','414-586-457'),
  (9,'Clementine','Bean','P.O. Box 693, 861 Proin St.','861-278-682'),
  (10,'Ulysses','Ruiz','426-3783 Purus. Street','582-934-938');


  
  INSERT INTO rozliczenia.premie (id_premii,rodzaj,kwota)
VALUES
  (1,'Premia wynikowa',171),
  (2,'Premia za wydajność',22),
  (3,'Premia za staż pracy',35),
  (4,'Premia świąteczna,',127),
  (5,'Premia motywacyjna',4),
  (6,'Premia za awans ',12),
  (7,'Premia za osiągnięcie celów zespołu',85),
  (8,'Premia za sugestie/przeprowadzone usprawnienia.',28),
  (9,'Premia za lojalność',11),
  (10,'Premia za umiejętności specjalistyczne,',199);
  
  INSERT INTO rozliczenia.godziny (id_godziny,data,liczba_godzin,id_pracownika)
VALUES
  (1,'2024-02-06',3,1),
  (2,'Mar 20, 2024',2,2),
  (3,'Jan 18, 2024',7,3),
  (4,'Jan 17, 2024',8,4),
  (5,'Jul 17, 2024',4,5),
  (6,'Mar 21, 2025',8,6),
  (7,'Mar 28, 2025',6,7),
  (8,'Jan 12, 2025',4,8),
  (9,'Jul 10, 2023',3,9),
  (10,'Jan 8, 2024',2,10);

INSERT INTO rozliczenia.pensje (id_pensji,stanowisko,kwota,id_premii)
VALUES
  (1,'programista',96,1),
  (2,'kierownik',13,2),
  (3,'programista',131,3),
  (4,'tester',186,4),
  (5,'Konsultant finansowy',24,5),
  (6,'Specjalista ds. zasobów ludzkich',41,6),
  (7,'Specjalista ds. marketingu internetowego',55,7),
  (8,'Programista aplikacji mobilnych',97,8),
  (9,'Analityk danych',195,9),
  (10,'HR',12,10);
  
  
  
  
  
  
  
SELECT nazwisko, adres FROM rozliczenia.pracownicy;
-----
SELECT 
    id_godziny,
    DATE_PART('isodow', data) AS dzien_tygodnia,
    DATE_PART('month', data) AS miesiac
FROM 
    rozliczenia.godziny;
-----
ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;


ALTER TABLE rozliczenia.pensje
ADD kwota_netto DECIMAL(10, 2);

UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto * 0.8;


SELECT * FROM rozliczenia.pensje;

	