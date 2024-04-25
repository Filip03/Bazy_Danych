

DROP TABLE IF EXISTS zamowienia;
DROP TABLE IF EXISTS pomieszczenia;

CREATE TABLE zamowienia (
    id_produktu INT, 
    nazwa_produktu VARCHAR(255),
    id_klienta INT,
    nazwa_klienta VARCHAR(255),
    data_zamowienia DATE,
    cena_produktu DECIMAL(10),
    ilosc INT,
    VAT DECIMAL(5),
    suma_brutto DECIMAL(10),
    suma_netto DECIMAL(10),
    PRIMARY KEY (id_produktu, id_klienta, data_zamowienia)
);


CREATE TABLE pomieszczenia (
    id_pomieszczenia SERIAL PRIMARY KEY,
    numer_pomieszczenia VARCHAR(50),
    id_budynku INT,
    powierzchnia DECIMAL(10),
    liczba_okien INT,
    liczba_drzwi INT,
    ulica VARCHAR(255),
    miasto VARCHAR(100),
    kod_pocztowy VARCHAR(20)
);
