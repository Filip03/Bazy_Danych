CREATE TABLE GeoEon (
    id_eon INT PRIMARY KEY,
    nazwa_eon VARCHAR(50)
);


CREATE TABLE GeoEra (
    id_era INT PRIMARY KEY,
    id_eon INT,
    nazwa_era VARCHAR(50),
    FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon)
);


CREATE TABLE GeoOkres (
    id_okres INT PRIMARY KEY,
    id_era INT,
    nazwa_okres VARCHAR(50),
    FOREIGN KEY (id_era) REFERENCES GeoEra(id_era)
);


CREATE TABLE GeoEpoka (
    id_epoka INT PRIMARY KEY,
    id_okres INT,
    nazwa_epoka VARCHAR(50),
    FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres)
);

CREATE TABLE GeoPietro (
    id_pietro INT PRIMARY KEY,
    id_epoka INT,
    nazwa_pietro VARCHAR(50),
    FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka)
);

INSERT INTO GeoEon (id_eon, nazwa_eon) VALUES (1, 'Fanerozoik');


INSERT INTO GeoEra (id_era, id_eon, nazwa_era) VALUES
(1, 1, 'Kenozoik'),
(2, 1, 'Mezozoik'),
(3, 1, 'Paleozoik');


INSERT INTO GeoOkres (id_okres, id_era, nazwa_okres) VALUES
(1, 1, 'Czwartorzęd'),
(2, 1, 'Neogen'),
(3, 1, 'Paleogen'),
(4, 2, 'Kreda'),
(5, 2, 'Jura'),
(6, 2, 'Trias'),
(7, 3, 'Perm'),
(8, 3, 'Karbon'),
(9, 3, 'Dewon');


INSERT INTO GeoEpoka (id_epoka, id_okres, nazwa_epoka) VALUES
(1, 1, 'Holocen'),
(2, 1, 'Plejstocen'),
(3, 2, 'Pliocen'),
(4, 2, 'Miocen'),
(5, 3, 'Oligocen'),
(6, 3, 'Eocen'),
(7, 3, 'Paleocen'),
(8, 4, 'Górna'),
(9, 4, 'Dolna'),
(10, 5, 'Górna'),
(11, 5, 'Środkowa'),
(12, 5, 'Dolna'),
(13, 6, 'Górna'),
(14, 6, 'Środkowa'),
(15, 6, 'Dolna'),
(16, 7, 'Górny'),
(17, 7, 'Dolny'),
(18, 8, 'Górny'),
(19, 8, 'Dolny'),
(20, 9, 'Górny'),
(21, 9, 'Środkowy'),
(22, 9, 'Dolny');



INSERT INTO GeoPietro (id_pietro, id_epoka, nazwa_pietro) VALUES
(1, 1, 'Megalaj'),
(2, 1, 'Northgrip'),
(3, 1, 'Grenland'),
(4, 2, 'Późny'),
(5, 2, 'Chiban'),
(6, 2, 'Kalabr'),
(7, 2, 'Gelas'),
(8, 3, 'Piacent'),
(9, 3, 'Zanki'),
(10, 4, 'Messyn'),
(11, 4, 'Torton'),
(12, 4, 'Serrawal'),
(13, 4, 'Lang'),
(14, 4, 'Burdygał'),
(15, 4, 'Akwitan'),
(16, 5, 'Szat'),
(17, 5, 'Rupel'),
(18, 6, 'Priabon'),
(19, 6, 'Barton'),
(20, 6, 'Lutet'),
(21, 6, 'Iprez'),
(22, 7, 'Tanet'),
(23, 7, 'Zeland'),
(24, 7, 'Dan'),
(25, 8, 'Mastrycht'),
(26, 8, 'Kampan'),
(27, 8, 'Santon'),
(28, 8, 'Koniak'),
(29, 8, 'Turon'),
(30, 8, 'Cenoman'),
(31, 9, 'Alb'),
(32, 9, 'Apt'),
(33, 9, 'Barrem'),
(34, 9, 'Hoteryw'),
(35, 9, 'Walanżyn'),
(36, 9, 'Berrias'),
(37, 10, 'Tyton'),
(38, 10, 'Kimeryd'),
(39, 10, 'Oksford'),
(40, 11, 'Kelowej'),
(41, 11, 'Baton'),
(42, 11, 'Bajos'),
(43, 11, 'Aalen'),
(44, 12, 'Toark'),
(45, 12, 'Pliensbach'),
(46, 12, 'Synemur'),
(47, 12, 'Hettang'),
(48, 13, 'Retyk'),
(49, 13, 'Noryk'),
(50, 13, 'Karnik'),
(51, 14, 'Ladyn'),
(52, 14, 'Anizyk'),
(53, 15, 'Olenek'),
(54, 15, 'Ind'),
(55, 16, 'Czangsing'),
(56, 16, 'Wucziaping'),
(57, 16, 'Kapitan'),
(58, 16, 'Word'),
(59, 16, 'Road'),
(60, 17, 'Kungur'),
(61, 17, 'Artinsk'),
(62, 17, 'Sakmar'),
(63, 17, 'Assel'),
(64, 18, 'Gżel'),
(65, 18, 'Kasimow'),
(66, 18, 'Moskow'),
(67, 18, 'Baszkir'),
(68, 19, 'Serpuchow'),
(69, 19, 'Wizen'),
(70, 19, 'Turnej'),
(71, 20, 'Famen'),
(72, 20, 'Fran'),
(73, 21, 'Żywet'),
(74, 21, 'Eifel'),
(75, 22, 'Ems'),
(76, 22, 'Prag'),
(77, 22, 'Lochkow');


SELECT 
    gp.id_pietro, gp.nazwa_pietro,
    ge.id_epoka, ge.nazwa_epoka,
    go.id_okres, go.nazwa_okres,
    ger.id_era, ger.nazwa_era,
    geon.id_eon, geon.nazwa_eon
INTO GeoTabela
FROM GeoPietro gp
INNER JOIN GeoEpoka ge ON gp.id_epoka = ge.id_epoka
INNER JOIN GeoOkres go ON ge.id_okres = go.id_okres
INNER JOIN GeoEra ger ON go.id_era = ger.id_era
INNER JOIN GeoEon geon ON ger.id_eon = geon.id_eon;


CREATE TABLE Dziesiec (cyfra int, bit int);
INSERT INTO Dziesiec (cyfra, bit) VALUES 
(0, 0), (1, 0), (2, 0), (3, 0), (4, 0), 
(5, 0), (6, 0), (7, 0), (8, 0), (9, 0);


CREATE TABLE Milion(liczba int,cyfra int, bit int);
INSERT INTO Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra 
+ 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit 
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec 
a6 ;

--indeksy
CREATE INDEX id_eon ON GeoEon (id_eon);
CREATE INDEX id_era ON GeoEra (id_era);
CREATE INDEX id_okres ON GeoOkres (id_okres);
CREATE INDEX id_epoka ON GeoEpoka (id_epoka);
CREATE INDEX id_pietro ON GeoPietro (id_pietro);
CREATE INDEX id_geotabela ON GeoTabela (id_pietro);

--usuwanie indeksów
DROP INDEX id_eon ON GeoEon;
DROP INDEX id_era ON GeoEra;
DROP INDEX id_okres ON GeoOkres;
DROP INDEX id_epoka ON GeoEpoka;
DROP INDEX id_pietro ON GeoPietro;
DROP INDEX id_geotabela ON GeoTabela;

--1 ZL

SELECT COUNT(*) 
FROM Milion 
INNER JOIN GeoTabela 
ON (Milion.liczba % 77 = GeoTabela.id_pietro);


--2 ZL

SELECT COUNT(*) 
FROM dbo.Milion 
INNER JOIN dbo.GeoPietro 
ON (Milion.liczba % 77 = GeoPietro.id_pietro)
INNER JOIN dbo.GeoEpoka 
ON GeoPietro.id_epoka = GeoEpoka.id_epoka
INNER JOIN dbo.GeoOkres 
ON GeoEpoka.id_okres = GeoOkres.id_okres
INNER JOIN dbo.GeoEra 
ON GeoOkres.id_era = GeoEra.id_era
INNER JOIN dbo.GeoEon 
ON GeoEra.id_eon = GeoEon.id_eon;


--3 ZL

SELECT COUNT(*) 
FROM dbo.Milion 
WHERE Milion.liczba % 77 = 
(SELECT id_pietro 
 FROM dbo.GeoTabela 
 WHERE Milion.liczba % 77 = id_pietro);


--4 ZL
SELECT COUNT(*) 
FROM dbo.Milion 
WHERE Milion.liczba % 77 = (SELECT pe.id_pietro FROM GeoPietro AS pe
	INNER JOIN GeoEpoka AS ep ON pe.id_epoka = ep.id_epoka
	INNER JOIN GeoOkres AS ok ON ep.id_okres = ok.id_okres
	INNER JOIN GeoEra AS er ON ok.id_era = er.id_era
	INNER JOIN GeoEon AS eo ON er.id_eon = eo.id_eon
	WHERE Milion.liczba % 77 = pe.id_pietro);
