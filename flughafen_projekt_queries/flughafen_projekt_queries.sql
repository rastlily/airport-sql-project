
--
-- 1. Ermittle den minimalen, maximalen und durchschnittlichen Preis der Buchungen.
--
SELECT 
MIN(preis) AS min_preis, 
MAX(preis) AS max_preis, 
AVG(preis) AS avg_preis
FROM buchung;
--
-- 2. Finde die Namen der Reisenden mit den höchsten Buchungskosten.
--
SELECT 
p.vorname,
p.nachname,
b.preis
FROM buchung b
JOIN passagier p ON b.passagier_id = p.passagier_id
WHERE b.preis = (SELECT MAX(preis) FROM buchung);
--
-- 3. Bestimme die Fluglinie mit den durchschnittlich teuersten Tickets.
--
SELECT 
fl.fluglinie_id,
fl.firmenname AS Company,
SUM(b.preis) AS Total_sum_of_bookings,
COUNT(b.buchung_id) AS No_of_bookings,
AVG(b.preis) AS Average_price_of_booking
FROM buchung b
JOIN flug f ON b.flug_id = f.flug_id
JOIN fluglinie fl ON f.fluglinie_id = fl.fluglinie_id
GROUP BY fl.firmenname, fl.fluglinie_id
ORDER BY Average_price_of_booking DESC
LIMIT 3;
--
-- 4. Ermittle die Flugzeuge mit der höchsten Kapazität, die vom Flughafen ALTAMIRA abgeflogen sind.
--
SELECT 
ft.beschreibung, 
z.kapazitaet, 
fl.name
FROM flug f
JOIN flugzeug z ON f.flugzeug_id = z.flugzeug_id
JOIN flugzeug_typ ft ON z.typ_id = ft.typ_id
JOIN flughafen fl ON f.von = fl.flughafen_id 
WHERE fl.name = 'ALTAMIRA'
ORDER BY z.kapazitaet DESC;
--
-- 5. Zähle, wie viele Personen die Spain Airlines im Zeitraum vom 06.06.2015 bis zum 08.06.2015 transportiert hat.
--
SELECT COUNT(DISTINCT b.passagier_id) AS anzahl_passagiere
FROM buchung b
JOIN flug f ON b.flug_id = f.flug_id
JOIN fluglinie fl ON f.fluglinie_id = fl.fluglinie_id
WHERE fl.firmenname = 'Spain Airlines' 
AND f.abflug BETWEEN '2015-06-06' AND '2015-06-08';
--
-- 6. Erstelle für jeden Flug eine Auflistung mit Flugnummer, Kapazität des Flugzeugs und der Anzahl der Buchungen.
--
SELECT 
f.flug_id,
f.flugnr,
fz.kapazitaet,
COUNT(b.buchung_id) AS Anzahl_von_Buchungen,
CASE
    WHEN COUNT(b.buchung_id) > (0.05 * fz.kapazitaet) THEN "Yes"
    ELSE "No"
END AS '5%_Yes/No' 
FROM flug f
JOIN flugzeug fz ON f.flugzeug_id = fz.flugzeug_id
LEFT JOIN buchung b ON f.flug_id = b.flug_id
GROUP BY f.flug_id, f.flugnr, fz.kapazitaet
ORDER BY f.flug_id;
--
-- 7. Identifiziere die Fluglinien, die am häufigsten zum Flughafen KAGOSHIMA fliegen.
--
SELECT 
fl.firmenname AS Fluglinie,
COUNT(f.flug_id) AS Anzahl
FROM flug f
JOIN fluglinie fl ON f.fluglinie_id = fl.fluglnien_id
JOIN flughafen fh ON f.ankunft_flughafen_id = fh.id
WHERE fh.name = 'KAGOSHIMA'
GROUP BY fl.name
ORDER BY anzahl_fluege DESC;
--
-- 8.Bestimme die Flugzeuge einer Fluglinie mit einem italienischen Flughafen als Basis, die die meisten Flüge durchgeführt haben, und gib deren Typ an.
--
SELECT
fz.flugzeug_id,
fl.firmenname,
fl.heimatflughafen_id,
fh.land, 
COUNT(f.flug_id) AS Anzahl,
fzt.bezeichnung
FROM flug f
JOIN flugzeug fz ON f.flugzeug_id = fz.flugzeug_id
JOIN fluglinie fl ON f.fluglinie_id = fl.fluglinie_id
JOIN flughafen fh ON fl.heimatflughafen_id = fh.flughafen_id
JOIN flugzeug_typ fzt ON fz.typ_id = fzt.typ_id
WHERE fh.land = 'ITALY'
GROUP BY fz.flugzeug_id, fl.firmenname, fl.heimatflughafen_id, fh.land, fzt.bezeichnung
ORDER BY Anzahl DESC
LIMIT 3;
--
-- 9. Berechne die gesamten Anteile aller Buchungen je nach Flugzeugtyp in Prozent.
--
SELECT 
fzt.bezeichnung AS Flugzeugtyp, 
COUNT(b.buchung_id) AS Anzahl_an_Buchungen, 
ROUND((COUNT(b.buchung_id) * 100.0 / (SELECT COUNT(*) FROM buchung)), 4) AS "Anteil_Aller_Buchungen_in_%"
FROM buchung b
JOIN flug f ON b.flug_id = f.flug_id
JOIN flugzeug fz ON f.flugzeug_id = fz.flugzeug_id
JOIN flugzeug_typ fzt ON fz.typ_id = fzt.typ_id
GROUP BY fzt.bezeichnung
ORDER BY "Anteil_Aller_Buchungen_in_%" DESC;























