# ✈️ Flughafen-Projekt — Airport Database & Analytics

**Autor:** Liliia Rastorhuieva  
**Datenbank:** MySQL  
**Sprache:** SQL  
**Status:** 📊 Abgeschlossen

---

## 📌 Projektbeschreibung

Dieses Projekt ist eine vollständige relationale Datenbank für einen Luftverkehrsknotenpunkt (Flughafen), die zentrale Geschäftsprozesse modelliert:

- Verwaltung von Flughäfen und Fluggesellschaften  
- Erfassung von Passagieren und Buchungen  
- Strukturierung von Flugzeug- und Flugdaten  
- Durchführung von Buchungs- und Fluganalysen  

Die Datenbank wurde mit realen Quelldaten im Excel-Format erstellt (z. B. Daten zu Fluggesellschaften) und enthält Beispiele zum Erstellen, Ändern und Löschen von Strukturen sowie komplexe analytische Abfragen für Business Analytics.

---

## 🛠️ Projektaufgaben / Beschreibung

- Datenaufbereitung und -strukturierung in Excel/Google Sheets zur Erstellung von CSV-Dateien für den Import in die Datenbank.
- Erstellung und Ausführung von SQL-Abfragen zur Verwaltung und Analyse der Datenbank.
- Entwicklung eines Datenmodells und Dokumentation der Datenbankstruktur.

---

## 🎯 Hauptziele des Projekts

✅ Entwurf des DB-Schemas unter Anwendung der Normalisierungsprinzipien  
✅ Arbeit mit Relationen (FOREIGN KEY, ON DELETE CASCADE)  
✅ Import und Einfügen realer Daten aus Tabellen  
✅ Erstellung komplexer SQL-Abfragen zur Beantwortung geschäftlicher Fragestellungen  
✅ Praxis mit DDL (CREATE, ALTER, DROP) und DML (INSERT, UPDATE)

---

## 🗂️ Haupttabellen

- `flughafen` — Flughäfen  
- `fluglinie` — Fluggesellschaften (Verknüpfung mit Heimatflughafen)  
- `flugzeug_typ` — Flugzeugtypen  
- `flugzeug` — Flugzeuge  
- `passagier` — Passagiere  
- `passagierdetails` — zusätzliche Passagierdaten  
- `flug` — Flüge  
- `buchung` — Sitzplatzbuchungen  

---

## 🔍 Wichtige analytische Abfragen

In diesem Projekt wurden u.a. folgende Analyseaufgaben mit SQL umgesetzt:

- Ermittlung minimaler, maximaler und durchschnittlicher Buchungspreise  
- Suche nach Passagieren mit den teuersten Tickets  
- Ermittlung der Top-3 Fluggesellschaften nach durchschnittlichem Ticketpreis  
- Analyse der größten Flugzeuge, die von einem bestimmten Flughafen abfliegen  
- Berechnung der Anzahl der Passagiere einer bestimmten Fluggesellschaft in einem definierten Zeitraum  

---

## ⚙️ Was ich in diesem Projekt geübt habe

✔️ Entwurf verbundener Tabellen und relationaler Struktur  
✔️ Verwendung von FOREIGN KEY und ON DELETE CASCADE  
✔️ Datenimport aus Excel in MySQL  
✔️ Erstellung von Abfragen mit JOIN, GROUP BY, ORDER BY, Unterabfragen und Aggregationen  
✔️ Transformation und Modifikation von Tabellen (ALTER TABLE)  
✔️ Hinzufügen und Löschen von Spalten, Aktualisierung von Werten  
✔️ Datenvalidierung mit CHECK  

---

## 🧩 Tech-Stack

- Datenbank: MySQL  
- Tools: MySQL Workbench, Excel  
- Abfragesprache: SQL (DDL, DML, DCL)

---

## 📈 Warum dieses Projekt wichtig für mein Portfolio ist

✅ Zeigt praktische Arbeit mit realen Geschäftsdaten  
✅ Demonstriert die Fähigkeit, vollständige Verknüpfungen zwischen Tabellen zu erstellen  
✅ Enthält Beispiele für Analytics, die für Data Analytics relevant sind  
✅ Eignet sich als Beispiel für ein Vorstellungsgespräch: zeigt nicht nur Struktur, sondern auch Geschäftslogik  

---

## 🚀 So startest du

Datenbank erstellen:

```` sql 
CREATE DATABASE project_flughafen;
USE project_flughafen;
````
---

## 💡 Autor

Projekt zu Lernzwecken erstellt.  
Bei Interesse — schreib mir auf [lilyrastorhuieva@gmail.com].

⭐️ Wenn dir dieses Projekt gefällt — gib mir ein ⭐️ oder forke das Repository!
