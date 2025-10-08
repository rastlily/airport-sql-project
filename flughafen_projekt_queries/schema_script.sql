-- Tabelle Passagiere (Passagiere)
CREATE TABLE Passagiere (
    passagier_id INT PRIMARY KEY,  -- Eindeutige ID des Passagiers
    passnummer VARCHAR(20) UNIQUE NOT NULL, -- Eindeutige Reisepassnummer
    vorname VARCHAR(50) NOT NULL,
    nachname VARCHAR(50) NOT NULL
);

-- Tabelle Passagierdetails (Details der Passagiere)
CREATE TABLE Passagierdetails (
    passagier_id INT PRIMARY KEY,  -- FK, entspricht ID in Passagiere (1:1)
    geburtstag DATE NOT NULL,
    geschlecht CHAR(1) CHECK (geschlecht IN ('M', 'F', 'X')), -- Geschlecht (M/F/X)
    strasse VARCHAR(100),
    ort VARCHAR(50),
    plz VARCHAR(10),
    land VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    telefon VARCHAR(20),
    FOREIGN KEY (passagier_id) REFERENCES Passagiere(passagier_id) ON DELETE CASCADE
);

-- Tabelle Fluege (Flüge)
CREATE TABLE Fluege (
    flug_id INT PRIMARY KEY,  -- Eindeutige ID des Fluges
    flugnummer VARCHAR(20) UNIQUE NOT NULL,
    abflugzeit TIMESTAMP NOT NULL, -- Abflugzeit
    ankunftzeit TIMESTAMP NOT NULL, -- Ankunftszeit
    fluglinie_id INT NOT NULL,  -- FK auf Fluglinien
    flugzeug_id INT NOT NULL,   -- FK auf Flugzeuge
    abflug_flughafen_id INT NOT NULL, -- FK auf Flughafen
    ankunft_flughafen_id INT NOT NULL, -- FK auf Flughafen
    FOREIGN KEY (fluglinie_id) REFERENCES Fluglinien(fluglinie_id),
    FOREIGN KEY (flugzeug_id) REFERENCES Flugzeuge(flugzeug_id),
    FOREIGN KEY (abflug_flughafen_id) REFERENCES Flughafen(flughafen_id),
    FOREIGN KEY (ankunft_flughafen_id) REFERENCES Flughafen(flughafen_id)
);

-- Tabelle Buchungen (Buchungen)
CREATE TABLE Buchungen (
    buchung_id INT PRIMARY KEY,  -- Eindeutige ID der Buchung
    platz VARCHAR(10) NOT NULL,  -- Sitzplatz
    preis DECIMAL(10,2) NOT NULL, -- Preis
    passagier_id INT NOT NULL,  -- FK auf Passagiere
    flug_id INT NOT NULL,       -- FK auf Fluege
    FOREIGN KEY (passagier_id) REFERENCES Passagiere(passagier_id) ON DELETE CASCADE,
    FOREIGN KEY (flug_id) REFERENCES Fluege(flug_id) ON DELETE CASCADE
);

-- Tabelle Fluglinien (Fluggesellschaften)
CREATE TABLE Fluglinien (
    fluglinie_id INT PRIMARY KEY,  -- Eindeutige ID der Fluggesellschaft
    iata_code CHAR(2) UNIQUE NOT NULL, -- IATA-Code
    firmenname VARCHAR(100) NOT NULL,
    heimatflughafen_id INT NOT NULL, -- FK auf Flughafen (Basisflughafen)
    FOREIGN KEY (heimatflughafen_id) REFERENCES Flughafen(flughafen_id)
);

-- Tabelle Flugzeuge (Flugzeuge)
CREATE TABLE Flugzeuge (
    flugzeug_id INT PRIMARY KEY,  -- Eindeutige ID des Flugzeugs
    kapazitaet INT NOT NULL CHECK (kapazitaet > 0), -- Kapazität
    flugzeugtyp_id INT NOT NULL, -- FK auf Flugzeugtypen
    fluglinie_id INT NOT NULL, -- FK auf Fluglinien
    FOREIGN KEY (flugzeugtyp_id) REFERENCES Flugzeugtypen(flugzeugtyp_id),
    FOREIGN KEY (fluglinie_id) REFERENCES Fluglinien(fluglinie_id)
);

-- Tabelle Flugzeugtypen (Flugzeugmodelle)
CREATE TABLE Flugzeugtypen (
    flugzeugtyp_id INT PRIMARY KEY,  -- Eindeutige ID des Typs
    bezeichnung VARCHAR(50) NOT NULL, -- Modellbezeichnung
    beschreibung TEXT                 -- Beschreibung
);

-- Tabelle Flughafen (Flughäfen)
CREATE TABLE Flughafen (
    flughafen_id INT PRIMARY KEY,  -- Eindeutige ID des Flughafens
    name VARCHAR(100) NOT NULL,    -- Name
    stadt VARCHAR(50) NOT NULL,    -- Stadt
    land VARCHAR(50) NOT NULL,     -- Land
    breite DOUBLE NOT NULL,        -- Breitengrad
    laenge DOUBLE NOT NULL,        -- Längengrad
    geolokation VARCHAR(100)      -- Geodaten / Code
);
